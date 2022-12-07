INTERFACE zif_crp_message_logger
  PUBLIC .
    METHODS get_logger_message
        RETURNING VALUE(msg) TYPE string.

ENDINTERFACE.
