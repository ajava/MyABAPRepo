CLASS zcl_demo_dataref_use DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_demo_dataref_use IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    types: BEGIN OF ty_foo,
           comp1 TYPE i,
           comp2 TYPE string,
           END OF ty_foo.
    DATA(foo) = new ty_foo( ).
    DATA(comp1_name) = `comp1`.
    foo->(comp1_name) = 1.
    DATA(comp2_name) = `comp2`.
    foo->(comp2_name) = `Test`.
    out->write( foo->* ).
  ENDMETHOD.
ENDCLASS.
