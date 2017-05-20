function varargout = GuiTest(varargin)
% GUITEST MATLAB code for GuiTest.fig
%      GUITEST, by itself, creates a new GUITEST or raises the existing
%      singleton*.
%
%      H = GUITEST returns the handle to a new GUITEST or the handle to
%      the existing singleton*.
%
%      GUITEST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUITEST.M with the given input arguments.
%
%      GUITEST('Property','Value',...) creates a new GUITEST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GuiTest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GuiTest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GuiTest

% Last Modified by GUIDE v2.5 15-Aug-2016 11:36:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GuiTest_OpeningFcn, ...
                   'gui_OutputFcn',  @GuiTest_OutputFcn, ...
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


% --- Executes just before GuiTest is made visible.
function GuiTest_OpeningFcn(hObject, eventdata, handles, varargin)

set(handles.selectMethodPopUp,'String',{'API Method','Nordlund'}); 
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GuiTest (see VARARGIN)

% Choose default command line output for GuiTest
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GuiTest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GuiTest_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function boringFileEditText_Callback(hObject, eventdata, handles)
% hObject    handle to boringFileEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of boringFileEditText as text
%        str2double(get(hObject,'String')) returns contents of boringFileEditText as a double


% --- Executes during object creation, after setting all properties.
function boringFileEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to boringFileEditText (see GCBO)
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

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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


% --- Executes on button press in getOutputPushButton.
function getOutputPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to getOutputPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in setDefaultPushButton.
function setDefaultPushButton_Callback(hObject, eventdata, handles)
if get(handles.rb_lab,'Value')==1
[newCohesion1,newUnitWeight1] =getimprovedCohesionMatrix_GUI(handles);
handles.data_lab(:,7)=newCohesion1;
handles.data_lab(:,5) = newUnitWeight1;

handles.lab_table = uitable(handles.uipanel1,'Data',handles.data_lab,'ColumnName',handles.cnames,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',({[] [] [] [] 'numeric' [] 'numeric' {'Cohesive' 'Cohesionless'}...
        {'Cohesive' 'Medium Dense Sand-Silt' 'Medium Dense Sand Dense Sand-Silt' 'Dense Sand Very Dense Sand-Silt' ' Very Dense Sand'}}),'ColumnEditable',[false false false false true false true true true]);
end
guidata(hObject,handles);
% hObject    handle to setDefaultPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in getDataPushButton.
function getDataPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to getDataPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% ------------------------GET Structures from All the Files----------------
clear handles.rb handles.rb_gen handles.rb_CPT
[fileName, BoringSheetNames, sheetName, Project, ExplorationType ] = getBoringSheetData_GUI( handles.p1,handles.f1 );
[PileSheetNames, Project_Pile ] = getPileSheetData_GUI(handles.p2,handles.f2);
[GeneralizedPileSheetNames, Project_GeneralizedPile ] = getGeneralizedPileSheetData_GUI(handles.p2,handles.f2);
[~, CPTSheetNames, Project_CPT ] = getCPTSheetData_GUI_mod( handles.p1,handles.f1 );
[~, STEELSheetNames, Project_Steel ] = getSteelPiledata_GUI( handles.p2,handles.f2 );
if (strcmpi(handles.f3,'Project#26-Steel_Load Test Data.xlsx'))
[~, LoadSheetNames, Project_Load ] = getLoaddata_proj26_GUI( handles.p3,handles.f3 );
else
[~, LoadSheetNames, Project_Load ] = getLoaddata_GUI( handles.p3,handles.f3 );
end
Project_BoringUnits = BoringUnits(handles.p1, handles.f1);
Project_CPTUnits = CPTunits(handles.p1,handles.f1);
Project_GSLUnits = GSL_uNITS(handles.p2,handles.f2);
Project_PileUnits1 = PileUnits1(handles.p2, handles.f2);
Project_PileUnits2 = PileUnits2(handles.p2,handles.f2);
%--------------------------Sort Lab Data ----------------------------------
[Table,index] = sortLabdata_GUI(handles.p1,handles.f1);  
Project_LabUnits  = LabUnits_GUI(handles.p1,handles.f1);

%--------------------------Assigning Data----------------------------------
handles.Project = Project;
nestedStructure = fieldnames(handles.Project);
handles.fileName = fileName;
handles.BoringSheetNames = BoringSheetNames;
handles.sheetName = sheetName;
handles.ExplorationType = ExplorationType;
handles.PileSheetNames = PileSheetNames;
handles.Project_Pile = Project_Pile;
handles.CPTSheetNames = CPTSheetNames;
handles.Project_CPT = Project_CPT;
handles.STEELSheetNames = STEELSheetNames;
handles.Project_Steel = Project_Steel;
handles.Table = Table;
handles.index = index;
handles.nestedStructure= nestedStructure;
handles.LoadSheetNames = LoadSheetNames;
handles.Project_Load = Project_Load;
handles.GeneralizedPileSheetNames = GeneralizedPileSheetNames;
handles.Project_GeneralizedPile = Project_GeneralizedPile;
handles.nestedStructure_GeneralizedPile = fieldnames(Project_GeneralizedPile);
handles.nestedStructure_CPT = fieldnames(Project_CPT);
handles.Project_BoringUnits = Project_BoringUnits;
handles.Project_CPTUnits = Project_CPTUnits;
handles.Project_GSLUnits = Project_GSLUnits;
handles.Project_PileUnits1 = Project_PileUnits1;
handles.Project_PileUnits2 = Project_PileUnits2;
handles.Project_LabUnits = Project_LabUnits;
handles.nestedStructure_LabUnits = fieldnames(Project_LabUnits);
handles.nestedStructure_BoringUnits =fieldnames(Project_BoringUnits);


%-----------------------------------Dynamic Radio Buttons---------------------------------------


handles.radioButtonNames = matlab.lang.makeValidName(handles.nestedStructure);
handles.rb_gen_names = matlab.lang.makeValidName(handles.nestedStructure_GeneralizedPile);
handles.rb_CPT_names = matlab.lang.makeValidName(handles.nestedStructure_CPT);

bg = uibuttongroup(GuiTest,...
                  'Title','Data Sheets',...
                  'Position', [.01 .1 .35 .7]);
              handles.rb_lab = uicontrol(bg,'Style','radiobutton','String','Lab','Units','normalized','Position',[.1 .8 .3 .1]);

   for i = 1:length(handles.nestedStructure)
          
              handles.rb(i) = uicontrol(bg,'Style','radiobutton','String',handles.radioButtonNames{i},'Units','normalized','Position',[.07 (.8-(.1*i)) .91 .1]);

   end
   for j = 1:length(handles.nestedStructure_GeneralizedPile)  
   
    handles.rb_gen(j) = uicontrol(bg,'Style','radiobutton','String',handles.rb_gen_names{j},'Units','normalized','Position',[.3 (.8-(.1*j)) .91 .1]);
   end
    for k = 1:length(handles.nestedStructure_CPT)  
   
    handles.rb_CPT(k) = uicontrol(bg,'Style','radiobutton','String',handles.rb_CPT_names{k},'Units','normalized','Position',[.7 (.8-(.1*k)) .91 .1]);
   end
   
 %----------------------------GET Pile Names on LB-------------------------
 
 set(handles.pileNameLb,'string',(handles.PileSheetNames));
 
 
guidata(hObject,handles);
% --- Executes on button press in selectFilePushButton1.
function selectFilePushButton1_Callback(hObject, eventdata, handles)
% hObject    handle to selectFilePushButton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.f1,handles.p1] = uigetfile({'*.xlsx';'*.xls';'*.*'},'File Selector');

set(handles.boringFileEditText,'String',strcat(handles.p1,handles.f1));

guidata(hObject,handles);
% --- Executes on button press in selectFilePushButton2.
function selectFilePushButton2_Callback(hObject, eventdata, handles)
% hObject    handle to selectFilePushButton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[handles.f2,handles.p2] = uigetfile({'*.xlsx';'*.xls';'*.*'},'File Selector');

set(handles.edit2,'String',strcat(handles.p2,handles.f2));
guidata(hObject,handles);


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in testButton.
function testButton_Callback(hObject, eventdata, handles)
% hObject    handle to testButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

  
   
   %----------------------------------DROP DOWN FOR PILE---------------

%  for w = 1:length(handles.PileSheetNames)
%  handles.something1{w} = char(handles.PileSheetNames{w});
%  
% end
% handles.lb1 = uicontrol(GuiTest,'Style','listbox',...
%                 'String',handles.something1,...
%                 'units','normalized','Position',[0.02 0.25 .1 .1]);   
%  
% handles.lb = uicontrol(GuiTest,'Style','listbox',...
%                 'Position',[0.02 0.15 .1 .1]);



% --- Executes on button press in calculateQsPushButton.
function calculateQsPushButton_Callback(hObject, eventdata, handles)
% nestedStructure_Pile= fieldnames(handles.Project_Pile);
% 
% set(handles.lb,'String',[]);
% for o = 1:length(handles.something1)
% if (get(handles.lb1,'Value')==o)
%     
%     for q = 21:39
%         if strcmp(handles.Project_Pile.(nestedStructure_Pile{o}).ExplorationDesig_ExtraData{q},'')
%             continue
%         else
%             handles.Pile_ExplorationType1{q-20} =  handles.Project_Pile.(nestedStructure_Pile{o}).ExplorationDesig_ExtraData{q};
%         end
%     end
% 
% end
% end
%  
%      
%     %-------------------------------DROP DOWN MENU - BORING-------
%     for w = 1:length(handles.Pile_ExplorationType1)
%  handles.something{w} = char(handles.Pile_ExplorationType1{w});
%  
%     end
% handles.lb = uicontrol(GuiTest,'Style','listbox',...
%                 'String',handles.something,...
%                 'units','normalized','Position',[0.02 0.15 .1 .1]);
%    
% 
% 
% 
% 
% 
% 
% 
% for w = 1:length(handles.something)
% if (get(handles.lb,'Value')==w)
% for j = 1:length(handles.Table.ExplorationDesignation_Combined)
% if (strcmp(handles.ExplorationType{w},handles.Table.ExplorationDesignation_Combined(j)))
%  LabSoil_Depth2(j) = cell2mat(handles.data_lab(j,1));    
%  LabSoil_Type2(j)  = handles.data_lab(j,3);
%  Lab_Cohesion2(j) = cell2mat(handles.data_lab(j,7));
%  Lab_UnitWeight2(j) = cell2mat(handles.data_lab(j,5));
%     
%     
% 
% end
% end
% end
% end
% 
% LabSoil_Depth1 = LabSoil_Depth2(~LabSoil_Depth2==0);
% index1 = find(LabSoil_Depth2);
% LabSoil_Type1 = LabSoil_Type2(~cellfun(@isempty, LabSoil_Type2));
% Lab_Cohesion1 = Lab_Cohesion2(index1);
% Lab_UnitWeight1 = Lab_UnitWeight2(index1);
% 
% [LabMajor_Soil_Type1] = handles.data_lab(:,8);
% 
% soiltype_idx  =find(strcmp(LabMajor_Soil_Type1,'Cohesive'));
% cohesion_idx = find(Lab_Cohesion1==0);
% final_idx = intersect(soiltype_idx,cohesion_idx);
% 
% Lab_Cohesion1(final_idx)=[];
% Lab_UnitWeight1(final_idx)=[];
% LabSoil_Type1(final_idx)=[];
% LabSoil_Depth1(final_idx)=[];
% 
% 
% Lab_Cohesion = Lab_Cohesion1;
% Lab_UnitWeight = Lab_UnitWeight1;
% for w = 1:length(handles.something)
% if (get(handles.lb,'Value')==w)
% Lab_UnitWeight12 = CohesionlessSoil_UnitWeightAdjustment_GUI(Lab_UnitWeight,handles.Project,w,LabMajor_Soil_Type1);
% LabSoil_Type = LabSoil_Type1;
% LabSoil_Depth = LabSoil_Depth1;
% [Lab_GWT, Lab_Ground_Elev] = getGWT_GroundElev_GUI(handles.Project,w, LabSoil_Depth);
% 
% [LabMajor_Soil_Type] = handles.data_lab(:,8);
% Lab_Soil_Elev = -(LabSoil_Depth)+Lab_Ground_Elev';
% end
% end
% 
% 
% [ sigma_v,~, sigma_t] = sigma_v_calc_GUI( Lab_Soil_Elev', LabSoil_Type', Lab_GWT, Lab_Ground_Elev, Lab_UnitWeight12');
% 
% 
% for w = 1:length(handles.something)
% % if (get(handles.lb,'Value')==w)
%  [qs,qt] = getQsValues_API_Modified_GUI(Lab_Cohesion, LabSoil_Type,LabSoil_Depth,LabMajor_Soil_Type, handles.ExplorationType, handles.Project_Pile, sigma_v, w,handles.data_lab(:,9));
% 
% nestedStructure = fieldnames(handles.Project);
% 
%  handles.LabResult_Project.(nestedStructure{w}).Lab_Soil_Elev = Lab_Soil_Elev;
%     handles.LabResult_Project.(nestedStructure{w}).LabSoil_Depth = LabSoil_Depth;
% %     handles.LabResult_Project.(nestedStructure{w}).SoilLayerNumber = SoilLayerNumber_1;
%     handles.LabResult_Project.(nestedStructure{w}).Lab_GWT = Lab_GWT;
%     handles.LabResult_Project.(nestedStructure{w}).Lab_Ground_Elev = Lab_Ground_Elev;
%     handles.LabResult_Project.(nestedStructure{w}).LabSoil_Type = LabSoil_Type;
% %     handles.LabResult_Project.(nestedStructure{w}).SPT_Data = SPT_Data;
%     handles.LabResult_Project.(nestedStructure{w}).Lab_UnitWeight1 = Lab_UnitWeight1;
%     handles.LabResult_Project.(nestedStructure{w}).sigma_v = sigma_v;
%      handles.LabResult_Project.(nestedStructure{w}).Cohesion = Lab_Cohesion;
%     handles.LabResult_Project.(nestedStructure{w}).MajorSoilType = LabMajor_Soil_Type;
%     handles.LabResult_Project.(nestedStructure{w}).qs = qs;
%     handles.LabResult_Project.(nestedStructure{w}).qt = qt;
% 
% end
% 
% 
%    
% 
% 
% 
% guidata(hObject,handles);
% hObject    handle to calculateQsPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in calculatePileWiseButton.
function calculatePileWiseButton_Callback(hObject, eventdata, handles)
% nestedStructure = fieldnames(handles.Project);
% nestedStructure_Result = fieldnames(handles.LabResult_Project);
% nestedStructure_Pile = fieldnames(handles.Project_Pile);
% nestedStructure_Steel = fieldnames(handles.Project_Steel);
% 
% 
% for m = 1:length(nestedStructure_Pile)
%     for q = 21:39
%         if strcmp(handles.Project_Pile.(nestedStructure_Pile{m}).ExplorationDesig_ExtraData{q},'')
%             continue
%         else
%             Pile_ExplorationType =  handles.Project_Pile.(nestedStructure_Pile{m}).ExplorationDesig_ExtraData{q};
%    
%      for n = 1:length(nestedStructure_Result)
%          
% if strcmp(char(handles.ExplorationType{n}),Pile_ExplorationType)
% A = handles.LabResult_Project.(nestedStructure_Result{n}).LabSoil_Depth;
% B = handles.Project_Steel.(nestedStructure_Steel{m}).OuterDiameter;
% C = handles.Project_Steel.(nestedStructure_Steel{m}).InnerDiameter;
% D = handles.LabResult_Project.(nestedStructure_Result{n}).qs;
% 
% 
% AnnularArea{m} = (pi*(B^2 - C^2))/(4*144);
% TotalArea{m} = (pi*(B^2))/(4*144);
% T = TotalArea{m};
% F = AnnularArea{m};
% SurfaceArea_EmbeddedLength{m} = (pi*B*(handles.Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6}))/12;
% for k = 1:length(A)
% if (k ==1)
% SurfaceArea_Outside{m} =(pi*B*(A(k)))/12 ;  
% 
% SurfaceArea_Inside{m} = (pi*C*(A(k)))/12;
% else
% SurfaceArea_Outside{m} =(pi*B*(A(k)-A(k-1)))/12;
% 
% SurfaceArea_Inside{m} = (pi*C*(A(k)-A(k-1)))/12;
% end
% end
% H1(1) = cell2mat(SurfaceArea_Outside(m));
% for t = 2:length(A)
% H1(t)= cell2mat(SurfaceArea_Outside(m));
% I1(t)=cell2mat(SurfaceArea_Inside(m));
% 
% end
% H =H1(A<handles.Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6})';
% I = I1(A<handles.Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6})';
% 
% % Q = LabSoil_Type(A<Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6},m);
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).Soil_Depth = A(A<handles.Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6});
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).qs = D(A<handles.Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6});
% E = handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).qs;
% 
% % Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).AnnularArea =F(A<Project_Pile.(nestedStructure_Pile{m}).EmbeddedLength_ExtraData{6});
% % G = Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).AnnularArea;
% 
% % Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).capacity = mean(E)*AnnularArea{m};
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result1 = E.*H';
% R1= handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result1;
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result2 = (E.*I');
% R2 = handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result2;
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result3(m) = F*handles.LabResult_Project.(nestedStructure_Result{n}).qt(m);
% R3 = handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result3;
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result4(m) = handles.LabResult_Project.(nestedStructure_Result{n}).qt(m)*T;
% R4 = handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result4;
% 
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result5= E.*SurfaceArea_EmbeddedLength{m};
% R5 = handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).result5;
% 
% %-------------------conditions------------------
% for x= 1:length(R1)
% handles.Project_PileWise_Result.(nestedStructure_Pile{m}).(nestedStructure_Result{n}).TotalCapacity(x) = R1(x) + (min((R2(x)+R3(m)),R4(m)));
% end
% else
%     continue
% end
% end
% end
%     end
% end
% 
% handles.cnames1 = {'Depth', 'Qs','Result1','Result2', 'Result5'};
% m1 =get(handles.lb1,'Value');
% n1 = get(handles.lb,'Value');
% 
% handles.data_result =  [num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).Soil_Depth') ...
%         num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).qs') ...
%           num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result1') ...
%           num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result2')]; ...
%         %num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result4) ...
% %          num2cell(handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result5')];
%     
%      handles.result_table = uitable(handles.resultPanel,'Data',handles.data_result,'ColumnName',handles.cnames1,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',{[] []});
% 
%      
%      TC =handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).TotalCapacity;
%      QtAA = handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result3;
%      QtTA = handles.Project_PileWise_Result.(nestedStructure_Pile{m1}).(nestedStructure{n1}).result4;
% 
% set(handles.finalCapacityEditText,'string',num2str(sum(TC(~isnan(TC)))));
% set(handles.QtAnnularAreaEdit,'string',num2str(sum(QtAA(~isnan(QtAA)))));
% set(handles.QtTotalAreaEdit,'string',num2str(sum(QtTA(~isnan(QtTA)))));
% 
% guidata(hObject,handles);
% hObject    handle to calculatePileWiseButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function finalCapacityEditText_Callback(hObject, eventdata, handles)
% hObject    handle to finalCapacityEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finalCapacityEditText as text
%        str2double(get(hObject,'String')) returns contents of finalCapacityEditText as a double


% --- Executes during object creation, after setting all properties.
function finalCapacityEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finalCapacityEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QtAnnularAreaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to QtAnnularAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QtAnnularAreaEdit as text
%        str2double(get(hObject,'String')) returns contents of QtAnnularAreaEdit as a double


% --- Executes during object creation, after setting all properties.
function QtAnnularAreaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QtAnnularAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function QtTotalAreaEdit_Callback(hObject, eventdata, handles)
% hObject    handle to QtTotalAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of QtTotalAreaEdit as text
%        str2double(get(hObject,'String')) returns contents of QtTotalAreaEdit as a double


% --- Executes during object creation, after setting all properties.
function QtTotalAreaEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to QtTotalAreaEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in selectMethodPopUp.
function selectMethodPopUp_Callback(hObject, eventdata, handles)



% hObject    handle to selectMethodPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns selectMethodPopUp contents as cell array
%        contents{get(hObject,'Value')} returns selected item from selectMethodPopUp


% --- Executes during object creation, after setting all properties.
function selectMethodPopUp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to selectMethodPopUp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numberOfLayer_Callback(hObject, eventdata, handles)
% hObject    handle to numberOfLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numberOfLayer as text
%        str2double(get(hObject,'String')) returns contents of numberOfLayer as a double


% --- Executes during object creation, after setting all properties.
function numberOfLayer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numberOfLayer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in layerButton.
function layerButton_Callback(hObject, eventdata, handles)
% hObject    handle to layerButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 

% %--------------------------PILE LAYERING-------------------------------
%  handles.numberOfLayer1 = str2double(get(handles.numberOfLayer,'String'));
%  handles.Pile_data = cell(handles.numberOfLayer1,6);
%  nestedStructure_Pile = fieldnames(handles.Project_Pile);
%  nestedStructure_STEEL =fieldnames(handles.Project_Steel);
%  nestedStructure_Load = fieldnames(handles.Project_Load);
%  
%  handles.PileFigure = figure('Units','inches','Position',[1 1 15 8]);
%        handles.cnames3 = {'Start Elevation(feet)' 'End Elevation(feet)' 'Soil Description' 'Relative Density' 'Cohesion(Ksf)' 'Unit Weight(Pcf)'};
% %        handles.PileLayer_data = [
%        handles.PileLayer_table = uitable(handles.PileFigure,'data',handles.Pile_data,'ColumnName',handles.cnames3,'units','normalized','Position',[0.05 0.05 0.51 0.9],'ColumnFormat',({'numeric' 'numeric' {'Cohesive', 'Cohesionless'} {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'}),'ColumnEditable',[true true true true true true]);
%        
%        
%        index_selected = get(handles.lb1,'Value');
%   
%     % Item selected in list box
%     filename = handles.PileSheetNames{index_selected};
%        
%      set(handles.PileFigure,'numbertitle','off','name',filename);  
%             
%      
%      handles.PileFigurePanel = uipanel(handles.PileFigure,'Title','Stuff',...
%              'Position',[.6 .05 .4 .9]);
%          
%          handles.PileFigurePanelPushButton = uicontrol(handles.PileFigurePanel,'Style','pushbutton','String','Calculate',...
%                 'Position',[50 20 60 40]);
%      
            
%             handles.Unitsbg = uibuttongroup(handles.PileFigure,'Visible','off',...
%                   'Position',[20 100 5 1],...
%                   'SelectionChangedFcn',@bselection);
%               
%               
%               handles.SIUnitsr1 = uicontrol(handles.Unitsbg,'Style',...
%                   'radiobutton',...
%                   'String','SI',...
%                   'Position',[10 350 100 30],...
%                   'HandleVisibility','off');
%               
%               handles.IPSr2 = uicontrol(handles.Unitsbg,'Style',...
%                   'radiobutton',...
%                   'String','IPS',...
%                   'Position',[20 350 100 30],...
%                   'HandleVisibility','off');
     %--------------------Get Boring Distance------------------------------
     
%      for q1 = 21:39
%      ExplorationDesignation{q1-20} = handles.Project_Pile.(nestedStructure_Pile{index_selected}).ExplorationDesig_ExtraData{q1};
%      ExplorationDistance{q1-20} = handles.Project_Pile.(nestedStructure_Pile{index_selected}).EmbeddedLength_ExtraData{q1};
%      
%      
%      end
%     A1 = ExplorationDesignation;
%     B1 = ExplorationDistance;
%     
%     
%      
%      
%      
%      handles.ExplorationDesignation1 = A1(~cellfun('isempty',A1));
%      handles.ExplorationDistance1 = B1(~cellfun('isempty',B1));
%       A = (handles.ExplorationDesignation1);
%      B = (handles.ExplorationDistance1);
%      %-------------------GSE GWE added to the Panel on the right-----------
%      
%      handles.GSE = handles.Project_Pile.(nestedStructure_Pile{index_selected}).GroundSurface_ExtraData{12};
%      handles.PileTipElevation = handles.Project_Pile.(nestedStructure_Pile{index_selected}).EmbeddedLength_ExtraData{4};
%      handles.WallThickness = handles.Project_Steel.(nestedStructure_STEEL{index_selected}).WallThickness;
%      handles.OuterDiameter = handles.Project_Steel.(nestedStructure_STEEL{index_selected}).OuterDiameter;
%      handles.GWE = handles.Project_Load.(nestedStructure_Load{index_selected}).GSE_ExtraData(3);
%      
%      %---------------------------------------------------------------------
%         handles.Pile_ExtraData = [A' B'];
%         handles.Pile_ExtraData1 = {handles.GSE; handles.PileTipElevation ;handles.WallThickness ;handles.OuterDiameter; handles.GWE};
%            
%      %------------------------Add UITABLE for the Extra Data---------------
%      handles.cnames4 = {'Exploration Designation','Distance(feet)'};
%      handles.Pile_DataTable = ...
%         uitable(handles.PileFigurePanel,'Data',handles.Pile_ExtraData,'ColumnName',handles.cnames4,'units','normalized','Position',[0.05 0.5 0.9 0.2],'ColumnFormat',{[] [] [] []});
%      handles.cnames5 = {'GSE(feet)' 'PTE(feet)' 'Wall Thickness(inches)' 'Outer Diameter(inches)' 'GWE(feet)'};
%     handles.Pile_ExtraDataTable = ...
%         uitable(handles.PileFigurePanel,'Data',handles.Pile_ExtraData1,'RowName',handles.cnames5,'units','normalized','Position',[0.05 0.7 0.9 0.2],'ColumnFormat',{[] [] [] []});
%     
%     
%     
%     
%     
% %-------------------------------Get Data from the UI table-----------------
% 
%    
%         
% %--------------------------------Number of Layer & Method---------------------------
% handles.methodPopUp = uicontrol(handles.PileFigurePanel,'Style','popupmenu',...
%                 'String',{'API','NordLund','McVay','Other'},...
%                 'Value',1,'Position',[20 100 130 20]);
% 
% handles.numberofLayerEditBox = uicontrol(handles.PileFigurePanel,'Style','edit','Position',[20 120 130 20],'String','Select number of Layer');
% 
% handles.SetPushButton = uicontrol(handles.PileFigurePanel,'Style','pushbutton','String','Set',...
%                 'Position',[180 100 130 20]);
% 
% handles.PileLayer_table = uitable(handles.PileFigure,'data',handles.Pile_data,'ColumnName',handles.cnames3,'units','normalized','Position',[0.05 0.05 0.55 0.9],'ColumnFormat',({'numeric' 'numeric' {'Cohesive', 'Cohesionless'} {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'}),'ColumnEditable',[true true true true true true]);           
%             
%             guidata(hObject,handles);
%             
%   
%   
% %---------------------------------Calculate Pile Result Button-------------           
% set(handles.SetPushButton,'Callback',{@SetPushButton_Callback,handles});
% 
%  set(handles.PileFigurePanelPushButton,'Callback',{@PileFigurePushButton_Callback,handles});
% function PileFigurePushButton_Callback(hObject,eventdata,handles)
% 
%  handles.Pile_data =get(handles.PileLayer_table,'data');  
%  
%  %---------------------------ALL THE CALCULATIONS--------------------------
% [sigma_v_tip, sigma_v_mid, ~, ~ ] = sigma_v_calc_GUI_modified((handles.GWE), cell2mat(handles.Pile_data(:,1)),(cell2mat(handles.Pile_data(:,2))), cell2mat(handles.Pile_data(:,6)), handles.PileTipElevation); 
%  
% for z1 = 1:handles.numberOfLayer1
%     if (strcmpi(handles.Pile_data{z1,3},'Cohesive'))
%     Qs(z1) = alpha_method_API(handles.Pile_data(z1,3),cell2mat(handles.Pile_data(z1,5)),sigma_v_mid(z1));    
%     elseif (strcmpi(handles.Pile_data{z1,3},'Cohesionless'))
%     Qs(z1) =  beta_Method_API(handles.Pile_data(z1,3),handles.Pile_data(z1,4), sigma_v_mid(z1));   
%     end
% end
% 
% for z1 =1:(handles.numberOfLayer1)
%     if z1 ==handles.numberOfLayer1
%         
%     
%  if (strcmpi(handles.Pile_data{z1,3},'Cohesive'))
%    Qt(z1) =   Total_Stress_Bearing_Capacity_Approach_AASHTO_and_API(handles.Pile_data(z1,3),cell2mat(handles.Pile_data(z1,5)));
%  elseif  (strcmpi(handles.Pile_data{z1,3},'Cohesionless'))
%    Qt(z1) = Bearing_Capacity_Approach_API(handles.Pile_data(z1,3),handles.Pile_data(z1,4), sigma_v_tip);
%  end
%     else
%         Qt(z1)=0;
%     end
% end
% 
% [Q_t_full,Q_t_annulus,Q_s_inner,Q_s_outer,Q_total_case1,Q_total_case2] = calculated_resistance_capacities_API(handles.OuterDiameter,handles.WallThickness,Qs,Qt, cell2mat(handles.Pile_data(:,1)), cell2mat(handles.Pile_data(:,2)),handles.PileTipElevation);
% 
% handles.ResultTable = table(handles.Pile_data,Qs',Qt');
% handles.ResultTable.Properties.VariableNames = {'Input' 'qs_Ksf' 'qt_Ksf'};
% handles.Qt_full = Q_t_full';
% handles.Qt_annulus = Q_t_annulus';
% handles.Qs_inner = Q_s_inner;
% handles.Qs_outer = Q_s_outer;
% handles.Qtotal1 = Q_total_case1;
% handles.Qtotal2 = Q_total_case2;
% M = length(handles.Qt_full);
% handles.Resultdata = [handles.Qt_full(M) handles.Qt_annulus(M) handles.Qs_inner handles.Qs_outer handles.Qtotal1(M) handles.Qtotal2(M)];
% handles.Resultdata_VarName = {'Qt considered full area' 'Qt considered ring area' 'Qs inner surface area' 'Qs outer surface area' 'Qtotal (full tip + outer skin resistances)' 'Qtotal (ring tip + outer skin + inner skin resistances)'};
% handles.Resultdata_Units = {'kips' 'kips' 'kips' 'kips' 'kips' 'kips'};
% handles.ResultTable_Units = {'Start Elev(ft)' '(End Elev(ft)' 'Soil Type' 'Relative Denstiy' 'Cohesion(ksf)' 'Unit Weight(pcf)' 'Unit Skin Friction(ksf)' 'Unit End Bearing(ksf)'};

% handles.ResultData{1} = cell2mat(handles.Pile_data);
% handles.ResultData{2}= Qs';
% handles.ResultData{3} = Qt;s
%  [filename, pathname] = uiputfile(...
%  {'*.xls';'*.xlsx';'*.*'},...
%  'Save as');
% writetable(handles.ResultTable,filename,'Sheet',1);
% xlswrite(filename,handles.Resultdata',1,'M2:M7');
% xlswrite(filename,handles.Resultdata_VarName',1,'L2:L7');
% xlswrite(filename,handles.Resultdata_Units',1,'N2:N7');
% xlswrite(filename,{'Results' 'Value' 'Units'},1,'L1:N1');
% xlswrite(filename,handles.ResultTable_Units,1,'A1:H1');
% guidata(hObject,handles);
     
 %-------------------------------------------------------------------------
 
  %-------------------------------Set Layer & Method ----------------------
 set(handles.SetPushButton,'Callback',{@SetPushButton_Callback,handles});
function SetPushButton_Callback(hObject,eventdata,handles)

% handles.numberOfLayer1 = str2double(get(handles.numberofLayerEditBox,'String'));
%  handles.Pile_data = cell(handles.numberOfLayer1,6);
%  
%  handles.PileLayer_table = uitable(handles.PileFigure,'data',handles.Pile_data,'ColumnName',handles.cnames3,'units','normalized','Position',[0.05 0.05 0.51 0.9],'ColumnFormat',({'numeric' 'numeric' {'Cohesive', 'Cohesionless'} {'N/A','Loose Sand-Silt','Medium Dense Sand-Silt','Medium Dense Sand Dense Sand-Silt','Dense Sand Very Dense Sand-Silt','Very Dense Sand'} 'numeric' 'numeric'}),'ColumnEditable',[true true true true true true]);
%  handles.Pile_data = get(handles.PileLayer_table,'data');
%  
%        guidata(hObject,handles);     
 
%   handles.Pile_data

%--------------------------------------------------------------------------

function LoadFile_editText_Callback(hObject, eventdata, handles)
% hObject    handle to LoadFile_editText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of LoadFile_editText as text
%        str2double(get(hObject,'String')) returns contents of LoadFile_editText as a double


% --- Executes during object creation, after setting all properties.
function LoadFile_editText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to LoadFile_editText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SelectLoadFilePushButton.
function SelectLoadFilePushButton_Callback(hObject, eventdata, handles)
% hObject    handle to SelectLoadFilePushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[handles.f3,handles.p3] = uigetfile({'*.xlsx';'*.xls';'*.*'},'File Selector');

set(handles.LoadFile_editText,'String',strcat(handles.p3,handles.f3));

guidata(hObject,handles);


% --- Executes on button press in showDataPushButton.
function showDataPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to showDataPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

nestedStructure = fieldnames(handles.Project);
nestedStructure_GeneralizedPile = fieldnames(handles.Project_GeneralizedPile);
nestedStructure_CPT = fieldnames(handles.Project_CPT);

if get(handles.rb_lab,'Value')==1

%     if isempty(handles.Table)
%     handles.data_lab = cell(5,8);
%     
%     else
%     
if isempty(handles.Table)
    handles.boringWise_data1 = cell(5,8);
    handles.cnames2 = {'Elevation' 'USCS Code' 'Primary Soil Desc' 'Moisture Content' 'Unit Weight' 'Predicted Unit Weight' 'Cohesion' 'Friction Angle'};   
handles.f_emptyLab = figure('Units','inches','Position',[4 3 6 5]);
handles.boringwise_labTable = uitable(handles.f_emptyLab,'Data',handles.boringWise_data1,'ColumnName',handles.cnames2,'units','normalized','Position',[0.05 0.05 0.9 0.9]);
set(handles.f_emptyLab,'numbertitle','off','name','No Lab Data Available');
else
     [MajorSoilType_Lab] = checkMajorSoilType_GUI(handles.Table.USCSCode_Combined);
     [SoilDesc] = getSoilDesc_GUI(handles.Table.USCSCode_Combined);
     [handles.ElevationValues] = getElevationValues_GUI(handles,nestedStructure); 
%     
%     
%     handles.data_lab = [(num2cell(handles.ElevationValues'-handles.Table.Depth_Combined))....
%         handles.Table.ExplorationDesignation_Combined handles.Table.USCSCode_Combined ...
%         num2cell(handles.Table.MoistueContent_Combined) ...
%         num2cell(handles.Table.TotalUnit_Combined) ...
%         handles.Table.ShearTestCode_Combined ...
%         num2cell(handles.Table.Cohesion_Combined) MajorSoilType_Lab' SoilDesc'];
%         
%     end
%     handles.cnames = {'Elevation', 'Exploration Designation','USCS Code','Moisture Content','Unit Weight', 'Shear Test Code',' Cohesion','Soil Type','Soil Description'};
%     handles.lab_table = uitable(handles.uipanel1,'Data',handles.data_lab,'ColumnName',handles.cnames,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',({[] [] [] [] 'numeric' [] 'numeric' {'Cohesive' 'Cohesionless'}...
%         {'Cohesive' 'Medium Dense Sand-Silt' 'Medium Dense Sand Dense Sand-Silt' 'Dense Sand Very Dense Sand-Silt' ' Very Dense Sand'}}),'ColumnEditable',[false false false false true false true true true]);

%-------------------- Lab Data Distribution--------------------------------

[handles.struct_boringWiseLabData] = getDistributedTable_GUI(handles);
nestedStructure_boringWise = fieldnames(handles.struct_boringWiseLabData);

%--------------------------------------------------------------------------
%-------------------- Assign a Soil Type to all elevation------------------




%--------------------------------------------------------------------------
%------------------- GUI for Boring wise Lab data--------------------------
for i1 = 1:length(handles.ExplorationType)
 [M, N] = size(num2cell(handles.struct_boringWiseLabData.(nestedStructure_boringWise{i1}).Table.Var1));
 [Primary_Soil_Desc{i1}] = assignPrimarySoil_GUI(handles.Project,i1,handles.struct_boringWiseLabData);
 estimated_total_unit_weight = 0;
 
 if (length(Primary_Soil_Desc{i1})==1)
     
 estimated_total_unit_weight =[];
 else
 for z = 2:length(Primary_Soil_Desc{i1})

 estimated_total_unit_weight(z-1) = Total_Unit_weight_by_moisture_content(handles.struct_boringWiseLabData.(nestedStructure_boringWise{i1}).Table.Var4{z},handles.struct_boringWiseLabData.(nestedStructure_boringWise{i1}).Table.Var3(z),Primary_Soil_Desc{i1}{z});
 
 end
 end
 handles.PredictedUnitWeight1{i1} = estimated_total_unit_weight';
unit_estimatedunitweight = 'pcf';
 handles.PredictedUnitWeight{i1} =[unit_estimatedunitweight;num2cell(handles.PredictedUnitWeight1{i1})]; 
    
 end
   
 
 for i1 = 1:length(handles.ExplorationType)
      handles.boringWise_data =[(handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var1),  (handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var3), Primary_Soil_Desc{i1}, (handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var4), (handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var5),(handles.PredictedUnitWeight{i1}), (handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var6),(handles.struct_boringWiseLabData.(nestedStructure{i1}).Table.Var7)];
    handles.boringWise_data1 = handles.boringWise_data;
    handles.cnames2 = {'Elevation' 'USCS Code' 'Primary Soil Desc' 'Moisture Content' 'Unit Weight' 'Predicted Unit Weight' 'Cohesion' 'Friction Angle'};   
handles.f(i1) = figure('Units','inches','Position',[4 3 6 5]);
handles.boringwise_labTable = uitable(handles.f(i1),'Data',handles.boringWise_data1,'ColumnName',handles.cnames2,'units','normalized','Position',[0.05 0.05 0.9 0.9]);
% handles.bg_units(i1) = uibuttongroup(handles.f(i1),...
%                   'Title','Units',...
%                   'Position', [.01 .1 .35 .7]);
%  handles.SI_RadioButton(i1) = uicontrol(handles.bg_units(i1),'Style','radiobutton','String','SI','Position',[10 350 100 30]);
%   handles.IPS_RadioButton(i1) = uicontrol(handles.bg_units(i1),'Style','radiobutton','String','IPS','Position',[20 350 100 30]);
if isa(handles.ExplorationType{i1}{1},'double')
    handles.ExplorationType{i1}{1} = num2str(handles.ExplorationType{i1}{1});
end
set(handles.f(i1),'numbertitle','off','name',handles.ExplorationType{i1}{1});
end
end
end

%-------------------------------------Boring Data GUI upload---------------

[handles.Project_PrimarySoil] = assignPrimarySoil_Exploration(handles.Project);


   for o =1:length(handles.rb)
    if get(handles.rb(o),'Value')==1
        
        units_boringdata = (handles.Project_BoringUnits.(handles.nestedStructure_BoringUnits{o}).units);
        A123 = handles.Project.(nestedStructure{o}).Elevation;
        A1_withoutUnits = num2cell(A123(~isnan(A123)));
%         A1_withoutUnits_double = cell2mat(A1_withoutUnits);
        A1 = [units_boringdata{1};A1_withoutUnits];
        
        B123 = handles.Project.(nestedStructure{o}).Depth;
        B1_withoutUnits = num2cell(B123(~isnan(B123)));
        B1 = [units_boringdata{2};B1_withoutUnits];
        
        C123 = handles.Project.(nestedStructure{o}).FieldBlowCount;
        C1_withoutUnits = num2cell(C123(1:length(A1_withoutUnits)));
        C1 = [units_boringdata{4};C1_withoutUnits];
        
        D123 = handles.Project.(nestedStructure{o}).BlowIncrement;
        D1_withoutUnits = num2cell(D123(1:length(A1_withoutUnits)));
        D1 = [units_boringdata{5};D1_withoutUnits];
        
        E123 = handles.Project.(nestedStructure{o}).SoilLayerNumber;
        E1_withoutUnits = num2cell(E123(~isnan(E123)));
        E1 = [units_boringdata{7};E1_withoutUnits];
        
       
        F11_withoutUnits = (handles.Project_PrimarySoil.(nestedStructure{o}).SoilAssignment_Elevation);
        F11 = [units_boringdata{11};F11_withoutUnits];
        
        H123 = (handles.Project.(nestedStructure{o}).GWT_ExtraData{13});
        I1 = (handles.Project.(nestedStructure{o}).GWT_ExtraData{1});
        
        H1 = (handles.Project.(nestedStructure{o}).GWT_ExtraData{1}-handles.Project.(nestedStructure{o}).GWT_ExtraData{13});
        HammerType = (handles.Project.(nestedStructure{o}).GWT_ExtraData{18});
        
        K11_withoutUnits = (handles.Project_PrimarySoil.(nestedStructure{o}).PrimarySoilDescAssignment_Elevation);
        K11 = [units_boringdata{13};K11_withoutUnits];
%--------------------------------------------Boring Predictions------------        
% ----Unit Weight Predictions with SPT-----
        if isempty(F11)
            F1 =[];
        else
        for i2 = 1:length(F11)
        F1(i2) = F11(i2);
        K1(i2) = K11(i2);
        end
        end
      [handles.Predicted_UnitWeight] =UnitWeight_NValue_GUI(C1,K11,F11);  
        G1 = handles.Predicted_UnitWeight;
%----OCR Value Predictions with SPT -------
% A1_withnoNan = A1(~isnan(A1)); 
if isempty(A1_withoutUnits)
H1_compMatrix= [];
I1_compMatrix = [];

else
for a1 = 1:length(A1_withoutUnits)
H1_compMatrix(a1) = H1;
I1_compMatrix(a1) = I1;
end
end

if isempty(H1_compMatrix)
    sigma_v = [];
else
        [ sigma_v, ~, ~ ] = sigma_v_calc_GUI( A1, F11, H1_compMatrix', I1_compMatrix', G1);
end 
if isempty(sigma_v)||isempty(C1_withoutUnits)
    handles.OCR_SPT = [];
    handles.FrictionAngle_Hatanaka = [];
    handles.FrictionAngle_Schmertamann = [];
    handles.FrictionAngle_PH_T = [];
    handles.Su_SPT = [];
    handles.Su_SPT_OCR = [];
    Dr = [];
else
    [N60,N1] = NtoN1andN60(C1,HammerType,sigma_v);%%Put variable of HammerType
      handles.OCR_SPT= OCR_SPT_GUI(N60,sigma_v);
      [handles.FrictionAngle_Schmertamann,handles.FrictionAngle_Hatanaka,handles.FrictionAngle_PH_T] = FrictionAngle_SPT_GUI(N1,N60,sigma_v,C1,F1,K1);
      handles.Su_SPT= Su_SPT_GUI(C1,F1); % Check if F1 or F11
      handles.Su_SPT_OCR = SU_SPT_OCR_GUI(handles.OCR_SPT,sigma_v);
      [Dr] = Drvalue7(sigma_v,N60);
      
      
end    
        J11 = handles.OCR_SPT';
        J1 = ['unitless';num2cell(J11)];
        P11 = handles.FrictionAngle_Schmertamann';
        P1 = ['degrees';num2cell(P11)];
        Q11 = handles.Su_SPT;
        Q1 = ['tsf';num2cell(Q11')];
        R11 = handles.FrictionAngle_Hatanaka;
        R1 = ['degrees';num2cell(R11')];
        S11 = handles.FrictionAngle_PH_T;
        S1 = ['degrees';num2cell(S11')];
        U11 = handles.Su_SPT_OCR;
        U1 = ['tsf';num2cell(U11')];
        Dr1 = ['%';num2cell(Dr')];
        
    if isempty(sigma_v)
    sigma_v = ['psf';sigma_v];
    
    end
        
         handles.data_boring = [(A1)...
        (B1) (C1) ...
        (D1) ...
        (E1) ...
        (G1) (J1) (P1) (R1) S1 (Q1) U1 Dr1 (sigma_v) ]; 
    
    if isa(handles.ExplorationType{o}{1},'double')
    handles.BoringDataFigure(o) = figure('Name',num2str(handles.ExplorationType{o}{1}),'Units','inches','Position',[2 3 6 5]);    
    else
    handles.BoringDataFigure(o) = figure('Name',handles.ExplorationType{o}{1},'Units','inches','Position',[2 3 6 5]);
    end
%     handles.bg_boringunits(o) = uibuttongroup(handles.BoringDataFigure(o),...
%                   'Title','Units',...
%                   'Position', [.01 .1 .35 .7]);
%  handles.SI_Boring_RadioButton(o) = uicontrol(handles.bg_boringunits(o),'Style','radiobutton','String','SI','Position',[10 350 100 30]);
%   handles.IPS_Boring_RadioButton(o) = uicontrol(handles.bg_boringunits(o),'Style','radiobutton','String','IPS','Position',[20 350 100 30]);
    
    
    handles.cnames2 = {'Soil Elevation','Soil Depth','SPT Count','Blow Increment','Soil Layer Number' 'Predicted Unit Weight' 'Predicted OCR' 'Predicted Friction Angle-Schmertmann' 'Predicted Friction Angle-Hatanaka' 'Prediction Friction Angle-PH&T' 'Predicted Su' 'Predicted Su_OCR' 'Relative Density' 'Vertical Effective Stress'};
handles.boring_table = uitable(handles.BoringDataFigure(o),'Data',handles.data_boring,'ColumnName',handles.cnames2,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',({ [] [] [] [] [] [] [] [] [] [] [] [] [] []}),'ColumnEditable',[ false false false false false false false false false false false false false]);
        
        
    
    else continue
   end
   end
   
 %------------------------------------Generalized Pile Data upload---------
 
 for o1 = 1:length(handles.rb_gen)
     if get(handles.rb_gen(o1),'Value')==1
         
        A11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).Depth);
        B11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).USCSCode);
        C11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).PrimarySoilDesc);
        D11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).SecondarySoilDesc);
        E11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).LayerDesc);
        F11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).SPTNumber);
        G11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).SPTIncrement);
        H11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).Cohesion);
        I11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).FrictionAngle);
        J11 = (handles.Project_GeneralizedPile.(nestedStructure_GeneralizedPile{o1}).UnitWeight);
    handles.genPileDataFigure(o1) = figure('Name',handles.nestedStructure_GeneralizedPile{o1},'Units','inches','Position',[2 3 6 5]);
        handles.data_genPile = [A11 B11 C11 D11 E11 F11 G11 H11 I11 J11]; 
   handles.cnames6 = {'Depth','USCSCode','PrimarySoilDesc','SecondarySoilDesc','LayerDesc','SPTNumber','SPTIncrement','Cohesion','FrictionAngle','UnitWeight'}; 
  handles.genPile_table = uitable(handles.genPileDataFigure(o1),'Data',handles.data_genPile,'ColumnName',handles.cnames6,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',({[] [] [] [] [] [] [] [] [] [] []}),'ColumnEditable',[false false false false false false false false false false false]);      
     end
 end
 
 %----------------------------------------CPT Data Upload------------------
 % what if no GWT available
 
 for o2 = 1:length(handles.rb_CPT)
     
     if get(handles.rb_CPT(o2),'Value')==1
     [Project_assignedSoilCPT] = assignPrimarySoil_CPT_GUI(handles.Project_CPT);    
        A2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).Elevation);
        A2 = A2(~cellfun('isempty',A2));
        B2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).Depth);
        B2 = B2(~cellfun('isempty',B2));
        C2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).Qc);
        C2 = C2(~cellfun('isempty',C2));
        D2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).Fs);
        D2 = D2(~cellfun('isempty',D2));
        E2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).FrictionRatio);
        E2 = E2(~cellfun('isempty',E2));
        F2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).SoilBehaviorType);
        F2 = F2(~cellfun('isempty',F2));
        G2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).Cohesion);
        G2 = G2(1:size(A2));
        H2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).DepthToBottomLayer);
        H2 = H2(~cellfun('isempty',H2));
        I2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).USCScode);
        I2 = I2(~cellfun('isempty',I2));
        J2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).GenCohesion);
        J2 = J2(~cellfun('isempty',J2));
        K2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).qt);
        K2 = K2(~cellfun('isempty',K2));
        
        
        L2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).SPTBlowCount);
        L2 = L2(~cellfun('isempty',L2));
        M2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).GSW_ExtraData);
        N2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).GSW_ExtraData{2})-(handles.Project_CPT.(nestedStructure_CPT{o2}).GSW_ExtraData{12});
        P2 = (Project_assignedSoilCPT.(nestedStructure_CPT{o2}).SoilAssignment_Elevation);
        S2 = (handles.Project_CPT.(nestedStructure_CPT{o2}).qt);
        S2 = S2(~cellfun('isempty',S2));
   %---------------------------------------Estimations---------------------
   A22 = cell2mat(A2(2:end));
   
   C22 = cell2mat(C2(2:end));
   D22 = cell2mat(D2(2:end));
   E22 = cell2mat(E2(2:end));
   K22 = cell2mat(K2(2:end));
   L22 = cell2mat(L2(2:end));
   P22 = (P2);
   F22= F2(2:end);
   for i11 = 1:length(A2)
       if isempty(G2{i11})
           G2{i11} = 'data not reported';
       end
   end
%    G22 = cell2mat(G2(2:end));
   H22 = H2(2:end);
   I22 = cell2mat(I2(2:end)');
   J22 = cell2mat(J2(2:end));
   
   if isempty(N2)
     for r1  = 1:length(A22)
   N22 = N2;
   M22(r1) = M2{2};
   end
   else
   for r1  = 1:length(A22)
   N22(r1) = N2;
   M22(r1) = M2{2};
   end
   end
   
%   if isempty(K22)
  
   [UnitWeight_Predicted_CPT1,E2] = UnitWeight_CPT_GUI(E2,C2,K2,D2);
   
   UnitWeight_Predicted_CPT = ['pcf';num2cell(UnitWeight_Predicted_CPT1)];
%   end
 
  
  if (isempty(A22)&& isempty(C22))
     handles.data_CPT = cell(5,9); %%for empty CPT
  else
    [ CPT_sigma_v, ~, ~ ] = sigma_v_calc_CPT_GUI(A2, P22, N22', M22', UnitWeight_Predicted_CPT); % GWT not known// how to assign Soil Type
   
  
    
    if isempty(C22)&&isempty(K22)
   for z11 =1:length(UnitWeight_Predicted_CPT1)
    OCR_CPT{z11} = 'No Prediction Due To Lack of SPT Count';
    Su_CPT{z11} = 'No Prediction Due to Lack of OCR';
    
   end
  else
   
    OCR_CPT = OCR_CPT_GUI(C2,K2,CPT_sigma_v);
    Su_CPT=Su_CPT_GUI(OCR_CPT',CPT_sigma_v);
    [Dr_CPT] = Drvalue1(CPT_sigma_v,K2,C2);
    
    if length(K2)==1 && length(C2)>1 && length(CPT_sigma_v)>1
        [phi] = cptestimate(C2,CPT_sigma_v);
    elseif length(C2)==1 && length(K2)>1 && length(CPT_sigma_v)>1
    [phi]= cpt_frictionangle_GUI(K2,CPT_sigma_v);
    else
        phi = [];
    end
    end
    
    OCR_CPT_withunits = ['(-)';num2cell(OCR_CPT)];
    Su_CPT_withunits = ['pcf';num2cell(Su_CPT')];
    Dr_CPT_withunits = ['%';num2cell(Dr_CPT')];
    phi_withunits = ['(-)';num2cell(phi')];
%      phi1_withunits = ['(-)';num2cell(phi1')];
    
    if (length(C2)==1)
    for i7 = 2:length(UnitWeight_Predicted_CPT)
    
    C2{i7} = '-';
    
    end
    C2 = C2';
    end
    if (length(S2)==1)
        for i71 = 2:length(UnitWeight_Predicted_CPT)
            S2{i71,1}='-';
        end
    end
    if isempty(C22)
        for i10 = 1:length(A22)
            C2{i10+1,1} = 'No Data Available';
        end
    end
    if isempty(D22)
        for i10 = 1:length(A22)
            D2{i10+1,1} = 'No Data Available';
        end
    end
    if isempty(E22)
        for i10 = 1:length(A22)
            E2{i10+1,1} = 'No Data Available';
        end
    end
    
        for i10 = 1:length(A22)
            if isempty(G2{i10+1,1})
            G2{i10+1,1} = 'No Data Available';
            end
        end
    if isempty(F22)
        for i10 = 1:length(A22)
            F2{i10+1,1} = 'No Data Available';
        end
    end
    if isempty(UnitWeight_Predicted_CPT1)
        for i10 = 1:length(A22)
            UnitWeight_Predicted_CPT{i10+1,1} = 'No Data Available';
        end
    end
    if isempty(OCR_CPT)
        for i10 = 1:length(A22)
            OCR_CPT_withunits{i10+1,1} = 'No Data Available';
        end
    end
    if isempty(Su_CPT)
        for i10 = 1:length(A22)
            Su_CPT_withunits{i10+1,1} = 'No Data Available';
        end
    end
    if length(S2)==1
        for i10 = 1:length(A22)
            S2{i10+1,1} = 'No Data Available';
        end
    end
     if length(Dr_CPT_withunits)==1
        for i10 = 1:length(A22)
            Dr_CPT_withunits{i10+1,1} = 'No Data Available';
        end
     end
    if length(phi_withunits)==1
        for i10 = 1:length(A22)
            phi_withunits{i10+1,1} = 'No Data Available';
        end
    end
%      if length(phi1_withunits)==1
%         for i10 = 1:length(A22)
%             phi1_withunits{i10+1,1} = 'No Data Available';
%         end
%     end
     handles.data_CPT = [A2 C2 S2 D2 E2 F2 G2 (UnitWeight_Predicted_CPT) (OCR_CPT_withunits) (Su_CPT_withunits) (Dr_CPT_withunits) (phi_withunits) ];
    
  end
   %----------------------------------Table Set Up------------------------
    handles.CPTDataFigure(o2) = figure('Name',handles.nestedStructure_CPT{o2},'Units','inches','Position',[2 3 6 5]);
    
    
    
%         handles.data_CPT = [A22 C22 D22 E22 cell2mat(F22) G22 UnitWeight_Predicted_CPT' OCR_CPT']; 
   handles.cnames7 = {'Elevation','Qc','Qt','Fs','FrictionRation','SoilBehaviorType','Cohesion','Estimated Unit Weight','Estimated OCR','Estimated Su' 'Relative Density' 'Friction Angle'}; 
  handles.CPT_table = uitable(handles.CPTDataFigure(o2),'Data',handles.data_CPT,'ColumnName',handles.cnames7,'units','normalized','Position',[0.05 0.05 0.9 0.9],'ColumnFormat',({[] [] [] [] [] [] [] [] [] [] [] [] [] [] [] []}),'ColumnEditable',[false false false false false false false false false false false false false false false false]);      
     end
 end
 
 
 
   guidata(hObject,handles);


% --- Executes on button press in startPushButton.
function startPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to startPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
PileLayer_GUI;


% --- Executes on selection change in pileNameLb.
function pileNameLb_Callback(hObject, eventdata, handles)
% hObject    handle to pileNameLb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns pileNameLb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from pileNameLb
nestedStructure_Pile = fieldnames(handles.Project_Pile);
nestedStructure_STEEL = fieldnames(handles.Project_Steel);
nestedStructure_Load = fieldnames(handles.Project_Load);

sel_Index = get(hObject,'Value');

%--------------------------PUT the data on selection of Pile---------------

 %--------------------Get Boring Distance------------------------------
     
     for q1 = 21:39
     ExplorationDesignation{q1-20} = handles.Project_Pile.(nestedStructure_Pile{sel_Index}).ExplorationDesig_ExtraData{q1};
     ExplorationDistance{q1-20} = handles.Project_Pile.(nestedStructure_Pile{sel_Index}).EmbeddedLength_ExtraData{q1};
     
     
     end
    A1 = ExplorationDesignation;
    B1 = ExplorationDistance;
    
    
     
     
     
     handles.ExplorationDesignation1 = A1(~cellfun('isempty',A1));
     handles.ExplorationDistance1 = B1(~cellfun('isempty',B1));
      A = (handles.ExplorationDesignation1);
     B = (handles.ExplorationDistance1);
     %-------------------GSE GWE added to the Panel on the right-----------
     
     handles.GSE = handles.Project_Pile.(nestedStructure_Pile{sel_Index}).GroundSurface_ExtraData{12};
     handles.PileTipElevation = handles.Project_Pile.(nestedStructure_Pile{sel_Index}).EmbeddedLength_ExtraData{4};
     handles.WallThickness = handles.Project_Steel.(nestedStructure_STEEL{sel_Index}).WallThickness;
     handles.OuterDiameter = handles.Project_Steel.(nestedStructure_STEEL{sel_Index}).OuterDiameter;
     handles.GWE = handles.Project_Load.(nestedStructure_Load{sel_Index}).GSE_ExtraData(3);
     
     %---------------------------------------------------------------------
        handles.Pile_ExtraData = [A' B'];
        handles.Pile_ExtraData1 = {handles.GSE; handles.PileTipElevation ;handles.WallThickness ;handles.OuterDiameter; handles.GWE};
           
     %------------------------Add UITABLE for the Extra Data---------------
     handles.cnames4 = {'Exploration Designation','Distance(feet)'};
     set(handles.ExplorationDesigTable,'Data',handles.Pile_ExtraData,'ColumnName',handles.cnames4,'units','normalized','Position',[0.05 0.5 0.9 0.2],'ColumnFormat',{[] [] [] []});
     handles.cnames5 = {'GSE(feet)' 'PTE(feet)' 'Wall Thickness(inches)' 'Outer Diameter(inches)' 'GWE(feet)'};
    set(handles.GSE_ExtraTable,'Data',handles.Pile_ExtraData1,'RowName',handles.cnames5,'units','normalized','Position',[0.05 0.7 0.9 0.2],'ColumnFormat',{[] [] [] []});
    




% --- Executes during object creation, after setting all properties.
function pileNameLb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pileNameLb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
