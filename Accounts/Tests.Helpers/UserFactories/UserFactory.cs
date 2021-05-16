using Application.Interfaces;
using Domain.Entities;
using Tests.Helpers.ConsultantFactories;

namespace Tests.Helpers.UserFactories
{
    public static class UserFactory
    {
        public static User ValidUser()
        {
            return new User
            {   
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
        }
        public static User AddedValidUserWithUniqueEmail(IApplicationDbContext context)
        {
            var user = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozmaunique@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            context.GetCollection<User>().InsertOne(user);
            return user; 
        }
        public static User ValidUserWithId()
        {
            return new User
            {
                Id = "6075e868974ac5357820d433",
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
        }
        public static User AddedUser(IApplicationDbContext context)
        {
            var user = ValidUser();
            context.GetCollection<User>().InsertOne(user);
            return user;
        }

        public static User Added2Users(IApplicationDbContext context)
        {
            var user1 = ValidUser();
            var user2 = ValidUser();
            context.GetCollection<User>().InsertOne(user1);
            context.GetCollection<User>().InsertOne(user2);
            return user1;
        }
        public static User UpdateUsernameAndEmailValidUser(string id)
        {
            return new User
            {
                Id = id,
                Username = "Catalin",
                Email = "cozma@yahoo.com"            
            };
        }
        public static User UpdateTypeValidUser(string id)
        {
            return new User
            {
                Id = id,
                Type = "Employee"
            };
        }

        public static User UserWithUniqueEmail(IApplicationDbContext context)
        {
            var user1 = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma1@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            var user2 = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma2@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            context.GetCollection<User>().InsertOne(user1);
            context.GetCollection<User>().InsertOne(user2);

            var newUser = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma3@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            return newUser;
        }
        public static User UserWithExistingEmailInUsers(IApplicationDbContext context)
        {
            var user1 = ValidUser();
            var user2 = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = "cozma2@gmail.com",
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            context.GetCollection<User>().InsertOne(user1);
            context.GetCollection<User>().InsertOne(user2);

            var newUser = ValidUser();
            return newUser;
        }
        public static User UserWithExistingEmailInConsultants(IApplicationDbContext context)
        {
            var user = ValidUser();
            var consultant = ConsultantFactory.ValidConsultant();
            context.GetCollection<User>().InsertOne(user);
            context.GetCollection<Consultant>().InsertOne(consultant);

            var newUser = new User
            {
                Username = "Cozma",
                Location = "Romania/Iasi/Iasi",
                Email = consultant.Email,
                Type = "Client",
                TicketsId = { "6075e868974ac5357820d428" }
            };
            return newUser;
        }
    }
}
