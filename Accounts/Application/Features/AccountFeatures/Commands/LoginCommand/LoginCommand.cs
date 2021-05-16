using Domain.Common;
using MediatR;

namespace Application.Features.AccountFeatures.Commands.LoginCommand
{
    public class LoginCommand: IRequest<ResponseEntity>
    {
        public string Email { get; set; }
        public string Password { get; set; }

    }
}
