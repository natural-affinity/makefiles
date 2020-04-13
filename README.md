# Makefiles (メイクファイル)

Makefiles for reuse across projects.

* `golang.bin.mk`: Golang applications with a main package (binary)
* `golang.lib.mk`: Golang applications without a main package (library)

## Usage
Include via `make --include-dir=DIR` or use [mmake](https://github.com/tj/mmake).

```bash
readonly MKHOME="$HOME/projects"

# add alias for make 
function make() {
    command make $@ -I $MKHOME 2>&1 --no-print-directory | grep -v "warning"
}
```

Clone the repo into `$MKHOME`.
```bash
cd $MKHOME
git clone https://github.com/natural-affinity/makefiles.git
```

Reuse rules via the `include` directive.

```Makefile
# include common makefile
include makefiles/golang.bin.mk

# add more rules
```

## Links
* [Tutorial](http://makefiletutorial.com/)
* [GNU make](https://www.gnu.org/software/make/manual/make.html)
* [go command](https://golang.org/cmd/go/)

## License
Released under the MIT License. See [LICENSE.md](./LICENSE.md) for details.
