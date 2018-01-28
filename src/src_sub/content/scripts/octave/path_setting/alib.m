function alib(ch)
%{
/*
 * This file is part of the "dev-in-place" repository located at:
 * https://github.com/osuvak/dev-in-place
 * 
 * Copyright (C) 2017  Onder Suvak
 * 
 * For licensing information check the above url.
 * Please do not remove this header.
 * */
%}

myPath = getenv( 'HOME' );

path_own = ...
    { ...
        fullfile('..','include','classes') , ...
        fullfile('..','include','functions') ...
    };
    
path_under_home = ...
    { ...
        fullfile( 'dev_in_place' , 'binaries' , 'mex' , 'octave' ) ...
    };
    
switch lower(ch)

    case 1
	pathSetter( ...
            '.' , 1 , ...
            path_own ...
            );
            
        pathSetter( ...
            myPath , 1 , ...
            path_under_home ...
            );
            
    case 2
        pathSetter( ...
            '.' , 2 , ...
            path_own ...
            );
            
        pathSetter( ...
            myPath , 2 , ...
            path_under_home ...
            );
            
    otherwise
	  warning('MATLAB:NoSwitchCase','Nothing to do in path setting.');
end