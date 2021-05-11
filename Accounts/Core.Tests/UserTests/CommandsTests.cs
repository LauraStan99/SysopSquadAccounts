using System;
using System.Threading;
using System.Threading.Tasks;
using Application.Features.UserFeatures.Commands.DeleteUserByIdCommand;
using Application.Features.UserFeatures.Commands.RegisterUserCommand;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using Domain.Common;
using Domain.Entities;
using FluentAssertions;
using Moq;
using Tests.Helpers;
using Tests.Helpers.UserFactories;
using Xunit;

namespace Core.Tests.UserTests
{
    public class CommandsTests
    {
        [Fact]
        public async Task GivenAnId_WhenDeleteUserByIdCommandHandler_ThenReturnTrue()
        {
            var user = UserFactory.ValidUser();
            var command = new DeleteUserByIdCommand(user.Id);
            var mockRepo = new Mock<IUserRepository>();
            mockRepo.Setup(db => db.DeleteAsync(command.Id).Result).Returns(true);
            var handler = new DeleteUserByIdCommandHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().BeTrue();
        }
    }
}
