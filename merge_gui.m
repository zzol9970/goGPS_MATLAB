function varargout = merge_gui(varargin)
% MERGE_GUI M-file for merge_gui.fig
%      MERGE_GUI, by itself, creates a new MERGE_GUI or raises the existing
%      singleton*.
%
%      H = MERGE_GUI returns the handle to a new MERGE_GUI or the handle to
%      the existing singleton*.
%
%      MERGE_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MERGE_GUI.M with the given input arguments.
%
%      MERGE_GUI('Property','Value',...) creates a new MERGE_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before merge_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to merge_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help merge_gui

% Last Modified by GUIDE v2.5 31-May-2010 16:39:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @merge_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @merge_gui_OutputFcn, ...
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


% --- Executes just before merge_gui is made visible.
function merge_gui_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to merge_gui (see VARARGIN)

% Choose default command line output for merge_gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%pixels
set(hObject, 'Units', 'pixels' );

%get display size
screenSize = get(0, 'ScreenSize');

%calculate the center of the display
position = get(hObject, 'Position');
position(1) = (screenSize(3)-position(3))/2;
position(2) = (screenSize(4)-position(4))/2;

%center the window
set(hObject, 'Position', position);

% --- Outputs from this function are returned to the command line.
function varargout = merge_gui_OutputFcn(hObject, eventdata, handles)  %#ok<*STOUT,*INUSD>
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure


function rover_dataset_Callback(hObject, eventdata, handles) %#ok<*DEFNU>
% hObject    handle to rover_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of rover_dataset as text
%        str2double(get(hObject,'String')) returns contents of rover_dataset as a double


% --- Executes during object creation, after setting all properties.
function rover_dataset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to rover_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse_rover_dataset.
function browse_rover_dataset_Callback(hObject, eventdata, handles)
% hObject    handle to browse_rover_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.bin','Rover dataset (*.bin)'}, ...
    'Choose rover observations dataset','../data');

if (filename ~= 0)
    pos = find(filename == '_');
    filename = filename(1:pos(end-1)-1);
    set(handles.rover_dataset,'String',fullfile(pathname, filename));
end


% --- Executes on button press in browse_master_dataset.
function browse_master_dataset_Callback(hObject, eventdata, handles)
% hObject    handle to browse_master_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile( ...
    {'*.bin','Rover dataset (*.bin)'}, ...
    'Choose master observations dataset','../data');

if (filename ~= 0)
    pos = find(filename == '_');
    filename = filename(1:pos(end-1)-1);
    set(handles.master_dataset,'String',fullfile(pathname, filename));
end

function data_out_folder_Callback(hObject, eventdata, handles)
% hObject    handle to data_out_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_out_folder as text
%        str2double(get(hObject,'String')) returns contents of data_out_folder as a double


% --- Executes during object creation, after setting all properties.
function data_out_folder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_out_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browse_data_out_folder.
function browse_data_out_folder_Callback(hObject, eventdata, handles)
% hObject    handle to browse_data_out_folder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dname = uigetdir('../data/','Choose a directory to store output data');
if (dname ~= 0)
    set(handles.data_out_folder,'String',dname);
end


function data_out_name_Callback(hObject, eventdata, handles)
% hObject    handle to data_out_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of data_out_name as text
%        str2double(get(hObject,'String')) returns contents of data_out_name as a double


% --- Executes during object creation, after setting all properties.
function data_out_name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to data_out_name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in merge_button.
function merge_button_Callback(hObject, eventdata, handles)
% hObject    handle to merge_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
filerootR = get(handles.rover_dataset,'String');
filerootM = get(handles.master_dataset,'String');
filerootOUT = [get(handles.data_out_folder,'String') '\' get(handles.data_out_name,'String')];
filerootR(filerootR == '\') = '/';
filerootM(filerootM == '\') = '/';
filerootOUT(filerootOUT == '\') = '/';

wait_dlg = waitbar(0,'Please wait...');

goGPSbinMerge(filerootR, filerootM, filerootOUT, wait_dlg);

close(wait_dlg)

close(handles.converter_panel)

% --- Executes on button press in exit_button.
function exit_button_Callback(hObject, eventdata, handles)
% hObject    handle to exit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(handles.converter_panel)


function master_dataset_Callback(hObject, eventdata, handles)
% hObject    handle to master_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of master_dataset as text
%        str2double(get(hObject,'String')) returns contents of master_dataset as a double


% --- Executes during object creation, after setting all properties.
function master_dataset_CreateFcn(hObject, eventdata, handles)
% hObject    handle to master_dataset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

