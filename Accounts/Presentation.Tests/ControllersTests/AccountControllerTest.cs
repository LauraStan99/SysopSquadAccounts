using FakeItEasy;
using FluentAssertions;
using MediatR;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Tests.Helpers.AccountFactories;
using WebApi.Controllers.v1;
using Xunit;

namespace Presentation.Tests.ControllersTests
{
    public class AccountControllerTest
    {
        private readonly AccountsController _controller;
        private readonly IMediator _mediator;
        public AccountControllerTest()
        {
            _mediator = A.Fake<IMediator>();
            _controller = new AccountsController(_mediator);
        }

        [Fact]
        public async Task GivenAccountsController_WhenLoginIsCalled_ThenReturnAccount()
        {
            var command = LoginCommandFactory.ValidLoginUserCommand();

            var result = await _controller.Login(command);
            var okResult = result as OkObjectResult;

            okResult.Should().NotBeNull();
            okResult.StatusCode.Should().Be(200);
            A.CallTo(() => _mediator.Send(command, default)).MustHaveHappenedOnceExactly();
        }

    }
}
