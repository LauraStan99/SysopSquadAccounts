using System.Threading;
using System.Threading.Tasks;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand
{
    public class RegisterConsultantCommandHandler : IRequestHandler<RegisterConsultantCommand, Consultant>
    {
        private readonly IConsultantRepository _repository;
        private readonly IMapper _mapper;

        public RegisterConsultantCommandHandler(IConsultantRepository repository, IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
        }

        public async Task<Consultant> Handle(RegisterConsultantCommand request, CancellationToken cancellationToken)
        {
            var consultant = _mapper.Map<Consultant>(request);
            //Password.CreatePasswordHash(request.Password, out byte[] passwordHash, out byte[] passwordSalt);
            //consultant.PasswordHash = passwordHash;
            //consultant.PasswordSalt = passwordSalt;
            consultant.Availability = "Available";
            return await _repository.CreateAsync(consultant, request.Password).HidePassword();
        }
    }
}
