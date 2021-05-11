using Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery;
using Domain.Entities;
using System.Threading.Tasks;

namespace Application.Interfaces
{
    public interface IConsultantRepository : IRepository<Consultant>
    {
        Task<Consultant> UpdateConsultant(Consultant consultant);
        Task<Consultant> FindBestConsultant(GetBestConsultantQuery query);
    }
}
