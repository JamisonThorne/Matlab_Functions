function folder_move(input_path,output_path)
    %{
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     folder_move.m
    [] = function_name(input_path,output_path)
    %     End Example Code
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    folder_move(string,string) -> none
    
    takes in an input path as 1st arg and output path as second arg moves
    contents in input path to output path
    
    >>> folder_move('example/example1','new/example/example2')
    example/example1:
        example1.m
        example2.txt
    new/example/example2:
        empty folder
    >>>
    example/example1:
        empty folder
    new/example/example2:
        example1.m
        example2.txt
    %}
    movefile(input_path, output_path)
end