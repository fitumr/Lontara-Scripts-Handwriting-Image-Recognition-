function varargout = Pengenalan_Lontara2(varargin)
% PENGENALAN_BISINDO2 MATLAB code for Pengenalan_Bisindo2.fig
%      PENGENALAN_BISINDO2, by itself, creates a new PENGENALAN_BISINDO2 or raises the existing

%      H = PENGENALAN_BISINDO2 returns the handle to a new PENGENALAN_BISINDO2 or the handle to
%      the existing singleton*.
%
%      PENGENALAN_BISINDO2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PENGENALAN_BISINDO2.M with the given input arguments.
%
%      PENGENALAN_BISINDO2('Property','Value',...) creates a new PENGENALAN_BISINDO2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pengenalan_Bisindo2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pengenalan_Bisindo2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pengenalan_Bisindo2

% Last Modified by GUIDE v2.5 06-Sep-2020 21:34:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pengenalan_Bisindo2_OpeningFcn, ...
                   'gui_OutputFcn',  @Pengenalan_Bisindo2_OutputFcn, ...
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


% --- Executes just before Pengenalan_Lontara2 is made visible.
function Pengenalan_Lontara2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pengenalan_Bisindo2 (see VARARGIN)

% Choose default command line output for Pengenalan_Bisindo2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Pengenalan_Bisindo2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pengenalan_Bisindo2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- INPUT CITRA
function pushbutton3_Callback(hObject, eventdata, handles)
global citra next;
next=0;
 [name_file,name_path] = uigetfile(...
     {'*.jpg;**.png','Files of type (*.jpg*.png)';
     '*.jpg','File Jpeg (*.jpg)'},'Open Image');
 
if ~isequal (name_file,0)
    handles.gambar = imread(fullfile(name_path ,name_file));
    guidata(hObject,handles);
    citra = handles.gambar;
    axes(handles.axes1);
    imshow(citra);
else
    return
end

% --- BUTTON PRE PROCESSING
function pushbutton2_Callback(hObject, eventdata, handles)
global citra gray comp clos;

% UNTUK CITRA GRAYSCALE
  gray = rgb2gray(citra);
  axes(handles.axes2);
  imshow(gray);

% UNTUK CITRA BINER
  biner = im2bw(gray,0.8); 
  comp = not(biner);

% OPERASI CLOSING
  CL = ones(5); 
  clos = closing(comp,CL);   
  axes(handles.axes3);
  imshow(clos);
  
% C = size (clos);
% disp(C);

% --- POPUP MENU KOEFISIEN.
function popupmenu1_Callback(hObject, eventdata, handles)
opsi = get(handles.popupmenu1, 'value');
global koefisien next Hasil;
switch opsi
    case 2
        koefisien=2;
        next=1;
        disp(koefisien);
        load dbkoefisien2;
    case 3
        koefisien=5;
        next=1;
        disp(koefisien);
        load dbkoefisien5;
    case 4
        koefisien=10;
        next=1;
        disp(koefisien);
        load dbkoefisien10;
    case 5
        koefisien=25;
        next=1;
        disp(koefisien);
        load dbkoefisien25;
    case 6
        koefisien=50;
        next=1;
        disp(koefisien);
        load dbkoefisien50
    otherwise
        
        
end
handles.koefisien=koefisien;
guidata(hObject, handles);

% --- EKSTRAKSI CIRI DESKRIPTOR FOURIER
function pushbutton1_Callback(hObject, eventdata, handles)
global clos Norm koefisien next;
if next==0
    axes(handles.axes4);
    plot(0);
    Allert2;
else
Kontur = deteksiKontur(clos);
DF = perolehDF (Kontur);
Fitur = fiturFourier(DF, koefisien);
Norm = normalisasiDF (Fitur);
axes(handles.axes4);
bar(Norm);


disp('Normalisasi Citra Uji : ');
disp(Norm);
end

% --- JARAK EUCLIDEAN
function pushbutton5_Callback(hObject, eventdata, handles)
global Norm Hasil minz;
z(1) = jarakEuclidean (Norm,Hasil{1});
z(2) = jarakEuclidean (Norm,Hasil{2});
z(3) = jarakEuclidean (Norm,Hasil{3});
z(4) = jarakEuclidean (Norm,Hasil{4});
z(5) = jarakEuclidean (Norm,Hasil{5});
z(6) = jarakEuclidean (Norm,Hasil{6});
z(7) = jarakEuclidean (Norm,Hasil{7});
z(8) = jarakEuclidean (Norm,Hasil{8});
z(9) = jarakEuclidean (Norm,Hasil{9});
z(10) = jarakEuclidean (Norm,Hasil{10});
z(11) = jarakEuclidean (Norm,Hasil{11});
z(12) = jarakEuclidean (Norm,Hasil{12});
z(13) = jarakEuclidean (Norm,Hasil{13});
z(14) = jarakEuclidean (Norm,Hasil{14});
z(15) = jarakEuclidean (Norm,Hasil{15});
z(16) = jarakEuclidean (Norm,Hasil{16});
z(17) = jarakEuclidean (Norm,Hasil{17});
z(18) = jarakEuclidean (Norm,Hasil{18});
z(19) = jarakEuclidean (Norm,Hasil{19});
z(20) = jarakEuclidean (Norm,Hasil{20});
z(21) = jarakEuclidean (Norm,Hasil{21});
z(22) = jarakEuclidean (Norm,Hasil{22});
z(23) = jarakEuclidean (Norm,Hasil{23});
z(24) = jarakEuclidean (Norm,Hasil{24});
z(25) = jarakEuclidean (Norm,Hasil{25});
z(26) = jarakEuclidean (Norm,Hasil{26});
minz = min(z);

% --- OUTPUT JARAK EUCLIDEAN
if (minz == z(1))
    hasilX = 'A';
elseif (minz == z(2))
    hasilX = 'B';
elseif (minz == z(3))
    hasilX = 'C';
elseif (minz == z(4))
    hasilX = 'D';
elseif (minz == z(5))
    hasilX = 'E';
elseif (minz == z(6))
    hasilX = 'F';
elseif (minz == z(7))
    hasilX = 'G';
elseif (minz == z(8))
    hasilX = 'H';
elseif (minz == z(9))
    hasilX = 'I';
elseif (minz == z(10))
    hasilX = 'J';
elseif (minz == z(11))
    hasilX = 'K';
elseif (minz == z(12))
    hasilX = 'L';
elseif (minz == z(13))
    hasilX = 'M';
elseif (minz == z(14))
    hasilX = 'N';
elseif (minz == z(15))
    hasilX = 'O';
elseif (minz == z(16))
    hasilX = 'P';
elseif (minz == z(17))
    hasilX = 'Q';
elseif (minz == z(18))
    hasilX = 'R';
elseif (minz == z(19))
    hasilX = 'S';
elseif (minz == z(20))
    hasilX = 'T';
elseif (minz == z(21))
    hasilX = 'U';
elseif (minz == z(22))
    hasilX = 'V';
elseif (minz == z(23))
    hasilX = 'W';
elseif (minz == z(24))
    hasilX = 'X';
elseif (minz == z(25))
    hasilX = 'Y';
elseif (minz == z(26))
    hasilX = 'Z';
end
Ee = 'Euclidean Distance';
disp(Ee);
disp(minz);
set(handles.text5,'string',hasilX);

% --- MANHATTAN DISTANCE
function pushbutton4_Callback(hObject, eventdata, handles)
global Norm  Hasil minz;
y(1) = jarakManhattan (Norm,Hasil{1});
y(2) = jarakManhattan (Norm,Hasil{2});
y(3) = jarakManhattan (Norm,Hasil{3});
y(4) = jarakManhattan (Norm,Hasil{4});
y(5) = jarakManhattan (Norm,Hasil{5});
y(6) = jarakManhattan (Norm,Hasil{6});
y(7) = jarakManhattan (Norm,Hasil{7});
y(8) = jarakManhattan (Norm,Hasil{8});
y(9) = jarakManhattan (Norm,Hasil{9});
y(10) = jarakManhattan (Norm,Hasil{10});
y(11) = jarakManhattan (Norm,Hasil{11});
y(12) = jarakManhattan (Norm,Hasil{12});
y(13) = jarakManhattan (Norm,Hasil{13});
y(14) = jarakManhattan (Norm,Hasil{14});
y(15) = jarakManhattan (Norm,Hasil{15});
y(16) = jarakManhattan (Norm,Hasil{16});
y(17) = jarakManhattan (Norm,Hasil{17});
y(18) = jarakManhattan (Norm,Hasil{18});
y(19) = jarakManhattan (Norm,Hasil{19});
y(20) = jarakManhattan (Norm,Hasil{20});
y(21) = jarakManhattan (Norm,Hasil{21});
y(22) = jarakManhattan (Norm,Hasil{22});
y(23) = jarakManhattan (Norm,Hasil{23});
y(24) = jarakManhattan (Norm,Hasil{24});
y(25) = jarakManhattan (Norm,Hasil{25});
y(26) = jarakManhattan (Norm,Hasil{26});
miny = min(y);

% --- OUTPUT JARAK MANHATTAN
if (miny == y(1))
    hasilY = 'A';
elseif (miny == y(2))
    hasilY = 'B';
elseif (miny == y(3))
    hasilY = 'C';
elseif (miny == y(4))
    hasilY = 'D';
elseif (miny == y(5))
    hasilY = 'E';
elseif (miny == y(6))
    hasilY = 'F';
elseif (miny == y(7))
    hasilY = 'G';
elseif (miny == y(8))
    hasilY = 'H';
elseif (miny == y(9))
    hasilY = 'I';
elseif (miny == y(10))
    hasilY = 'J';
elseif (miny == y(11))
    hasilY = 'K';
elseif (miny == y(12))
    hasilY = 'L';
elseif (miny == y(13))
    hasilY = 'M';
elseif (miny == y(14))
    hasilY = 'N';
elseif (miny == y(15))
    hasilY = 'O';
elseif (miny == y(16))
    hasilY = 'P';
elseif (miny == y(17))
    hasilY = 'Q';
elseif (miny == y(18))
    hasilY = 'R';
elseif (miny == y(19))
    hasilY = 'S';
elseif (miny == y(20))
    hasilY = 'T';
elseif (miny == y(21))
    hasilY = 'U';
elseif (miny == y(22))
    hasilY = 'V';
elseif (miny == y(23))
    hasilY = 'W';
elseif (miny == y(24))
    hasilY = 'X';
elseif (miny == y(25))
    hasilY = 'Y';
elseif (miny == y(26))
    hasilY = 'Z';
end

set(handles.text8,'string',hasilY);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


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


% --- Executes during object creation, after setting all properties.
function text15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
