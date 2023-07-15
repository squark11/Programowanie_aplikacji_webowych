using FoodStock.Application.Repositories;
using FoodStock.Core.Entities;
using Microsoft.AspNetCore.Mvc;

namespace FoodStock.Api.Controllers;

[ApiController]
[Route("api/users")]
public class UserController : ControllerBase
{
    private readonly IUserRepository _userRepository;

    public UserController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<User>>> GetAll()
    {
        var users = await _userRepository.GetAllAsync();
        return Ok(users);
    }

    [HttpGet("{id:guid}")]
    public async Task<ActionResult<User>> Get([FromRoute] Guid id)
    {
        var user = await _userRepository.GetByIdAsync(id);
        if (user is null)
        {
            return NotFound();
        }
        
        return Ok(user);
    }
}
