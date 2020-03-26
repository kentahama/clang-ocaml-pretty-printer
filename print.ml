open Clang_ast_j

let rec print_decl d =
  match d with
  | TranslationUnitDecl (di, ds, dci, tudi) ->
     (* print_endline "TranslationUnitDecl"; *)
     List.iter print_decl ds
  | TypedefDecl (di, ndi, tp, tdi) ->
     "TypedefDecl "
     ^ string_of_decl_info di
     ^ string_of_named_decl_info ndi
     ^ string_of_type_ptr tp
     ^ string_of_typedef_decl_info tdi
     |> print_endline
  | VarDecl (di, ndi, qt, vdi) ->
     "VarDecl "
     ^ string_of_named_decl_info ndi
     ^ string_of_var_decl_info vdi
     |> print_endline
  |AccessSpecDecl _|BlockDecl _|CapturedDecl _
   |ClassScopeFunctionSpecializationDecl _|EmptyDecl _|ExportDecl _
   |ExternCContextDecl _|FileScopeAsmDecl _|FriendDecl _
   |FriendTemplateDecl _|ImportDecl _|LinkageSpecDecl _|LabelDecl _
   |NamespaceDecl _|NamespaceAliasDecl _|ObjCCompatibleAliasDecl _
   |ObjCCategoryDecl _|ObjCCategoryImplDecl _|ObjCImplementationDecl _
   |ObjCInterfaceDecl _|ObjCProtocolDecl _|ObjCMethodDecl _
   |ObjCPropertyDecl _|BuiltinTemplateDecl _|ConceptDecl _
   |ClassTemplateDecl _|FunctionTemplateDecl _|TypeAliasTemplateDecl _
   |VarTemplateDecl _|TemplateTemplateParmDecl _|EnumDecl _|RecordDecl _
   |CXXRecordDecl _|ClassTemplateSpecializationDecl _
   |ClassTemplatePartialSpecializationDecl _|TemplateTypeParmDecl _
   |ObjCTypeParamDecl _|TypeAliasDecl _
   |UnresolvedUsingTypenameDecl _|UsingDecl _|UsingDirectiveDecl _
   |UsingPackDecl _|UsingShadowDecl _|ConstructorUsingShadowDecl _
   |BindingDecl _|FieldDecl _|ObjCAtDefsFieldDecl _|ObjCIvarDecl _
   |FunctionDecl _|CXXDeductionGuideDecl _|CXXMethodDecl _
   |CXXConstructorDecl _|CXXConversionDecl _|CXXDestructorDecl _
   |MSPropertyDecl _|NonTypeTemplateParmDecl _
   |DecompositionDecl _|ImplicitParamDecl _|OMPCapturedExprDecl _
   |ParmVarDecl _|VarTemplateSpecializationDecl _
   |VarTemplatePartialSpecializationDecl _|EnumConstantDecl _
   |IndirectFieldDecl _|OMPDeclareMapperDecl _|OMPDeclareReductionDecl _
   |UnresolvedUsingValueDecl _|OMPAllocateDecl _|OMPRequiresDecl _
   |OMPThreadPrivateDecl _|ObjCPropertyImplDecl _|PragmaCommentDecl _
   |PragmaDetectMismatchDecl _|StaticAssertDecl _
   -> (print_endline "!unimplemented!")
