using System.Text;
using System.Threading.Tasks;
using Application.Interfaces;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using Persistence.Context;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using MongoDB.Driver;
using Persistence.Helpers;
using Persistence.Repository.v1;

namespace Persistence
{
    public static class DependencyInjection
    {
        public static void AddPersistence(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<AccountDatabaseSettings>(configuration.GetSection("AccountDatabaseSettings"));

            services.AddSingleton<IAccountDatabaseSettings>(sp =>
                sp.GetRequiredService<IOptions<AccountDatabaseSettings>>().Value);

            services.AddScoped<IApplicationDbContext, ApplicationDbContext>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IConsultantRepository, ConsultantRepository>();
            services.AddScoped<IAccountRepository, AccountRepository>();

            var mongoCon = configuration.GetSection("AccountDatabaseSettings")["ConnectionString"];
            services.AddSingleton<IMongoClient>(new MongoClient(mongoCon));

            var key = Encoding.ASCII.GetBytes(AppSettings.Secret);
            services.AddAuthentication(x =>
                {
                    x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                    x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(x =>
                {
                    x.Events = new JwtBearerEvents
                    {
                        OnTokenValidated = context =>
                        {
                            var userService = context.HttpContext.RequestServices.GetRequiredService<IUserRepository>();
                            var userId = context.Principal.Identity.Name;
                            var user = userService.GetByIdAsync(userId);
                            if (user == null)
                            {
                                context.Fail("Unauthorized");
                            }

                            var consultantService = context.HttpContext.RequestServices.GetRequiredService<IConsultantRepository>();
                            var consultantId = context.Principal.Identity.Name;
                            var consultant = consultantService.GetByIdAsync(consultantId);
                            if (consultant == null)
                            {
                                context.Fail("Unauthorized");
                            }

                            return Task.CompletedTask;

                        }
                    };
                    x.RequireHttpsMetadata = false;
                    x.SaveToken = true;
                    x.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = false,
                        ValidateAudience = false
                    };
                });
        }
    }
}
