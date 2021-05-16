using Application.Features.UserFeatures.Queries.GetAllUsersQuery;
using MediatR;
using Moq;
using FakeItEasy;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApi.Controllers.v1;
using Xunit;
using MongoDB.Bson;
using Application.Features.UserFeatures.Queries.GetUserByIdQuery;
using Microsoft.AspNetCore.Mvc;
using FluentAssertions;
using Application.Features.UserFeatures.Commands.DeleteUserByIdCommand;
using Tests.Helpers.UserFactories;

namespace Presentation.Tests.ControllersTests
{
    public class UserControllerTest
    {
        private readonly UsersController _controller;
        private readonly IMediator _mediator;
        public UserControllerTest()
        {
            _mediator = A.Fake<IMediator>();
            _controller = new UsersController(_mediator);
        }

        [Fact]
        public async Task GivenUserController_WhenGetAllIsCalled_ThenReturnUserCollection()
        {
            var result = await _controller.GetAll();
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetAllUsersQuery>._, default)).MustHaveHappenedOnceExactly();
            
        }

        [Fact]
        public async Task GivenUserController_WhenGetByIdIsCalled_ThenReturnUserWithId()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.GetById(id);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(A<GetUserByIdQuery>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenUserController_WhenDeleteIsCalledWithNewId_ThenReturnNotFound()
        {
            var id = ObjectId.GenerateNewId().ToString();

            var result = await _controller.Delete(id);
            var notFoundResult = result as NotFoundResult;

            notFoundResult.Should().NotBeNull();
            notFoundResult.StatusCode.Should().Be(404);
            A.CallTo(() => _mediator.Send(A<DeleteUserByIdCommand>._, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenUserController_WhenRegisterIsCalled_ThenReturnUser()
        {
            var command = RegisterUserCommandFactory.ValidRegisterUserCommand();

            var result = await _controller.Register(command);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }

        [Fact]
        public async Task GivenUserController_WhenUpdateIsCalled_ThenReturnNoContent()
        {
            var id = ObjectId.GenerateNewId().ToString();
            var command = UpdateUserByIdCommandFactory.ValidUpdateUserCommand(id);

            var result = await _controller.Update(command);
            var noContentResult = result as NoContentResult;

            noContentResult.Should().NotBeNull();
            noContentResult.StatusCode.Should().Be(204);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }
    }
}
