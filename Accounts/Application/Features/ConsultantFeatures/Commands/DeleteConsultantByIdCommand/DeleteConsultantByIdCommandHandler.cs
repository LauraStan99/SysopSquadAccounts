using System.Threading;
using System.Threading.Tasks;
using Application.Interfaces;
using MediatR;

namespace Application.Features.ConsultantFeatures.Commands.DeleteConsultantByIdCommand
{
    public class DeleteConsultantByIdCommandHandler: IRequestHandler<DeleteConsultantByIdCommand, bool>
    {
        private readonly IConsultantRepository _repository;

        public DeleteConsultantByIdCommandHandler(IConsultantRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> Handle(DeleteConsultantByIdCommand request, CancellationToken cancellationToken)
        {
            return await _repository.DeleteAsync(request.Id);
        }
    }
}
