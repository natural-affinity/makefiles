APPLICATION := $(lastword $(subst /, ,$(dir $(shell go list)/)))
PACKAGE := $(shell go list)
TESTS := $(wildcard *_test.go **/*_test.go)
SRC := $(filter-out $(TESTS), $(wildcard *.go **/*.go))
EXT := $(shell go env GOEXE)
BIN := $(value GOPATH)\bin\$(APPLICATION)$(EXT)

# build when changed
$(BIN): $(SRC)
	go build -o $(BIN) -ldflags '-s -w'

# run command at fixed intervals
watch: install
	@kouhai -i 2s 'make test'

# run all tests and rebuild when changed
test: $(BIN)
	@go test $(PACKAGE)/... $(ARGS)

# run make test and update golden files
golden: $(BIN)
	$(MAKE) test ARGS="--update"

# build and install application
install: $(BIN)

# remove application
clean: 
	@go clean -i

.PHONY: clean test golden watch install
