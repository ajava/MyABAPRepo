CLASS zcl_binary_number DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_binary_number .
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS generate_next_two_binary_num
            IMPORTING
                current_binary TYPE i
                binary_generator_queue TYPE REF TO zif_demo_queue.
ENDCLASS.



CLASS zcl_binary_number IMPLEMENTATION.


  METHOD zif_binary_number~generate_binary.
    DATA index TYPE i.
    DATA binary_number TYPE i.
    DATA binary_generator_queue TYPE REF TO zif_demo_queue.

     IF number LE 0 .
       RAISE EXCEPTION NEW zcx_binary_num_generation( ).
    ENDIF.

    binary_generator_queue = NEW zcl_demo_queue( ).
    binary_numbers_queue = NEW zcl_demo_queue( ).
    binary_generator_queue->push( 1 ).
    WHILE ( index < number ).
       binary_generator_queue->pop( IMPORTING element = binary_number ).
       binary_numbers_queue->push( binary_number ).
       generate_next_two_binary_num( current_binary = binary_number
                                     binary_generator_queue = binary_generator_queue ).
       index += 1.
    ENDWHILE.

  ENDMETHOD.

  METHOD generate_next_two_binary_num.
     DATA binary_number_str TYPE string.
     DATA bin_first_num TYPE i.
     DATA bin_second_num TYPE i.

     binary_number_str = current_binary.
     CONDENSE binary_number_str.
     DATA(bin_first_numstr) = |{ binary_number_str }0|.
     DATA(bin_second_numstr) = |{ binary_number_str }1|.
     bin_first_num = CONV #( bin_first_numstr ).
     bin_second_num = CONV #( bin_second_numstr ).
     binary_generator_queue->push( bin_first_num ).binary_generator_queue->push( bin_second_num ).

  ENDMETHOD.

ENDCLASS.
