function res = BicubicInterpolator ( p,x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

		arr(1) = cubicInterpolate(p(1,:), y);
		arr(2) = cubicInterpolate(p(2,:), y);
		arr(3) = cubicInterpolate(p(3,:), y);
		arr(4) = cubicInterpolate(p(4,:), y);
		res = cubicInterpolate(arr, x);
end

