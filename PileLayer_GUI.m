function varargout = PileLayer_GUI(varargin)
% PILELAYER_GUI MATLAB code for PileLayer_GUI.fig
%      PILELAYER_GUI, by itself, creates a new PILELAYER_GUI or raises the existing
%      singleton*.
%
%      H = PILELAYER_GUI returns the handle to a new PILELAYER_GUI or the handle to
%      the existing singleton*.
%
%      PILELAYER_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PILELAYER_GUI.M with the given input arguments.
%
%      PILELAYER_GUI('Property','Value',...) creates a new PILELAYER_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before PileLayer_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to PileLayer_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help PileLayer_GUI

% Last Modified by GUIDE v2.5 08-Aug-2016 16:14:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @PileLayer_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @PileLayer_GUI_OutputFcn, ...
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


% --- Executes just before PileLayer_GUI is made visible.
function PileLayer_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to PileLayer_GUI (see VARARGIN)

%-----------------------------------SET PILE TABLE-------------------------
set(handles.methodPopMenu,'String',{'API Method','Nordlund','McVay','Other'}); 
handles.numberOfLayer1 = 4;
handles.Pile_data = cell(handles.numberOfLayer1,6);
handles.cnames3 = {'Start Elevation(feet)' 'End Elevation(feet)' 'Soil Description' 'Relative Density' 'Cohesion(Ksf)' 'Unit Weight(Pcf)'};
set(handles.PileLayerTable,'data',handles.Pile_data,'ColumnName',handles.cnames3,...
    'ColumnFormat',{'numeric' 'numeric' {'Cohesive', 'Cohesionless'}...
    {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'},...
    'ColumnEditable',[true true true true true true]);  
%--------------------------------------------------------------------------

%------------------------------------SET Extra Data Table------------------

 handles.cnames5 = {'GSE(feet)' 'PTE(feet)' 'Wall Thickness(inches)' 'Outer Diameter(inches)' 'GWE(feet)'};
 handles.Pile_ExtraData1 = cell(5,1);
 set(handles.PileExtradataTable,'Data',handles.Pile_ExtraData1,'RowName',handles.cnames5,...
     'units','normalized','Position',[0.05 0.7 0.9 0.2],'ColumnFormat',{'numeric'},'ColumnEditable',true);

%--------------------------------------------------------------------------

%------------------------------------SET Boring Distance Table ------------
 handles.cnames4 = {'Exploration Designation','Distance(feet)'};
 handles.Pile_ExplorationDist = cell(4,2);
 set(handles.ExplorationDistTable,'Data',handles.Pile_ExplorationDist,'ColumnName',handles.cnames4,...
     'ColumnFormat',{'char','numeric'},'ColumnEditable',[true true]);
 

%--------------------------------------------------------------------------
% Choose default command line output for PileLayer_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes PileLayer_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = PileLayer_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function fileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to fileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function newButton_Callback(hObject, eventdata, handles)
% hObject    handle to newButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function openButton_Callback(hObject, eventdata, handles)
% hObject    handle to openButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
OpenFile= openFileMethod_GUI();
  A = OpenFile.StartElev;
     B = OpenFile.EndElev;
     C =  OpenFile.SoilType;
     D =  OpenFile.RelativeDensity;
     E  = OpenFile.UnitWeight;
     F  = OpenFile.Layers ;
     G = OpenFile.Cohesion;
handles.numberOfLayer2 = 4;
 handles.Pile_data = {40,6};
 for ( i= 1:1:length(A))
     handles.Pile_data {i,1} = A(i) ;
     
    handles.Pile_data {i,2} = B(i) ;
    handles.Pile_data {i,3} = char(C(i)) ;
 handles.Pile_data {i,4} = char(D(i)) ;
   handles.Pile_data {i,5} = E(i);
 handles.Pile_data {i,6} = G(i);
 end
    
     
    

 
set(handles.PileLayerTable,'data',handles.Pile_data,'ColumnName',handles.cnames3,...
    'ColumnFormat',{'numeric' 'numeric' {'Cohesive', 'Cohesionless'}...
    {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'},...
    'ColumnEditable',[true true true true true true]); 
 handles.Pile_data = get(handles.PileLayerTable,'data');
 
       guidata(hObject,handles);    



% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function saveAsButton_Callback(hObject, eventdata, handles)
% hObject    handle to saveAsButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

saveFunction_GUI(handles);

function numberOfLayerBox_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfLayerBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfLayerBox as text
%        str2double(get(hObject,'String')) returns contents of numberOfLayerBox as a double


% --- Executes during object creation, after setting all properties.
function numberOfLayerBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfLayerBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in methodPopMenu.
function methodPopMenu_Callback(hObject, eventdata, handles)
% hObject    handle to methodPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methodPopMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methodPopMenu


% --- Executes during object creation, after setting all properties.
function methodPopMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methodPopMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in setButton.
function setButton_Callback(hObject, eventdata, handles)
% hObject    handle to setButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.numberOfLayer1 = str2double(get(handles.numberOfLayerBox,'String'));
 handles.Pile_data = cell(handles.numberOfLayer1,6);
 
set(handles.PileLayerTable,'data',handles.Pile_data,'ColumnName',handles.cnames3,...
    'ColumnFormat',{'numeric' 'numeric' {'Cohesive', 'Cohesionless'}...
    {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'},...
    'ColumnEditable',[true true true true true true]); 
 handles.Pile_data = get(handles.PileLayerTable,'data');
 
       guidata(hObject,handles);    


% --- Executes on button press in calculateButton.
function calculateButton_Callback(hObject, eventdata, handles)
% hObject    handle to calculateButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.Pile_ExtraData = get(handles.PileExtradataTable,'data');
handles.GWE = str2double(handles.Pile_ExtraData(5));
handles.PileTipElevation = str2double(handles.Pile_ExtraData(2));
handles.OuterDiameter = str2double(handles.Pile_ExtraData(4));
handles.WallThickness = str2double(handles.Pile_ExtraData(3));
 handles.Pile_data =get(handles.PileLayerTable,'data');  
 
 %---------------------------ALL THE CALCULATIONS--------------------------
[sigma_v_tip, sigma_v_mid, ~, ~ ] = sigma_v_calc_GUI_modified((handles.GWE), cell2mat(handles.Pile_data(:,1)),(cell2mat(handles.Pile_data(:,2))), cell2mat(handles.Pile_data(:,6)), handles.PileTipElevation); 
 
for z1 = 1:handles.numberOfLayer1
    if (strcmpi(handles.Pile_data{z1,3},'Cohesive'))
    Qs(z1) = alpha_method_API(handles.Pile_data(z1,3),cell2mat(handles.Pile_data(z1,5)),sigma_v_mid(z1));    
    elseif (strcmpi(handles.Pile_data{z1,3},'Cohesionless'))
    Qs(z1) =  beta_Method_API(handles.Pile_data(z1,3),handles.Pile_data(z1,4), sigma_v_mid(z1));   
    end
end

for z1 =1:(handles.numberOfLayer1)
    if z1 ==handles.numberOfLayer1
        
    
 if (strcmpi(handles.Pile_data{z1,3},'Cohesive'))
   Qt(z1) =   Total_Stress_Bearing_Capacity_Approach_AASHTO_and_API(handles.Pile_data(z1,3),cell2mat(handles.Pile_data(z1,5)));
 elseif  (strcmpi(handles.Pile_data{z1,3},'Cohesionless'))
   Qt(z1) = Bearing_Capacity_Approach_API(handles.Pile_data(z1,3),handles.Pile_data(z1,4), sigma_v_tip);
 end
    else
        Qt(z1)=0;
    end
end

[Q_t_full,Q_t_annulus,Q_s_inner,Q_s_outer,Q_total_case1,Q_total_case2] = calculated_resistance_capacities_API(handles.OuterDiameter,handles.WallThickness,Qs,Qt, cell2mat(handles.Pile_data(:,1)), cell2mat(handles.Pile_data(:,2)),handles.PileTipElevation);

handles.ResultTable = table(handles.Pile_data,Qs',Qt');
handles.ResultTable.Properties.VariableNames = {'Input' 'qs_Ksf' 'qt_Ksf'};
handles.Qt_full = Q_t_full';
handles.Qt_annulus = Q_t_annulus';
handles.Qs_inner = Q_s_inner;
handles.Qs_outer = Q_s_outer;
handles.Qtotal1 = Q_total_case1;
handles.Qtotal2 = Q_total_case2;
M = length(handles.Qt_full);
handles.Resultdata = [handles.Qt_full(M) handles.Qt_annulus(M) handles.Qs_inner handles.Qs_outer handles.Qtotal1(M) handles.Qtotal2(M)];
handles.Resultdata_VarName = {'Qt considered full area' 'Qt considered ring area' 'Qs inner surface area' 'Qs outer surface area' 'Qtotal (full tip + outer skin resistances)' 'Qtotal (ring tip + outer skin + inner skin resistances)'};
handles.Resultdata_Units = {'kips' 'kips' 'kips' 'kips' 'kips' 'kips'};
handles.ResultTable_Units = {'Start Elev(ft)' '(End Elev(ft)' 'Soil Type' 'Relative Denstiy' 'Cohesion(ksf)' 'Unit Weight(pcf)' 'Unit Skin Friction(ksf)' 'Unit End Bearing(ksf)'};

% handles.ResultData{1} = cell2mat(handles.Pile_data);
% handles.ResultData{2}= Qs';
% handles.ResultData{3} = Qt;s
saveFunction_GUI(handles);
 guidata(hObject,handles); 
% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


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
