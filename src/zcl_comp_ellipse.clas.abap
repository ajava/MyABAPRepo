CLASS zcl_comp_ellipse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_comp_graphics .
  PROTECTED SECTION.
  PRIVATE SECTION.
   CONSTANTS my_graphics type string value `Ellipse graphics`.
ENDCLASS.



CLASS zcl_comp_ellipse IMPLEMENTATION.


  METHOD zif_comp_graphics~get_graphics_print_text.
    text = my_graphics .
  ENDMETHOD.
ENDCLASS.
