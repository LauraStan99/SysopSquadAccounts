using System.Collections.Generic;
using Domain.Entities;
using MediatR;

namespace Application.Features.ConsultantFeatures.Queries.GetAllConsultantsQuery
{
    public class GetAllConsultantsQuery : IRequest<IEnumerable<Consultant>> { }
}
