using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand
{
    public class RegisterConsultantCommand : IRequest<Consultant>
    {
        public string Username { get; set; }
        public string Location { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

        public string Availability { get; set; }
    }
}
