using Application.Helpers;
using Application.Interfaces;
using Domain.Entities;
using MediatR;
using System.Threading;
using System.Threading.Tasks;

namespace Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery
{

    public class GetBestConsultantQueryHandler : IRequestHandler<GetBestConsultantQuery, Consultant>
    {
        private readonly IConsultantRepository _repository;

        public GetBestConsultantQueryHandler(IConsultantRepository repository)
        {
            _repository = repository;
        }
        public async Task<Consultant> Handle(GetBestConsultantQuery request, CancellationToken cancellationToken)
        {
            return await _repository.FindBestConsultant(request).HidePassword();
        }
    }
}
