-- Unable to render TABLE DDL for object ANKIT.INSTRUCTOR with DBMS_METADATA attempting internal generator.
CREATE TABLE INSTRUCTOR 
(
  INSTRUCTORID VARCHAR2(20 BYTE) NOT NULL 
, DEPTNO NUMBER 
, FIRSTNAME VARCHAR2(21 BYTE) NOT NULL 
, LASTNAME VARCHAR2(21 BYTE) NOT NULL 
, TELEPHONE VARCHAR2(10 BYTE) DEFAULT 'NA' 
, FAX VARCHAR2(10 BYTE) DEFAULT 'NA' 
, EMAIL VARCHAR2(100 BYTE) NOT NULL 
, CONSTRAINT INST_INSTID_PK PRIMARY KEY 
  (
    INSTRUCTORID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX INST_INSTID_PK ON INSTRUCTOR (INSTRUCTORID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESSALTER TABLE INSTRUCTOR
ADD CONSTRAINT INST_DNO_FK FOREIGN KEY
(
  DEPTNO 
)
REFERENCES DEPARTMENT
(
  DEPTNO 
)
ENABLE
