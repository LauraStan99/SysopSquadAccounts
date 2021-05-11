using Application.Features.AccountFeatures.Commands.LoginCommand;
using Application.Interfaces;
using Domain.Entities;
using FluentValidation;
using System.Linq;

namespace WebApi.Validators.AccountValidators
{
    public class LoginCommandValidator: AbstractValidator<LoginCommand>
    {
        private readonly IAccountRepository _repository;

        public LoginCommandValidator(IAccountRepository repository)
        {
            _repository = repository;

            RuleFor(account => account.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyPassword)
                .MinimumLength(4).WithMessage(ValidationErrors.ShortPassword)
                .Must(p => p.Any(char.IsDigit)).WithMessage(ValidationErrors.NoDigitPassword);

            RuleFor(account => account.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyEmail)
                .EmailAddress().WithMessage(ValidationErrors.InvalidEmail)
                .MustAsync(async (email, cancellation) =>
                {
                    var user = await _repository.GetByEmailAsync<User>(email);
                    var consultant = await _repository.GetByEmailAsync<Consultant>(email);
                    return user != null || consultant != null;
                }).WithMessage(ValidationErrors.InexistentLoginEmail);
        }
    }
}
