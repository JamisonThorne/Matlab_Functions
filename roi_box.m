function [new_datastack] = roi_box(data_stack,roi_size,figure_name,window,level,figure_location)
    %{
    Example Setup:
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %     Start Example Code
    %   Actual Box will be 2*roi_size x 2*roi_size
    [new_datastack] = roi_box(data_stack,roi_size)  
    %     End Example Code
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    roi_box(512x512x400 array,60) -> (120x120x400 array)
    
    Function accepts a dataset of any given size and user defined ROI. A 
    GUI allows the user to define the ROI location where the user
    defined ROI box will be drawn with the click at the center of said box.
    Drawn ROI saved as .png and .fig
    
    >>> roi_box(example_dataset(5000:5000:400),60)
    new_dataset(120:120:400)
    %}
    disp('Starting GUI...')
    ttt = mean(data_stack,3);
    figure,imagesc(ttt, [0 100]), colormap gray, colorbar;
    cor = ginput(1);
    click_coordinate = uint16(cor);
    close all;
    disp('Creating ROIs...')
    x_axis = (click_coordinate(2) - roi_size):(click_coordinate(2) + roi_size);
    y_axis = (click_coordinate(1) - roi_size):(click_coordinate(1) + roi_size);
    disp('Creating ROI Figure...')
    box_size = (click_coordinate(2) + roi_size) - (click_coordinate(2) - roi_size);
    create_rectangle_figure(data_stack,x_axis,y_axis,box_size,figure_name,figure_location);
    disp('Creating New Datastack...')
    new_datastack = data_stack(x_axis,y_axis,:); 
end

function create_rectangle_figure(dataset,x_axis,y_axis,box_size,figure_name,window,level,figure_location)
        %{
        Example Setup:
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        %     Start Example Code
        % disp('Starting GUI...')
        % ttt = mean(data_stack,3);
        % figure,imagesc(ttt, [0 100]), colormap gray, colorbar;
        % cor = ginput(1);
        % click_coordinate = uint16(cor);
        % close all;
        % disp('Creating ROIs...')
        % x_axis = (click_coordinate(2) - roi_size):(click_coordinate(2) + roi_size);
        % y_axis = (click_coordinate(1) - roi_size):(click_coordinate(1) + roi_size);
        % disp('Creating ROI Figure...')
        % box_size = (click_coordinate(2) + roi_size) - (click_coordinate(2) - roi_size);
        create_rectangle_figure(data_stack,x_axis,y_axis,box_size,figure_name,figure_location);
        %     End Example Code
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        create_rectangle_figure(512x512x100 matrix,20:50,20:50,31,string,string path)
        -> generated figure

        Function that saves a figure with a box drawn with click from GUI at the center
        
        >>> create_rectangle_figure(data_stack,x_axis,y_axis,box_size,figure_name,figure_location);
        Figure
        %}
        figure,imagesc(dataset2table, [window level]), colormap gray, colorbar;
        hold on;
        rectangle('Position',[min(x_axis) min(y_axis) box_size box_size],'EdgeColor','r');
        current_dataset = gcf;
        saveas(current_dataset, strcat(figure_location, filesep, figure_name,'.jpg'));
        savefig(current_dataset, strcat(figure_location, filesep, figure_name,'.fig'));   
        clear current_dataset dataset
        clc;
        close all
end