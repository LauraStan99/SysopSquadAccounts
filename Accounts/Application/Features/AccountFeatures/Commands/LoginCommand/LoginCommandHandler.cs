using System;
using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Features.AccountFeatures.Commands.LoginCommand
{
    public class LoginCommandHandler: IRequestHandler<LoginCommand, ResponseEntity>
    {
        private readonly IAccountRepository _repository;
        private readonly IMapper _mapper;

        public LoginCommandHandler(IAccountRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<ResponseEntity> Handle(LoginCommand request, CancellationToken cancellationToken)
        {
            var user = await _repository.GetByEmailAsync<User>(request.Email);
            var consultant = await _repository.GetByEmailAsync<Consultant>(request.Email);
            var account = (user != null) ? (BaseEntity) user : consultant;
            var type = "";

            if (account == user)
                type = user.Type;
            else
                type = "Consultant";

            if ( !Password.VerifyPasswordHash(request.Password, account.PasswordHash, account.PasswordSalt) )
                throw new ArgumentException("Password doesn't match", nameof(request));
                
            var entity = _mapper.Map<ResponseEntity>(account);
            entity.Type = type;
            return _repository.Login(entity).HidePassword();
        }
    }
}
