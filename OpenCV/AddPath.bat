@Echo Off
Title AddPath - By:Charlotte.HonG
:: Date :2016/05/28
:: Final :2017/07/20

::===========================================================
::�T�{�O�_���޲z���v��
call :IsAdmin

::===========================================================
::�קK���ư���A�S�����b
set str=%PATH%;%~dp0bin;
::Echo [Test] %str%
::setx path "%str%" /m
powershell [System.Environment]::SetEnvironmentVariable(\"PATH\", $Env:Path + \";%~dp0bin;\", \"Machine\")
::===========================================================
Exit

:IsAdmin
@Echo Off
Reg.exe query "HKU\S-1-5-19\Environment"
If Not %ERRORLEVEL% EQU 0 (
  Cls
  Echo [�v������] �ݨϥκ޲z���v���}��
  Pause & Exit
)
goto:eof