using System.Threading.Tasks;
using Domain.Common;

namespace Application.Interfaces
{
    public interface IAccountRepository
    {
        Task<TEntity> GetByEmailAsync<TEntity>(string email) where TEntity : BaseEntity;
        ResponseEntity Login(ResponseEntity entity);
    }
}
