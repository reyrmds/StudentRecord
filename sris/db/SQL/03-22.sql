select distinct section from tbl_record

update tbl_record set section='BBTE 1-1' where section='BBTE1-1'
update tbl_record set section='BBTE 1-2' where section='BBTE1-2'
update tbl_record set section='BBTE 1-3' where section='BBTE1-3'
update tbl_record set section='BBTE 2-1' where section='BBTE2-1'
update tbl_record set section='BBTE 4-1' where section='BBTE4-1'
update tbl_record set section='BBTE 3-1' where section='BBTE3-1'
update tbl_record set section='BBTE 3-2' where section='BBTE3-2'
update tbl_record set section='BBTE 2-1' where section='BBBTE2-1'

DELETE FROM tbl_record WHERE section = 'awd'

SELECT * FROM TBL_RECORD WHERE SECTION='awd'