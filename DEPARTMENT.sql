-- Unable to render TABLE DDL for object ANKIT.DEPARTMENT with DBMS_METADATA attempting internal generator.
CREATE TABLE DEPARTMENT 
(
  DEPTNO NUMBER NOT NULL 
, DEPTNAME VARCHAR2(21 BYTE) NOT NULL 
, DEPTLOCATION VARCHAR2(13 BYTE) NOT NULL 
, CONSTRAINT SYS_C0036074 PRIMARY KEY 
  (
    DEPTNO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SYS_C0036074 ON DEPARTMENT (DEPTNO ASC) 
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
NOCOMPRESS
