show/projects:
	@docker-compose run --rm q dotnet new -i Microsoft.Quantum.ProjectTemplates -n console

project/%:
	@docker-compose run --rm q dotnet new $(*D) -lang Q# -o $(@F)

run/%:
	@docker-compose run --rm q dotnet run --project $(@F) --configuration $(*D)

clean/%:
	@docker-compose run --rm q dotnet clean $(@F) --configuration $(*D)

test/%:
	@docker-compose run --rm q /bin/bash -c "cd $(@F) && dotnet restore && dotnet test"

restore/%:
	@docker-compose run --rm q /bin/bash -c "cd $(@F) && dotnet restore"

add/%:
	docker-compose run --rm q dotnet add $(*D) package $(@F)

clear:
	docker-compsoe run --rm q dotnet nuget locals all --clear
