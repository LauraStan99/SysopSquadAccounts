using Xunit;

namespace Infrastructure.Tests.Helpers
{
    [CollectionDefinition("Database collection")]
    public class DatabaseCollection : ICollectionFixture<DatabaseTest>
    {
    }
}
