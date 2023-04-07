@ echo off

echo wscript.echo date>tmp.vbs
for /f %%a in ('cscript tmp.vbs //Nologo') do set "Today=%%a"
for /f "tokens=1-2 delims=/" %%a in ("%Today%") do (
set _dd_=%%a
set mm=%%b
@If %%b==01 Set _mm_=January
@If %%b==02 Set _mm_=February
@If %%b==03 Set _mm_=March
@If %%b==04 Set _mm_=April
@If %%b==05 Set _mm_=May
@If %%b==06 Set _mm_=June
@If %%b==07 Set _mm_=July
@If %%b==08 Set _mm_=August
@If %%b==09 Set _mm_=September
@If %%b==10 Set _mm_=October
@If %%b==11 Set _mm_=November
@If %%b==12 Set _mm_=December
set yy=%%c)


SET _yy_=%date:~8,2%
Set _Year_=%date:~6,4%
Set _Month_=%date:~3,2%
Set dd=%date:~0,2%
Set _date_=%_yy_%%_Month_%%dd%
Set _Today_=%dd%%_Month_%%_yy_%
Set _tday_=%_yy_%%mm%%dd%

echo "%_today_%"
@pause
cd
c:\


Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL"
xcopy "D:\Visa FTP\Incoming\visa\VISAFL.INC.001.EPIN.TXT" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL"
ren "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL\VISAFL.INC.001.EPIN.TXT" "%_today_%-VISAFL.INC.001" 
ren "D:\Visa FTP\Incoming\visa\VISAFL.INC.001.EPIN.TXT" "VISA.CTF"

Mkdir "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_Year_%\%_mm_%\NNSS\INC-Report" 
xcopy "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL\%_today_%-VISAFL.INC.001" "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_Year_%\%_mm_%\NNSS\INC-Report"

Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL"
xcopy "D:\Visa FTP\Incoming\visa\VISAFL.INC.001.EPIN02.TXT" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL"
ren "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL\VISAFL.INC.001.EPIN02.TXT" "%_today_%-VSDFSA.INC"
ren "D:\Visa FTP\Incoming\visa\VISAFL.INC.001.EPIN02.TXT" "VSDFSA.INC"

Mkdir "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_Year_%\%_mm_%\NNSS\INC-Report" 
xcopy "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\VISALFL\%_today_%-VSDFSA.INC" "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_Year_%\%_mm_%\NNSS\INC-Report"

If not exist "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\VSS\d%_tday_%_NNSS" Mkdir "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\VSS\d%_tday_%_NNSS"
Set bin43visa="\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\VSS\d%_tday_%_NNSS"

Mkdir "D:\SMS & VSS Report\%_Year_%\%_mm_%\NNSS\VSS\d%_tday_%%" 
Set bin43visalocal="D:\SMS & VSS Report\%_Year_%\%_mm_%\NNSS\VSS\d%_tday_%_NNSS" 

If not exist "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\SMS\d%_tday_%_NNSS" Mkdir "\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\SMS\d%_tday_%_NNSS"
Set bin44visa="\\hoe-fileserver.cpb.bank.com\Reports\CCenter_RPT\%_year_%\%_mm_%\NNSS\SMS\d%_tday_%_NNSS"

Mkdir "D:\SMS & VSS Report\%_Year_%\%_mm_%\NNSS\SMS\d%_tday_%%" 
Set bin44visalocal="D:\SMS & VSS Report\%_Year_%\%_mm_%\NNSS\SMS\d%_tday_%_NNSS" 


cd\
c:
cd C:\EP40\C431082\REPORTS\INCOMING\d%_tday_%_r1_t*_prod
XCopy /y *.* %bin43visa%
xcopy /y *.* %bin43visalocal%

cd C:\EP40\C445362\REPORTS\INCOMING\d%_tday_%_r1_t*_prod
XCopy /y *.* %bin44visa%
XCopy /y *.* %bin44visalocal%

cd\
D: 
move "D:\Visa FTP\Incoming\visa\VISA.CTF" "D:\Visa FTP\Incoming\visa_nnss"
ren "D:\Visa FTP\Incoming\visa_nnss\VISA.CTF" VISA_NNSS.CTF
move D:\Visa FTP\Incoming\visa\VSDFSA.INC" "D:\Visa FTP\Incoming\visa_nnss"

@pause

