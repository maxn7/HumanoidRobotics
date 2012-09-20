function move(axis, angle)
%This function send an order to Parallax Servo controller
%trought serial port.
% The serial port must be open with serialOpen.m

switch axis
    case 'shoulder'
        disp('moving shoulder');
        channel = 1;
        ramp = 2;
        value = angle; %TODO : calibration
        
    otherwise
        disp('Error : unknown axis')
        return
end


%Formatting binary data to send trough serial
header = '!SC';
cr = 13;
lowB = mod(value,2^8) ;
highB = floor(value/2^8) ;
order = strcat(header,channel,ramp,lowB,highB,cr);
fwrite(serialPort,order);

%Log for debugging
%data = fopen('raw','w')
%fwrite(data,order)
%fclose(data)

return
end

