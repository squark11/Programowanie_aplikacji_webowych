using FoodStock.Application.Repositories;
using FoodStock.Core.Entities;

namespace FoodStock.Infrastructure.DAL.Repositories;

internal sealed class UserRepository : BaseRepository<User>, IUserRepository
{
    public UserRepository(FoodStockDbContext dbContext) : base(dbContext)
    {
    }
}
