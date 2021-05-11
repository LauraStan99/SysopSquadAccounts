using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Infrastructure.Tests.Helpers;
using Tests.Helpers;
using Tests.Helpers.ConsultantFactories;
using Xunit;

namespace Infrastructure.Tests.ConsultantTests
{
    public class ConsultantRepositoryTest : IClassFixture<DatabaseTest>
    {
        private readonly IConsultantRepository _repository;
        private readonly DatabaseTest _database;

        public ConsultantRepositoryTest(DatabaseTest databaseTest)
        {
            _database = databaseTest;
            _repository = _database.ConsultantRepository;
        }

        [Fact]
        public async Task GivenAnUser_WhenCreateAsync_ThenReturnUserEntity()
        {
            var consultant = ConsultantFactory.ValidConsultant();

            var result = await _repository.CreateAsync(consultant);

            result.Should().BeOfType<Consultant>();
            result.Id.Should().Be(consultant.Id);
            result.Username.Should().Be(consultant.Username);
            result.Email.Should().Be(consultant.Email);
            result.Location.Should().Be(consultant.Location);
            result.Availability.Should().Be(consultant.Availability);
            result.NumberOfTickets.Should().Be(consultant.NumberOfTickets);
            result.Skill.Should().Be(consultant.Skill);
        }

        [Fact]
        public async Task GivenAListOfUsers_WhenGetAllUsers_ThenReturnListOfUsersEntity()
        {
            var consultant = ConsultantFactory.Added2Consultants(_database.DbContext);

            var result = await _repository.GetAllAsync();

            result.Should().BeOfType<List<Consultant>>();
            var addedConsultant = result.FirstOrDefault(u => u.Id == consultant.Id);
            addedConsultant.Should().NotBeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenGetByIdAsync_ThenReturnAnUser()
        {
            var consultant = ConsultantFactory.AddedConsultant(_database.DbContext);

            var result = await _repository.GetByIdAsync(consultant.Id);

            result.Should().NotBeNull();
            result.Should().BeOfType<Consultant>();
            result.Id.Should().Be(consultant.Id);
            result.Username.Should().Be(consultant.Username);
            result.Email.Should().Be(consultant.Email);
            result.Location.Should().Be(consultant.Location);
            result.Availability.Should().Be(consultant.Availability);
            result.NumberOfTickets.Should().Be(consultant.NumberOfTickets);
            result.Skill.Should().Be(consultant.Skill);
        }

        [Fact]
        public async Task GivenAnInexistentId_WhenGetByIdAsync_ThenReturnNull()
        {
            var consultant = ConsultantFactory.ValidConsultant();

            var result = await _repository.GetByIdAsync(consultant.Id);

            result.Should().BeNull();
        }

        [Fact]
        public async Task GivenAnId_WhenDeleteAsync_ThenReturnTrue()
        {
            var consultant = ConsultantFactory.AddedConsultant(_database.DbContext);

            var result = await _repository.DeleteAsync(consultant.Id);

            result.Should().BeTrue();
        }

        [Fact]
        public async Task GivenAnInexistentId_WhenDeleteAsync_ThenReturnFalse()
        {
            var consultant = ConsultantFactory.ValidConsultant();

            var result = await _repository.DeleteAsync(consultant.Id);

            result.Should().BeFalse();
        }

        [Fact]
        public async Task GivenAConsultant_WhenUpdateConsultant_ThenReturnConsultantUpdated()
        {
            var consultant = ConsultantFactory.AddedConsultant(_database.DbContext);
            var updatedConsultant = ConsultantFactory.UpdateUsernameAndEmailValidConsultant(consultant.Id);

            var result = await _repository.UpdateConsultant(updatedConsultant);

            result.Should().BeOfType<Consultant>();
            result.Id.Should().Be(updatedConsultant.Id);
            result.Username.Should().Be(updatedConsultant.Username);
            result.Email.Should().BeEquivalentTo(updatedConsultant.Email);
            result.Location.Should().BeEquivalentTo(consultant.Location);
            result.Availability.Should().BeEquivalentTo(consultant.Availability);
            result.NumberOfTickets.Should().Be(consultant.NumberOfTickets);
            result.Skill.Should().BeEquivalentTo(consultant.Skill);
        }

        [Fact]
        public async Task GivenNewConsultantEmail_WhenCheckUniqueEmail_ThenReturnFalse()
        {
            var consultant = ConsultantFactory.ConsultantWithUniqueEmail(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(consultant.Email);

            result.Should().BeFalse();
        }

        [Fact]
        public async Task GivenExistingConsultantEmailInUsers_WhenCheckUniqueEmail_ThenReturnTrue()
        {
            var consultant = ConsultantFactory.ConsultantWithExistingEmailInUsers(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(consultant.Email);

            result.Should().BeTrue();
        }

        [Fact]
        public async Task GivenExistingConsultantEmailInConsultants_WhenCheckUniqueEmail_ThenReturnTrue()
        {
            var consultant = ConsultantFactory.ConsultantWithExistingEmailInConsultants(_database.DbContext);

            var result = await _repository.CheckUniqueEmail(consultant.Email);

            result.Should().BeTrue();
        }
    }
}