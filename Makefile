CLANG_PLUGINS=facebook-clang-plugins
PLUGIN_LIB_DIR=$(CLANG_PLUGINS)/clang-ocaml/build
CLANG_AST_LIBS=$(patsubst %,$(PLUGIN_LIB_DIR)/%.cmx,clang_ast_types clang_ast_t clang_ast_j process utils yojson_utils)
LIBS=$(patsubst %,%.cmx,print)

OCAMLOPT=ocamlfind ocamlopt -package unix,atdgen,atdgen-runtime,camlzip -I $(PLUGIN_LIB_DIR) -safe-string

main.exe: $(CLANG_AST_LIBS) $(LIBS) main.cmx
	$(OCAMLOPT) -linkpkg -o $@ $^

%.cmx: %.ml
	$(OCAMLOPT) -c $<
%.cmi: %.mli
	$(OCAMLOPT) -c $<

-include .depend
.depend: $(wildcard *.ml) $(wildcard *.mli)
	ocamldep -native $^ > .depend

.PHONY: clean
clean:
	-@rm -v *.cmx *.cmi *.o .depend main.exe
