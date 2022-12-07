CLASS zcl_crp_demo_run DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crp_demo_run IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA(errorLogger) = new zcl_crp_error_message_logger(  ).
    DATA(warnLogger) = new zcl_crp_warn_message_logger(  ).
    DATA(infoLogger) = new zcl_crp_info_message_logger(  ).

    errorlogger->set_next_logger( warnLogger ).
    warnlogger->set_next_logger( infologger ).

*   out->write( errorlogger->get_logged_message( message = |This is an information|
*                                     level = zcl_crp_messag_logger_enum=>error ) ).
*
*   out->write( errorlogger->get_logged_message( message = |This is an information|
*                                     level = zcl_crp_messag_logger_enum=>warning ) ).

   out->write( warnlogger->get_logged_message( message = |This is an information|
                                     level = zcl_crp_messag_logger_enum=>info ) ).

  ENDMETHOD.
ENDCLASS.
