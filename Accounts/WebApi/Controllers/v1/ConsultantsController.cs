using System;
using System.Threading.Tasks;
using Application.Features.ConsultantFeatures.Commands.DeleteConsultantByIdCommand;
using Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand;
using Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand;
using Application.Features.ConsultantFeatures.Queries.GetAllConsultantsQuery;
using Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery;
using Application.Features.ConsultantFeatures.Queries.GetConsultantByIdQuery;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers.v1
{
    [ApiVersion("1.0")]
    public class ConsultantsController : BaseApiController
    {
        public ConsultantsController(IMediator mediator) : base(mediator)
        {
        }

        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await Mediator.Send(new GetAllConsultantsQuery()));
        }

        [HttpGet("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(string id)
        {
            try
            {
                return Ok(await Mediator.Send(new GetConsultantByIdQuery(id)));
            }
            catch (Exception ex)
            {
                return BadRequest(new { error = ex.Message });
            }
        }

        [HttpGet("best")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [AllowAnonymous]
        public async Task<IActionResult> GetBestConsultant([FromQuery(Name = "skill")] string skill,[FromQuery(Name = "location")] string location)
        {
            return Ok(await Mediator.Send(new GetBestConsultantQuery(skill, location)));
        }

        [HttpDelete("{id:length(24)}")]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Delete(string id)
        {
            var deleted = await Mediator.Send(new DeleteConsultantByIdCommand(id));
            if(deleted)
                return NoContent();
            return NotFound();            
        }

        [AllowAnonymous]
        [HttpPost("register")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        public async Task<IActionResult> Register([FromBody] RegisterConsultantCommand command)
        {
            var consultant = await Mediator.Send(command);
            return Ok(new
            {
                consultant.Id,
                consultant.Username,
                consultant.Email,
                consultant.Skill,
                consultant.NumberOfTickets,
                consultant.Location,
                consultant.Availability
            });
        }

        [HttpPut]
        [AllowAnonymous]
        [ProducesResponseType(StatusCodes.Status204NoContent)]
        [ProducesResponseType(StatusCodes.Status404NotFound)]
        public async Task<IActionResult> Update(UpdateConsultantByIdCommand command)
        {
            await Mediator.Send(command);
            return NoContent();
        }
    }
}
