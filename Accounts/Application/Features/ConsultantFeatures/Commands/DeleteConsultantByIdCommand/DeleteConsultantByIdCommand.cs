using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.ConsultantFeatures.Commands.DeleteConsultantByIdCommand
{
    public class DeleteConsultantByIdCommand : IRequest<bool>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public DeleteConsultantByIdCommand(string id)
        {
            Id = id;
        }
    }
}
