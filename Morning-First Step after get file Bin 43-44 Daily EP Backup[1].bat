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


Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 431082\%_today_%NNSS"
xcopy C:\EP40\C431082\INCOMING\"*.~FP" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 431082\%_today_%NNSS"
xcopy C:\EP40\C431082\INCOMING\"*.~IP" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 431082\%_today_%NNSS"

Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status" 
xcopy C:\EP40\C431082\WORKSPACE\EASStatsRpt.txt "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status" 
ren "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status\EASStatsRpt.txt" "%_today_%-43EASStatsRpt.txt"

Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 445362\%_today_%NNSS"
xcopy C:\EP40\C445362\INCOMING\"*.~FP" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 445362\%_today_%NNSS"
xcopy C:\EP40\C445362\INCOMING\"*.~IP" "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming 445362\%_today_%NNSS"

Mkdir "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status" 
xcopy C:\EP40\C445362\WORKSPACE\EASStatsRpt.txt "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status" 
ren "D:\Daily EP Backup\%_Year_%\%_mm_%\NNSS\Incoming Status\EASStatsRpt.txt" "%_today_%-44EASStatsRpt.txt"


