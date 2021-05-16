using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Application.Features.UserFeatures.Queries.GetAllUsersQuery;
using Application.Features.UserFeatures.Queries.GetUserByIdQuery;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Moq;
using Tests.Helpers.UserFactories;
using Xunit;

namespace Core.Tests.UserTests
{
    public class QueriesTests
    {
        [Fact]
        public async Task GivenAList_WhenGetAllUsersQueryHandler_ThenReturnNotNull()
        {
            var user1 = UserFactory.ValidUser();
            var user2 = UserFactory.ValidUser();
            var users = new List<User> { user1, user2 };
            var command = new GetAllUsersQuery();
            var mockRepo = new Mock<IUserRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(users);
            var handler = new GetAllUsersQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotContainNulls();
            result.Should().HaveCount(users.Count);
            result.Should().Contain(user1);
        }
        [Fact]
        public async Task GivenAnId_WhenGetUserByIdQueryHandler_ThenReturnNotNull()
        {
            var user = UserFactory.ValidUser();
            var command = new GetUserByIdQuery(user.Id);
            var mockRepo = new Mock<IUserRepository>();
            mockRepo.Setup(db => db.GetByIdAsync(command.Id).Result).Returns(user);
            var handler = new GetUserByIdQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotBeNull();
            result.Id.Should().Be(user.Id);
            result.Type.Should().Be(user.Type);
            result.Location.Should().Be(user.Location);
            result.Username.Should().Be(user.Username);
        }
    }
}
