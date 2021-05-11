using Application.Interfaces;
using FluentAssertions;
using FluentValidation.TestHelper;
using Moq;
using Tests.Helpers.ConsultantFactories;
using WebApi.Validators;
using WebApi.Validators.ConsultantValidators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests.ConsultantTests
{
    public class RegisterConsultantValidatorsTest
    {
        private readonly RegisterConsultantCommandValidator _validator;

        public RegisterConsultantValidatorsTest()
        {
            var command = RegisterConsultantCommandFactory.ValidRegisterConsultantCommandWithExistingEmail();
            var mockRepo = new Mock<IConsultantRepository>();
            mockRepo.Setup(db => db.CheckUniqueEmail(command.Email).Result).Returns(true);
            _validator = new RegisterConsultantCommandValidator(mockRepo.Object);
        }
        [Fact]
        public void GivenValidData_WhenValidateRegister_ThenReturnNoErrors()
        {
            var command = RegisterConsultantCommandFactory.ValidRegisterConsultantCommand();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }
        [Fact]
        public void GivenShortPassword_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithShortPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.ShortPassword);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenPasswordWithNoDigits_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithNoDigitsPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.NoDigitPassword);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenNoPassword_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithNoPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.EmptyPassword);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenEmptyUsername_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithEmptyUsername();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.EmptyUsername);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
        }
        [Fact]
        public void GivenEmptyLocation_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithEmptyLocation();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Location)
                .WithErrorMessage(ValidationErrors.EmptyLocation);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenEmptyEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithEmptyEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.EmptyEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenNoData_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithNoData();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.EmptyEmail);
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.EmptyUsername);
            result.ShouldHaveValidationErrorFor(c => c.Location)
                .WithErrorMessage(ValidationErrors.EmptyLocation);
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.EmptyPassword);
        }
        [Fact]
        public void GivenShortUsername_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithShortUsername();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.ShortUsername);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
        }
        [Fact]
        public void GivenShortLocation_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithShortLocation();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Location)
                .WithErrorMessage(ValidationErrors.ShortLocation);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenInvalidEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.RegisterConsultantCommandWithInvalidEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.InvalidEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
        [Fact]
        public void GivenExistingEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterConsultantCommandFactory.ValidRegisterConsultantCommandWithExistingEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.NotUniqueEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
    }
}
