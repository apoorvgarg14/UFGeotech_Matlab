function saveFunction_GUI(handles)
 [filename, pathname] = uiputfile(...
 {'*.xls';'*.xlsx';'*.*'},...
 'Save as');
writetable(handles.ResultTable,filename,'Sheet',1);
xlswrite(filename,handles.Resultdata',1,'M2:M7');
xlswrite(filename,handles.Resultdata_VarName',1,'L2:L7');
xlswrite(filename,handles.Resultdata_Units',1,'N2:N7');
xlswrite(filename,{'Results' 'Value' 'Units'},1,'L1:N1');
xlswrite(filename,handles.ResultTable_Units,1,'A1:H1');
xlswrite(filename,'END',1,'A42:A42');

end