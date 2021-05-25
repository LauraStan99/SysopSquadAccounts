using Application.Interfaces;
using Domain.Common;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Tests.Helpers;
using System.Threading.Tasks;
using Tests.Helpers.ConsultantFactories;
using Tests.Helpers.UserFactories;
using Xunit;

namespace Infrastructure.Tests.AccountTests
{
    [Collection("Database collection")]
    public class AccountRepositoryTest
    {
        private readonly DatabaseTest _database;
        private readonly IAccountRepository _repository;

        public AccountRepositoryTest(DatabaseTest database)
        {
            _database = database;
            _repository = _database.AccountRepository;
        }


        [Fact]
        public async Task GivenAnUserEmail_WhenGetByEmailAsync_ThenReturnAnUser()
        {
            var user = UserFactory.AddedValidUserWithUniqueEmail(_database.DbContext);

            var result = await _repository.GetByEmailAsync<User>(user.Email);

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
        public async Task GivenAnConsultantEmail_WhenGetByEmailAsync_ThenReturnAConsultant()
        {
            var consultant = ConsultantFactory.AddedValidConsultantWithUniqueEmail(_database.DbContext);

            var result = await _repository.GetByEmailAsync<Consultant>(consultant.Email);

            result.Should().NotBeNull();
            result.Should().BeOfType<Consultant>();
            result.Id.Should().Be(consultant.Id);
            result.Username.Should().Be(consultant.Username);
            result.Email.Should().Be(consultant.Email);
            result.Location.Should().Be(consultant.Location);
            result.Availability.Should().Be(consultant.Availability);
            result.NumberOfTickets.Should().Be(consultant.NumberOfTickets);
        }

        [Fact]
        public void GivenEntity_WhenLogin_ThenReturnEntityWithToken()
        {
            var user = UserFactory.AddedUser(_database.DbContext);
            var entity = new ResponseEntity
            {
                Id = user.Id
            };

            var result = _repository.Login(entity);

            result.Should().NotBeNull();
            result.Id.Should().Be(entity.Id);
            result.Token.Should().NotBeNullOrEmpty();
        }
    }
}
