using System.Threading;
using System.Threading.Tasks;
using Application.Features.ConsultantFeatures.Commands.DeleteConsultantByIdCommand;
using Application.Interfaces;
using FluentAssertions;
using Moq;
using Tests.Helpers.ConsultantFactories;
using Xunit;

namespace Core.Tests.ConsultantTests
{
    public class CommandsTests
    {
        
        [Fact]
        public async Task GivenAnId_WhenDeleteConsultantByIdCommandHandler_ThenReturnTrue()
        {
            var consultant = ConsultantFactory.ValidConsultant();
            var command = new DeleteConsultantByIdCommand(consultant.Id);
            var mockRepo = new Mock<IConsultantRepository>();
            mockRepo.Setup(db => db.DeleteAsync(command.Id).Result).Returns(true);
            var handler = new DeleteConsultantByIdCommandHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().BeTrue();
        }

    }
}
