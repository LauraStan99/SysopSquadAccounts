using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using Application.Features.ConsultantFeatures.Queries.GetAllConsultantsQuery;
using Application.Features.ConsultantFeatures.Queries.GetConsultantByIdQuery;
using Application.Helpers;
using Application.Interfaces;
using Domain.Entities;
using FluentAssertions;
using Moq;
using Tests.Helpers.ConsultantFactories;
using Xunit;

namespace Core.Tests.ConsultantTests
{
    public class QueriesTests
    {
        [Fact]
        public async Task GivenAList_WhenGetAllConsultantsQueryHandler_ThenReturnNotNull()
        {
            var consultant1 = ConsultantFactory.ValidConsultant();
            var consultant2 = ConsultantFactory.ValidConsultant();
            var consultants = new List<Consultant> {consultant1, consultant2};
            var command = new GetAllConsultantsQuery();
            var mockRepo = new Mock<IConsultantRepository>();
            mockRepo.Setup(db => db.GetAllAsync().Result).Returns(consultants);
            var handler = new GetAllConsultantsQueryHandler(mockRepo.Object);

            var result = await handler.Handle(command, CancellationToken.None);

            result.Should().NotContainNulls();
            result.Should().HaveCount(consultants.Count);
            result.Should().Contain(consultant1);
        }
    }
}
