function create_my_mtg_figure(dataset,dataset_name,figure_location)
    %{
    Example Setup:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     Start Example Code
    create_my_mtg_figure(data_stack,'example name','example/path')
    %     End Example Code
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Abbreviation:   mtg -> montage

    create_my_mtg_figure(512x512x100 array,string,string path) -> none
    
    Takes a dataset and saves the montage of that dataset
    
    >>> create_my_mtg_figure(512x512x100 array,string,string path) -> none

    %}
    dataset_figure = figure('Visible','on','name',dataset_name), montage(dataset)   %visible set to 'on' due to unique matlab functionality :)
    saveas(dataset_figure, strcat(figure_location, filesep, dataset_name,'.jpg'));  %saves jpg to path
    savefig(dataset_figure, strcat(figure_location, filesep, dataset_name,'.fig')); %saves fig to path
    clear dataset_figure   %Clear;clc;close needed to save memory when processing large amounts of data                
    clc;                   %Clear;clc;close needed to save memory when processing large amounts of data
    close all              %Clear;clc;close needed to save memory when processing large amounts of data    
end