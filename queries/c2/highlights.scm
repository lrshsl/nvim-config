;  ====================================================================
; Keywords
; ====================================================================

[
  "const"
  "tlocal"
  "volatile"
  "static"
  "public"
 ] @keyword.modifier

["import" "as" "local"] @keyword.import
"module" @keyword.module

[
  "if"
  "else"
  "switch"
  "case"
  "default"
] @keyword.conditional

[
  "while"
  "for"
] @keyword.repeat

"fn" @keyword.function

"return" @keyword.return

[
  "continue"
  "break"
] @keyword.control

[
  "struct"
  "union"
  "enum"
  "type"
] @keyword.type

; ====================================================================
; Types
; ====================================================================

(primitive_type) @type.builtin

(type_ident) @type

; ====================================================================
; Attributes
; ====================================================================

(attribute_name) @attribute

; ====================================================================
; Functions
; ====================================================================

(fn_def
  name: (ident_path) @function)

(fn_call
  fn_handle: (ident_path) @function.call)

(fn_call
  fn_handle: (field_expr
    name: (ident) @function.call))

[
  "static_assert"
  "sizeof"
  "elemsof"
  "offsetof"
  "to_container"
  "assert"
  "cast"
] @function.builtin

; ====================================================================
; Declarations & Variables
; ====================================================================

(param
  name: (ident) @variable.parameter)

; (field_name) @variable.member

(enum_field
  (constant_name) @constant)

(var_decl
  name: (ident_path) @variable)

; (ident_path) @variable

; ====================================================================
; Literals & Constants
; ====================================================================

(integer_literal) @number
(float_literal) @number
(string_literal) @string
(escape_sequence) @string.escape
(char_literal) @character

; ====================================================================
; Operators & Punctuation
; ====================================================================

[
  "="
  "*="
  "/="
  "%="
  "+="
  "-="
  "<<="
  ">>="
  "&="
  "^="
  "|="
  "=="
  "!="
  "<"
  "<="
  ">"
  ">="
  "&&"
  "||"
  "!"
  "~"
  "&"
  "|"
  "^"
  "<<"
  ">>"
  "+"
  "-"
  "*"
  "/"
  "%"
  "++"
  "--"
  "."
] @operator

[
  ";"
  ","
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket

; ====================================================================
; Comments
; ====================================================================

(comment) @comment @spell
