*"* use this source file for your ABAP unit test classes
CLASS ltc_binary_number_generate DEFINITION FOR TESTING
                                 DURATION SHORT
                                 RISK LEVEL HARMLESS.

PUBLIC SECTION.
   METHODS generate_bin_number_for1 FOR TESTING
            RAISING
              zcx_binary_num_generation.
  METHODS generate_bin_number_for2 FOR TESTING
            RAISING
              zcx_binary_num_generation.
  METHODS generate_bin_number_for3 FOR TESTING
            RAISING
              zcx_binary_num_generation.
   METHODS generate_bin_number_for10 FOR TESTING
            RAISING
              zcx_binary_num_generation.

  METHODS error_bin_number_for0 FOR TESTING.

PRIVATE SECTION.
  DATA cut TYPE REF TO zif_binary_number.
  DATA exp_binary_queue TYPE REF TO zif_demo_queue.
  METHODS setup.
  METHODS assert_binary_numbers
    IMPORTING
      act_queue TYPE REF TO zif_demo_queue
      exp_queue TYPE REF TO zif_demo_queue.
ENDCLASS.

CLASS ltc_binary_number_generate IMPLEMENTATION.

  METHOD generate_bin_number_for2.
    DATA(act_binary_queue) = cut->generate_binary( 3 ).
    exp_binary_queue->push( 1 ).
    exp_binary_queue->push( 10 ).
    assert_binary_numbers( act_queue = act_binary_queue
                           exp_queue = exp_binary_queue ).
  ENDMETHOD.

  METHOD setup.
    cut = NEW zcl_binary_number( ).
    exp_binary_queue = NEW zcl_demo_queue( ).
  ENDMETHOD.


  METHOD assert_binary_numbers.
    DATA: act_binary TYPE i,
          exp_binary TYPE i.
    WHILE act_queue->is_empty( ).
      act_queue->pop( IMPORTING element = act_binary ).
      exp_queue->pop( IMPORTING element = exp_binary ).
      cl_abap_unit_assert=>assert_equals( msg = 'Invalid Binary generated'
                                          exp = exp_binary
                                          act = act_binary ).
    ENDWHILE.
  ENDMETHOD.


  METHOD generate_bin_number_for3.
    DATA(act_binary_queue) = cut->generate_binary( 3 ).
    exp_binary_queue->push( 1 ).
    exp_binary_queue->push( 10 ).
    exp_binary_queue->push( 11 ).
    assert_binary_numbers( act_queue = act_binary_queue
                           exp_queue = exp_binary_queue ).
  ENDMETHOD.

  METHOD generate_bin_number_for1.
    DATA(act_binary_queue) = cut->generate_binary( 1 ).
    exp_binary_queue->push( 1 ).
    assert_binary_numbers( act_queue = act_binary_queue
                           exp_queue = exp_binary_queue ).
  ENDMETHOD.

  METHOD error_bin_number_for0.
    TRY.
        data(act_binary_queue) = cut->generate_binary( 0 ).
        cl_abap_unit_assert=>fail( msg = 'Expected error not raised' ).
      CATCH zcx_binary_num_generation.
        "handle exception
    ENDTRY.
    exp_binary_queue->push( 1 ).
  ENDMETHOD.

  METHOD generate_bin_number_for10.
     DATA(act_binary_queue) = cut->generate_binary( 10 ).
    exp_binary_queue->push( 1 ).
    exp_binary_queue->push( 10 ).
    exp_binary_queue->push( 11 ).
    exp_binary_queue->push( 100 ).
    exp_binary_queue->push( 101 ).
    exp_binary_queue->push( 110 ).
    exp_binary_queue->push( 111 ).
    exp_binary_queue->push( 1000 ).
    exp_binary_queue->push( 1001 ).
    exp_binary_queue->push( 1010 ).
    assert_binary_numbers( act_queue = act_binary_queue
                           exp_queue = exp_binary_queue ).
  ENDMETHOD.

ENDCLASS.
