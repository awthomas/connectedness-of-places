clear all %#ok<CLALL>

data = load('data38.mat');
data_a = data.times_VT;

a = 157; %range edit start
b = 164; %range edit end
c = 1; %index start
d = 309; %index end
e = 269; %domain start
f = 276; %domain end

data_c = data_a;
% data_c(a:b,c:d) = data_b(a:b,c:d);

data37 = data_c(e:f,:);