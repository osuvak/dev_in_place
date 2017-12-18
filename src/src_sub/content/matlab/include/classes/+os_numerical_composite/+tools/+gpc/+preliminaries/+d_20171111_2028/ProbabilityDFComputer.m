classdef ProbabilityDFComputer < hgsetget
%{
/*
 * This file is part of the "dev_in_place" repository located at:
 * https://github.com/osuvak/dev_in_place
 * 
 * Copyright (C) 2017  Onder Suvak
 * 
 * For licensing information check the above url.
 * Please do not remove this header.
 * */
%}

    methods(Access=public,Abstract)
  
        compute(obj)
        
        f = cdf(obj,xvec)
        f = pdf(obj,xvec)
  
    end % methods

end % classdef
