using Application.Features.UserFeatures.Commands.RegisterUserCommand;
using Application.Features.UserFeatures.Commands.UpdateUserByIdCommand;
using Domain.Entities;
using AutoMapper;
using Application.Features.ConsultantFeatures.Commands.RegisterConsultantCommand;
using Application.Features.ConsultantFeatures.Commands.UpdateConsultantByIdCommand;
using Domain.Common;

namespace Application.Helpers
{
    public class AutoMapperProfile : Profile
    {
        public AutoMapperProfile()
        {
            CreateMap<RegisterUserCommand, User>();
            CreateMap<UpdateUserByIdCommand, User>();

            CreateMap<RegisterConsultantCommand, Consultant>();
            CreateMap<UpdateConsultantByIdCommand, Consultant>();

            CreateMap<BaseEntity, ResponseEntity>();
        }
    }
}
