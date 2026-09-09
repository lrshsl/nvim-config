; Scopes
[
  (source_file)
  (fn_def)
  (block)
  (for_stmt)
] @local.scope

; Definitions
(var_decl
  name: (ident_path) @local.definition)

(param
  name: (ident) @local.definition)

(fn_def
  name: (ident_path) @local.definition)

; References
(ident_path) @local.reference
