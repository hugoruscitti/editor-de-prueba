VERSION=0.0.4
NOMBRE="editor-de-prueba"

N=[0m
G=[01;32m
Y=[01;33m
B=[01;34m

DMG_NAME=editor-de-prueba-${VERSION}.dmg
NAME=editor-de-prueba

comandos:
	@echo ""
	@echo "${B}Comandos disponibles para ${Y}${NOMBRE}${N} (versión: ${VERSION})"
	@echo ""
	@echo "  ${Y}Comandos iniciales${N}"
	@echo ""
	@echo "    ${G}iniciar${N}         Instala dependencias."
	@echo "    ${G}iniciar_dev${N}     Instala dependencias con enlaces simbólicos."
	@echo "    ${G}update${N}          Actualiza pilasengine y dependencias."
	@echo ""
	@echo "  ${Y}Comandos de desarrollo${N}"
	@echo ""
	@echo "    ${G}build${N}           Compila la aplicación."
	@echo "    ${G}build_watch${N}     Compila la aplicación constantemente."
	@echo "    ${G}test_mac${N}        Ejecuta la aplicación en modo desarrollo."
	@echo ""
	@echo "  ${Y}Comandos de publicación${N}"
	@echo ""
	@echo "    ${G}version${N}         Aumenta la versión."
	@echo "    ${G}sync${N}            Sincroniza la versión generada."
	@echo "    ${G}dist${N}            Genera los binarios."
	@echo "    ${G}upload${N}          Sube los binarios a github-releases."
	@echo ""


_instalar_dependencias:
	@echo "${G}Instalando dependencias ... ${N}"
	@npm install; bower install
	@rm -r -f repo_pilasengine.js

iniciar: _instalar_dependencias
	@echo "${G}Clonando el repositorio de pilasengine.js ... ${N}"
	@git clone https://github.com/hugoruscitti/pilasengine.js.git repo_pilasengine.js
	@echo "${G}Instalando dependencias de pilasengine.js ... ${N}"
	@cd repo_pilasengine.js; make iniciar

version:
	# patch || minor
	@bumpversion patch --current-version ${VERSION} Makefile --list

sync:
	git commit -am 'release ${VERSION}'
	git tag '${VERSION}'
	git push
	git push --all
	git push --tags

iniciar_dev: _instalar_dependencias
	@echo "${G}Vinculando el repositorio de pilasengine.js ... ${N}"
	@ln -s ../pilasengine.js/ repo_pilasengine.js
	make _actualizar_pilasengine

_actualizar_pilasengine:
	@echo "${G}Actualizando e instalando pilasengine.js ... ${N}"
	@cd repo_pilasengine.js; git pull; make iniciar

update:
	cd repo_pilasengine.js; git pull; make compilar
	cp repo_pilasengine.js/dist/js/phaser.js vendor/libs/phaser.js
	cp repo_pilasengine.js/dist/js/pilasengine.js vendor/libs/pilasengine.js
	cp -r repo_pilasengine.js/dist/data/* public/data/
	
build:
	ember build

build_watch:
	ember build --watch

test_mac:
	electron dist

dist: build
	electron-packager dist/ ${NAME} --platform=darwin --arch=x64 --version=0.35.1
	hdiutil create -volname ${NAME} -srcfolder ${NAME}-darwin-x64/${NAME}.app -ov -format UDZO ${DMG_NAME}

upload:
	publish-release --token 35ff7e5428cfab187f9be32bc37149db1c80883e --owner hugoruscitti --repo ${NAME} --name "${VERSION}" --assets ${DMG_NAME}
	

.PHONY: docs dist upload

