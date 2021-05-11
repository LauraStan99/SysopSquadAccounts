using Domain.Common;
using System.Threading.Tasks;

namespace Application.Helpers
{
    internal static class ExtensionMethods
    {
        internal static TEntity HidePassword<TEntity>(this TEntity entity) where TEntity : BaseEntity
        {
            entity.PasswordHash = null;
            entity.PasswordSalt = null;
            return entity;
        }
        internal static Task<TEntity> HidePassword<TEntity>(this Task<TEntity> entity) where TEntity : BaseEntity
        {
            entity.Result.PasswordHash = null;
            entity.Result.PasswordSalt = null;
            return entity;
        }
    }
}
