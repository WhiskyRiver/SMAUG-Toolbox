function DisplaySpecificTraces(TraceStruct, ChosenTraceIndices, offset_nm, ...
    LinLog, StartTraceNum)
    %Copyright 2020 LabMonti.  Written by Nathan Bamberger.  This work is 
    %licensed under the Creative Commons Attribution-NonCommercial 4.0 
    %International License. To view a copy of this license, visit 
    %http://creativecommons.org/licenses/by-nc/4.0/.  
    %
    %Function Description: Displays user-specified traces from a dataset on
    %the same plot. 
    %
    %~~~INPUTS~~~:
    %
    %TraceStruct: a trace structure containing all the traces in a dataset
    %   and associated information
    %
    %ChosenTraceIndices: a vector containing the indices of the traces to
    %   be plotted
    %
    %offset_nm: the amount (in the units of x, typically nanometers) that
    %   each trace will be shifted to the right by relative to the previous
    %   trace
    %
    %LinLog: Whether the y-axis (Conductance) should be on a linear or
    %   logarithmic scale; acceptable values are "Lin" and "Log"
    %
    %StartTraceNum: the trace # to start counting at; for example, if 
    %   StartTraceNum = 150 then the user-specified trace #1 will
    %   correspond to trace #150, etc.
    
    
    %Default inputs
    if nargin < 5
        StartTraceNum = 1;
    end
    if nargin < 4
        LinLog = 'Log';
    end
    if nargin < 3
        offset_nm = 0.25;
    end
    if nargin < 2
        ChosenTraceIndices = [1 2 3 4 5];
    end
    if nargin < 1 || nargin > 5
        error('Inappropriate # of inputs!');
    end

    if ~strcmp(LinLog,'Log') && ~strcmp(LinLog,'Lin')
        error('The parameter "LinLog" can only have the values "Lin" or "Log"');
    end    
    
    %Adjust trace indices so that ID#1 corresponds to StartTraceNum
    ChosenTraceIndices = ChosenTraceIndices + StartTraceNum - 1;
    
    displayTraces(TraceStruct,ChosenTraceIndices,offset_nm,LinLog);

end