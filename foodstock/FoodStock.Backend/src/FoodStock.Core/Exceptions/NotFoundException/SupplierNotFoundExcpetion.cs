namespace FoodStock.Core.Exceptions;

public class SupplierNotFoundExcpetion : NotFoundException
{
    public Guid Id { get; }
    
    public SupplierNotFoundExcpetion(Guid id) : base($"Supplier with id: {id} not found.")
    {
        Id = id;
    }
}
