# How to use the programmer

Check  

>$ avrdude -p m328p -c usbasp -v

Read flash  

>$ avrdude -p m328p -c usbasp -v -U flash:r:flash.hex:i

Verify flash  

>$ avrdude -p m328p -c usbasp -v -U flash:v:flash.hex:i
