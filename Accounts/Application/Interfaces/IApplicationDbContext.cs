using MongoDB.Driver;

namespace Application.Interfaces
{
    public interface IApplicationDbContext
    {
        MongoClient Client { get; set; }
        IMongoCollection<T> GetCollection<T>();
    }
}
