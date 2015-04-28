% Differential Equation if the RLC CIrcuit
function f=RLCEqu(i,j)
global C L R b Signal E;

% Input signal
if Signal==1
	b=(E*pulstran(i,0:1:20,'rectpuls',2));										% Step 
elseif Signal==2
	b=(E*sin(1*i));																% Sine wave
elseif Signal==3
	b=(E*sawtooth(i,0.5));														% triangle wave
end

% Differential Equation
f=zeros(2,1);
f(1)=j(2);
f(2)=(-1/(L*C))*j(1)+(-R/L)*j(2)+b/(L*C);
