function new_image = image_resize( input_image, old_size, new_size )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
new_image = zeros(new_size, new_size);
old_image = zeros(old_size+3,old_size+3);
old_image(2:old_size+1, 2:old_size+1) = input_image;
%     for i=1:new_size
%         for j=1:new_size
%             u = double(i*old_size)/new_size;
%             x = floor(i*old_size/new_size);
%             v = double(j*old_size)/new_size;
%             y = floor(j*old_size/new_size);
% %            if (x <2) || (x > old_size-2)              
% %            end
%neophodna promena old_image koordinata zbog dodavanja redova i kolona u
%old_image
%             p = old_image((x-1):(x+2), (y-1):(y+2)); 
%             new_image(i,j)=BicubicInterpolator ( p,u-x,v-y);
%         end
%     end

    for i=0:new_size-1
        for j=0:new_size-1
            u = 2+double(i*(old_size-1))/(new_size-1);
            x = 2+floor(i*(old_size-1)/(new_size-1));
            v = 2+double(j*(old_size-1))/(new_size-1);
            y = 2+floor(j*(old_size-1)/(new_size-1));
            p = old_image((x-1):(x+2), (y-1):(y+2)); 
            new_image(i+1,j+1)=BicubicInterpolator ( p,u-x,v-y);
        end
    end

end

