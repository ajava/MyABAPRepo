INTERFACE zif_binary_number
  PUBLIC .
    METHODS generate_binary
        IMPORTING
            number TYPE i
         RETURNING VALUE(binary_numbers_queue) TYPE REF TO zif_demo_queue
         RAISING zcx_binary_num_generation.

ENDINTERFACE.
