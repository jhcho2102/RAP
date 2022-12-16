CLASS zhandle_bo_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zhandle_bo_000 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "READ
    DATA lt_import TYPE TABLE FOR READ IMPORT zi_course_00.
    DATA lw_import TYPE STRUCTURE FOR READ IMPORT zi_course_00.
    DATA lt_result TYPE TABLE FOR READ RESULT zi_course_00.

    SELECT SINGLE
      FROM ZCOURSE_00
     FIELDS course_uuid
     WHERE course_id = 'S4D437'
       INTO @DATA(lv_uuid).

    lw_import-%tky-CourseUuid = lv_uuid.
    append lw_import to lt_import.

    READ ENTITY zi_course_00
      ALL FIELDS WITH lt_import
      RESULT lt_result.


    DATA lt_update TYPE TABLE FOR UPDATE zi_course_00.
    DATA lw_update TYPE STRUCTURE FOR UPDATE zi_course_00.
    DATA lw_failed TYPE RESPONSE FOR FAILED zi_course_00.

    lw_update-%tky-CourseUuid = lv_uuid.
    lw_update-CourseName = 'Test Material'.
    append lw_update to lt_update.

    MODIFY ENTITY zi_course_00
     UPDATE FIELDS ( CourseName )
     WITH lt_update
     FAILED lw_failed.

   COMMIT ENTITIES.

    out->write( 'Done' ).
  ENDMETHOD.

ENDCLASS.
