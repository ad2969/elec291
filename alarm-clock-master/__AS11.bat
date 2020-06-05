@echo off
Z:
cd "\Academic\GitHub\elec291-alarm-clock\"
if exist Perfect.lst del Perfect.lst
if exist Perfect.s19 del Perfect.s19
if exist __err.txt del __err.txt
"Z:\Academic\CrossIDE\Call51\Bin\a51.exe"  Perfect.asm > __err.txt
"Z:\Academic\CrossIDE\Call51\Bin\a51.exe"  Perfect.asm -l > Perfect.lst
if not exist s2mif.exe goto done
if exist Perfect.s19 s2mif Perfect.s19 Perfect.mif > nul
:done
