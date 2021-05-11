using Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand;

namespace Tests.Helpers.ConsultantFactories
{
    public static class UpdateConsultantByIdCommandFactory
    {
        public static UpdateConsultantByIdCommand ValidUpdateConsultantCommand(string id)
        {
            return new()
            {
                Id = id,
                Username = "andra",
                Location = "Iasi",
                Email = "andraconsultant@gmail.com",
                Password = "1234",
                Skill = "Software",
                NumberOfTickets = 5,
                Availability = "Available"
            };
        }

        public static UpdateConsultantByIdCommand UpdateConsultantCommandWithoutId() =>
            new()
            {
                Username = "andra",
                Location = "Iasi",
                Email = "andraconsultant@gmail.com",
                Password = "1234",
                Skill = "Software",
                NumberOfTickets = 5,
                Availability = "Available"
            };

        public static UpdateConsultantByIdCommand UpdateConsultantCommandWithInvalidIdStructure() =>
            new()
            {
                Id = "aaa93pwodjsdaaaaaaaajjkk",
                Username = "andra",
                Location = "Iasi",
                Email = "andraconsultant@gmail.com",
                Password = "1234",
                Skill = "Software",
                NumberOfTickets = 5,
                Availability = "Available"
            };

        public static UpdateConsultantByIdCommand UpdateConsultantCommandWithInvalidIdLength() =>
            new()
            {
                Id = "error",
                Username = "andra",
                Location = "Iasi",
                Email = "andraconsultant@gmail.com",
                Password = "1234",
                Skill = "Software",
                NumberOfTickets = 5,
                Availability = "Available"
            };

        public static UpdateConsultantByIdCommand UpdateConsultantCommandWithInexistentId() =>
            new()
            {
                Id = "6075e868974ac5357820d422",
                Username = "andra",
                Location = "Iasi",
                Email = "andraconsultant@gmail.com",
                Password = "1234",
                Skill = "Software",
                NumberOfTickets = 5,
                Availability = "Available"
            };
    }
}
