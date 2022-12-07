CLASS zcl_demo_queue DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_demo_queue .
  PROTECTED SECTION.
  PRIVATE SECTION.
   TYPES: BEGIN OF ty_queue,
            element TYPE REF TO DATA,
           END OF ty_queue.
   DATA _queue TYPE STANDARD TABLE OF ty_queue.
ENDCLASS.



CLASS zcl_demo_queue IMPLEMENTATION.

  METHOD zif_demo_queue~is_empty.
    IF ( lines( _queue ) EQ 0 ).
        result = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD zif_demo_queue~pop.
    IF ( lines( _queue ) NE 0 ).
         element = _queue[ 1 ]-element->*.
        DELETE _queue INDEX 1.
    ENDIF.
  ENDMETHOD.

  METHOD zif_demo_queue~push.
    APPEND INITIAL LINE TO _queue REFERENCE INTO DATA(queue_element).
    CREATE DATA queue_element->element LIKE element.
    queue_element->element->* = element.
  ENDMETHOD.

ENDCLASS.
