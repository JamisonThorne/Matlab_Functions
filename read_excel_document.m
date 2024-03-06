function read_excel_document(excel_path)
    % Changing detectImportOptions allows you to have specific data select for
    % the table you are reading. Read documentation for more info
    opts = detectImportOptions(excel_path);
        %to select sheet example:
        % opts.Sheet = 2;
    readtable(excel_path, opts)
end