using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebApi.Controllers
{
    [ApiController]
    [Route("api/v{version:apiVersion}/[controller]")]
    [Authorize]
    public class BaseApiController : ControllerBase
    {
        protected IMediator Mediator;

        public BaseApiController(IMediator mediator)
        {
            this.Mediator = mediator;
        }
    }
}
