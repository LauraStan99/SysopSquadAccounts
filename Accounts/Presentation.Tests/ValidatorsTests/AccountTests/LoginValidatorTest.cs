using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using FluentValidation.TestHelper;
using Moq;
using Tests.Helpers.AccountFactories;
using Tests.Helpers.ConsultantFactories;
using Tests.Helpers.UserFactories;
using WebApi.Validators;
using WebApi.Validators.AccountValidators;
using Xunit;

namespace Presentation.Tests.ValidatorsTests.AccountTests
{
    public class LoginValidatorTest
    {
        private readonly LoginCommandValidator _validator;

        public LoginValidatorTest()
        {
            var user = UserFactory.ValidUser();
            var consultant = ConsultantFactory.ValidConsultant();
            var mockRepo = new Mock<IAccountRepository>();
            mockRepo.Setup(db => db.GetByEmailAsync<Consultant>(consultant.Email).Result).Returns(consultant);
            mockRepo.Setup(db => db.GetByEmailAsync<User>(user.Email).Result).Returns(user);
            _validator = new LoginCommandValidator(mockRepo.Object);
        }

        [Fact]
        public void GivenValidData_WhenValidateUserLogin_ThenReturnNoErrors()
        {
            var command = LoginCommandFactory.ValidLoginUserCommand();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenValidData_WhenValidateConsultantLogin_ThenReturnNoErrors()
        {
            var command = LoginCommandFactory.ValidLoginConsultantCommand();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeTrue();
            result.ShouldNotHaveAnyValidationErrors();
        }

        [Fact]
        public void GivenUnregisteredAccount_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithInexistingEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Email).WithErrorMessage(ValidationErrors.InexistentLoginEmail);
            result.ShouldNotHaveValidationErrorFor(a=>a.Password);
        }

        [Fact]
        public void GivenEmptyEmail_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithEmptyEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Email).WithErrorMessage(ValidationErrors.EmptyEmail);
            result.ShouldNotHaveValidationErrorFor(a => a.Password);
        }

        [Fact]
        public void GivenEmptyPassword_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithEmptyPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Password).WithErrorMessage(ValidationErrors.EmptyPassword);
            result.ShouldNotHaveValidationErrorFor(a => a.Email);
        }

        [Fact]
        public void GivenShortPassword_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithShortPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Password).WithErrorMessage(ValidationErrors.ShortPassword);
            result.ShouldNotHaveValidationErrorFor(a => a.Email);
        }

        [Fact]
        public void GivenNoDigitPassword_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithNoDigitPassword();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Password).WithErrorMessage(ValidationErrors.NoDigitPassword);
            result.ShouldNotHaveValidationErrorFor(a => a.Email);
        }

        [Fact]
        public void GivenInvalidEmail_WhenValidateLogin_ThenReturnErrors()
        {
            var command = LoginCommandFactory.LoginCommandWithInvalidEmail();

            var result = _validator.TestValidate(command);

            result.IsValid.Should().BeFalse();
            result.ShouldHaveValidationErrorFor(a => a.Email).WithErrorMessage(ValidationErrors.InvalidEmail);
            result.ShouldNotHaveValidationErrorFor(a => a.Password);
        }
    }
}
