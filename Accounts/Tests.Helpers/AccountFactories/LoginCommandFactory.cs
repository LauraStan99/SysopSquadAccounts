using Application.Features.AccountFeatures.Commands.LoginCommand;
using Tests.Helpers.ConsultantFactories;
using Tests.Helpers.UserFactories;

namespace Tests.Helpers.AccountFactories
{
    public static class LoginCommandFactory
    {
        public static LoginCommand ValidLoginUserCommand()
        {
            var user = UserFactory.ValidUser();
            return new()
            {
                Email = user.Email,
                Password = "1234"
            };
        }

        public static LoginCommand ValidLoginConsultantCommand()
        {
            var consultant = ConsultantFactory.ValidConsultant();
            return new()
            {
                Email = consultant.Email,
                Password = "1234"
            };
        }

        public static LoginCommand LoginCommandWithInexistingEmail() => new()
        {
            Email = "inexitent@gmail.com",
            Password = "1234"
        };

        public static LoginCommand LoginCommandWithEmptyEmail()
        {
            var command = ValidLoginUserCommand();
            command.Email = "";
            return command;
        }

        public static LoginCommand LoginCommandWithEmptyPassword()
        {
            var command = ValidLoginUserCommand();
            command.Password = "";
            return command;
        }

        public static LoginCommand LoginCommandWithShortPassword()
        {
            var command = ValidLoginUserCommand();
            command.Password = "123";
            return command;
        }

        public static LoginCommand LoginCommandWithNoDigitPassword()
        {
            var command = ValidLoginUserCommand();
            command.Password = "error";
            return command;
        }

        public static LoginCommand LoginCommandWithInvalidEmail()
        {
            var command = ValidLoginUserCommand();
            command.Email = "invalid";
            return command;
        }
    }
}
