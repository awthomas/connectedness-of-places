clear all %#ok
close all

%% VT

file = fopen('proj1.csv');
data_VT = textscan(file,'%s');
fclose(file);
zip_raw_VT = cellstr(cell2mat(data_VT{1,1}));

m = ['driving  ';'bicycling';'walking  ';'transit  '];
mode = cellstr(m);

zcount = 1:20:length(zip_raw_VT);

time_VT = zeros([1 length(zip_raw_VT) 3]);

% for i = 1:1
%     for j = zcount
%         for k = 1:1 %3 for VT
%             zip_o = zip_raw_VT{i};
%             zip_d1 = zip_raw_VT{i+1};
%             zip_d2 = zip_raw_VT{i+2};
%             zip_d3 = zip_raw_VT{i+3};
%             zip_d4 = zip_raw_VT{i+4};
%             zip_d5 = zip_raw_VT{i+5};
%             zip_d6 = zip_raw_VT{i+6};
%             zip_d7 = zip_raw_VT{i+7};
%             zip_d8 = zip_raw_VT{i+8};
%             zip_d9 = zip_raw_VT{i+9};
%             zip_d10 = zip_raw_VT{i+10};
%             zip_d11 = zip_raw_VT{i+11};
%             zip_d12 = zip_raw_VT{i+12};
%             zip_d13 = zip_raw_VT{i+13};
%             zip_d14 = zip_raw_VT{i+14};
%             zip_d15 = zip_raw_VT{i+15};
%             zip_d16 = zip_raw_VT{i+16};
%             zip_d17 = zip_raw_VT{i+17};
%             zip_d18 = zip_raw_VT{i+18};
%             zip_d19 = zip_raw_VT{i+19};
%             zip_d20 = zip_raw_VT{i+20};
%             url = strcat('https://maps.googleapis.com/maps/api/',...
%                 'distancematrix/json?origins=',zip_o,'&destinations=',...
%                 zip_d1,'|',zip_d2,'|',zip_d3,'|',zip_d4,'|',zip_d5,'|',...
%                 zip_d6,'|',zip_d7,'|',zip_d8,'|',zip_d9,'|',zip_d10,'|',...
%                 zip_d11,'|',zip_d12,'|',zip_d13,'|',zip_d14,'|',zip_d15,'|',...
%                 zip_d16,'|',zip_d17,'|',zip_d18,'|',zip_d19,'|',zip_d20,...
%                 '&mode=',mode{k},'&language=en-US');
%             web = webread(url);
%             time_VT(i,j,k)= web.rows.elements(1).duration.value;
%             time_VT(i,j+1,k)= web.rows.elements(2).duration.value;
%             time_VT(i,j+2,k)= web.rows.elements(3).duration.value;
%             time_VT(i,j+3,k)= web.rows.elements(4).duration.value;
%             time_VT(i,j+4,k)= web.rows.elements(5).duration.value;
%             time_VT(i,j+5,k)= web.rows.elements(6).duration.value;
%             time_VT(i,j+6,k)= web.rows.elements(7).duration.value;
%             time_VT(i,j+7,k)= web.rows.elements(8).duration.value;
%             time_VT(i,j+8,k)= web.rows.elements(9).duration.value;
%             time_VT(i,j+9,k)= web.rows.elements(10).duration.value;
%             time_VT(i,j+10,k)= web.rows.elements(11).duration.value;
%             time_VT(i,j+11,k)= web.rows.elements(12).duration.value;
%             time_VT(i,j+12,k)= web.rows.elements(13).duration.value;
%             time_VT(i,j+13,k)= web.rows.elements(14).duration.value;
%             time_VT(i,j+14,k)= web.rows.elements(15).duration.value;
%             time_VT(i,j+15,k)= web.rows.elements(16).duration.value;
%             time_VT(i,j+16,k)= web.rows.elements(17).duration.value;
%             time_VT(i,j+17,k)= web.rows.elements(18).duration.value;
%             time_VT(i,j+18,k)= web.rows.elements(19).duration.value;
%             time_VT(i,j+19,k)= web.rows.elements(20).duration.value;
% 
%         end
%     end
% end

%% NYC

file = fopen('proj2.csv');
data_NYC = textscan(file,'%s');
fclose(file);
zip_raw_NYC = cellstr(cell2mat(data_NYC{1,1}));

time_NYC = zeros([1 length(zip_raw_NYC) 4]);

% for i = 1:1
%     for j = zcount
%         for k = 1:1 %3 for NYC
%             zip_o = zip_raw_NYC{i};
%             zip_d1 = zip_raw_NYC{i+1};
%             zip_d2 = zip_raw_NYC{i+2};
%             zip_d3 = zip_raw_NYC{i+3};
%             zip_d4 = zip_raw_NYC{i+4};
%             zip_d5 = zip_raw_NYC{i+5};
%             zip_d6 = zip_raw_NYC{i+6};
%             zip_d7 = zip_raw_NYC{i+7};
%             zip_d8 = zip_raw_NYC{i+8};
%             zip_d9 = zip_raw_NYC{i+9};
%             zip_d10 = zip_raw_NYC{i+10};
%             zip_d11 = zip_raw_NYC{i+11};
%             zip_d12 = zip_raw_NYC{i+12};
%             zip_d13 = zip_raw_NYC{i+13};
%             zip_d14 = zip_raw_NYC{i+14};
%             zip_d15 = zip_raw_NYC{i+15};
%             zip_d16 = zip_raw_NYC{i+16};
%             zip_d17 = zip_raw_NYC{i+17};
%             zip_d18 = zip_raw_NYC{i+18};
%             zip_d19 = zip_raw_NYC{i+19};
%             zip_d20 = zip_raw_NYC{i+20};
%             url = strcat('https://maps.googleapis.com/maps/api/',...
%                 'distancematrix/json?origins=',zip_o,'&destinations=',...
%                 zip_d1,'|',zip_d2,'|',zip_d3,'|',zip_d4,'|',zip_d5,'|',...
%                 zip_d6,'|',zip_d7,'|',zip_d8,'|',zip_d9,'|',zip_d10,'|',...
%                 zip_d11,'|',zip_d12,'|',zip_d13,'|',zip_d14,'|',zip_d15,'|',...
%                 zip_d16,'|',zip_d17,'|',zip_d18,'|',zip_d19,'|',zip_d20,...
%                 '&mode=',mode{k},'&language=en-US');
%             web = webread(url);
%             time_NYC(i,j,k)= web.rows.elements(1).duration.value;
%             time_NYC(i,j+1,k)= web.rows.elements(2).duration.value;
%             time_NYC(i,j+2,k)= web.rows.elements(3).duration.value;
%             time_NYC(i,j+3,k)= web.rows.elements(4).duration.value;
%             time_NYC(i,j+4,k)= web.rows.elements(5).duration.value;
%             time_NYC(i,j+5,k)= web.rows.elements(6).duration.value;
%             time_NYC(i,j+6,k)= web.rows.elements(7).duration.value;
%             time_NYC(i,j+7,k)= web.rows.elements(8).duration.value;
%             time_NYC(i,j+8,k)= web.rows.elements(9).duration.value;
%             time_NYC(i,j+9,k)= web.rows.elements(10).duration.value;
%             time_NYC(i,j+10,k)= web.rows.elements(11).duration.value;
%             time_NYC(i,j+11,k)= web.rows.elements(12).duration.value;
%             time_NYC(i,j+12,k)= web.rows.elements(13).duration.value;
%             time_NYC(i,j+13,k)= web.rows.elements(14).duration.value;
%             time_NYC(i,j+14,k)= web.rows.elements(15).duration.value;
%             time_NYC(i,j+15,k)= web.rows.elements(16).duration.value;
%             time_NYC(i,j+16,k)= web.rows.elements(17).duration.value;
%             time_NYC(i,j+17,k)= web.rows.elements(18).duration.value;
%             time_NYC(i,j+18,k)= web.rows.elements(19).duration.value;
%             time_NYC(i,j+19,k)= web.rows.elements(20).duration.value;
% 
%         end
%     end
% end