$length = 14
$owner = "IngeniumTeam"
$repo = New-Object 'object[,]' $length, 2
$repo[0, 0] = "$($owner)/BlackLineSensor"
$repo[1, 0] = "$($owner)/Bluetooth"
$repo[2, 0] = "$($owner)/Button"
$repo[3, 0] = "$($owner)/HCSR04"
$repo[4, 0] = "$($owner)/Joystick"
$repo[5, 0] = "$($owner)/Keybull"
$repo[6, 0] = "$($owner)/Led"
$repo[7, 0] = "$($owner)/Mecanum"
$repo[8, 0] = "$($owner)/Motor"
$repo[9, 0] = "$($owner)/PhotoElectric"
$repo[10, 0] = "$($owner)/Potentiometer"
$repo[11, 0] = "$($owner)/Report"
$repo[12, 0] = "bblanchon/ArduinoJson"
$repo[13, 0] = "Chris--A/Keypad"
for ($i = 0; $i -lt $length; $i++)
{
    $uri = "https://api.github.com/repos/$($repo[$i, 0])/releases/latest"
    echo $uri
    $release = Invoke-WebRequest -URI $uri | ConvertFrom-Json
    $repo[$i, 1] = $release.tag_name;
    start chrome --app="https://github.com/$($repo[$i, 0])/archive/refs/tags/$($repo[$i, 1]).zip"
}
Start-Sleep -Seconds 20
taskkill /F /IM chrome.exe
for ($i = 0; $i -lt $length; $i++)
{
    Expand-Archive -Path "Downloads/$(($repo[$i, 0] -split "/")[1])-$($repo[$i, 1].substring(1)).zip" -DestinationPath "Downloads/Librairies" -Force
}
