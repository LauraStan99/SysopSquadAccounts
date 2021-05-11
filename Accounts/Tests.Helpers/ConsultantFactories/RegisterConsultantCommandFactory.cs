using Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand;

namespace Tests.Helpers.ConsultantFactories
{
    public static class RegisterConsultantCommandFactory
    {
        public static RegisterConsultantCommand ValidRegisterConsultantCommand() => new()
        {
            Username = "andra",
            Location = "Iasi",
            Email = "andra@gmail.com",
            Password = "1234"
        };

        public static RegisterConsultantCommand RegisterConsultantCommandWithShortPassword()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Password = "err";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithNoDigitsPassword()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Password = "error";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithNoPassword()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Password = "";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithEmptyUsername()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Username = "";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithEmptyLocation()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Location = "";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithEmptyEmail()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Email = "";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithNoData() => new();

        public static RegisterConsultantCommand RegisterConsultantCommandWithShortUsername()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Username = "a";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithShortLocation()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Location = "a";
            return registerCommand;
        }

        public static RegisterConsultantCommand RegisterConsultantCommandWithInvalidEmail()
        {
            var registerCommand = ValidRegisterConsultantCommand();
            registerCommand.Email = "invalid";
            return registerCommand;
        }

        public static RegisterConsultantCommand ValidRegisterConsultantCommandWithExistingEmail() => new()
        {
            Username = "andra",
            Location = "Iasi",
            Email = "andraExisting@gmail.com",
            Password = "1234"
        };
    }
}
