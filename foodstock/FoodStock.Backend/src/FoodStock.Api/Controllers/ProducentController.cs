using FoodStock.Application.Functions.ProducentFunctions.Queries.GetProducentDetail;
using FoodStock.Application.Functions.ProducentFunctions.Queries.GetProducentListQuery;
using MediatR;
using Microsoft.AspNetCore.Mvc;

namespace FoodStock.Api.Controllers;

[ApiController]
[Route("api/producents")]
public class ProducentController : ControllerBase
{
    private readonly IMediator _mediator;
    
    public ProducentController(IMediator mediator)
    {
        _mediator = mediator;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<ProducentListViewModel>>> GetAll()
    {
        var producents = await _mediator.Send(new GetProducentListQuery());
        return Ok(producents);
    }

    [HttpGet("{id:guid}")]
    public async Task<ActionResult<ProducentDetailViewModel>> Get([FromRoute] Guid id)
    {
        var producent = await _mediator.Send(new GetProducentDetailQuery {Id = id});
        if (producent is null)
        {
            return NotFound();
        }
        return Ok(producent);
    }
}
