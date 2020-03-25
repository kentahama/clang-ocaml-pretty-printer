#!/bin/bash

clang \
    -fsyntax-only \
    -detailed-preprocessing-record \
    -Xclang -load \
    -Xclang facebook-clang-plugins/libtooling/build/FacebookClangPlugin.dylib \
    -Xclang -plugin \
    -Xclang YojsonASTExporter \
    -Xclang -plugin-arg-YojsonASTExporter \
    -Xclang - \
    -Xclang -plugin-arg-YojsonASTExporter \
    -Xclang USE_TEMP_DIR_FOR_DEDUPLICATION=build/tmp_YojsonASTExporter \
    -c $@
