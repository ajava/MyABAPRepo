INTERFACE zif_string_demo
  PUBLIC .
    METHODS is_bracket_closed
        IMPORTING
            string_with_brackets TYPE string
        RETURNING VALUE(is_closed) TYPE abap_bool.

ENDINTERFACE.
