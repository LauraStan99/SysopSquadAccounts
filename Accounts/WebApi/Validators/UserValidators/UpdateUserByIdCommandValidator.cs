using Application.Features.UserFeatures.Commands.UpdateUserByIdCommand;
using Application.Interfaces;
using FluentValidation;
using System.Linq;

namespace WebApi.Validators.UserValidators
{
    public class UpdateUserByIdCommandValidator : AbstractValidator<UpdateUserByIdCommand>
    {
        private readonly IUserRepository _repository;
        
        public UpdateUserByIdCommandValidator(IUserRepository repository)
        {
            _repository = repository;
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(user => user.Id)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure)
                .MustAsync(async (id, cancellation) =>
                {
                    var user = await _repository.GetByIdAsync(id);
                    return user != null;
                }).WithMessage(ValidationErrors.InexistentId);

            When(user => !string.IsNullOrEmpty(user.Username), () =>
            {
                RuleFor(user => user.Username)
                    .Length(2, 25).WithMessage(ValidationErrors.ShortUsername);
            });

            When(user => !string.IsNullOrEmpty(user.Email), () =>
            {
                RuleFor(user => user.Email)
                    .Cascade(CascadeMode.Stop)
                    .EmailAddress().WithMessage(ValidationErrors.InvalidEmail)
                    .MustAsync(async (email, cancellation) =>
                    {
                        var exists = await _repository.CheckUniqueEmail(email);
                        return !exists;
                    }).WithMessage(ValidationErrors.NotUniqueEmail);
            });

            When(user => !string.IsNullOrEmpty(user.Password), () =>
            {
                RuleFor(user => user.Password)
                    .Cascade(CascadeMode.Stop)
                    .MinimumLength(4).WithMessage(ValidationErrors.ShortPassword)
                    .Must(p => p.Any(char.IsDigit)).WithMessage(ValidationErrors.NoDigitPassword);
            });

            When(user => !string.IsNullOrEmpty(user.Location), () =>
            {
                RuleFor(user => user.Location)
                    .Cascade(CascadeMode.Stop)
                    .MinimumLength(2).WithMessage(ValidationErrors.ShortLocation);
            });
        }
    }
}
