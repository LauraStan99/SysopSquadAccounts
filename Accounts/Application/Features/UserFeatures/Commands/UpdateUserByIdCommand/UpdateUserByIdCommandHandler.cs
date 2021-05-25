using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Features.UserFeatures.Commands.UpdateUserByIdCommand
{
    public class UpdateUserByIdCommandHandler : IRequestHandler<UpdateUserByIdCommand, User>
    {
        private readonly IUserRepository _repository;
        private readonly IMapper _mapper;

        public UpdateUserByIdCommandHandler(IUserRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<User> Handle(UpdateUserByIdCommand request, CancellationToken cancellationToken)
        {
            var newUser = _mapper.Map<User>(request);
            if ( !string.IsNullOrWhiteSpace(request.Password) )
            {
                Password.CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);
                newUser.PasswordHash = passwordHash;
                newUser.PasswordSalt = passwordSalt;
            }
            return await _repository.UpdateUser(newUser).HidePassword();
        }
    }
}
