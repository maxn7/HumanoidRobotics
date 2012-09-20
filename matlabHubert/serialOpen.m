%openSerial.m
%This script open a serial port on UNIX
%Used to send data to Parallax Servo controller

serialPort = serial('/dev/ttyUSB1','BAUD',2400, 'TERMINATOR', 'CR')
fopen(serialPort)



%fclose(s)
