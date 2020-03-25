CLANG_PLUGINS := facebook-clang-plugins
LIB_DIR := $(CLANG_PLUGINS)/clang-ocaml/build
CLANG_AST_LIBS=$(patsubst %,$(LIB_DIR)/%.cmx,clang_ast_types clang_ast_t clang_ast_j process utils yojson_utils)

OCAMLOPT := ocamlfind ocamlopt -package unix,atdgen,atdgen-runtime,camlzip -I $(LIB_DIR) -safe-string

main.exe: $(CLANG_AST_LIBS) main.cmx
	$(OCAMLOPT) -linkpkg -o $@ $^

%.cmx: %.ml
	$(OCAMLOPT) -c $^
%.cmi: $.mli
	$(OCAMLOPT) -c $^

.PHONY: clean
clean:
	-@rm -v *.cmx *.cmi *.o main.exe
