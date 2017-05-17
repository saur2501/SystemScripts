#!binbash
chrome.exe httpwww.youtube.comwatchv=7bLaLJ51rRk httpwww.youtube.comwatchv=OxYSaT_NfjQ &
n=$((RANDOM%10+30))
echo $n
sleep $n
killall chromium-browser
echo all done!