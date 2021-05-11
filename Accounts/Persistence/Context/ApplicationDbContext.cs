using Application.Interfaces;
using MongoDB.Driver;

namespace Persistence.Context
{
    public class ApplicationDbContext : IApplicationDbContext
    {
        private readonly IMongoDatabase _database;
        public MongoClient Client { get; set; }
        public ApplicationDbContext(IAccountDatabaseSettings settings)
        {
            Client = new MongoClient(settings.ConnectionString);
            _database = Client.GetDatabase(settings.DatabaseName);
        }

        public IMongoCollection<T> GetCollection<T>()
        {
            return _database.GetCollection<T>(typeof(T).Name+"s");
        }
    }
}
