CLASS zcl_demo_stack DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_demo_stack .
  PROTECTED SECTION.
  PRIVATE SECTION.
   TYPES: BEGIN OF ty_stack,
            element TYPE REF TO DATA,
           END OF ty_stack.
   DATA _stack TYPE STANDARD TABLE OF ty_stack.
ENDCLASS.



CLASS zcl_demo_stack IMPLEMENTATION.


  METHOD zif_demo_stack~is_empty.
   IF lines( _stack ) EQ 0.
    result = abap_true.
   ENDIF.
  ENDMETHOD.


  METHOD zif_demo_stack~pop.
    DATA(table_count) = lines( _stack ).
    IF table_count NE 0.
        element = _stack[ table_count ]-element->*.
        DELETE _stack INDEX table_count.
    ENDIF.
  ENDMETHOD.


  METHOD zif_demo_stack~push.
    APPEND INITIAL LINE TO _stack REFERENCE INTO DATA(stack_element).
    CREATE DATA stack_element->element LIKE element.
    stack_element->element->* = element.
  ENDMETHOD.


ENDCLASS.
