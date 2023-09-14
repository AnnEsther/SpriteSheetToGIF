@ECHO OFF
setlocal enabledelayedexpansion

set /A cnt=0
set /A width=320
set /A height=320
set /A loop=0
set /A delay=1
set format=.png

for /r %%a in (*.png) do (
	set oldName=%%a
	set newname=!oldName:%format%=.gif!
	magick convert -dispose previous %%a -crop %width%x%height% +adjoin +repage -adjoin -loop %loop% -delay %delay% !newname!
	set /A cnt = cnt + 1
)

echo count of converted file = %cnt%

