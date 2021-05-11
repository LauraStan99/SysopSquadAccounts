using System.Collections.Generic;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using FluentValidation.TestHelper;
using Moq;
using Tests.Helpers.UserFactories;
using WebApi.Validators;
using WebApi.Validators.UserValidators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests.UserTests
{
    public class UpdateUserValidatorsTest
    {
        private readonly UpdateUserByIdCommandValidator _validator;
        private readonly User _user;

        public UpdateUserValidatorsTest()
        {
            _user = UserFactory.ValidUserWithId();
            var mockRepo = new Mock<IUserRepository>();
            mockRepo.Setup(db => db.GetByIdAsync(_user.Id).Result).Returns(_user);
            _validator = new UpdateUserByIdCommandValidator(mockRepo.Object);
        }

        [Fact]
        public void GivenValidData_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithNoId_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateUserByIdCommandFactory.UpdateUserCommandWithoutId();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.EmptyId);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.TicketsId);
        }

        [Fact]
        public void GivenDataWithInvalidIdStructure_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateUserByIdCommandFactory.UpdateUserCommandWithInvalidIdStructure();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InvalidIdStructure);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.TicketsId);
        }

        [Fact]
        public void GivenDataWithInvalidIdLength_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateUserByIdCommandFactory.UpdateUserCommandWithInvalidIdLength();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InvalidIdLength);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.TicketsId);
        }

        [Fact]
        public void GivenDataWithInexistentId_WhenValidateUpdate_ThenReturnErrors()
        {
            var command = UpdateUserByIdCommandFactory.UpdateUserCommandWithInexistentId();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Id)
                .WithErrorMessage(ValidationErrors.InexistentId);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.TicketsId);
        }

        [Fact]
        public void GivenDataWithoutUsername_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);
            command.Username = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutPassword_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);
            command.Password = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutLocation_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);
            command.Location = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutEmail_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);
            command.Email = "";

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenDataWithoutTicketsId_WhenValidateUpdate_ThenReturnNoErrors()
        {
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(_user.Id);
            command.TicketsId = new List<string>();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }
    }
}
