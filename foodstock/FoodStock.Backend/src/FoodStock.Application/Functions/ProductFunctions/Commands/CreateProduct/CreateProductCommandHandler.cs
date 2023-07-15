using AutoMapper;
using FoodStock.Application.Repositories;
using FoodStock.Core;
using FoodStock.Core.Entities;
using MediatR;

namespace FoodStock.Application.Functions.ProductFunctions.Commands.CreateProduct;

public class CreateProductHandler : IRequestHandler<CreateProductCommand, CreateProductCommandResponse>
{
    private readonly IProductRepository _productRepository;
    private readonly IMapper _mapper;

    public CreateProductHandler(IProductRepository productRepository, IMapper mapper)
    {
        _productRepository = productRepository;
        _mapper = mapper;
    }

    public async Task<CreateProductCommandResponse> Handle(CreateProductCommand request,
        CancellationToken cancellationToken)
    {
        var validator = new CreateProductCommandValidator();
        var validatorResult = await validator.ValidateAsync(request);

        if (!validatorResult.IsValid)
        {
            return new CreateProductCommandResponse(validatorResult);
        }

        var product = _mapper.Map<Product>(request with {Id = Guid.NewGuid()});
        
        product = await _productRepository.AddAsync(product);

        return new CreateProductCommandResponse(product.Id);
    }
}