%Input Signals
global Signal E h;

if Signal==1
    h=0:0.001:1;
    Ve=(E*pulstran(h,0:1:20,'rectpuls',2));										% Step Wave
elseif Signal==2
    h=0:0.01:20;  
    Ve=(E*sin(1*h));															% Sine Wave
elseif Signal==3
    h=0:0.01:20;  
    Ve=(E*sawtooth(h,0.5));														% Triangle Wave
end

if Signal==1
	% Input signal waveform
	axes(handles.axes5)															% In the axes 5
	plot(h,Ve,'LineWidth',2,'Color','k');										% Draw the signal
	axis ([0 1 0 50]) ;															% scale of the axis
	axis off																	% don't show the axis

else

	% Input signal waveform
	axes(handles.axes5)															% In the axes 5
	plot(h,Ve,'LineWidth',2,'Color','k');										% Draw the signal
	axis ([0 20 -20 20]);														% scale of the axis
	axis off																	% don't show the axis
	
end
