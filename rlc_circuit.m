function varargout = rlc_circuit(varargin)
% RLC_CIRCUIT MATLAB code for rlc_circuit.fig
%      RLC_CIRCUIT, by itself, creates a new RLC_CIRCUIT or raises the existing
%      singleton*.
%
%      H = RLC_CIRCUIT returns the handle to a new RLC_CIRCUIT or the handle to
%      the existing singleton*.
%
%      RLC_CIRCUIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RLC_CIRCUIT.M with the given input arguments.
%
%      RLC_CIRCUIT('Property','Value',...) creates a new RLC_CIRCUIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rlc_circuit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rlc_circuit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rlc_circuit

% Last Modified by GUIDE v2.5 20-Dec-2011 01:48:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rlc_circuit_OpeningFcn, ...
                   'gui_OutputFcn',  @rlc_circuit_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before rlc_circuit is made visible.
function rlc_circuit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rlc_circuit (see VARARGIN)
global F Ohm H E Signal;
% F      : unit of capacity
% Ohm    : unit of resistance
% H      : unit of Inductance
% E      : Amplitude of Input Signal
% Signal : Type of Input signal
clc
Signal=1;								%  Step Wave

F=10^-6;								%  uF
Ohm=1;									%  Ohm
H=10^-3;								%  mH
E=20;
DrawRLC(handles)																%  Draw RLC schematic
DrawInputSignal																	%  Draw the input Signal
DrawBodeDiagram																	%  Draw Bode Diagram
DrawOutputWaveforms																%  Draw Output waveforms

% Choose default command line output for rlc_circuit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rlc_circuit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = rlc_circuit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NumSliderVal=get(hObject,'Value');												%  Get the current vlaue of the slider
StrSliderVal=num2str(NumSliderVal);												%  Transform it to string
set(handles.edit1,'String',StrSliderVal);										%  Put it the correspondent Edit Text

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NumSliderVal=get(hObject,'Value');												%  Get the current vlaue of the slider
StrSliderVal=num2str(NumSliderVal);												%  Transform it to string
set(handles.edit2,'String',StrSliderVal);										%  Put it the correspondent Edit Text

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters

% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

NumSliderVal=get(hObject,'Value');												%  Get the current vlaue of the slider
StrSliderVal=num2str(NumSliderVal);												%  Transform it to string
set(handles.edit3,'String',StrSliderVal);										%  Put it the correspondent Edit Text

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters

% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	StrVal = get(hObject,'String');												%  get the value from the field
	NewVal = str2double(StrVal);												%  transform the string to double
	if  isempty(NewVal) || (NewVal< 1) || (NewVal>999)							%  If the Edit value is empty or value is inf<1 or value inf >999
		OldVal = get(handles.slider1,'Value');									%  Restore the previous value from the correspendent slider
		set(hObject,'String',OldVal);											%
	else																		%  Otherwise the value is correct
		set(handles.slider1,'Value',NewVal)										%  change the slider value
		slider1_Callback(handles.slider1, eventdata, handles)
	end
	


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	StrVal = get(hObject,'String');												%  get the value from the field
	NewVal = str2double(StrVal);												%  transform the string to double
	if  isempty(NewVal) || (NewVal< 1) || (NewVal>999)							%  If the Edit value is empty or value is inf<1 or value inf >999
		OldVal = get(handles.slider2,'Value');									%  Restore the previous value from the correspendent slider
		set(hObject,'String',OldVal);											%
	else																		%  Otherwise the value is correct
		set(handles.slider2,'Value',NewVal)										%  change the slider value
		slider2_Callback(handles.slider2, eventdata, handles)
	end
	


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
	StrVal = get(hObject,'String');												%  get the value from the field
	NewVal = str2double(StrVal);												%  transform the string to double
	if  isempty(NewVal) || (NewVal< 1) || (NewVal>999)							%  If the Edit value is empty or value is inf<1 or value inf >999
		OldVal = get(handles.slider3,'Value');									%  Restore the previous value from the correspendent slider
		set(hObject,'String',OldVal);											%
	else																		%  Otherwise the value is correct
		set(handles.slider3,'Value',NewVal)										%  change the slider value
		slider3_Callback(handles.slider3, eventdata, handles)
	end



% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global Ohm ;
%	Ohm	: l'unit of the resistance

str = get(hObject, 'String');													%  Get the list from popupmenu
val = get(hObject,'Value');														%  Get the value of the choice
switch str{val};
 case 'mOhm'                                                                	%  If the choice is mOhm
   Ohm=10^-3;                                                                   %  Multiply the value by 10^-3
 case 'Ohm'                                                 					%  If the choice is Ohm
   Ohm=1;                                               						%  Multiply the value by 1
 case 'KOhm'                                                    				%  If the choice is KOhm (kilo Ohm)
   Ohm=10^3;                                                        			%  Multiply the value by 10^3
 case 'MOhm'                                                            		%  If the choice is MOhm (Mega Ohm)
   Ohm=10^6;                                                                	%  Multiply the value by 10^6
end

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global H ;
% H      : Unit of the inductance

str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
    case 'mH'																	%  If the choice is mH (mili Henry)
        H=10^-3;																%  Multiply the value by 10^-3
    case 'uH'																	%  If the choice is uH (micro henry)
        H=10^-6;																%  Multiply the value by 10^-6
    case 'nH'																	%  If the choice is nH (nano henry)
        H=10^-9;																%  Multiply the value by 10^-9
end

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global F;
% F      : Unity of the capacity

str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
     case 'uF'																	%  If the choice is uF (micro Farad) 
            F=10^-6;															%  Multiply the value by 10^-6
     case 'nF'																	%  If the choice is nF  (nano Farad)
            F=10^-9;															%  Multiply the value by 10^-6
     case 'pF'																	%  If the choice is pF  (pico Farad)
            F=10^-12;															%  Multiply the value by 10^-12
end

DrawBodeDiagram																	%  ReDraw Bode Diagram after updating the parameters
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Signal

%Signal : le type du signal d'ent�e

str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val};
     case 'Pulse Wave'															%  Input signal is a Pulse Wave
           Signal=1;
     case 'Sine Wave'															%  Input Signal is a Sine Wabe
           Signal=2;
     case 'Triangle Wave'														%  Input Signal is a Triangle wave
          Signal=3;
end
DrawInputSignal																	%  Update the Input Signal
DrawOutputWaveforms																%  ReDraw Voltage and current waveforms after updating the parameters


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

