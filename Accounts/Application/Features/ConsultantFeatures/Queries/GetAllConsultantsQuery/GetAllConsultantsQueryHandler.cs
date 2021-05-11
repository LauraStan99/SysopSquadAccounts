using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Queries.GetAllConsultantsQuery
{
    public class GetAllConsultantsQueryHandler : IRequestHandler<GetAllConsultantsQuery, IEnumerable<Consultant>>
    {
        private readonly IConsultantRepository _repository;

        public GetAllConsultantsQueryHandler(IConsultantRepository repository)
        {
            _repository = repository;
        }

        public async Task<IEnumerable<Consultant>> Handle(GetAllConsultantsQuery request, CancellationToken cancellationToken)
        {
            var entities = await _repository.GetAllAsync();
            return entities.Select(entity => entity.HidePassword());
        }
    }
}
