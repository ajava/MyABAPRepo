*"* use this source file for your ABAP unit test classes
CLASS ltc_brackets DEFINITION FOR TESTING
                   RISK LEVEL HARMLESS
                   DURATION SHORT.
 PUBLIC SECTION.
  METHODS closed_simple_brackets FOR TESTING.
  METHODS not_closed_brackets FOR TESTING.
  METHODS closed_complex_brackets FOR TESTING.
 PRIVATE SECTION.
  METHODS setup.
  METHODS assert_closed_brackets
     IMPORTING
        str TYPE string
        msg type csequence optional.
   METHODS assert_not_closed_brackets
     IMPORTING
        str TYPE string
        msg type csequence optional.
  DATA bracket_test TYPE REF TO zif_string_demo.
ENDCLASS.

CLASS ltc_brackets IMPLEMENTATION.

  METHOD closed_simple_brackets.
    FINAL(closed_bracket_string) = `{[()]}`.
    assert_closed_brackets( str = closed_bracket_string
                     msg = `Brackets not properly closed` ).
  ENDMETHOD.

  METHOD setup.
    bracket_test = NEW zcl_bracket_string( ).
  ENDMETHOD.

  METHOD not_closed_brackets.
    FINAL(not_closed_bracket_string) = `{[({)]}`.
    assert_not_closed_brackets( str = not_closed_bracket_string
                     msg = `Brackets properly closed` ).
  ENDMETHOD.

  METHOD closed_complex_brackets.
    FINAL(closed_bracket_string) = `{[({[(())]})]}`.
    assert_closed_brackets( str = closed_bracket_string
                     msg = `Brackets not properly closed` ).
  ENDMETHOD.

  METHOD assert_closed_brackets.
    cl_abap_unit_assert=>assert_true( act = bracket_test->is_bracket_closed( str )
                                      msg = msg ).
  ENDMETHOD.

  METHOD assert_not_closed_brackets.
     cl_abap_unit_assert=>assert_false( act = bracket_test->is_bracket_closed( str )
                                      msg = msg ).
  ENDMETHOD.

ENDCLASS.
