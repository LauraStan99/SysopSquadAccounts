namespace Application.Interfaces
{
    public interface IAccountDatabaseSettings
    {
        string ConnectionString { get; set; }
        string DatabaseName { get; set; }
    }
}
