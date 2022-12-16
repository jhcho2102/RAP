CLASS zfill_data_000 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zfill_data_000 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_course type table of zcourse_00.

    "2개 데이터 삽
    lt_course = VALUE #( ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
                           course_id = 'S4D437'
                           course_name = 'ABAP Restful Programming Model'
                           country = 'KR'
                           price = '1000'
                           currency_code = 'EUR'
                           blocked = space
                           )
                         ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
                           course_id = 'CLD400'
                           course_name = 'BTP ABAP Enviornment'
                           country = 'KR'
                           price = '900'
                           currency_code = 'EUR'
                           blocked = space
                           )
                           ( course_uuid = cl_system_uuid=>create_uuid_x16_static( )
                           course_id = 'SAP FI'
                           course_name = 'SAP Finance'
                           country = 'US'
                           price = '900'
                           currency_code = 'EUR'
                           blocked = space
                           )
                           ).
    delete from zcourse_00d.
    delete from zcourse_00.
    insert zcourse_00 from table @lt_course.

    out->write( 'Inserted' ).
  ENDMETHOD.

ENDCLASS.
