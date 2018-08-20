function varargout = face_detection(varargin)
% FACE_DETECTION MATLAB code for face_detection.fig
%      FACE_DETECTION, by itself, creates a new FACE_DETECTION or raises the existing
%      singleton*.
%
%      H = FACE_DETECTION returns the handle to a new FACE_DETECTION or the handle to
%      the existing singleton*.
%
%      FACE_DETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACE_DETECTION.M with the given input arguments.
%
%      FACE_DETECTION('Property','Value',...) creates a new FACE_DETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before face_detection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to face_detection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help face_detection

% Last Modified by GUIDE v2.5 28-Jan-2016 14:01:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @face_detection_OpeningFcn, ...
                   'gui_OutputFcn',  @face_detection_OutputFcn, ...
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


% --- Executes just before face_detection is made visible.
function face_detection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to face_detection (see VARARGIN)

% Choose default command line output for face_detection
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes face_detection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = face_detection_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
global img_set;
global pn_db;
[fn,pn_db,fi]=uigetfile('*.mat','选择图片样本集');
img_set=[pn_db fn];
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
global I;
[fn,pn,fi]=uigetfile('*.jpg','选择图片');
I=imread([pn fn]);
axes(handles.axes3);
axes3=I;
imshow(axes3);title('目标图片');%显示在坐标系中
%srcfolder=uigetfile();
%I=imread(srcfolder);
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%%对比 开始检测
global img_set;
global I;
global pn_db;
S=load(img_set);
temp=S;%保存新的排序结果
[~,num]=size(S.lbp_fea);
%imsize=[100 100];
%patchsize=[20 20];
    m=100;
    n=100;
    s=20;
    t=20;
    lbp_hist=hist_lbp(I,m,n,s,t);
    lbp_hist=lbp_hist/(20*20);
    temp.lbp_fea=[];
    for i=1:num
        S_c=S.lbp_fea(:,i);
        td=distent_3(S_c,lbp_hist); %第三种
        temp.lbp_fea=[temp.lbp_fea,td];
    end
    [y,d]=sort(temp.lbp_fea);
    answer=d(1,1);
    set(handles.edit1,'string',num2str(answer(1)));%将结果输出到文本框
img_ans=imread(cell2mat(S.fullname(answer)));%[pn_db S.lable(num2str(answer(1)))]
axes(handles.axes5);
axes5=img_ans;
imshow(axes5);title('图片集中的图片');%显示在坐标系中
    
    % %比对正确率
% right=0;
% for i=1:file_number
%     if my_answer(i)==S.number_lable(i)
%         right=right+1;
%     end
% end
% E=right/file_number;
% fprintf('识别率为：%f',E);
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


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


% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 
