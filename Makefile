VERSION=0.0.1
NOMBRE="editor-de-prueba"

N=[0m
G=[01;32m
Y=[01;33m
B=[01;34m


comandos:
	@echo ""
	@echo "${B}Comandos disponibles para ${Y}${NOMBRE}${N} (versión: ${VERSION})"
	@echo ""
	@echo "  ${Y}Para desarrolladores${N}"
	@echo ""
	@echo "    ${G}iniciar${N}         Instala dependencias."
	@echo "    ${G}iniciar_dev${N}     Instala dependencias con enlaces simbólicos."
	@echo "    ${G}update${N}          Actualiza pilasengine y dependencias."
	@echo ""
	@echo "    ${G}test_mac${N}        Ejecuta la aplicación en modo desarrollo."
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

test_mac:
	electron dist

.PHONY: docs

