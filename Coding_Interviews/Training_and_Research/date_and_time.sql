/*
Note

SYSDATETIME and SYSUTCDATETIME have more fractional seconds precision than GETDATE and GETUTCDATE. SYSDATETIMEOFFSET includes the system time zone offset. SYSDATETIME, SYSUTCDATETIME, and SYSDATETIMEOFFSET can be assigned to a variable of any of the date and time types.


*/
SELECT 'SYSDATETIME()      ', SYSDATETIME();  
SELECT 'SYSDATETIMEOFFSET()', SYSDATETIMEOFFSET();  
SELECT 'SYSUTCDATETIME()   ', SYSUTCDATETIME();  
SELECT 'CURRENT_TIMESTAMP  ', CURRENT_TIMESTAMP;  
SELECT 'GETDATE()          ', GETDATE();  
SELECT 'GETUTCDATE()       ', GETUTCDATE();  

select SWITCHOFFSET(GETDATE(), '-02:00')


drop table if exists dbo.test
CREATE TABLE dbo.test   
    (  
    ColDatetimeoffset datetimeoffset  
    );  
GO  
INSERT INTO dbo.test   
VALUES ('1998-09-20 7:45:50.71345 -5:00');  
GO  
SELECT SWITCHOFFSET (ColDatetimeoffset, '-08:00')   
FROM dbo.test;  
GO  
--Returns: 1998-09-20 04:45:50.7134500 -08:00  
SELECT ColDatetimeoffset  
FROM dbo.test;  
--Returns: 1998-09-20 07:45:50.7134500 -05:00  


DECLARE @dt datetimeoffset = switchoffset (CONVERT(datetimeoffset, GETDATE()), '-04:00');   
SELECT @dt
/*
  Moving to DST in "Central European Standard Time" zone:
  offset changes from +01:00 -> +02:00
  Change occurred on March 27th, 2022 at 02:00:00.
  Adjusted local time became 2022-03-27 03:00:00.
*/

--Time before DST change has standard time offset (+01:00)
SELECT CONVERT(DATETIME2(0), '2022-03-27T01:01:00', 126)
AT TIME ZONE 'Central European Standard Time';
--Result: 2022-03-27 01:01:00 +01:00

/*
  Adjusted time from the "gap interval" (between 02:00 and 03:00)
  is moved 1 hour ahead and presented with the summer time offset
  (after the DST change)
*/
SELECT CONVERT(DATETIME2(0), '2022-03-27T02:01:00', 126)
AT TIME ZONE 'Central European Standard Time';
--Result: 2022-03-27 03:01:00 +02:00
--Time after 03:00 is presented with the summer time offset (+02:00)
SELECT CONVERT(DATETIME2(0), '2022-03-27T03:01:00', 126)
AT TIME ZONE 'Central European Standard Time';
--Result: 2022-03-27 03:01:00 +02:00
select '****************************************'

SELECT CONVERT(DATETIME2(0), '2022-03-27T02:01:00', 126)
SELECT CONVERT(DATETIME2(0), '2022-03-27T03:01:00', 126)
SELECT CONVERT(DATETIME2(0), '2022-10-30T01:01:00', 126)
SELECT CONVERT(DATETIME2(0), '2022-10-30T02:01:00', 126)
SELECT CONVERT(DATETIME2(0), '2022-10-30T03:01:00', 126)
select CURRENT_TIMEZONE () 