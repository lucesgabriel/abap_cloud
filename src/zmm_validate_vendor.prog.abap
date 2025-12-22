*&---------------------------------------------------------------------*
*& Report  ZMM_VALIDATE_VENDOR
*&---------------------------------------------------------------------*
*& Description: Validación de ID de proveedor contra tabla LFA1
*& Request: Ejercicio 2 - Validación de entrada de proveedor
*& Author: Gabriel
*& Date: 19/12/2025
*&---------------------------------------------------------------------*
*& Modifications:
*& Date       | Author      | Description
*&---------------------------------------------------------------------*
REPORT zmm_validate_vendor.

*----------------------------------------------------------------------*
* VARIABLES
*----------------------------------------------------------------------*
DATA: v_name1 TYPE lfa1-name1.   "Nombre del proveedor

*----------------------------------------------------------------------*
* SELECTION SCREEN
*----------------------------------------------------------------------*
SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.
  PARAMETERS: p_lifnr TYPE lfa1-lifnr OBLIGATORY.  "ID Proveedor
SELECTION-SCREEN END OF BLOCK b1.

*----------------------------------------------------------------------*
* AT SELECTION-SCREEN - Validación antes de ejecutar
*----------------------------------------------------------------------*
AT SELECTION-SCREEN ON p_lifnr.
  PERFORM f_validate_vendor.

*----------------------------------------------------------------------*
* START-OF-SELECTION
*----------------------------------------------------------------------*
START-OF-SELECTION.
  PERFORM f_display_vendor_info.

*&---------------------------------------------------------------------*
*& Form F_VALIDATE_VENDOR
*&---------------------------------------------------------------------*
*& Valida que el proveedor exista en la tabla LFA1
*&---------------------------------------------------------------------*
FORM f_validate_vendor.

  SELECT SINGLE name1
    INTO v_name1
    FROM lfa1
    WHERE lifnr = p_lifnr.

  IF sy-subrc <> 0.
    MESSAGE e001(zmm_vendor) WITH p_lifnr.
    " Alternativa sin clase de mensajes:
    " MESSAGE e000(00) WITH 'El proveedor' p_lifnr 'no existe en el sistema'.
  ENDIF.

ENDFORM.

*&---------------------------------------------------------------------*
*& Form F_DISPLAY_VENDOR_INFO
*&---------------------------------------------------------------------*
*& Muestra información del proveedor válido
*&---------------------------------------------------------------------*
FORM f_display_vendor_info.

  WRITE: / 'Proveedor válido:',
         / 'ID:', p_lifnr,
         / 'Nombre:', v_name1.

ENDFORM.
