CREATE DATABASE IF NOT EXISTS db01;

use db01;

DROP TABLE IF EXISTS EMP2;
DROP TABLE IF EXISTS DEPT2;


-- �H�U�]�w: �ۼW�D�䪺�_�I�ȡA�]�N�O��l�ȡA���Ƚd��O1 .. 655355 --
set auto_increment_offset=10;
-- �H�U�]�w: �ۼW�D��C�����W���q�A��w�]�ȬO1�A���Ƚd��O1 .. 65535 --
set auto_increment_increment=10; 
CREATE TABLE DEPT2 (
	DEPTNO	INT AUTO_INCREMENT NOT NULL,
	DNAME	  VARCHAR(14),
	LOC		  VARCHAR(13),
	CONSTRAINT DEPT2_PRIMARY_KEY PRIMARY KEY (DEPTNO)
) AUTO_INCREMENT = 10;

INSERT INTO DEPT2 (DNAME,LOC) VALUES ('�]�ȳ�','�O�W�x�_');
INSERT INTO DEPT2 (DNAME,LOC) VALUES ('��o��','�O�W�s��');
INSERT INTO DEPT2 (DNAME,LOC) VALUES ('�~�ȳ�','����ì�');
INSERT INTO DEPT2 (DNAME,LOC) VALUES ('�ͺ޳�','����W��');


-- �H�U�]�w: �ۼW�D�䪺�_�I�ȡA�]�N�O��l�ȡA���Ƚd��O1 .. 655355 --
set auto_increment_offset=7001;
-- �H�U�]�w: �ۼW�D��C�����W���q�A��w�]�ȬO1�A���Ƚd��O1 .. 65535 --
set auto_increment_increment=1;
CREATE TABLE EMP2 (
	EMPNO     INT AUTO_INCREMENT NOT NULL,
	ENAME     VARCHAR(10),
	JOB       VARCHAR(9),
	HIREDATE  DATE,
	SAL       DECIMAL(7,2),
	COMM      DECIMAL(7,2),
	DEPTNO    INT NOT NULL,    
	CONSTRAINT EMP2_DEPTNO_FK FOREIGN KEY (DEPTNO) REFERENCES DEPT2 (DEPTNO),
	CONSTRAINT EMP2_EMPNO_PK PRIMARY KEY (EMPNO)
) AUTO_INCREMENT = 7001;

INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('KING'  ,'PRESIDENT',STR_TO_DATE('1981-11-17','%Y-%m-%d'),5000.5,0.0 ,10);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('BLAKE' ,'MANAGER'  ,STR_TO_DATE('1981-05-01','%Y-%m-%d'),2850.0,0.0 ,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('CLARK' ,'MANAGER'  ,STR_TO_DATE('1981-01-09','%Y-%m-%d'),2450.0,0.0 ,10);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('JONES' ,'MANAGER'  ,STR_TO_DATE('1981-04-02','%Y-%m-%d'),2975.0,0.0 ,20);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('MARTIN','SALESMAN' ,STR_TO_DATE('1981-09-28','%Y-%m-%d'),1250.0,1400,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('ALLEN' ,'SALESMAN' ,STR_TO_DATE('1981-02-02','%Y-%m-%d'),1600.0,300 ,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('TURNER','SALESMAN' ,STR_TO_DATE('1981-09-28','%Y-%m-%d'),1500.0,0.0 ,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('JAMES' ,'CLERK'    ,STR_TO_DATE('1981-12-03','%Y-%m-%d'), 950.0,0.0 ,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('WARD'  ,'SALESMAN' ,STR_TO_DATE('1981-02-22','%Y-%m-%d'),1250.0,500 ,30);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('FORD'  ,'ANALYST'  ,STR_TO_DATE('1981-12-03','%Y-%m-%d'),3000.0,0.0 ,20);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('SMITH' ,'CLERK'    ,STR_TO_DATE('1980-12-17','%Y-%m-%d'), 800.0,0.0 ,20);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('SCOTT' ,'ANALYST'  ,STR_TO_DATE('1981-12-09','%Y-%m-%d'),3000.0,0.0 ,20);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('ADAMS' ,'CLERK'    ,STR_TO_DATE('1983-01-12','%Y-%m-%d'),1100.0,0.0 ,20);
INSERT INTO EMP2 (ENAME, JOB, HIREDATE, SAL, COMM, DEPTNO)  VALUES ('MILLER','CLERK'    ,STR_TO_DATE('1982-01-23','%Y-%m-%d'),1300.0,0.0 ,10);

-- �H�U�����ܶq��:
-- show variables like '%auto_inc%';
-- show session variables like '%auto_inc%';  -- //session�ܶq
-- show global variables  like '%auto_inc%';  -- //global�ܶq

-- �H�U�������Ҫ� �����BSSL�B �r���s�X��:
-- select version();
-- show variables like '%ssl%';  [ �ΰ��� mysql> \s ]
-- show variables like '%character%';