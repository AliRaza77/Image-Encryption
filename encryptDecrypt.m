function varargout = encryptDecrypt(varargin)
% ENCRYPTDECRYPT MATLAB code for encryptDecrypt.fig
%      ENCRYPTDECRYPT, by itself, creates a new ENCRYPTDECRYPT or raises the existing
%      singleton*.
%
%      H = ENCRYPTDECRYPT returns the handle to a new ENCRYPTDECRYPT or the handle to
%      the existing singleton*.
%
%      ENCRYPTDECRYPT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ENCRYPTDECRYPT.M with the given input arguments.
%
%      ENCRYPTDECRYPT('Property','Value',...) creates a new ENCRYPTDECRYPT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before encryptDecrypt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to encryptDecrypt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help encryptDecrypt

% Last Modified by GUIDE v2.5 10-Feb-2018 17:35:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @encryptDecrypt_OpeningFcn, ...
                   'gui_OutputFcn',  @encryptDecrypt_OutputFcn, ...
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


% --- Executes just before encryptDecrypt is made visible.
function encryptDecrypt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to encryptDecrypt (see VARARGIN)

% Choose default command line output for encryptDecrypt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes encryptDecrypt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = encryptDecrypt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
 Key=encryptmain
 msgbox( sprintf( 'The key to decrypt your image is: %d', Key))
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
seedP = inputdlg('Enter your key:')
seedP=cell2mat(seedP(1))
seedP=str2num(seedP)
decryptmain(seedP)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
