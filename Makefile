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
	@echo "    ${G}update${N}          Actualiza pilasengine y dependencias."
	@echo ""

iniciar:
	@echo "${G}Instalando dependencias ... ${N}"
	@npm install; bower install
	@rm -r -f repo_pilasengine.js
	@echo "${G}Clonando el repositorio de pilasengine.js ... ${N}"
	@git clone https://github.com/hugoruscitti/pilasengine.js.git repo_pilasengine.js
	@echo "${G}Instalando dependencias de pilasengine.js ... ${N}"
	@cd repo_pilasengine.js; make iniciar

update:
	cd repo_pilasengine.js; git stash; git pull; make compilar; git stash pop
	cp repo_pilasengine.js/dist public/

.PHONY: docs
