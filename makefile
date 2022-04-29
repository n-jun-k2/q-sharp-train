show/projects:
	@docker-compose run --rm q dotnet new -i Microsoft.Quantum.ProjectTemplates -n console

project/%:
	@docker-compose run --rm q dotnet new $(*D) -lang Q# -o $(@F)

run/%:
	@docker-compose run --rm q dotnet run --project $(@F) --configuration $(*D)