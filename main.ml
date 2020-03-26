let () =
  let fname = Sys.argv.(1) in
  let verbose = try Sys.argv.(2) = "-v" with _ -> false in
  let d = Yojson_utils.read_data_from_file Clang_ast_j.read_decl fname in
  if verbose
  then
    print_endline (Clang_ast_j.string_of_decl d)
  else
    Print.print_decl d
