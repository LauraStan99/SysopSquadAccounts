using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.UserFeatures.Queries.GetUserByIdQuery
{
    public class GetUserByIdQuery: IRequest<User>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public GetUserByIdQuery(string id)
        {
            Id = id;
        }
    }
}
