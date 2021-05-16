using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Common;
using Domain.Entities;
using MongoDB.Driver;
using Persistence.Helpers;

namespace Persistence.Repository.v1
{
    public class Repository<TEntity> : IRepository<TEntity> where TEntity : BaseEntity
    {
        private readonly IApplicationDbContext _context;

        public Repository(IApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
        {
            return await _context.GetCollection<TEntity>().FindAsync(entity => true).Result.ToListAsync();
        }

        public async Task<TEntity> GetByIdAsync(string id)
        {
            return await _context.GetCollection<TEntity>().Find<TEntity>(entity => entity.Id == id).FirstOrDefaultAsync();
        }
        
        private async Task<T> GetByEmailAsync<T>(string email) where T:BaseEntity
        {
            return await _context.GetCollection<T>()
                                 .FindAsync<T>(person => person.Email == email).Result
                                 .FirstOrDefaultAsync();
        }

        public async Task<bool> CheckUniqueEmail(string email)
        {
            var user = await GetByEmailAsync<User>(email);
            var consultant = await GetByEmailAsync<Consultant>(email);
            if (user == null && consultant == null)
            {
                return false;
            }
            return true;
        }

        public async Task<TEntity> CreateAsync(TEntity entity, string password)
        {
            Password.CreatePasswordHash(password, out byte[] passwordHash, out byte[] passwordSalt);
            entity.PasswordHash = passwordHash;
            entity.PasswordSalt = passwordSalt;
            await _context.GetCollection<TEntity>().InsertOneAsync(entity);
            return entity;
        }

        public async Task<TEntity> UpdateAsync(TEntity entity)
        {
            var foundEntity = await GetByIdAsync(entity.Id);
            if (foundEntity == null)
            {
                throw new ArgumentException(RepositoryErrors.UserNotFound);
            }

            if (!string.IsNullOrWhiteSpace(entity.Email) && entity.Email != foundEntity.Email)
            {
                if (await CheckUniqueEmail(entity.Email))
                    throw new ArgumentException(RepositoryErrors.EmailNotUnique);

                foundEntity.Email = entity.Email;
            }
            if (!string.IsNullOrWhiteSpace(entity.Username))
            {
                foundEntity.Username = entity.Username;

            }
            if (!string.IsNullOrWhiteSpace(entity.Location))
            {
                foundEntity.Location = entity.Location;
            }
            if (entity.PasswordHash != null && entity.PasswordSalt != null)
            {
                foundEntity.PasswordHash = entity.PasswordHash;
                foundEntity.PasswordSalt = entity.PasswordSalt;
            }

            await _context.GetCollection<TEntity>().ReplaceOneAsync(filter: person => person.Id == foundEntity.Id, replacement: foundEntity);
            return foundEntity;
        }

        public async Task<bool> DeleteAsync(string id)
        {
            var deleteResult = await _context.GetCollection<TEntity>().DeleteOneAsync(user => user.Id == id);

            return deleteResult.IsAcknowledged && deleteResult.DeletedCount > 0;
        }
    }
}
