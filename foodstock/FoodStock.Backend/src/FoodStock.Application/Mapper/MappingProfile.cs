using AutoMapper;
using FoodStock.Application.Functions.CategoryFunctions.Commands.CreateCategory;
using FoodStock.Application.Functions.CategoryFunctions.Commands.UpdateCategory;
using FoodStock.Application.Functions.CategoryFunctions.Queries.GetCategoriesList;
using FoodStock.Application.Functions.CategoryFunctions.Queries.GetCategoryDetail;
using FoodStock.Application.Functions.ProducentFunctions.Queries.GetProducentDetail;
using FoodStock.Application.Functions.ProducentFunctions.Queries.GetProducentListQuery;
using FoodStock.Application.Functions.ProductFunctions.Commands.CreateProduct;
using FoodStock.Application.Functions.ProductFunctions.Commands.UpdateProduct;
using FoodStock.Application.Functions.ProductFunctions.Queries;
using FoodStock.Application.Functions.ProductFunctions.Queries.GetProductDetail;
using FoodStock.Application.Functions.ProductFunctions.Queries.GetProductsList;
using FoodStock.Application.Functions.SupplierFunctions.Queries.GetSupplierDetail;
using FoodStock.Application.Functions.SupplierFunctions.Queries.GetSupplierList;
using FoodStock.Core.Entities;

namespace FoodStock.Application.Mapper;

public class MappingProfile : Profile
{
    public MappingProfile()
    {
        //Product Mapper
        CreateMap<Product, ProductListViewModel>()
            .ForMember(dest => dest.CategoryName, 
                opt=> opt.MapFrom(src => src.Category.CategoryName));
        CreateMap<Product, ProductListByCategoryIdViewModel>()
            .ForMember(dest => dest.CategoryName,
                opt => opt.MapFrom(src => src.Category.CategoryName));
        CreateMap<Product, ProductDetailViewModel>()
            .ForMember(dest => dest.CategoryName,
                opt => opt.MapFrom(src => src.Category.CategoryName));
        CreateMap<Product, CreateProductCommand>().ReverseMap();
        CreateMap<Product, UpdateProductCommand>().ReverseMap();

        //Producent Mapper
        CreateMap<Producent, ProducentListViewModel>();
        CreateMap<Producent, ProducentDetailViewModel>();
        
        //Supplier Mapper
        CreateMap<Supplier, SupplierDetailViewModel>();
        CreateMap<Supplier, SupplierListViewModel>();
        
        //Category Mapper
        CreateMap<Category, CategoryListViewModel>();
        CreateMap<Category, CategoryDetailViewModel>();
        CreateMap<Category, UpdateCategoryCommand>().ReverseMap();
        CreateMap<Category, CreateCategoryCommand>().ReverseMap();
    }
}
