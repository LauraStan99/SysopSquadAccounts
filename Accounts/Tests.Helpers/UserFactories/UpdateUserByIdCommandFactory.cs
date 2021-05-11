using System.Collections.Generic;
using Application.Features.UserFeatures.Commands.UpdateUserByIdCommand;

namespace Tests.Helpers.UserFactories
{
    public static class UpdateUserByIdCommandFactory
    {
        public static UpdateUserByIdCommand ValidUpdateUserCommand(string id)
        {
            return new()
            {
                Id = id,
                Username = "andra",
                Location = "Iasi",
                Email = "andra@gmail.com",
                Password = "1234",
                TicketsId = new List<string> {"6075e868974ac5357820d428"}
            };
        }

        public static UpdateUserByIdCommand UpdateUserCommandWithoutId() =>
            new()
            {
                Username = "andra",
                Location = "Iasi",
                Email = "andra@gmail.com",
                Password = "1234",
                TicketsId = new List<string> { "6075e868974ac5357820d428" }
            };

        public static UpdateUserByIdCommand UpdateUserCommandWithInvalidIdStructure() =>
            new()
            {
                Id = "aaa93pwodjsdaaaaaaaajjkk",
                Username = "andra",
                Location = "Iasi",
                Email = "andra@gmail.com",
                Password = "1234",
                TicketsId = new List<string> { "6075e868974ac5357820d428" }
            };

        public static UpdateUserByIdCommand UpdateUserCommandWithInvalidIdLength() =>
            new()
            {
                Id = "error",
                Username = "andra",
                Location = "Iasi",
                Email = "andra@gmail.com",
                Password = "1234",
                TicketsId = new List<string> { "6075e868974ac5357820d428" }
            };

        public static UpdateUserByIdCommand UpdateUserCommandWithInexistentId() =>
            new()
            {
                Id = "6075e868974ac5357820d428",
                Username = "andra",
                Location = "Iasi",
                Email = "andra@gmail.com",
                Password = "1234",
                TicketsId = new List<string> { "6075e868974ac5357820d428" }
            };

    }
}
