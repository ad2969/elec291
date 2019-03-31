@echo off
::This file was created automatically by CrossIDE to compile with C51.
Z:
cd "\Academic\GitHub\elec291-coin-picker-robot\"
"Z:\Academic\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "Z:\Academic\GitHub\elec291-coin-picker-robot\merge1.c"
if not exist hex2mif.exe goto done
if exist merge1.ihx hex2mif merge1.ihx
if exist merge1.hex hex2mif merge1.hex
:done
echo done
echo Crosside_Action Set_Hex_File Z:\Academic\GitHub\elec291-coin-picker-robot\merge1.hex
