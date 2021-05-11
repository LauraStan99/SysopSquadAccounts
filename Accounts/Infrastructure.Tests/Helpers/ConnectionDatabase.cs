using Persistence.Context;

namespace Infrastructure.Tests.Helpers
{
    public static class ConnectionDatabase
    {
        public static AccountDatabaseSettings DbContextSettings = new();
        public static string connString = "mongodb+srv://laura:1234@cluster0.pratu.mongodb.net/myFirstDatabase?authSource=admin&replicaSet=atlas-1f4lzo-shard-0&w=majority&readPreference=primary&appname=MongoDB%20Compass&retryWrites=true&ssl=true";
    }
}
