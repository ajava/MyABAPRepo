CLASS zcl_bracket_string DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_string_demo .
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CONSTANTS opening_curly_bracket TYPE C VALUE '{'.
    CONSTANTS opening_square_bracket TYPE C VALUE '['.
    CONSTANTS opening_round_bracket TYPE C VALUE '('.
    CONSTANTS closing_curly_bracket TYPE C VALUE '}'.
    CONSTANTS closing_square_bracket TYPE C VALUE ']'.
    CONSTANTS closing_round_bracket TYPE C VALUE ')'.

    DATA char_stack TYPE REF TO zif_demo_stack.

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

    WHILE ( index < str_len ).
       char_at_index = string_with_brackets+index(1).
        CASE char_at_index.
            WHEN opening_curly_bracket OR opening_square_bracket OR opening_round_bracket.
                char_stack->push( char_at_index ).
            WHEN closing_curly_bracket OR closing_square_bracket OR closing_round_bracket..
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
      bracket_closed = COND #( WHEN  opening_bracket EQ opening_curly_bracket AND
                                     closing_bracket EQ closing_curly_bracket
                                 THEN abap_true
                                WHEN  opening_bracket EQ opening_square_bracket AND
                                      closing_bracket EQ closing_square_bracket
                                 THEN abap_true
                                WHEN  opening_bracket EQ opening_round_bracket AND
                                      closing_bracket EQ closing_round_bracket
                                 THEN abap_true
                                ELSE abap_false
                               ).
  ENDMETHOD.

  METHOD constructor.
     char_stack = NEW zcl_demo_stack( ).
  ENDMETHOD.

ENDCLASS.
