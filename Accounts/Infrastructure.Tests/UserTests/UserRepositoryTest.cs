using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Tests.Helpers;
using Tests.Helpers.UserFactories;
using Xunit;

namespace Infrastructure.Tests.UserTests
{
    [Collection("Database collection")]
    public class UserRepositoryTest
    {
        private readonly IUserRepository _repository;
        private readonly DatabaseTest _database;

        public UserRepositoryTest(DatabaseTest databaseTest)
        {
            _database = databaseTest;
            _repository = _database.UserRepository;
        }

        [Fact]
        public async Task GivenAnUser_WhenCreateAsync_ThenReturnUserEntity()
        {
            var user = UserFactory.ValidUser();
            var password = "1234";

            var result = await _repository.CreateAsync(user, password);

            result.Should().BeOfType<User>();
            result.Id.Should().Be(user.Id);
            result.Username.Should().Be(user.Username);
            result.Email.Should().Be(user.Email);
            result.Location.Should().Be(user.Location);
            result.Type.Should().Be(user.Type);
            result.TicketsId[0].Should().Be(user.TicketsId[0]);
        }

        [Fact]
        public async Task GivenAListOfUsers_WhenGetAllUsers_ThenReturnListOfUsersEntity()
        {
            var user = UserFactory.Added2Users(_database.DbContext);

            var result = await _repository.GetAllAsync();

            result.Should().BeOfType<List<User>>();
            var addedUser = result.FirstOrDefault(u => u.Id == user.Id);
            addedUser.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenGetByIdAsync_ThenReturnAnUser()
        {
            var user = UserFactory.AddedUser(_database.DbContext);

            var result = await _repository.GetByIdAsync(user.Id);

            result.Should().NotBeNull();
            result.Should().BeOfType<User>();
            result.Id.Should().Be(user.Id);
            result.Username.Should().Be(user.Username);
            result.Email.Should().Be(user.Email);
            result.Location.Should().Be(user.Location);
            result.Type.Should().Be(user.Type);
            result.TicketsId[0].Should().Be(user.TicketsId[0]);

        }

        [Fact]
        public async Task GivenAnInexistentId_WhenGetByIdAsync_ThenReturnNull()
        {
            var user = UserFactory.ValidUser();

            var result = await _repository.GetByIdAsync(user.Id);

            result.Should().BeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenDeleteAsync_ThenReturnTrue()
        {
            var user = UserFactory.AddedUser(_database.DbContext);

            var result = await _repository.DeleteAsync(user.Id);

            result.Should().BeTrue();
        }

        [Fact]
        public async Task GivenAnInexistentId_WhenDeleteAsync_ThenReturnFalse()
        {
            var user = UserFactory.ValidUser();

            var result = await _repository.DeleteAsync(user.Id);

            result.Should().BeFalse();
        }

        [Fact]
        public async Task GivenAnUser_WhenUpdateUser_ThenReturnUserUpdated()
        {
            var user = UserFactory.AddedUser(_database.DbContext);
            var updatedUser = UserFactory.UpdateUsernameAndEmailValidUser(user.Id);

            var result = await _repository.UpdateUser(updatedUser);

            result.Should().BeOfType<User>();
            result.Id.Should().Be(updatedUser.Id);
            result.Username.Should().Be(updatedUser.Username);
            result.Email.Should().BeEquivalentTo(updatedUser.Email);
            result.Location.Should().BeEquivalentTo(user.Location);
            result.TicketsId.Should().HaveCount(user.TicketsId.Count);
        }

        [Fact]
        public async Task GivenAnUser_WhenUpdateUserType_ThenReturnUserWithUnchangedType()
        {
            var user = UserFactory.AddedUser(_database.DbContext);
            var updatedUser = UserFactory.UpdateTypeValidUser(user.Id);

            var result = await _repository.UpdateUser(updatedUser);

            result.Should().BeOfType<User>();
            result.Id.Should().Be(updatedUser.Id);
            result.Type.Should().Be(user.Type);
        }

        [Fact]
        public async Task GivenNewUserEmail_WhenCheckUniqueEmail_ThenReturnFalse()
        {
            var user = UserFactory.UserWithUniqueEmail(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(user.Email);

            result.Should().BeFalse();
        }

        [Fact]
        public async Task GivenExistingUserEmailInUsers_WhenCheckUniqueEmail_ThenReturnTrue()
        {
            var user = UserFactory.UserWithExistingEmailInUsers(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(user.Email);

            result.Should().BeTrue();
        }

        [Fact]
        public async Task GivenExistingUserEmailInConsultants_WhenCheckUniqueEmail_ThenReturnTrue()
        {
            var user = UserFactory.UserWithExistingEmailInConsultants(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(user.Email);

            result.Should().BeTrue();
        }
    }
}
