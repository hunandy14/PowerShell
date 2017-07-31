@Echo Off
Title AddPath - By:Charlotte.HonG
:: Date :2016/05/28
:: Final :2017/07/20

::===========================================================
::確認是否為管理員權限
call :IsAdmin

::===========================================================
::避免重複執行，沒有防呆
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
  Echo [權限不足] 需使用管理員權限開啟
  Pause & Exit
)
goto:eof