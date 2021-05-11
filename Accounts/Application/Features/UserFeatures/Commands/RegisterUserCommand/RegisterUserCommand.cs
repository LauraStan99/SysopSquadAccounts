using Domain.Entities;
using MediatR;

namespace Application.Features.UserFeatures.Commands.RegisterUserCommand
{
    public class RegisterUserCommand : IRequest<User>
    {
        public string Username { get; set; }
        public string Type { get; set; }
        public string Location { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }

    }
}
