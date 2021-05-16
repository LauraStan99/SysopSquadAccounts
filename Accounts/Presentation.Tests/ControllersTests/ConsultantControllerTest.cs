using Application.Features.ConsultantFeatures.Commands.DeleteConsultantByIdCommand;
using Application.Features.ConsultantFeatures.Queries.GetAllConsultantsQuery;
using Application.Features.ConsultantFeatures.Queries.GetBestConsultantQuery;
using Application.Features.ConsultantFeatures.Queries.GetConsultantByIdQuery;
using FakeItEasy;
using FluentAssertions;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using MongoDB.Bson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tests.Helpers.ConsultantFactories;
using WebApi.Controllers.v1;
using Xunit;

namespace Presentation.Tests.ControllersTests
{
    public class ConsultantControllerTest
    {
        private readonly ConsultantsController _controller;
        private readonly IMediator _mediator;
        public ConsultantControllerTest()
        {
            _mediator = A.Fake<IMediator>();
            _controller = new ConsultantsController(_mediator);
        }

        [Fact]
        public async Task GivenConsultantController_WhenGetAllIsCalled_ThenReturnConsultantCollection()
        {
            var result = await _controller.GetAll();
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetAllConsultantsQuery>._, default)).MustHaveHappenedOnceExactly();

        }

        [Fact]
        public async Task GivenConsultantController_WhenGetByIdIsCalled_ThenReturnConsultantWithId()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.GetById(id);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetConsultantByIdQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenConsultantController_WhenGetBestConsultantIsCalled_ThenReturnConsultant()
        {
            var skill = "Software";
            var location = "Iasi";

            var result = await _controller.GetBestConsultant(skill, location);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetBestConsultantQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenConsultantController_WhenDeleteIsCalledWithNewId_ThenReturnNotFound()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.Delete(id);
            var notFoundResult = result as NotFoundResult;

            notFoundResult.Should().NotBeNull();
            notFoundResult.StatusCode.Should().Be(404);
            A.CallTo(() => _mediator.Send(A<DeleteConsultantByIdCommand>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenConsultantController_WhenRegisterIsCalled_ThenReturnConsultant()
        {
            var command = RegisterConsultantCommandFactory.ValidRegisterConsultantCommand();

            var result = await _controller.Register(command);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenConsultantController_WhenUpdateIsCalled_ThenReturnNoContent()
        {
            var id = ObjectId.GenerateNewId().ToString();
            var command = UpdateConsultantByIdCommandFactory.ValidUpdateConsultantCommand(id);

            var result = await _controller.Update(command);
            var noContentResult = result as NoContentResult;

            noContentResult.Should().NotBeNull();
            noContentResult.StatusCode.Should().Be(204);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }
    }
}
