clear all %#ok
close all

%% VT

file = fopen('proj1.csv');
data_VT = textscan(file,'%s');
fclose(file);
zip_raw_VT = cellstr(cell2mat(data_VT{1,1}));
m = ['driving  ';'bicycling';'walking  ';'transit  '];
mode = cellstr(m);

% VT_len = length(zip_raw_VT);
% zcount = 1:VT_len;
% 
% times_VT = zeros([VT_len VT_len]);
% 
% %  AIzaSyDZRUFlFJy9XpBRch7UD2IaIf11aSqyPoI
% 
% for i = 253:260 % loop over origin zip codes
%     for j = 1:VT_len % loop over destination zip codes
%         zip_o = zip_raw_VT{i};
%         zip_d = zip_raw_VT{j};
%         url = strcat('https://maps.googleapis.com/maps/api/',...
%             'distancematrix/json?origins=',zip_o,',VT,USA&destinations=',...
%             zip_d,',VT,USA&mode=',mode{1},'&key=AIzaSyDZRUFlFJy9XpBRch7UD2IaIf11aSqyPoI&language=en-US');
%         web = webread(url);
%         times_VT(i,j)= web.rows.elements.duration.value;
%     end
%     disp(i)
% end

%% NYC

file = fopen('proj2.csv');
data_NYC = textscan(file,'%s');
fclose(file);
zip_raw_NYC = cellstr(cell2mat(data_NYC{1,1}));

NYC_len = length(zip_raw_NYC);
zcount = 1:NYC_len;

times_NYC = zeros([3 NYC_len 3]); % transit (4) requires API key

% for i = 1:3 % loop over origin zip codes
%     for j = 1:NYC_len % loop over destination zip codes
%         for k = 1:3
%             zip_o = zip_raw_NYC{i};
%             zip_d = zip_raw_NYC{j};
%             url = strcat('https://maps.googleapis.com/maps/api/',...
%                 'distancematrix/json?origins=',zip_o,'&destinations=',...
%                 zip_d,'&mode=',mode{k},'&language=en-US');
%             web = webread(url);
%             if isfield(web.rows.elements,'duration') == 0
%                 times_NYC(i,j,k) = NaN;
%             else
%                 times_NYC(i,j,k) = web.rows.elements.duration.value;
%             end
%         end
%     end
%     disp(i)
% end

%% transit case only; requires API key

times_NYC_tr = zeros([11 NYC_len]);

% keys
%   AIzaSyDZRUFlFJy9XpBRch7UD2IaIf11aSqyPoI
%   AIzaSyDb_YyEla8SbFOPeMObSQwgagXmZP3ZQxU
%   AIzaSyDl_j8OCfQp4THoW3zQKqp9bpEEVyts89Y
%   AIzaSyD6kzFslLNgwzYHJ9WQMjTXgqTrz_jfj88
%   AIzaSyDgS_Dr7ChYz2gVDn1-Gx1mC-MZ0sgwNUA
%   AIzaSyChFOyaslCWPLCnAttjPFqw34i6EU2sDy0
%   AIzaSyAPMeQh_2r2kZq4NIj0FIQbuSnmc26M2Y8


for i = 210:211 % loop over origin zip codes
    for j = 1:NYC_len % loop over destination zip codes
        % loop over movement method % transit (4) requires API key
        zip_o  = zip_raw_NYC{i};
        zip_d = zip_raw_NYC{j};
        url = strcat('https://maps.googleapis.com/maps/api/',...
            'distancematrix/json?origins=',zip_o,'&destinations=',...
            zip_d,'&mode=',mode{4},'&key=AIzaSyChFOyaslCWPLCnAttjPFqw34i6EU2sDy0&language=en-US');
        web = webread(url);
        if isfield(web.rows.elements,'duration') == 0
            times_NYC_tr(i,j) = NaN;
        else
            times_NYC_tr(i,j)= web.rows.elements.duration.value;
        end
    end
    disp(i)
end
