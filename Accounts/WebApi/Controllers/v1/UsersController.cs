using System;
using System.Threading.Tasks;
using Application.Features.UserFeatures.Commands.DeleteUserByIdCommand;
using Application.Features.UserFeatures.Commands.RegisterUserCommand;
using Application.Features.UserFeatures.Commands.UpdateUserByIdCommand;
using Application.Features.UserFeatures.Queries.GetAllUsersQuery;
using Application.Features.UserFeatures.Queries.GetUserByIdQuery;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers.v1
{
    [ApiVersion("1.0")]
    public class UsersController:BaseApiController
    {
        public UsersController(IMediator mediator) : base(mediator)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await Mediator.Send(new GetAllUsersQuery()));
        }

        [HttpGet("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(string id)
        {
            try
            {
                return Ok(await Mediator.Send(new GetUserByIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpDelete("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(string id)
        {
            var deleted = await Mediator.Send(new DeleteUserByIdCommand(id));
            if (deleted)
                return NoContent();
            return NotFound();
        }

        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [AllowAnonymous]
        public async Task<IActionResult> Register([FromBody] RegisterUserCommand command)
        {
            var user = await Mediator.Send(command);
            return Ok(new
            {
                user.Id,
                user.Username,
                user.Email,
                user.Type,
                user.Location
            });
        }

        [HttpPut]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Update(UpdateUserByIdCommand command)
        {
            await Mediator.Send(command);
            return NoContent();
        }

    }
}
