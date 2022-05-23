theme = <theme-name>
plugin = <plugin-name>

build: prep build_theme build_plugins

prep:
	if [ -z "$(theme)" ];then return 1;fi

	mkdir packages
	mkdir packages/$(theme)
	mkdir packages/$(plugin)
	git --no-pager log \
	`git --no-pager describe --tags --abbrev=0 @^`..@ \
	--graph \
	--pretty='%Cred%h%Creset - %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' \
	>> CHANGELOG.md

build_theme:
	echo "Packaging Themes"
	rsync -chav --delete --exclude /package.json \
		--exclude /package-lock.json \
		--exclude node_modules \
		--exclude /parent \
		--exclude /gulpfile.js \
		--exclude .babelrc \
		--exclude .DS_Store \
		./src/ ./packages/$(theme)
	(cd packages && zip -r ./$(theme).zip ./$(theme))

build_plugins:
	echo "Packaging Plugins"
	rsync -chav --delete --exclude .DS_Store \
		./src-plugin/ packages/$(plugin)
	(cd packages && zip -r ./$(plugin).zip ./$(plugin))

clean:
	rm -rf ./packages && rm CHANGELOG.md