using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.UserFeatures.Commands.DeleteUserByIdCommand
{
    public class DeleteUserByIdCommand : IRequest<bool>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public readonly string Id;

        public DeleteUserByIdCommand(string id)
        {
            Id = id;
        }
    }
}
