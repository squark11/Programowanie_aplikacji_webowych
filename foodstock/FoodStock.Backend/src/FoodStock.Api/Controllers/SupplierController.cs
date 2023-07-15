﻿using FoodStock.Application.Functions.SupplierFunctions.Queries.GetSupplierDetail;
using FoodStock.Application.Functions.SupplierFunctions.Queries.GetSupplierList;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace FoodStock.Api.Controllers;

[ApiController]
[Route("api/suppliers")]
public class SupplierController : ControllerBase
{
    private readonly IMediator _mediator;
    
    public SupplierController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<SupplierListViewModel>>> GetAll()
    {
        var suppliers = await _mediator.Send(new GetSupplierListQuery());
        return Ok(suppliers);
    }

    [HttpGet("{id:guid}")]
    public async Task<ActionResult<SupplierDetailViewModel>> Get([FromRoute] Guid id)
    {
        var supplier = await _mediator.Send(new GetSupplierDetailQuery { Id = id });
        if (supplier is null)
        {
            return NotFound();
        }

        return Ok(supplier);
    }
    
}
