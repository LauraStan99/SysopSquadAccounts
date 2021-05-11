using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand
{
    public class UpdateConsultantByIdCommandHandler: IRequestHandler<UpdateConsultantByIdCommand, Consultant>
    {
        private readonly IConsultantRepository _repository;
        private readonly IMapper _mapper;

        public UpdateConsultantByIdCommandHandler(IConsultantRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<Consultant> Handle(UpdateConsultantByIdCommand request, CancellationToken cancellationToken)
        {
            var newConsultant = _mapper.Map<Consultant>(request);
            if (!string.IsNullOrWhiteSpace(request.Password))
            {
                Password.CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);
                newConsultant.PasswordHash = passwordHash;
                newConsultant.PasswordSalt = passwordSalt;
            }
            return await _repository.UpdateConsultant(newConsultant).HidePassword();
        }
    }
}
