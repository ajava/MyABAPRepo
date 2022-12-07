CLASS zcl_bracket_string DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_string_demo .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS bracket_check
            IMPORTING opening_bracket TYPE C
                      closing_bracket TYPE C
            RETURNING VALUE(bracket_closed) TYPE abap_bool.

ENDCLASS.



CLASS zcl_bracket_string IMPLEMENTATION.


  METHOD zif_string_demo~is_bracket_closed.
    DATA index TYPE i.
    DATA stack_poped_char TYPE C.
    DATA char_at_index TYPE C.
    DATA(str_len) = strlen( string_with_brackets ).
    DATA(char_stack) = CAST zif_demo_stack( NEW zcl_demo_stack( ) ).
    WHILE ( index < str_len ).
       char_at_index = string_with_brackets+index(1).
        CASE char_at_index.
            WHEN '{' OR '[' OR '('.
                char_stack->push( char_at_index ).
            WHEN '}' OR ']' OR ')'.
               char_stack->pop( IMPORTING
                                    element = stack_poped_char ).
               is_closed = bracket_check( opening_bracket = stack_poped_char
                                          closing_bracket = char_at_index ).
             IF is_closed EQ abap_false.
                 EXIT.
             ENDIF.
             CLEAR stack_poped_char.
        ENDCASE.
        index += 1.
    ENDWHILE.
  ENDMETHOD.

  METHOD bracket_check.
      bracket_closed = COND #( WHEN  opening_bracket EQ '{' AND closing_bracket EQ '}'
                                 THEN abap_true
                                WHEN  opening_bracket EQ '[' AND closing_bracket EQ ']'
                                 THEN abap_true
                                WHEN  opening_bracket EQ '(' AND closing_bracket EQ ')'
                                 THEN abap_true
                                ELSE abap_false
                               ).
  ENDMETHOD.

ENDCLASS.
