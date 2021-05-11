using Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand;
using Application.Interfaces;
using FluentValidation;
using System.Linq;

namespace WebApi.Validators.ConsultantValidators
{
    public class UpdateConsultantByIdCommandValidator : AbstractValidator<UpdateConsultantByIdCommand>
    {
        private readonly IConsultantRepository _repository;
        private enum ConsultantSkills
        {
            Software, Hardware, Hr
        };
        private enum ConsultantAvailability
        {
            Available, Away
        };
        public UpdateConsultantByIdCommandValidator(IConsultantRepository repository)
        {
            _repository = repository;
            const string idRegex = "^[a-f\\d]{24}$";

            RuleFor(consultant => consultant.Id)
                .Cascade(CascadeMode.Stop)
                .NotEmpty().WithMessage(ValidationErrors.EmptyId)
                .Length(24).WithMessage(ValidationErrors.InvalidIdLength)
                .Matches(idRegex).WithMessage(ValidationErrors.InvalidIdStructure)
                .MustAsync(async (id, cancellation) =>
                {
                    var consultant = await _repository.GetByIdAsync(id);
                    return consultant != null;
                }).WithMessage(ValidationErrors.InexistentId);

            When(consultant => !string.IsNullOrEmpty(consultant.Username), () =>
            {
                RuleFor(consultant => consultant.Username)
                    .Length(2, 25).WithMessage(ValidationErrors.ShortUsername);
            });

            When(consultant => !string.IsNullOrEmpty(consultant.Email), () =>
            {
                RuleFor(consultant => consultant.Email)
                    .Cascade(CascadeMode.Stop)
                    .EmailAddress().WithMessage(ValidationErrors.InvalidEmail)
                    .MustAsync(async (email, cancellation) =>
                    {
                        var exists = await _repository.CheckUniqueEmail(email);
                        return !exists;
                    }).WithMessage(ValidationErrors.NotUniqueEmail);
            });

            When(consultant => !string.IsNullOrEmpty(consultant.Password), () =>
            {
                RuleFor(consultant => consultant.Password)
                    .Cascade(CascadeMode.Stop)
                    .MinimumLength(4).WithMessage(ValidationErrors.ShortPassword)
                    .Must(p => p.Any(char.IsDigit)).WithMessage(ValidationErrors.NoDigitPassword);
            });

            When(consultant => !string.IsNullOrEmpty(consultant.Location), () =>
            {
                RuleFor(consultant => consultant.Location)
                    .Cascade(CascadeMode.Stop)
                    .MinimumLength(2).WithMessage(ValidationErrors.ShortLocation);
            });

            When(consultant => !string.IsNullOrEmpty(consultant.Skill), () =>
            {
                RuleFor(consultant => consultant.Skill)
                    .Cascade(CascadeMode.Stop)
                    .IsEnumName(typeof(ConsultantSkills), caseSensitive: false).WithMessage(ValidationErrors.InvalidSkill);
            });

            When(consultant => !string.IsNullOrEmpty(consultant.Availability), () =>
            {
                RuleFor(consultant => consultant.Availability)
                    .Cascade(CascadeMode.Stop)
                    .IsEnumName(typeof(ConsultantAvailability), caseSensitive: false).WithMessage(ValidationErrors.InvalidAvailability);
            });

            When(consultant => consultant.NumberOfTickets != 0, () =>
            {
                RuleFor(consultant => consultant.NumberOfTickets)
                    .GreaterThan(1).WithMessage(ValidationErrors.InvalidNumberOfTickets);
            });
        }
    }
}
