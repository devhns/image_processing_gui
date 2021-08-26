function varargout = final_proje(varargin)
% FINAL_PROJE MATLAB code for final_proje.fig
%      FINAL_PROJE, by itself, creates a new FINAL_PROJE or raises the existing
%      singleton*.
%
%      H = FINAL_PROJE returns the handle to a new FINAL_PROJE or the handle to
%      the existing singleton*.
%
%      FINAL_PROJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINAL_PROJE.M with the given input arguments.
%
%      FINAL_PROJE('Property','Value',...) creates a new FINAL_PROJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before final_proje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to final_proje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help final_proje

% Last Modified by GUIDE v2.5 06-Jun-2021 13:52:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @final_proje_OpeningFcn, ...
                   'gui_OutputFcn',  @final_proje_OutputFcn, ...
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


% --- Executes just before final_proje is made visible.
function final_proje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to final_proje (see VARARGIN)

% Choose default command line output for final_proje
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes final_proje wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = final_proje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in histogram.
function histogram_Callback(hObject, eventdata, handles)
a=handles.img;
axes(handles.grafik);
imhist(a);


% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
[file path]=uigetfile({'*.jpg';'*.bmp';'*.jpeg';'*.png'}, 'Belirtilen formatlardan dosya yükleme');
image=[path file];
handles.file=image;
if (file==0)
    warndlg('Dosya seçilemedi!') ; 
end
 [fpath, fname, fext]=fileparts(file);
 validex=({'.bmp','.jpg','.jpeg','.png'});
 found=0;
 for (x=1:length(validex))
 if (strcmpi(fext,validex{x}))
     found=1;


handles.img=imread(image);
handles.i=imread(image);
h = waitbar(0,'Yükleniyor...');
steps = 100;
for step = 1:steps
    waitbar(step / steps)
end
close(h) 
 axes(handles.g1); cla; imshow(handles.img);
 axes(handles.g2); cla; imshow(handles.img);
 axes(handles.grafik);
 imhist(handles.img);

 guidata(hObject,handles);
break; 
 end
 end
if (found==0)
     errordlg('Görüntü uygun formatta deðil. Lütfen uygun formatta bir görüntü seçin! [ .jpg, .jpeg, .bmp, .png] ','Dosya Format Hatasý');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
handles.img=handles.i;
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
[file path]= uiputfile('*.jpg','Save Image as');
save=[path file]; imwrite(handles.img,save,'jpg');


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
close all;

% --- Executes on button press in rgb_gray.
function rgb_gray_Callback(hObject, eventdata, handles)
handles.img = rgb2gray(handles.img);
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in rgb_binary.
function rgb_binary_Callback(hObject, eventdata, handles)
handles.img = im2bw(handles.img);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);


% --- Executes on button press in hist_esit.
function hist_esit_Callback(hObject, eventdata, handles)
a=handles.img;
a=histeq(a);
axes(handles.grafik);
imhist(a);
handles.img = histeq(handles.img);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in hist_genis.
function hist_genis_Callback(hObject, eventdata, handles)
b=handles.img;
b=imadjust(b,[.5 .4 .1;.6 .7 .2],[]);
axes(handles.grafik);
imhist(b);
handles.img = b;
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in gauss_gurultu.
function gauss_gurultu_Callback(hObject, eventdata, handles)
handles.img = imnoise(handles.img,'gaussian');
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in poisson_gurultu.
function poisson_gurultu_Callback(hObject, eventdata, handles)
handles.img = imnoise(handles.img,'poisson');
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in tuzbiber_gurultu.
function tuzbiber_gurultu_Callback(hObject, eventdata, handles)
handles.img = imnoise(handles.img,'salt & pepper',0.1);
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);


% --- Executes on button press in benek_gurultu.
function benek_gurultu_Callback(hObject, eventdata, handles)
handles.img = imnoise(handles.img,'speckle');
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in f1.
function f1_Callback(hObject, eventdata, handles)
h=fspecial('average');
handles.img=imfilter(handles.img,h,'replicate');
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in f3.
function f3_Callback(hObject, eventdata, handles)
r=medfilt2(handles.img(:,:,1)); g=medfilt2(handles.img(:,:,2)); b=medfilt2(handles.img(:,:,3)); 
handles.img=cat(3,r,g,b);
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on button press in asinma.
function asinma_Callback(hObject, eventdata, handles)
bw = handles.img;
s = strel('disk',2);
handles.img = imerode(bw,s);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in genlesme.
function genlesme_Callback(hObject, eventdata, handles)
bw = handles.img;
s = strel('disk',2);
handles.img = imdilate(bw,s);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);


% --- Executes on button press in acma.
function acma_Callback(hObject, eventdata, handles)
bin = handles.img;
ss = strel('disk',2);
handles.img = imopen(bin,ss);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in kapama.
function kapama_Callback(hObject, eventdata, handles)
bin = handles.img;
ss = strel('disk',2);
handles.img = imclose(bin,ss);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in basit_esik.
function basit_esik_Callback(hObject, eventdata, handles)
I=handles.img;
handles.img=im2bw(I,0.55);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in otsu_esik.
function otsu_esik_Callback(hObject, eventdata, handles)
I=handles.img;
I=rgb2gray(I);
T = graythresh(I);
handles.img = imbinarize(I,T);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in uyarla_esik.
function uyarla_esik_Callback(hObject, eventdata, handles)
I=handles.img;
I=rgb2gray(I);
T = adaptthresh(I, 0.4);
handles.img = imbinarize(I,T);
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in sobel_kenar.
function sobel_kenar_Callback(hObject, eventdata, handles)
handles.img = rgb2gray(handles.img);
handles.img = edge(handles.img,"sobel");
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in prewitt_kenar.
function prewitt_kenar_Callback(hObject, eventdata, handles)
handles.img = rgb2gray(handles.img);
handles.img = edge(handles.img,"prewitt");
axes(handles.g2); cla; imshow(handles.img);
guidata(hObject,handles);

% --- Executes on button press in k_means.
function k_means_Callback(hObject, eventdata, handles)
I=handles.img;
[L,C] = imsegkmeans(I,10);
J=label2rgb(L,im2double(C));
handles.img=J;
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

% --- Executes on selection change in rgb_kanal.
function rgb_kanal_Callback(hObject, eventdata, handles)
handles.kanal=handles.img;
val=get(hObject,'Value');
switch val
    case 1
        helpdlg('Lütfen bir renk kanalý seçin.');
    case 2
        handles.kanal(:,:,2)=0;
        handles.kanal(:,:,3)=0;
        axes(handles.g2); cla; imshow(handles.kanal);
        handles.img=handles.kanal;
        axes(handles.grafik);
        imhist(handles.img);
        guidata(hObject,handles); 
    case 3
        handles.kanal(:,:,1)=0;
        handles.kanal(:,:,3)=0;
        axes(handles.g2); cla; imshow(handles.kanal);
        handles.img=handles.kanal;
        axes(handles.grafik);
        imhist(handles.img);
        guidata(hObject,handles); 
    case 4
        handles.kanal(:,:,1)=0;
        handles.kanal(:,:,2)=0;
        axes(handles.g2); cla; imshow(handles.kanal);
        handles.img=handles.kanal;
        axes(handles.grafik);
        imhist(handles.img);
        guidata(hObject,handles);  
end

% --- Executes during object creation, after setting all properties.
function rgb_kanal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rgb_kanal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white g1 on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in giris_info.
function giris_info_Callback(hObject, eventdata, handles)
h = waitbar(0,'Yükleniyor');
steps = 100;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
imageinfo(handles.file);

% --- Executes on button press in cikis_info.
function cikis_info_Callback(hObject, eventdata, handles)
h = waitbar(0,'Yükleniyor...');
steps = 100;
for step = 1:steps
    % computations take place here
    waitbar(step / steps)
end
close(h) 
imageinfo(handles.g2);


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gaussian_filt.
function gaussian_filt_Callback(hObject, eventdata, handles)
hsize=[4 4]; sigma=1.2;
h=fspecial('gaussian',hsize,sigma);
handles.img=imfilter(handles.img,h,'replicate');
axes(handles.g2); cla; imshow(handles.img);
axes(handles.grafik);
imhist(handles.img);
guidata(hObject,handles);

