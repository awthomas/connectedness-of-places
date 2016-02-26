clear all %#ok
close all

%% VT

zip_raw_VT = load('proj1.csv');

dataload= load('datasortVT_1_141.mat');
data1VT = dataload.data;
dataload= load('datasortVT_142_309.mat');
data2VT = dataload.data;
arrload = load('arrivalsVT_1_141.mat');
arr1VT = arrload.arrivals;
arrload = load('arrivalsVT_142_309.mat');
arr2VT = arrload.arrivals2;

allarrs = cat(1,arr1VT,arr2VT);
allarrsVT_s = size(allarrs);

figure(1)
plot(allarrs')
xlabel('Time Elapsed (seconds)')
ylabel('VT ZIP Codes Reached')
title('VT ZIP Codes Reached by Car')
ylim([0 310])
xlim([0 allarrsVT_s(2)+60])

%zscore 
zscores = zscore(allarrs);
meanz_VT(1,:) = zip_raw_VT;
meanz_VT(2,:) = mean(zscores,2);
zscore_rank_VT = meanz_VT;

% figure(2)
% scatter(zscore_rank_VT(1,:),zscore_rank_VT(2,:),'k.')
% xlabel('ZIP Codes')
% ylabel('Average Z-Score')
% title('VT ZIP Code Average Z-Score')



%% NYC
% zip_raw_NYC = load('proj2.csv');
% dload = load('datarawNYC_d.mat');
% arr1NYC = dload.NYC_D;
% dload = load('datarawNYC_w.mat');
% arr2NYC = dload.NYC_W;
% dload = load('datarawNYC_b.mat');
% arr3NYC = dload.NYC_B;
% dload = load('datarawNYC_tr.mat');
% arr4NYC = dload.NYC_T;
% 
% arrNYC_s = size(arr1NYC);
% 
% datasort1NYC = sort(arr1NYC,2);
% datasort2NYC = sort(arr2NYC,2);
% datasort3NYC = sort(arr3NYC,2);
% datasort4NYC = sort(arr4NYC,2);
% 
% datasort2NYC(12,2) = 120;
% 
% dims_NYC = size(datasort1NYC);
% time1 = max(datasort1NYC(:));
% time2 = max(datasort2NYC(:));
% time3 = max(datasort3NYC(:));
% time4 = max(datasort4NYC(:));
% arrivals1NYC = zeros(dims_NYC(1),time1);
% arrivals2NYC = zeros(dims_NYC(1),time2);
% arrivals3NYC = zeros(dims_NYC(1),time3);
% arrivals4NYC = zeros(dims_NYC(1),time4);
% 
% for i = 1:dims_NYC(1)
%     for j = 2:dims_NYC(2)
%         if isnan(datasort1NYC(i,j)) == 0
%             arrivals1NYC(i,datasort1NYC(i,j):time1) = arrivals1NYC(i,datasort1NYC(i,j):time1) + 1;
%         end
%         if isnan(datasort2NYC(i,j)) == 0
%             arrivals2NYC(i,datasort2NYC(i,j):time2) = arrivals2NYC(i,datasort2NYC(i,j):time2) + 1;
%         end
%         if isnan(datasort3NYC(i,j)) == 0
%             arrivals3NYC(i,datasort3NYC(i,j):time3) = arrivals3NYC(i,datasort3NYC(i,j):time3) + 1;
%         end
%         if isnan(datasort4NYC(i,j)) == 0
%             arrivals4NYC(i,datasort4NYC(i,j):time4) = arrivals4NYC(i,datasort4NYC(i,j):time4) + 1;
%         end
%     end
% end


zip_raw_NYC = load('proj2.csv');
zip_raw_NYC = zip_raw_NYC(1:209);
arrload = load('arrivalsNYC_d.mat');
arr1NYC = arrload.arrivals1NYC;
arr1NYC = arr1NYC(1:209,:);
arrload = load('arrivalsNYC_w.mat');
arr2NYC = arrload.arrivals2NYC;
arr2NYC = arr2NYC(1:209,:);
arrload = load('arrivalsNYC_b.mat');
arr3NYC = arrload.arrivals3NYC;
arr3NYC = arr3NYC(1:209,:);
arrload = load('arrivalsNYC_tr.mat');
arr4NYC = arrload.arrivals4NYC;
arr4NYC = arr4NYC(1:209,:);
arr4NYC(78,:) = arr4NYC(77,:);

time1 = 4415;
time2 = 41286;
time3 = 14397;
time4 = 12391;

figure(3)
subplot(2,2,1)
plot(arr1NYC')
ylim([0 212])
xlim([0 time1+60])
xlabel('Time Elapsed (seconds)')
ylabel('NYC ZIP Codes Reached')
title('NYC ZIP Codes Reached by Car')

subplot(2,2,2)
plot(arr2NYC')
ylim([0 212])
xlim([0 time2+60])
xlabel('Time Elapsed (seconds)')
ylabel('NYC ZIP Codes Reached')
title('NYC ZIP Codes Reached on Foot')

subplot(2,2,3)
plot(arr3NYC')
ylim([0 212])
xlim([0 time3+60])
xlabel('Time Elapsed (seconds)')
ylabel('NYC ZIP Codes Reached')
title('NYC ZIP Codes Reached by Bicycle')

subplot(2,2,4)
plot(arr4NYC')
ylim([0 212])
xlim([0 time4+60])
xlabel('Time Elapsed (seconds)')
ylabel('NYC ZIP Codes Reached')
title('NYC ZIP Codes Reached by Transit')

zscores1 = zscore(arr1NYC);
zscores2 = zscore(arr2NYC);
zscores3 = zscore(arr3NYC);
zscores4 = zscore(arr4NYC);

meanz_NYC(1,:) = zip_raw_NYC;
meanz_NYC(2,:) = mean(zscores1,2);
meanz_NYC(3,:) = mean(zscores2,2);
meanz_NYC(4,:) = mean(zscores3,2);
meanz_NYC(5,:) = mean(zscores4,2);

% figure(4)
% subplot(2,2,1)
% scatter(meanz_NYC(1,:),meanz_NYC(2,:),'k.')
% subplot(2,2,2)
% scatter(meanz_NYC(1,:),meanz_NYC(3,:),'r.')
% subplot(2,2,3)
% scatter(meanz_NYC(1,:),meanz_NYC(4,:),'g.')
% subplot(2,2,4)
% scatter(meanz_NYC(1,:),meanz_NYC(5,:),'b.')


