@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\"
"Z:\Academic\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.c"
if not exist hex2mif.exe goto done
if exist Program.ihx hex2mif Program.ihx
if exist Program.hex hex2mif Program.hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Program.hex
