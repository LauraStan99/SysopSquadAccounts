using System.Threading;
using System.Threading.Tasks;
using Application.Features.UserFeatures.Commands.DeleteUserByIdCommand;
using Application.Helpers;
using Application.Interfaces;
using AutoMapper;
using FluentAssertions;
using Moq;
using Tests.Helpers.UserFactories;
using Xunit;

namespace Core.Tests.UserTests
{
    public class CommandsTests
    {
        private readonly IMapper _mapper;

        public CommandsTests()
        {
            var mappingConfig = new MapperConfiguration(mc =>
            {
                mc.AddProfile<AutoMapperProfile>();
            });
            _mapper = mappingConfig.CreateMapper();
        }
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

        //[Fact]
        //public async Task GivenValidData_WhenRegisterUserCommandHandler_ThenReturnUser()
        //{
        //    var command = RegisterUserCommandFactory.ValidRegisterUserCommand();
        //    var user = _mapper.Map<User>(command);
        //    var mockRepo = new Mock<IUserRepository>();
        //    mockRepo.Setup(db => db.CreateAsync(user, command.Password).Result).Returns(user);
        //    var handler = new RegisterUserCommandHandler(mockRepo.Object, _mapper);

        //    var result = await handler.Handle(command, CancellationToken.None);

        //    result.Should().NotBeNull();
        //    mockRepo.Verify(repo => repo.CreateAsync(user, command.Password), Times.Once());
        //}
    }
}
