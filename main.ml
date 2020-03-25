module J = Clang_ast_j
let rec print_decl d =
    match d with
    | J.TranslationUnitDecl (di, ds, dci, tudi) ->
       (* print_endline "TranslationUnitDecl"; *)
       List.iter print_decl ds
    | J.TypedefDecl _ ->
       (* print_endline "Typedef" *) ()
    | J.VarDecl (di, ndi, qt, vdi) ->
       print_endline (J.string_of_named_decl_info ndi);
       print_endline (J.string_of_var_decl_info vdi)
    | J.AccessSpecDecl _|J.BlockDecl _|J.CapturedDecl _
      |J.ClassScopeFunctionSpecializationDecl _|J.EmptyDecl _|J.ExportDecl _
      |J.ExternCContextDecl _|J.FileScopeAsmDecl _|J.FriendDecl _
      |J.FriendTemplateDecl _|J.ImportDecl _|J.LinkageSpecDecl _|J.LabelDecl _
      |J.NamespaceDecl _|J.NamespaceAliasDecl _|J.ObjCCompatibleAliasDecl _
      |J.ObjCCategoryDecl _|J.ObjCCategoryImplDecl _|J.ObjCImplementationDecl _
      |J.ObjCInterfaceDecl _|J.ObjCProtocolDecl _|J.ObjCMethodDecl _
      |J.ObjCPropertyDecl _|J.BuiltinTemplateDecl _|J.ConceptDecl _
      |J.ClassTemplateDecl _|J.FunctionTemplateDecl _|J.TypeAliasTemplateDecl _
      |J.VarTemplateDecl _|J.TemplateTemplateParmDecl _|J.EnumDecl _|J.RecordDecl _
      |J.CXXRecordDecl _|J.ClassTemplateSpecializationDecl _
      |J.ClassTemplatePartialSpecializationDecl _|J.TemplateTypeParmDecl _
      |J.ObjCTypeParamDecl _|J.TypeAliasDecl _
      |J.UnresolvedUsingTypenameDecl _|J.UsingDecl _|J.UsingDirectiveDecl _
      |J.UsingPackDecl _|J.UsingShadowDecl _|J.ConstructorUsingShadowDecl _
      |J.BindingDecl _|J.FieldDecl _|J.ObjCAtDefsFieldDecl _|J.ObjCIvarDecl _
      |J.FunctionDecl _|J.CXXDeductionGuideDecl _|J.CXXMethodDecl _
      |J.CXXConstructorDecl _|J.CXXConversionDecl _|J.CXXDestructorDecl _
      |J.MSPropertyDecl _|J.NonTypeTemplateParmDecl _
      |J.DecompositionDecl _|J.ImplicitParamDecl _|J.OMPCapturedExprDecl _
      |J.ParmVarDecl _|J.VarTemplateSpecializationDecl _
      |J.VarTemplatePartialSpecializationDecl _|J.EnumConstantDecl _
      |J.IndirectFieldDecl _|J.OMPDeclareMapperDecl _|J.OMPDeclareReductionDecl _
      |J.UnresolvedUsingValueDecl _|J.OMPAllocateDecl _|J.OMPRequiresDecl _
      |J.OMPThreadPrivateDecl _|J.ObjCPropertyImplDecl _|J.PragmaCommentDecl _
      |J.PragmaDetectMismatchDecl _|J.StaticAssertDecl _
    -> (print_endline "unimplemented")

let () =
  let fname = Sys.argv.(1) in
  let ic = open_in_bin fname in
  let d = Marshal.from_channel ic in
  print_decl d;
  close_in ic
