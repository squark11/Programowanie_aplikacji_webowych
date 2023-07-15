using System.Security.AccessControl;
using System.Security.Principal;

namespace FoodStock.Core.Entities;

public class Product
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public Guid CategoryId { get; set; }
    public virtual Category Category { get; set; }
    public Guid ProducentId { get; set; }
    public virtual Producent Producent { get; set; }
    public DateTime ExpirationDate { get; set; }
    public int Quantity { get; set; }
    public string? BarCode { get; set; }
    public DateTime AddedDate { get; set; }
    public Guid UserId { get; set; }
    public virtual User User { get; set; }
    public DateTime DeliveryDate { get; set; }
    public Guid SupplierId { get; set; }
    public virtual Supplier Supplier { get; set; }

    public Product()
    {
        AddedDate = DateTime.Now;
    }
}
