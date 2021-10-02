.PHONY: watch fmt test compile elixir-shell enter-env deps

ELIXIR_IMAGE_VERSION?=1.12-slim
ELIXIR_IMAGE_REPO?=elixir
ELIXIR_IMAGE_FULLNAME=$(ELIXIR_IMAGE_REPO):$(ELIXIR_IMAGE_VERSION)

watch:
	modd

fmt:
	mix format

compile: fmt
	mix compile

test: compile
	mix test

elixir-shell:
	iex -S mix

deps:
	mix deps.get
	mix deps

elixirEnvName?=mqtt-kv-dev
enter-env:
	docker run --rm --name $(elixirEnvName) -ti -v $(PWD):$(PWD) -w $(PWD) $(ELIXIR_IMAGE_FULLNAME) sh
