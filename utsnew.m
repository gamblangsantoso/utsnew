function varargout = utsnew(varargin)
% UTSNEW MATLAB code for utsnew.fig
%      UTSNEW, by itself, creates a new UTSNEW or raises the existing
%      singleton*.
%
%      H = UTSNEW returns the handle to a new UTSNEW or the handle to
%      the existing singleton*.
%
%      UTSNEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UTSNEW.M with the given input arguments.
%
%      UTSNEW('Property','Value',...) creates a new UTSNEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before utsnew_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to utsnew_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help utsnew

% Last Modified by GUIDE v2.5 02-May-2021 07:04:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @utsnew_OpeningFcn, ...
                   'gui_OutputFcn',  @utsnew_OutputFcn, ...
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


% --- Executes just before utsnew is made visible.
function utsnew_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to utsnew (see VARARGIN)

% Choose default command line output for utsnew
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% buat axes
ah = axes('unit', 'normalized', 'position', [0 0 1 1]);
% import background
bg = imread('background3.jpg'); imagesc(bg);
%matikan axes dan tampilkan background
set(ah, 'handlevisibility', 'off', 'visible', 'off') 

% UIWAIT makes utsnew wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = utsnew_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama_file,nama_path] = uigetfile({'*.jpg';'*.bmp';'*.png';'*.tif';'.jpeg'},....
    'Pilih Gambar');

if ~isequal (nama_file,0)
    Img=imread(fullfile(nama_path,nama_file));
    axes(handles.axes1)
    imshow(Img);
    title('Citra RGB');
    R = Img(:,:,1);
    G = Img(:,:,2);
    B = Img(:,:,3);
else
    return
end
handles.Img=Img;
handles.R=R;
handles.G=G;
handles.B=B;
guidata(hObject, handles) 


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
set(handles.radiobutton2,'Value',1)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',0)

R=handles.R;
G=handles.G;
B=handles.B;
axes(handles.axes2)
Red=cat(3,R,G*0,B*0);
imshow(Red)
title('Merah')

axes(handles.axes3)
h=histogram(B,256);
h.FaceColor='r';
h.EdgeColor='r';
xlim([0,255])
grid off
title('Histogram')

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',1)
set(handles.radiobutton4,'Value',0)

R=handles.R;
G=handles.G;
B=handles.B;
axes(handles.axes2)
Hijau=cat(3,R*0,G,B*0);
imshow(Hijau)
title('Hijau')

axes(handles.axes3)
h=histogram(G,256);
h.FaceColor='g';
h.EdgeColor='g';
xlim([0,255])
grid off
title('Histogram')

% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4
set(handles.radiobutton2,'Value',0)
set(handles.radiobutton3,'Value',0)
set(handles.radiobutton4,'Value',1)

R=handles.R;
G=handles.G;
B=handles.B;

axes(handles.axes2)
Biru=cat(3,R*0,G*0,B);
imshow(Biru)
title('Biru')

axes(handles.axes3)
h=histogram(B,256);
h.FaceColor='b';
h.EdgeColor='b';
xlim([0,255])
grid off
title('Histogram')
