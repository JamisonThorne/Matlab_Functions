function [result] = random_number_generator()
%{
[result] = random_number_generator() -> char

random_number_generator outputs a perfectly random number by utilizing
system time down to the millisecond combined with the rand() matlab
function.

>>> random_number_generator() -> 
'20221004115400510.81472'
>>> random_number_generator() -> 
'20221004115416180.90579'
>>> random_number_generator() -> 
'20221004115423420.12699'
%}
    %readup on datetime using help --datetime in command promp
    %outputs to the millisecond which is what we want
    datetime.setDefaultFormats('default','yyyy-MM-dd hh:mm:ss:SS');
    %changes output from a datetime structure to character for manipulation
    time_output = char(datetime);
    %split --help
    %split parses out strings/characters based on assigned delimiters
    split_time_output = join(split(time_output,'-'));
    %join combines data structures or whatever you are using
    split_time_output = join(split(split_time_output,':'));
    split_time_output = string(split(split_time_output,' '));
    %using join creates spaces which we dont want, we use strcat instead
    %strcat --help
    final_time_output = strcat(split_time_output(1),split_time_output(2), ...
    split_time_output(3), split_time_output(4),split_time_output(5), ...
    split_time_output(6), split_time_output(7));
    %basic random number generation
    random_placeholder = num2str(rand(1));
    %combines time string created above and random number generated to give
    %perfect randomization
    result = char(strcat(final_time_output,random_placeholder));
end