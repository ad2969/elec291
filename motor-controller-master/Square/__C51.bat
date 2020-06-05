@echo off
::This file was created automatically by CrossIDE to compile with C51.
C:
cd "\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Square\"
"Z:\Academic\CrossIDE\Call51\Bin\c51.exe" --use-stdout  "C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Square\square(1).c"
if not exist hex2mif.exe goto done
if exist square(1).ihx hex2mif square(1).ihx
if exist square(1).hex hex2mif square(1).hex
:done
echo done
echo Crosside_Action Set_Hex_File C:\Users\Clare\OneDrive\[UBC] Undegraduate Sophomore\ELEC291 (Calvino-Fraga, Jesus)\Lab 6 - Motor Control\Square\square(1).hex
