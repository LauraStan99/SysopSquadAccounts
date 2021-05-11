using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Common;
using Microsoft.IdentityModel.Tokens;
using MongoDB.Driver;
using Persistence.Helpers;

namespace Persistence.Repository.v1
{
    public class AccountRepository : IAccountRepository
    {
        private readonly IApplicationDbContext _context;

        public AccountRepository(IApplicationDbContext context)
        {
            _context = context;
        }
        public async Task<TEntity> GetByEmailAsync<TEntity>(string email) where TEntity:BaseEntity
        {
            return await _context.GetCollection<TEntity>().Find<TEntity>(entity => entity.Email == email).FirstOrDefaultAsync();
        }


        public ResponseEntity Login(ResponseEntity entity)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(AppSettings.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new Claim[]
                {
                    new Claim(ClaimTypes.Name, entity.Id.ToString())
                }),
                Expires = DateTime.UtcNow.AddDays(7),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };

            var token = tokenHandler.CreateToken(tokenDescriptor);
            var tokenString = tokenHandler.WriteToken(token);
            entity.Token = tokenString;
            return entity;
        }
    }
}
