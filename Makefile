DIST_FOLDER = Dist
GAME_LOVE = ${DIST_FOLDER}/game.love
EXCLUDE_ZIP = Dist/**\* .git/**\* Makefile .gitignore .editorconfig .luarc.json .make.lua _web/**\* Docs/**\*

zip:
	rm -rf ${DIST_FOLDER}/ 
	mkdir ${DIST_FOLDER}/
	zip -r0 ${GAME_LOVE} . -x ${EXCLUDE_ZIP}
