function map = map(left, right, template_x, template_y)
t_x = floor(template_x/2);
t_y = floor(template_y/2);
[height, width] = size(left);
map = ones(height-(template_x+1), width-(template_y+1));
for row = t_y+1:height-t_y
    for col = t_x+1:width-t_x
        T = left(row-t_x:row+t_x,col-t_x:col+t_x);
        left_t = col-14; 
        right_t = col;
        if left_t<t_x+1
            left_t = t_x+1; % prevents negative left_t
        end
        min = Inf;
        pixel_min = left_t;
        for pixel = left_t:right_t
            I = right(row-t_x:row+t_x,pixel-t_x:pixel+t_x);
            I_rot = rot90(I,2);
            conv_1 = conv2(I,I_rot);
            ssd_1 = conv_1(11,11);
            conv_2 = conv2(T,I_rot);
            ssd_2 = conv_2(11,11)*2;
            SSD = ssd_1 - ssd_2;
            if SSD < min
                min=SSD;
                pixel_min = pixel;
            end
        end
        curr_min = pixel_min - col;
        map(row-t_x, col-t_x) = curr_min;
    end
end

