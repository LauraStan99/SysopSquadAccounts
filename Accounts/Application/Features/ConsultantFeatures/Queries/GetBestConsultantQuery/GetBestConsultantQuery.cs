using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery
{
    public class GetBestConsultantQuery: IRequest<Consultant>
    {
        public readonly string Skill;
        public readonly string Location;

        public GetBestConsultantQuery(string skill, string location)
        {
            Skill = skill;
            Location = location;
        }
    }
}
