clear all %#ok
close all

%% VT

file = fopen('proj1.csv');
data_VT = textscan(file,'%s');
fclose(file);
zip_raw_VT = cellstr(cell2mat(data_VT{1,1}));

m = ['driving  ';'bicycling';'walking  ';'transit  '];
mode = cellstr(m);

VT_len = length(zip_raw_VT);
zcount = 1:VT_len; %#ok<NASGU>

times_VT = zeros([VT_len VT_len 3]);

for i = 1:VT_len % loop over origin zip codes
    for j = 1:VT_len % loop over destination zip codes
        zip_o = zip_raw_VT{i};
        zip_d = zip_raw_VT{j};
        url = strcat('https://maps.googleapis.com/maps/api/',...
            'distancematrix/json?origins=',zip_o,'&destinations=',...
            zip_d,'&mode=',mode{1},'&language=en-US&key=AIzaSyDZRUFlFJy9XpBRch7UD2IaIf11aSqyPoI');
        web = webread(url);
        times_VT(i,j)= web.rows.elements.duration.value;
    end
end

%% NYC

file = fopen('proj2.csv');
data_NYC = textscan(file,'%s');
fclose(file);
zip_raw_NYC = cellstr(cell2mat(data_NYC{1,1}));

NYC_len = length(zip_raw_NYC);
zcount = 1:NYC_len;

times_NYC = zeros([length(zip_raw_NYC) length(zip_raw_NYC) 4]);

for i = 1:NYC_len % loop over origin zip codes
    for j = 1:NYC_len % loop over destination zip codes
        for k = 1:3 % loop over movement method
            zip_o  = zip_raw_NYC{i};
            zip_d = zip_raw_NYC{j};
            url = strcat('https://maps.googleapis.com/maps/api/',...
                'distancematrix/json?origins=',zip_o,'&destinations=',...
                zip_d,'&mode=',mode{k},'&language=en-US');
            web = webread(url);
            times_NYC(i,j,k)= web.rows.elements.duration.value;
        end
    end
end

