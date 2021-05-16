using Application.Helpers;
using AutoMapper;

namespace Core.Tests.AccountTests
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

        //[Fact]
        //public async Task GivenValidUser_WhenLoginCommandHandler_ThenReturnSuccess()
        //{
        //    var command = LoginCommandFactory.ValidLoginUserCommand();
        //    var user = UserFactory.ValidUser();
        //    Password.CreatePasswordHash(command.Password, out byte[] passwordHash, out byte[] passwordSalt);
        //    user.PasswordHash = passwordHash;
        //    user.PasswordSalt = passwordSalt;
        //    var mockRepo = new Mock<IAccountRepository>();
        //    mockRepo.Setup(db => db.GetByEmailAsync<User>(command.Email).Result).Returns(user);
        //    var entity = _mapper.Map<ResponseEntity>(user);
        //    mockRepo.Setup(db => db.Login(entity)).Returns(entity);
        //    var handler = new LoginCommandHandler(mockRepo.Object, _mapper);

        //    var result = await handler.Handle(command, CancellationToken.None);

        //    result.Should().NotBeNull();
        //    mockRepo.Verify(repo => repo.GetByEmailAsync<User>(command.Email), Times.Once());
        //    mockRepo.Verify(repo => repo.Login(entity), Times.Once());
        //}
    }
}
