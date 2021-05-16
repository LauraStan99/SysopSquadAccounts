using Application.Interfaces;
using Domain.Entities;
using Tests.Helpers.UserFactories;

namespace Tests.Helpers.ConsultantFactories
{
    public static class ConsultantFactory
    {
        public static Consultant ValidConsultant()
        {
            return new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "andu@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
        }
        public static Consultant AddedValidConsultantWithUniqueEmail(IApplicationDbContext context)
        {
            var consultant = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "anduunique@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            context.GetCollection<Consultant>().InsertOne(consultant);
            return consultant;
        }
        public static Consultant ValidConsultantWithId()
        {
            return new Consultant
            {
                Id = "6075e868974ac5357820d430",
                Username = "andu",
                Location = "Iasi",
                Email = "andu@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
        }

        public static Consultant Added2Consultants(IApplicationDbContext context)
        {
            var consultant1 = ValidConsultant();
            var consultant2 = ValidConsultant();
            context.GetCollection<Consultant>().InsertOne(consultant1);
            context.GetCollection<Consultant>().InsertOne(consultant2);
            return consultant1;
        }

        public static Consultant AddedConsultant(IApplicationDbContext context)
        {
            var consultant = ValidConsultant();
            context.GetCollection<Consultant>().InsertOne(consultant);
            return consultant;
        }

        public static Consultant UpdateUsernameAndEmailValidConsultant(string id)
        {
            return new Consultant()
            {
                Id = id,
                Username = "Catalin",
                Email = "cozma@yahoo.com"
            };
        }

        public static Consultant ConsultantWithUniqueEmail(IApplicationDbContext context)
        {
            var consultant1 = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "andu1@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            var consultant2 = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "andu2@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            context.GetCollection<Consultant>().InsertOne(consultant1);
            context.GetCollection<Consultant>().InsertOne(consultant2);

            var newConsultant = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "andu3@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            return newConsultant;
        }

        public static Consultant ConsultantWithExistingEmailInConsultants(IApplicationDbContext context)
        {
            var consultant1 = ValidConsultant();
            var consultant2 = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = "andu2@gmail.com",
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            context.GetCollection<Consultant>().InsertOne(consultant1);
            context.GetCollection<Consultant>().InsertOne(consultant2);

            var newConsultant = ValidConsultant();
            return newConsultant;
        }

        public static Consultant ConsultantWithExistingEmailInUsers(IApplicationDbContext context)
        {
            var consultant = ValidConsultant();
            var user = UserFactory.ValidUser();
            context.GetCollection<User>().InsertOne(user);
            context.GetCollection<Consultant>().InsertOne(consultant);

            var newConsultant = new Consultant
            {
                Username = "andu",
                Location = "Iasi",
                Email = user.Email,
                Skill = "software",
                NumberOfTickets = 10,
                Availability = "available"
            };
            return newConsultant;
        }
    }
}
