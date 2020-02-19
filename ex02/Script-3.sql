CREATE SEQUENCE	 seq_board;


CREATE TABLE tbl_board(
bno NUMBER (10,0),
title varchar2(200) NOT NULL,
content varchar2(2000) NOT NULL,
writer varchar2(50) NOT NULL,
regdate DATE DEFAULT SYSDATE,
updatedate DATE DEFAULT sysdate);

ALTER TABLE tbl_board ADD CONSTRAINT pk_board
PRIMARY KEY (bno);

/

INSERT INTO tbl_board (bno, title, content, writer) VALUES (seq_board.nextval, '테스트 제목11', '테스트 내용11','user01');


SELECT * FROM tbl_board;

SELECT * FROM tbl_board ORDER BY BNO DESC;


/
--페이징 쿼리 
select
	bno, title, content,writer, regdate,updatedate
	from(
		select /*+INDEX_DESC(tbl_board pk_board) */
		rownum rn, bno, title, content, writer, regdate, updatedate
		from tbl_board
		where rownum <= 60
		)
	where rn > 50


	

	
	
