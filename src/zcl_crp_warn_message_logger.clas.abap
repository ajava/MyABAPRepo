CLASS zcl_crp_warn_message_logger DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  INHERITING FROM zcl_crp_message_logger .

  PUBLIC SECTION.
    METHODS: zif_crp_message_logger~get_logger_message REDEFINITION.
    METHODS constructor.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crp_warn_message_logger IMPLEMENTATION.
  METHOD zif_crp_message_logger~get_logger_message.
    msg = |Warning Message|.
  ENDMETHOD.

  METHOD constructor.
    super->constructor( ).
    log_level = zcl_crp_messag_logger_enum=>warning.
  ENDMETHOD.

ENDCLASS.
