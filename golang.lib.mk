APPLICATION := $(lastword $(subst /, ,$(dir $(shell go list))))
PLATFORM := $(shell go env GOOS)_$(shell go env GOARCH)
PACKAGE := $(shell go list)
TESTS := $(wildcard *_test.go **/*_test.go)
SRC := $(filter-out $(TESTS), $(wildcard *.go **/*.go))
BIN := $(value GOPATH)\pkg\$(PLATFORM)\$(PACKAGE).a

# build when changed
$(BIN): $(SRC)
	go install

# run command at fixed intervals
watch: install
	@kouhai -i 2s '$(MAKE) test'

# run all tests and rebuild when changed
test: $(BIN)
	@go test $(PACKAGE)/...

# run make test and update golden files
golden: $(BIN)
	$(MAKE) test ARGS="--update"

# build and install application
install: $(BIN)

# remove application
clean: 
	@go clean -i

.PHONY: clean test golden watch install
