# Makefiles (メイクファイル)

Makefiles for reuse across projects.

* `golang.bin.mk`: Golang applications with a main package (binary)
* `golang.lib.mk`: Golang applications without a main package (library)

## Usage
1. Include via `make --include-dir=DIR` or use [mmake](https://github.com/tj/mmake).

```bash
readonly MKHOME="$HOME/projects"

# add alias for make 
function make() {
    command make $@ -I $MKHOME 2>&1 --no-print-directory | grep -v "warning"
}
```

2. Reuse rules via the `include` directive.

```Makefile
# include common makefile
include github.com/natural-affinity/makefiles/golang.bin.mk

# add more rules
```

## License
Released under the MIT License. See [LICENSE.md](./LICENSE.md) for details.
