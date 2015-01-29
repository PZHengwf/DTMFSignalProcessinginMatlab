%���ߣ��³�
%ѧ�ţ�10213053

%**********************MATLAB����DTMF�źŵ����������**************************
%����һ����GUIDE�����Զ�����ͼ�ν���Ļ����������д���ܺ����γɵ�.m�ļ�
%�ļ��������Ӧ��.fig�ļ�һ������

%*************ǰ��������Ϊ�Զ��ɹ�����ͼ�ν���ĺ������Ա�д�Ĺ��ܺ����ں���**************


function varargout = DTMF(varargin)
% DTMF MATLAB code for DTMF.fig
%      DTMF, by itself, creates a new DTMF or raises the existing
%      singleton*.
%
%      H = DTMF returns the handle to a new DTMF or the handle to
%      the existing singleton*.
%
%      DTMF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DTMF.M with the given input arguments.
%
%      DTMF('Property','Value',...) creates a new DTMF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DTMF_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DTMF_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DTMF

% Last Modified by GUIDE v2.5 14-May-2013 20:33:28

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DTMF_OpeningFcn, ...
                   'gui_OutputFcn',  @DTMF_OutputFcn, ...
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


% --- Executes just before DTMF is made visible.
function DTMF_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DTMF (see VARARGIN)

% Choose default command line output for DTMF
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DTMF wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DTMF_OutputFcn(~, ~, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, ~, ~)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
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



%*******************************************************************************
%*******************************************************************************
%*******************************************************************************
%*********************���Ϻ���ΪGUIDE�Զ����ɵĹ���ͼ�ν���ĺ���******************
%*******************************************************************************
%*********************���º���Ϊ�Լ��༭����**************************************
%*******************************************************************************
%*******************************************************************************
%*******************************************************************************



%********************************��ʾһ���ַ��Ĳ���*********************************************
%����ť�����£�������ȡ��ť��Ϣ����edit1��ʾ����׷���ַ�������ʾ���ַ���Ӧ�Ĳ���ͼ��Ƶ��ͼ��
% --- Executes on button press in pushbutton1.
function pushbutton_Callback(hObject, ~, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.edit2,'Visible','off');

%�����ʾ
set(handles.edit1,'String',strcat(get(handles.edit1,'String'),get(hObject,'String')));

%�����ź�����
[a,b]=generate(get(hObject,'String'));

%��ʾǰ0.05s�Ĳ���
axes(handles.axes1);
plot(b,a);
axis([0,0.05,-2,2]);grid

%fft�任
y=fft(a,512); %ֻ��400���㣬��0��512���FFT��
mag=abs(y);
f=[1:512]*8000/512;

%��ʾƵ���ź�
axes(handles.axes2);
stem(f,mag);
axis([500,2000,0,200]);grid

%����
p=audioplayer(a,8000);
play(p);
pause(0.5);



%*******************************�����Ļ*************************************
% --- Executes on button press in pushbutton17.
function clc_Callback(~, ~, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.edit1,'String','');
cla(handles.axes1);
cla(handles.axes2);
set(handles.edit2,'Visible','off');


%****************************��ʾ�����绰���봮�Ĳ���****************************************
% --- Executes on button press in pushbutton18.
function gs_Callback(~, ~, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%��ȡ�������� 
list=get(handles.edit1,'String');

%ÿ���źų���0.05s������400����
%ÿ���źź����һ�ο��źţ�Ҳ��0.05s��400���㡣
%�����������ݳ���Ϊ400*2*�绰���볤�ȡ� 
stream=zeros(1,length(list)*400*2);     %Ԥ���������С�

for i=1:length(list)                 %����ÿ�����ź��룬�����²���
   [a,~]=generate(list(i));         %������ɢ�ź�
    for j=1:400                       %�Ȱ�һ�����ŵ����д��ȥ
       stream(j+(i-1)*2*400)=a(j);
    end
    [a,~]=generate('gap'); 
    for j=1:400                       %�ٰѼ���Ŀ��ź����д��ȥ
       stream(j+(i-1)*2*400+400)=a(j);
    end
end
t=(1:length(list)*400*2)/8000;        %�źŵĺ����ꡪ��ʱ��

%��ʱ���ź�ͼ��ӡ��axes1��
axes(handles.axes1);
plot(t,stream);

%����fft
y=fft(stream,length(list)*400*2);
mag=abs(y);
f=[1:length(list)*400*2]*8000/(length(list)*400*2);

%��Ƶ���źŴ�ӡ��axes2��
axes(handles.axes2);
plot(f,mag);
axis([500,1800,0,ceil(max(mag)/200)*200]);grid %ֻ��ʾ�ض���Ƶ��

%����������Ϊwav�ļ�
wavwrite(stream,8000,'Dial.wav');

%��ʾ��ʾ����ɹ�
set(handles.edit2,'String','Signal stored in Dial.wav');
set(handles.edit2,'Visible','on');
pause(1.5);
set(handles.edit2,'Visible','off');



%*******************************����һ���ַ��Ĳ���********************************************
%��������String��ʽ�İ�ť��ʾ��������Ӧ����ɢ�źź���ɢʱ�����С�
%���ص��ǲ���Ƶ��Ϊ8kHz������ʱ��Ϊ500ms����ɢ�źš�
function [a,b] = generate(text)
  Fs=8000;            %����Ƶ��Ϊ8kHz�� ����������Ϊ1/8000s��
  t=(1:400)/Fs;      %�źų���ʱ��Ϊ50ms������400���㡣
  pit=2*pi*t;         %����
  
  %���ݲ�ͬ�İ�����ȷ����ͬ�ĸߡ���Ƶ�ʡ�
  if(strcmp(text,'1'))
    fl=697;
    fh=1209;
  elseif (strcmp(text,'2'))
    fl=697;
    fh=1336;
  elseif (strcmp(text,'3'))
    fl=697;
    fh=1477;  
  elseif (strcmp(text,'4'))
    fl=770;
    fh=1209;  
  elseif (strcmp(text,'5'))
    fl=770;
    fh=1336;
  elseif (strcmp(text,'6'))
    fl=770;
    fh=1477;  
  elseif (strcmp(text,'7'))
    fl=852;
    fh=1209;  
  elseif (strcmp(text,'8'))
    fl=852;
    fh=1336;
  elseif (strcmp(text,'9'))
    fl=852;
    fh=1477;  
  elseif (strcmp(text,'0'))
    fl=941;
    fh=1336;
   elseif (strcmp(text,'*'))
    fl=941;
    fh=1209;  
  elseif (strcmp(text,'#'))
    fl=941;
    fh=1477;
  elseif (strcmp(text,'A'))
    fl=697;
    fh=1633; 
  elseif (strcmp(text,'B'))
    fl=770;
    fh=1633;
  elseif (strcmp(text,'C'))
    fl=852;
    fh=1633;
  elseif (strcmp(text,'D'))
    fl=941;
    fh=1633;
  elseif(strcmp(text,'gap'))
    fl=0;
    fh=0;
  end
  
  %���ɲ���
  y=sin(fl*pit);
  x=sin(fh*pit);
  a=x+y;
  b=t;



%************************************�����ļ�*****************************************
%������ȡ��Ƶ�ļ������벢��ʾ��ʱ��Ƶ������绰���롣
% --- Executes on button press in pushbutton19.
function decode_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
%��ȡ��Ƶ�ļ�
[y,fs,nbits]=wavread(get(handles.edit3,'String'));

%��Ƶ��ʱ������
 t=[1:length(y)]/fs;
 
%��ӡʱ���ź�
 axes(handles.axes1);
 plot(t,y);
 axis([0,length(y)/fs,-1.5,1.5]);grid;

 %fft�任
 a=fft(y,length(y));
 mag=abs(a);
 f=[1:length(y)]*8000/(length(y));
 
 %��ӡƵ���ź�
 axes(handles.axes2);
 plot(f,mag);
 axis([500,1800,0,ceil(max(mag)/200)*200]);grid;
 
 
 %#####���¶���Ƶ���н���#####
 
 n=length(y)/800;
 r=zeros(4*n,64);
 c=zeros(54*n,64);
 for s=1:4*n
     R=y((200*(s-1)+1):(200*s));
   
     g=fft(R,256);
     c(s,:)=abs(g(1:64));
     r(s,:)=c(s,:);
     z=find(c(s,:)<50); %************************************��ֵ��λ50
  
     c(s,z)=zeros(size(z));
 end
 sm=[31 44;23 40;23 44;23 48;26 40;26 44;26 48;28 40;28 44;28 48;23 53;26 53;28 53;31 53;31 40;31 48];
 for i3=1:4*n
    b=nnz(c(i3,:));
    if b==2
        q1=find(c(i3,:));
        for i4=1:16     
            if q1==sm(i4,:)
                AN(i3)=i4-1;
                break;
            end
        end
    else 
        AN(i3)=NaN;
    end
 end
 
 %���ɵ������У�ÿ��λ�����У�ǰ��λΪ��ͬ�ĺ��룬����λΪ�պ��롣���ֻҪ��ȡһ���С�
 for i7=1:length(AN)/4
     switch(AN((i7-1)*4+1))
         case 1
             str(i7)='1';
         case 2
             str(i7)='2';            
         case 3
             str(i7)='3';            
         case 4
             str(i7)='4';
         case 5
             str(i7)='5';
         case 6
             str(i7)='6';
         case 7
             str(i7)='7';
         case 8
             str(i7)='8';
         case 9
             str(i7)='9';
         case 0
             str(i7)='0';
         case 10
             str(i7)='A';
         case 11
             str(i7)='B';
         case 12
             str(i7)='C';
         case 13
             str(i7)='D';
         case 14
             str(i7)='*';
         case 15
             str(i7)='#';
         otherwise
             str(i7)='X';
     end
 end
 
 %��ʾ��ʾ������ĺ���
 set(handles.edit2,'String','The number is:');
 set(handles.edit2,'Visible','on');
 set(handles.edit1,'String',str);
 
 %����
 wavplay(y,8000);
