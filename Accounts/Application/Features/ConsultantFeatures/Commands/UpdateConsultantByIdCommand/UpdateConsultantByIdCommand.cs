using Domain.Entities;
using MediatR;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand
{
    public class UpdateConsultantByIdCommand: IRequest<Consultant>
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string Id { get; set; }
        public string Username { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Location { get; set; }
        public string Skill { get; set; }
        public int NumberOfTickets { get; set; }
        public string Availability { get; set; }
    }
}
