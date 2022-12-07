CLASS zcl_comp_demo_run DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_comp_demo_run IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    data(line_graphics) = CAST zif_comp_graphics( new zcl_comp_line( ) ).
    data(ellipse_graphics) = CAST zif_comp_graphics( new zcl_comp_ellipse( ) ).
    data(composite_graphics) =  new zcl_comp_composite_graphics( ).
    out->write( line_graphics->get_graphics_print_text( ) ).
    out->write( ellipse_graphics->get_graphics_print_text( ) ).
    composite_graphics->add_graphics( line_graphics ).
    composite_graphics->add_graphics( ellipse_graphics ).
    out->write( composite_graphics->zif_comp_graphics~get_graphics_print_text( ) ).

  ENDMETHOD.
ENDCLASS.
