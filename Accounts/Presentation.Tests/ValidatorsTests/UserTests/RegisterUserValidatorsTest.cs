using Application.Interfaces;
using FluentAssertions;
using FluentValidation.TestHelper;
using Moq;
using Tests.Helpers.UserFactories;
using WebApi.Validators;
using WebApi.Validators.UserValidators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests.UserTests
{
    public class RegisterUserValidatorsTest 
    {
        private readonly RegisterUserCommandValidator _validator;

        public RegisterUserValidatorsTest()
        {
            var command = RegisterUserCommandFactory.ValidRegisterUserCommandWithExistingEmail();
            var mockRepo = new Mock<IUserRepository>();
            mockRepo.Setup(db => db.CheckUniqueEmail(command.Email).Result).Returns(true);
            _validator = new RegisterUserCommandValidator(mockRepo.Object);
        }

        [Fact]
        public void GivenValidData_WhenValidateRegister_ThenReturnNoErrors()
        {
            var command = RegisterUserCommandFactory.ValidRegisterUserCommand();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenShortPassword_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithShortPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.ShortPassword);
            result.ShouldNotHaveValidationErrorFor(user=>user.Email);
            result.ShouldNotHaveValidationErrorFor(user=>user.Location);
            result.ShouldNotHaveValidationErrorFor(user=>user.Type);
            result.ShouldNotHaveValidationErrorFor(user=>user.Username);
        }

        [Fact]
        public void GivenPasswordWithNoDigits_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithNoDigitsPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.NoDigitPassword);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenInvalidType_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithWrongType();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Type)
                .WithErrorMessage(ValidationErrors.InvalidUserType);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenEmptyPasswordAndNoUsername_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithEmptyPasswordAndNoUsername();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.EmptyPassword);
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.EmptyUsername);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
        }

        [Fact]
        public void GivenNoPassword_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithNoPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Password)
                .WithErrorMessage(ValidationErrors.EmptyPassword);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenEmptyUsername_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithEmptyUsername();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.EmptyUsername);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
        }

        [Fact]
        public void GivenEmptyLocation_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithEmptyLocation();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Location)
                .WithErrorMessage(ValidationErrors.EmptyLocation);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenEmptyEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithEmptyEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.EmptyEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenEmptyType_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithEmptyType();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Type)
                .WithErrorMessage(ValidationErrors.EmptyType);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenNoData_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithNoData();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Type)
                .WithErrorMessage(ValidationErrors.EmptyType);
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
            var command = RegisterUserCommandFactory.RegisterUserCommandWithShortUsername();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Username)
                .WithErrorMessage(ValidationErrors.ShortUsername);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
        }

        [Fact]
        public void GivenShortLocation_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithShortLocation();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Location)
                .WithErrorMessage(ValidationErrors.ShortLocation);
            result.ShouldNotHaveValidationErrorFor(user => user.Email);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenInvalidEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.RegisterUserCommandWithInvalidEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.InvalidEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }

        [Fact]
        public void GivenExistingEmail_WhenValidateRegister_ThenReturnValidationErrors()
        {
            var command = RegisterUserCommandFactory.ValidRegisterUserCommandWithExistingEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveAnyValidationError();
            result.ShouldHaveValidationErrorFor(c => c.Email)
                .WithErrorMessage(ValidationErrors.NotUniqueEmail);
            result.ShouldNotHaveValidationErrorFor(user => user.Password);
            result.ShouldNotHaveValidationErrorFor(user => user.Location);
            result.ShouldNotHaveValidationErrorFor(user => user.Type);
            result.ShouldNotHaveValidationErrorFor(user => user.Username);
        }
    }
}
