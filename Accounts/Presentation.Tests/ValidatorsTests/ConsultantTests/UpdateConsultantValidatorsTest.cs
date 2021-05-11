using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using FluentValidation.TestHelper;
using Moq;
using Tests.Helpers.ConsultantFactories;
using WebApi.Validators;
using WebApi.Validators.ConsultantValidators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests.ConsultantTests
{
    public class UpdateConsultantValidatorsTest
    {
        private readonly UpdateConsultantByIdCommandValidator _validator;
        private readonly Consultant _consultant;

        public UpdateConsultantValidatorsTest()
        {
            _consultant = ConsultantFactory.ValidConsultantWithId();
            var mockRepo = new Mock<IConsultantRepository>();
            mockRepo.Setup(db => db.GetByIdAsync(_consultant.Id).Result).Returns(_consultant);
            _validator = new UpdateConsultantByIdCommandValidator(mockRepo.Object);
        }

        [Fact]
        public void GivenValidData_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithNoId_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.UpdateConsultantCommandWithoutId();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.EmptyId);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Skill);
            result.ShouldNotHaveValidationErrorFor(user => user.Availability);
            result.ShouldNotHaveValidationErrorFor(user => user.NumberOfTickets);
        }

        [Fact]
        public void GivenDataWithInvalidIdStructure_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.UpdateConsultantCommandWithInvalidIdStructure();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InvalidIdStructure);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Skill);
            result.ShouldNotHaveValidationErrorFor(user => user.Availability);
            result.ShouldNotHaveValidationErrorFor(user => user.NumberOfTickets);
        }

        [Fact]
        public void GivenDataWithInvalidIdLength_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.UpdateConsultantCommandWithInvalidIdLength();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InvalidIdLength);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Skill);
            result.ShouldNotHaveValidationErrorFor(user => user.Availability);
            result.ShouldNotHaveValidationErrorFor(user => user.NumberOfTickets);
        }

        [Fact]
        public void GivenDataWithInexistentId_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.UpdateConsultantCommandWithInexistentId();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InexistentId);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Skill);
            result.ShouldNotHaveValidationErrorFor(user => user.Availability);
            result.ShouldNotHaveValidationErrorFor(user => user.NumberOfTickets);
        }

        [Fact]
        public void GivenDataWithoutUsername_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Username = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutPassword_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Password = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutEmail_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Email = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutLocation_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Location = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutSkill_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Skill = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutNumberOfTickets_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.NumberOfTickets = 0;

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutAvailability_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(_consultant.Id);
            command.Availability = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }
    }
}
