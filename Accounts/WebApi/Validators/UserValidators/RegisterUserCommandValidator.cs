using Application.Features.UserFeatures.Commands.RegisterUserCommand;
using Application.Interfaces;
using FluentValidation;
using System.Linq;

namespace WebApi.Validators.UserValidators
{
    public class RegisterUserCommandValidator : AbstractValidator<RegisterUserCommand>
    {
        private readonly IUserRepository _repository;

        private enum UserType
        {
            Client, Employee, CallCenter
        };
        public RegisterUserCommandValidator(IUserRepository repository)
        {
            _repository = repository;

            RuleFor(user => user.Username)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyUsername)
                .Length(2, 25).WithMessage(ValidationErrors.ShortUsername);

            RuleFor(user => user.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyPassword)
                .MinimumLength(4).WithMessage(ValidationErrors.ShortPassword)
                .Must(p => p.Any(char.IsDigit)).WithMessage(ValidationErrors.NoDigitPassword);

            RuleFor(user => user.Location)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyLocation)
                .MinimumLength(2).WithMessage(ValidationErrors.ShortLocation);

            RuleFor(user => user.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyEmail)
                .EmailAddress().WithMessage(ValidationErrors.InvalidEmail)
                .MustAsync(async (email, cancellation) =>
                {
                    bool exists = await _repository.CheckUniqueEmail(email);
                    return !exists;
                }).WithMessage(ValidationErrors.NotUniqueEmail);

            RuleFor(user => user.Type)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyType)
                .IsEnumName(typeof(UserType), caseSensitive: false).WithMessage(ValidationErrors.InvalidUserType);
        }
    }
}
