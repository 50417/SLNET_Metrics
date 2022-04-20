function [firstpart,secondpart] = split_two_last_delim(str,delim)
%SPLIT_TWO_LAST_DELIM splits the string into two string at the first matching delimiter from the end
% returns two character array
%   Detailed explanation goes here
    if isempty(str)
        firstpart = '';
        secondpart = '';
        return;
    end
    arr_of_str = strsplit(str,delim);
    arr_len = length(arr_of_str);
    firstpart = arr_of_str{1};
    for i = 2 : arr_len-1
        firstpart = strcat(firstpart,delim,arr_of_str(i));
    end

    secondpart = arr_of_str{arr_len};
end