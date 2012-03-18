global C L R F  Ohm H E ;
% C      : the value of the capacitor
% L      : the Value of the Inductor
% R      : The value of the resistor
% F      : Unity of the capacitor
% Ohm    : Unity of the resistor
% H      : Unity of the Inductor
% E      : Amplitude of the input signal
% Signal : Type of the input signal

% Values of R,L and C

R=(get(handles.slider1,'Value'))*Ohm;
L=(get(handles.slider2,'Value'))*H;
C=(get(handles.slider3,'Value'))*F;

%calculate of the damping Factor
z=(R/2)*sqrt(C/L);
set(handles.text6,'String',z);													% Show the value

 if z>1																			% If the factor is supperior than 1 
     set(handles.text7,'string','Overdamped')									% It means that the system is overdamped
 elseif z==1																	% If the factor is equal to 1
     set(handles.text7,'string','Critically damped')							% The system is in critical phase
 elseif z<1																		% If the factor is inferior of 1
     set(handles.text7,'string','Underdamped')									% The system is underdamped
 end
 
 
 
% Drawing the Bode diagram
axes(handles.axes1)																% Choosing the axes 1 
x=0.1:0.1:10000;																% Scale of the x axis
p=j*x;																			% p: Laplace   x=w/w0
FT=E./(L*C*p.*p + R*C*p + 1);													% Transfer function
AdB=20*log10(abs(FT));															% The module of the transfer function
semilogx(x,AdB,'LineWidth',2,'Color','red');									% Draw the module in a semilog graph
set(handles.axes1,'Color',[0.306 0.396 0.58])									% Change the background color
legend('Gain(dB)');	
grid on																			% Enable the grid

%create a phase Plot
axes(handles.axes2)																% In the axes 2
phase=angle(FT)*(180/pi);														% Get the phase
semilogx(x,phase,'LineWidth',2,'Color','red');									% Plot the phase in a semibode graph and change the width and the color of the line
set(handles.axes2,'Color',[0.306 0.396 0.58])									% Change the background color
legend('phase(°)');																% y label
grid on																			% Enable the grid

% Angular resonance
W0=1/sqrt(L*C);
set(handles.text9,'string',W0);													% Set the value in the static text 9

% Gain and phase margin
sys=tf(E,[L*C R*C 1]);
[Gm,Pm,Wg,Wp] = margin(sys);
Gm_dB=20*log10(Gm);
set(handles.text12,'string',Pm);												% Set the value in the static text 12
