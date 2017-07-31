::@Echo Off
Title CreatList - By:Charlotte.HonG

set FILENAME1="DebugLib_Lists.txt"
set FILENAME2="Lib_Lists.txt"
set FILEPATH=lib
set LISTPATH=%~dp0

::Lib清單
cd %FILEPATH%
dir *d.lib /b /on> %~dp0%FILENAME1%
dir *320.lib /b /on> %~dp0%FILENAME2%

::路徑清單
echo %~dp0lib> %~dp0%PathList.txt
cd ..
cd ..
cd ..
echo %cd%\include>> %~dp0%PathList.txt


exit