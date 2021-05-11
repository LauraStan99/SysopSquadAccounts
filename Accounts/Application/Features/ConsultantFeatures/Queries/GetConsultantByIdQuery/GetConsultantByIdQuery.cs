using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.ConsultantFeatures.Queries.GetConsultantByIdQuery
{
    public class GetConsultantByIdQuery: IRequest<Consultant>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public GetConsultantByIdQuery(string id)
        {
            Id = id;
        }
    }
}
