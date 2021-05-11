using System.Collections.Generic;
using Domain.Entities;
using MediatR;

namespace Application.Features.UserFeatures.Queries.GetAllUsersQuery
{
    public class GetAllUsersQuery : IRequest<IEnumerable<User>>
    {
    }
}
