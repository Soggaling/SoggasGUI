@echo off
color 0a
title SoggasGUI
echo loading GUI...
powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; $notify = New-Object System.Windows.Forms.NotifyIcon; $path = (Get-Process -id $pid).Path; $notify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path); $notify.Visible = $true; $notify.ShowBalloonTip(5000, 'GUI Running!', 'Welcome %username% to SoggasGUI :)', [System.Windows.Forms.ToolTipIcon]::Info); $notify.Dispose() }"
cls
:menu
color 0a
echo -----------------------------
echo ^|   Soggal1ng Made this     ^|
echo ^|  discord.gg/29uepW58st    ^|
echo ^|      Weekly Updates!      ^|
echo -----------------------------
echo 1) Discord Webhook Deleter
echo 2) Token info grabber
echo 3) Ip address recon
echo 4)
echo 5)
echo 6) exit GUI
set /p input=">> "
if %input% EQU 1 goto webhookdelete
if %input% EQU 2 goto infograbber
if %input% EQU 3 goto iplookup
if %input% EQU 4 goto
if %input% EQU 5 goto
if %input% EQU 6 goto exit
if %input% EQU "" goto menu
if not defined input goto menu
:iplookup
cls
set /p ip=Target IP:
curl http://ip-api.com/line/%ip%
echo [Success] Continue!
pause
cls
goto menu
:infograbber
cls
set /p token=Enter your Discord token: 
for /f "tokens=* delims=" %%i in ('curl -H "Authorization: %token%" -s https://discord.com/api/v9/users/@me') do set "user_data=%%i"
echo User Information:
echo %user_data%
pause
cls
goto menu
:webhookdelete
cls
set /p webhook_url=Enter the webhook URL to delete: 
curl -X DELETE %webhook_url%
if %errorlevel% equ 0 (
    echo [success] Webhook Deleted Successfully!
) else (
    echo [Fail] Webhook failed to delete or webhook doesn't exist!
)
pause
cls
goto menu
:exit
powershell -Command "& { Add-Type -AssemblyName System.Windows.Forms; $notify = New-Object System.Windows.Forms.NotifyIcon; $path = (Get-Process -id $pid).Path; $notify.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path); $notify.Visible = $true; $notify.ShowBalloonTip(6000, 'GUI Closing!', 'Goodbye %username%!! Come back soon.', [System.Windows.Forms.ToolTipIcon]::Info); $notify.Dispose() }"
exit /b
