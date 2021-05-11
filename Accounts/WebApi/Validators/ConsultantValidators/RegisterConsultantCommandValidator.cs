using Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand;
using Application.Interfaces;
using FluentValidation;
using System.Linq;

namespace WebApi.Validators.ConsultantValidators
{
    public class RegisterConsultantCommandValidator : AbstractValidator<RegisterConsultantCommand>
    {
        private readonly IConsultantRepository _repository;

        public RegisterConsultantCommandValidator(IConsultantRepository repository)
        {
            _repository = repository;

            RuleFor(consultant => consultant.Username)
               .Cascade(CascadeMode.Stop)
               .NotEmpty().WithMessage(ValidationErrors.EmptyUsername)
               .Length(2, 25).WithMessage(ValidationErrors.ShortUsername);

            RuleFor(consultant => consultant.Password)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyPassword)
                .MinimumLength(4).WithMessage(ValidationErrors.ShortPassword)
                .Must(p => p.Any(char.IsDigit)).WithMessage(ValidationErrors.NoDigitPassword);

            RuleFor(consultant => consultant.Location)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyLocation)
                .MinimumLength(2).WithMessage(ValidationErrors.ShortLocation);

            RuleFor(consultant => consultant.Email)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyEmail)
                .EmailAddress().WithMessage(ValidationErrors.InvalidEmail)
                .MustAsync(async (email, cancellation) =>
                {
                    bool exists = await _repository.CheckUniqueEmail(email);
                    return !exists;
                }).WithMessage(ValidationErrors.NotUniqueEmail);
        }
    }
}
