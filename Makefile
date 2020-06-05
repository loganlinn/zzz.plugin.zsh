build: README.md

README.md: zzz.plugin.zsh build/bin/shdoc FORCE
	build/bin/shdoc < $< > $@

build/lib/shdoc:
	@mkdir -p $@
	@curl -sL https://github.com/reconquest/shdoc/archive/master.tar.gz | tar xz --directory $@ --strip-components 1
	@sed -i '' 's/#!\/usr\/bin\/awk/#!\/usr\/bin\/env awk/' $@/shdoc

build/bin/shdoc: build/lib/shdoc
	@mkdir -p $(@D)
	@ln -s $(abspath build/lib/shdoc/shdoc) $@

clean:
	@rm -rf build

FORCE:
