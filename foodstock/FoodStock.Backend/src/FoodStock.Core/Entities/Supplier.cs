﻿namespace FoodStock.Core.Entities;

public class Supplier
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public virtual List<Product> Products { get; set; }
}
