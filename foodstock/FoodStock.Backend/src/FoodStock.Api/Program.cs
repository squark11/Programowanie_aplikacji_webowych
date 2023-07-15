using FoodStock.Application;
using FoodStock.Core;
using FoodStock.Infrastructure;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services
    .AddCore()
    .AddApplication()
    .AddInfrastructure(builder.Configuration);

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//Add this line to listen on port 80
#if !DEBUG
    builder.WebHost.UseUrls("http://*:80");
#endif

var MyAllowSpecificOrigins = "_myAllowSpecificOrigins";
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.UseCors(MyAllowSpecificOrigins);

app.UseInfrastructure();

app.Run();