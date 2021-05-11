using System;
using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Queries.GetConsultantByIdQuery
{
    public class GetConsultantByIdQueryHandler: IRequestHandler<GetConsultantByIdQuery, Consultant>
    {
        private readonly IConsultantRepository _repository;

        public GetConsultantByIdQueryHandler(IConsultantRepository repository)
        {
            _repository = repository;
        }
        public async Task<Consultant> Handle(GetConsultantByIdQuery request, CancellationToken cancellationToken)
        {
            var entity = await _repository.GetByIdAsync(request.Id);
            if (entity == null)
                throw new ArgumentException("Consultant Not Found!", nameof(request));
            return entity.HidePassword();
        }
    }
}
