function [t, v] = measPVDF(daqPVDF, duration)
    start(daqPVDF, "Duration", seconds(duration));
    data = read(daqPVDF, seconds(duration));
    t = data.Time;
    v = data.Variables;
end