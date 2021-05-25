using Application.Interfaces;
using Domain.Entities;
using System.Threading.Tasks;
using MongoDB.Driver;
using Application.Helpers;

namespace Persistence.Repository.v1
{
    public class UserRepository : Repository<User>, IUserRepository
    {
        private readonly IApplicationDbContext _context;

        public UserRepository(IApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<User> UpdateUser(User user)
        {
            var foundEntity = await GetByIdAsync(user.Id);

            if (UpdateHelper.CheckNull(user.Email))
                foundEntity.Email = user.Email;

            if (UpdateHelper.CheckNull(user.Username))
                foundEntity.Username = user.Username;

            if (UpdateHelper.CheckNull(user.Location))
                foundEntity.Location = user.Location;

            if (user.PasswordHash != null && user.PasswordSalt != null)
            {
                foundEntity.PasswordHash = user.PasswordHash;
                foundEntity.PasswordSalt = user.PasswordSalt;
            }

            if (user.TicketsId.Count > 0)
            {
                if (foundEntity.TicketsId.Count == 0)
                    foundEntity.TicketsId = user.TicketsId;
                else
                    foreach (var ticket in user.TicketsId)
                        foundEntity.AddTicket(ticket);
            }
            
            await _context.GetCollection<User>().ReplaceOneAsync(filter: user => user.Id == foundEntity.Id, replacement: foundEntity);

            return foundEntity;
        }
    }
}
