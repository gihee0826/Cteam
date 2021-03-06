
/* Drop Triggers */

DROP TRIGGER TRI_BOARD_BNO;
DROP TRIGGER TRI_MEM_MNO;
DROP TRIGGER TRI_REPLY_CNO;



/* Drop Tables */

DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE MEM CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE SEQ_BOARD_BNO;
DROP SEQUENCE SEQ_COMMENT_CNO;
DROP SEQUENCE SEQ_MEMBER_MNO;
DROP SEQUENCE SEQ_MEM_MNO;
DROP SEQUENCE SEQ_REPLY_CNO;




/* Create Sequences */

CREATE SEQUENCE SEQ_BOARD_BNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_COMMENT_CNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEMBER_MNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_MEM_MNO INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE SEQ_REPLY_CNO INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE BOARD
(
	BNO number NOT NULL,
	BCategory varchar2(50) NOT NULL,
	BTITLE varchar2(200) NOT NULL,
	BDATE date NOT NULL,
	IMG1 varchar2(100),
	IMG2 varchar2(100),
	BCONTENT nclob NOT NULL,
	IMG3 varchar2(100),
	MNO number NOT NULL,
	PRIMARY KEY (BNO)
);


CREATE TABLE MEM
(
	MNO number NOT NULL,
	-- 이메일형식
	MID varchar2(100) NOT NULL UNIQUE,
	MPASS varchar2(100) NOT NULL,
	MNAME varchar2(30) NOT NULL,
	-- 관리자 판단여부
	ADMINYN char(20) NOT NULL,
	MAGE number NOT NULL,
	PRIMARY KEY (MNO)
);


CREATE TABLE REPLY
(
	CNO number NOT NULL,
	CCONTENT varchar2(1000) NOT NULL,
	CDATE date NOT NULL,
	BNO number NOT NULL,
	MNO number NOT NULL,
	PRIMARY KEY (CNO)
);



/* Create Foreign Keys */

ALTER TABLE REPLY
	ADD FOREIGN KEY (BNO)
	REFERENCES BOARD (BNO)
;


ALTER TABLE BOARD
	ADD FOREIGN KEY (MNO)
	REFERENCES MEM (MNO)
;


ALTER TABLE REPLY
	ADD FOREIGN KEY (MNO)
	REFERENCES MEM (MNO)
;



/* Create Triggers */

CREATE OR REPLACE TRIGGER TRI_BOARD_BNO BEFORE INSERT ON BOARD
FOR EACH ROW
BEGIN
	SELECT SEQ_BOARD_BNO.nextval
	INTO :new.BNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_MEM_MNO BEFORE INSERT ON MEM
FOR EACH ROW
BEGIN
	SELECT SEQ_MEM_MNO.nextval
	INTO :new.MNO
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_REPLY_CNO BEFORE INSERT ON REPLY
FOR EACH ROW
BEGIN
	SELECT SEQ_REPLY_CNO.nextval
	INTO :new.CNO
	FROM dual;
END;

/




/* Comments */

COMMENT ON COLUMN MEM.MID IS '이메일형식';
COMMENT ON COLUMN MEM.ADMINYN IS '관리자 판단여부';



