namespace FoodStock.Core.Entities;

public class User
{
    public Guid Id { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
    public string FirstName { get; set; }
    public string Surname { get; set; }
    public Guid RoleId { get; set; }
    public virtual Role Role { get; set; }
    public virtual List<Product> Products { get; set; }

}
