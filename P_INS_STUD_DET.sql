-- Unable to render PROCEDURE DDL for object ANKIT.P_INS_STUD_DET with DBMS_METADATA attempting internal generator.
CREATE PROCEDURE P_INS_STUD_DET 
is
v_conf varchar2(5);
begin
DBMS_OUTPUT.PUT_LINE('Do you wish to continue? press Y for yes or N for no.');
v_conf := y;
if upper(v_conf) = 'Y'
then
v_sql := 'insert into student(studentid,firstname, lastname, date_of_birth,address,city,state,zipcode,telephone,fax,email) values(seq_studid.nextval,''';

DBMS_OUTPUT.PUT_LINE('Please provide first name of student.');
v_firstname := andy;
v_sql := v_sql||v_firstname||''',';

DBMS_OUTPUT.PUT_LINE(v_sql);
end if; 
end;
