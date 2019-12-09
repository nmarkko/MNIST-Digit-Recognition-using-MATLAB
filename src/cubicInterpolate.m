function res = cubicInterpolate ( p, x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
res = p(2) + 0.5 * x*(p(3) - p(1) + x*(2.0*p(1) - 5.0*p(2) + 4.0*p(3) - p(4) + x*(3.0*(p(2) - p(3)) + p(4) - p(1))));
% p are pixel values: max 1, min 0
% if res>1
%     res=1;
% end
% if res < 0
%     res=0;
% end

end

