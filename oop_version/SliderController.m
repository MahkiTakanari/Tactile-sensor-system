classdef SliderController
    properties
        s   % serialport
    end

    methods
        % コンストラクタ
        function obj = SliderController(port)
            try
                obj.s = serialport(port, 9600);
                configureTerminator(obj.s, "CR/LF");
                fprintf("SET: serialport on %s\n", port);
            catch ME
                if contains(ME.message, "already in use")
                    warning("Port %s is already open. Attempting to reuse existing object.\n", port);
                    found = serialportfind("Port", port);
                    if ~isempty(found) && isvalid(found(1))
                        obj.s = found(1);
                        fprintf("REUSE: existing serialport on %s\n", port);
                    else
                        error("Port %s is already in use, but no valid object found.", port);
                    end
                else
                    rethrow(ME);
                end
            end
        end

        % インスタンスメソッド
        function runSeq(obj, code)
            cmd = sprintf("run %d", code);
            writeline(obj.s, cmd);
            pause(2);
        end
    end
end