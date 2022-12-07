CLASS zcl_crp_message_logger DEFINITION
  PUBLIC
  ABSTRACT
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zif_crp_message_logger ALL METHODS ABSTRACT .
    METHODS set_next_logger IMPORTING logger TYPE REF TO zcl_crp_message_logger.
    METHODS get_logged_message IMPORTING
                            message TYPE string
                            level TYPE I
                            RETURNING VALUE(msg) TYPE string.
  PROTECTED SECTION.
    DATA next_logger TYPE REF TO zcl_crp_message_logger.
    DATA log_level TYPE I.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_crp_message_logger IMPLEMENTATION.

  METHOD set_next_logger.
    me->next_logger = logger.
  ENDMETHOD.

  METHOD get_logged_message.
    DATA return_msg TYPE string.
    IF log_level <= level.
        return_msg = |{ message } { me->zif_crp_message_logger~get_logger_message(  ) }|.
    ENDIF.
    IF next_logger IS BOUND.
     return_msg = |{ return_msg } { next_logger->get_logged_message( message = message
                                                   level = log_level  ) }|.
    ENDIF.
    msg = return_msg.
  ENDMETHOD.

ENDCLASS.
