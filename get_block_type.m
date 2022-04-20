function block_type = get_block_type(block_name_fp)
    % Some Simulink library block type is Subsystem. Will look into
    % ReferenceBlock parameter to get the actual type in the
    % Simulink library dialog box
    % https://www.reddit.com/r/matlab/comments/4m1zko/get_library_block_path_name_from_corresponding/
    % 
    % Returns block type as a character array if input block_type is character array or cell array 
    if iscell(block_name_fp)
        block_name_fp = block_name_fp{1};
    end
    block_type = get_param(block_name_fp,'BlockType');
    
    if strcmp(block_type,'SubSystem') || strcmp(block_type,'S-Function')
        % Returns a structure
        blk_obj_params = get_param(block_name_fp,'ObjectParameters');
        if isfield(blk_obj_params,'ReferenceBlock')
            % Returns a character array
            ref_block_type = get_param(block_name_fp,'ReferenceBlock');
            [~,ref_block_type] = split_two_last_delim(ref_block_type,'/');
            ref_block_type = strrep(ref_block_type,newline,'-');
            if ~isempty(ref_block_type)
                block_type = ref_block_type;
            end
        else
            disp("Block name with empty Reference Block with Block type as");
            disp(block_type);
            disp(block_name_fp);
        end
    end
    block_type = strip(block_type);
end