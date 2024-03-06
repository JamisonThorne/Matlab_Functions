function [Text_You_Want] = xml_pull(xml_path,xml_name)
    %   Reads xml files
    %   Call via the following:  
    %   [Text_You_Want] = xml_pull(new_path);
    xml_split = split(xml_path,'\');    %Example Formatting
    xml_join = char(strcat(join(xml_split(1:end-2),'\'),filesep,xml_name,'.xml')); %Example Formatting
    parameter_xml = readstruct(xml_join);   %Fine .xml path and read it
    Text_You_Want = parameter_xml.Text_you_want;
end