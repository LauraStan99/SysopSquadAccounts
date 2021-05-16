using Application.Interfaces;
using Persistence.Context;
using Persistence.Repository.v1;
using System;

namespace Infrastructure.Tests.Helpers
{

    public class DatabaseTest : IDisposable
    {
        private readonly string dbName = "AccountsTestDatabase";
        public IApplicationDbContext DbContext { get; }
        public IUserRepository UserRepository { get; }
        public IConsultantRepository ConsultantRepository { get; }
        public IAccountRepository AccountRepository { get; }

        public DatabaseTest()
        {
            ConnectionDatabase.DbContextSettings.ConnectionString = ConnectionDatabase.connString;
            ConnectionDatabase.DbContextSettings.DatabaseName = dbName;
            DbContext = new ApplicationDbContext(ConnectionDatabase.DbContextSettings);
            UserRepository = new UserRepository(DbContext);
            ConsultantRepository = new ConsultantRepository(DbContext);
            AccountRepository = new AccountRepository(DbContext);
        }

        public void Dispose()
        {
            DbContext.Client.GetDatabase(dbName).DropCollection("Users");
            DbContext.Client.GetDatabase(dbName).DropCollection("Consultants");
        }
    }
}
