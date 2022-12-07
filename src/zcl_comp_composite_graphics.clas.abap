CLASS zcl_comp_composite_graphics DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_comp_graphics .
    METHODS add_graphics
        IMPORTING
            graphics TYPE REF TO zif_comp_graphics.
  PROTECTED SECTION.
  PRIVATE SECTION.
    TYPES: BEGIN OF ty_graphics_container,
             graphics(1) type C,
             graphics_ref TYPE REF TO zif_comp_graphics,
            END OF ty_graphics_container.
    DATA graphics_container TYPE SORTED TABLE OF ty_graphics_container
                            WITH UNIQUE KEY graphics.
ENDCLASS.



CLASS zcl_comp_composite_graphics IMPLEMENTATION.


  METHOD zif_comp_graphics~get_graphics_print_text.
    DATA print_text TYPE string.
    LOOP AT graphics_container REFERENCE INTO DATA(graphic_container_line).
        print_text = | { graphic_container_line->graphics_ref->get_graphics_print_text(  ) } { print_text } |.
    ENDLOOP.
    text = print_text.
  ENDMETHOD.

  METHOD add_graphics.
    DATA(graphic_container_line) = COND #( WHEN graphics IS INSTANCE OF zcl_comp_ellipse
                            THEN VALUE ty_graphics_container( graphics = zcl_comp_graphics_enum=>ellipse
                                graphics_ref = graphics )
                            WHEN graphics IS INSTANCE OF zcl_comp_line
                            THEN VALUE ty_graphics_container( graphics = zcl_comp_graphics_enum=>line
                                graphics_ref = graphics )  ).
    IF graphic_container_line IS NOT INITIAL.
      INSERT graphic_container_line INTO TABLE graphics_container.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
