using System.Threading;
using System.Threading.Tasks;
using Application.Interfaces;
using MediatR;

namespace Application.Features.UserFeatures.Commands.DeleteUserByIdCommand
{
    public class DeleteUserByIdCommandHandler: IRequestHandler<DeleteUserByIdCommand, bool>
    {
        private readonly IUserRepository _repository;

        public DeleteUserByIdCommandHandler(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task<bool> Handle(DeleteUserByIdCommand request, CancellationToken cancellationToken)
        {
            return await _repository.DeleteAsync(request.Id);
        }
    }
}
