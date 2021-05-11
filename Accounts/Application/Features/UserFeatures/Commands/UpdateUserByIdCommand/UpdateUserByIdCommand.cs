using System.Collections.Generic;
using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.UserFeatures.Commands.UpdateUserByIdCommand
{
    public class UpdateUserByIdCommand : IRequest<User>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Location { get; set; }
        public List<string> TicketsId { get; set; }

    }
}
