CLASS zcl_demo_queue_client DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_queue_client IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA num_element type i.
    DATA str_element type string.
    DATA(queue) = cast zif_demo_queue(  new zcl_demo_queue( ) ).
    queue->push( 1 ).
    queue->push( 2 ).
    queue->push( 3 ).
    queue->push( 4 ).
    WHILE ( NOT queue->is_empty( ) ).
      queue->pop( IMPORTING
                    element = num_element  ).
      out->write( num_element ).
      clear num_element.
    ENDWHILE.

    queue->push( `Test string 1` ).
    queue->push( `Test string 2` ).
    queue->push( `Test string 3` ).
    queue->push( `Test string 4` ).
    WHILE ( NOT queue->is_empty( ) ).
      queue->pop( IMPORTING
                    element = str_element  ).
      out->write( str_element ).
      clear str_element.
    ENDWHILE.

  ENDMETHOD.

ENDCLASS.
