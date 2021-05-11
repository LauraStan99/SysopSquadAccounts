using Application.Features.UserFeatures.Commands.RegisterUserCommand;

namespace Tests.Helpers.UserFactories
{
    public static class RegisterUserCommandFactory
    {
        public static RegisterUserCommand ValidRegisterUserCommand() => new()
        {
            Username = "andra",
            Type = "Client",
            Location = "Iasi",
            Email = "andra@gmail.com",
            Password = "1234"
        };

        public static RegisterUserCommand ValidRegisterUserCommandWithExistingEmail() => new()
        {
            Username = "andra",
            Type = "Client",
            Location = "Iasi",
            Email = "andraexisting2@gmail.com",
            Password = "1234"
        };

        public static RegisterUserCommand RegisterUserCommandWithShortPassword()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Password = "err";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithShortUsername()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Username = "a";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithShortLocation()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Location = "e";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithInvalidEmail()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Email = "NotAnEmail";
            return registerUser;
        }
        
        public static RegisterUserCommand RegisterUserCommandWithNoDigitsPassword() 
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Password = "error";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithWrongType()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Type = "error";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithEmptyPasswordAndNoUsername()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Password = "";
            registerUser.Username = "";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithNoPassword()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Password = "";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithEmptyUsername()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Username = "";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithEmptyLocation()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Location = "";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithEmptyEmail()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Email = "";
            return registerUser;
        }

        public static RegisterUserCommand RegisterUserCommandWithEmptyType()
        {
            var registerUser = ValidRegisterUserCommand();
            registerUser.Type = "";
            return registerUser;
        }
        public static RegisterUserCommand RegisterUserCommandWithNoData() => new();
        
    }
}
