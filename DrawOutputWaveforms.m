global C Signal h;   
%C      : The value of the capacitor
%Signal : Type of the input signal
%h      : Time vector

if Signal==1																	% If the input signal is a step wave
    % The voltage waveform Vc(t)
    axes(handles.axes3);														% Draw the following in the axes 3
    [t,y]=ode15s('RLCEqu',[0 1],[0 0]);									% Solve the differential equation of the circuit
    plot(t,y(:,1),'LineWidth',2,'Color','red');									% Draw the solution and change the width and the color of the line
    set(handles.axes3,'Color',[0.306 0.396 0.58])								% Change the background color
    legend('Voltage Vout(V)');													% show legend
    axis auto;																	% automatic scales of the axis
    grid on;																	% Enable the grid
    
    %The current waveform i(t)
    axes(handles.axes4);														% Draw the following in the axes 4
    plot(t,C*y(:,2),'LineWidth',2,'Color','red')								% Dessiner le graphe
    set(handles.axes4,'Color',[0.306 0.396 0.58])								% change backgroud
    legend('Current I(A)');														% show legend
    xlabel('Time(s)');															% x label
    axis auto;																	% automatic scale of the axis
    grid on																		% Enable the grid
    

    
else																			% If the input signal is triangle or sine wave
       
    % The voltage waveform Vc(t)
    axes(handles.axes3);														% Draw the following in the axes 3
    [t,y]=ode15s('RLCEqu',[0 20],[0 0]);									% Solve the differential equation of the circuit
    plot(t,y(:,1),'LineWidth',2,'Color','red');									% Draw the solution and change the width and the color of the line
    set(handles.axes3,'Color',[0.306 0.396 0.58])								% Change the background color
    legend('Voltage Vout(V)');													% show legend
    axis auto;																	% automatic scales of the axis
    grid on;																	% Enable the grid
    
    %The current waveform i(t)
    axes(handles.axes4);														% Draw the following in the axes 4
    plot(t,C*y(:,2),'LineWidth',2,'Color','red');								% Draw the solution and change the width and the color of the line
    set(handles.axes4,'Color',[0.306 0.396 0.58])								% Change the background color
    legend('Current I(A)');														% show legend
    xlabel('Time(s)');															% x label
    axis auto;																	% automatic scales of the axis
    grid on;																	% Enable the grid

end
 
