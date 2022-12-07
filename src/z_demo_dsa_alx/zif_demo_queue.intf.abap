INTERFACE zif_demo_queue
  PUBLIC .
    METHODS push
        IMPORTING
            element TYPE ANY.
    METHODS pop
        EXPORTING
         element TYPE any.
    METHODS is_empty
        RETURNING VALUE(result) TYPE abap_boolean.

ENDINTERFACE.
