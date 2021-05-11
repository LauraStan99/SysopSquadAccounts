using Application.Interfaces;
using Domain.Entities;
using System.Threading.Tasks;
using MongoDB.Driver;
using Application.Helpers;
using System.Linq;
using Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery;

namespace Persistence.Repository.v1
{
    public class ConsultantRepository : Repository<Consultant>, IConsultantRepository
    {
        private readonly IApplicationDbContext _context;

        public ConsultantRepository(IApplicationDbContext context) : base(context)
        {
            _context = context;
        }

        public async Task<Consultant> FindBestConsultant(GetBestConsultantQuery query)
        {
            var skillFilter = Builders<Consultant>.Filter.Eq(consultant => consultant.Skill, query.Skill);
            var availabilityFilter = Builders<Consultant>.Filter.Eq(consultant => consultant.Availability, "Available");
            var locationFilter = Builders<Consultant>.Filter.Eq(consultant => consultant.Location, query.Location);
            var numberOfTicketsFilter = Builders<Consultant>.Filter.Gt(consultant => consultant.NumberOfTickets, 0);
            var filter = Builders<Consultant>.Filter.And(skillFilter, availabilityFilter, locationFilter, numberOfTicketsFilter);

            var consultants = await _context.GetCollection<Consultant>().FindAsync<Consultant>(filter).Result.ToListAsync();
            var maxNumberOfTickets = consultants.Max(consultant => consultant.NumberOfTickets);

            return consultants.Find(consultant => consultant.NumberOfTickets == maxNumberOfTickets);
        }

        public async Task<Consultant> UpdateConsultant(Consultant consultant)
        {
            var foundEntity = await GetByIdAsync(consultant.Id);

            if (UpdateHelper.CheckNull(consultant.Email)){ 

                foundEntity.Email = consultant.Email;
            }

            if (UpdateHelper.CheckNull(consultant.Username))
            {

                foundEntity.Username = consultant.Username;
            }

            if (UpdateHelper.CheckNull(consultant.Location))
            {

                foundEntity.Location = consultant.Location;
            }

            if (UpdateHelper.CheckNull(consultant.Availability))
            {

                foundEntity.Availability = consultant.Availability;
            }

            if (UpdateHelper.CheckNull(consultant.Skill))
            {

                foundEntity.Skill = consultant.Skill;
            }

            if (consultant.NumberOfTickets != 0)
            {
                foundEntity.NumberOfTickets = consultant.NumberOfTickets;
            }

            if (consultant.PasswordHash != null && consultant.PasswordSalt != null)
            {
                foundEntity.PasswordHash = consultant.PasswordHash;
                foundEntity.PasswordSalt = consultant.PasswordSalt;
            }

            await _context.GetCollection<Consultant>().ReplaceOneAsync(filter: consultant => consultant.Id == foundEntity.Id, replacement: foundEntity);

            return foundEntity;
        }


    }
}
