using Application.Interfaces;

namespace Persistence.Context
{
    public class AccountDatabaseSettings : IAccountDatabaseSettings
    {
        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
    }
}
