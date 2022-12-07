CLASS zcl_demo_stack_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_stack_client IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA num_element type i.
    DATA str_element type string.
    DATA(stack) = cast zif_demo_stack(  new zcl_demo_stack( ) ).
    stack->push( 1 ).
    stack->push( 2 ).
    stack->push( 3 ).
    stack->push( 4 ).
    WHILE ( NOT stack->is_empty( ) ).
      stack->pop( IMPORTING
                    element = num_element  ).
      out->write( num_element ).
      clear num_element.
    ENDWHILE.

    stack->push( `Test string 1` ).
    stack->push( `Test string 2` ).
    stack->push( `Test string 3` ).
    stack->push( `Test string 4` ).
    WHILE ( NOT stack->is_empty( ) ).
      stack->pop( IMPORTING
                    element = str_element  ).
      out->write( str_element ).
    ENDWHILE.

  ENDMETHOD.

ENDCLASS.
