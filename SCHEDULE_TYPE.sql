-- Unable to render TABLE DDL for object ANKIT.SCHEDULE_TYPE with DBMS_METADATA attempting internal generator.
CREATE TABLE SCHEDULE_TYPE 
(
  SCHEDULEID VARCHAR2(20 BYTE) NOT NULL 
, DESCRIPTION VARCHAR2(200 BYTE) NOT NULL 
, DAY NUMBER 
, STARTINGTIME DATE DEFAULT sysdate 
, DURATION NUMBER NOT NULL 
, CONSTRAINT SCHTYP_SCHEDID_PK PRIMARY KEY 
  (
    SCHEDULEID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SCHTYP_SCHEDID_PK ON SCHEDULE_TYPE (SCHEDULEID ASC) 
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
NOCOMPRESSALTER TABLE SCHEDULE_TYPE
ADD CONSTRAINT SYS_C0036102 CHECK 
(day in (1,2,3,4,5,6,7))
ENABLE