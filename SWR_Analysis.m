%% SWR Analysis
% This script will load all the SWRs the Gratianne catagorized and run
% analysis on them. It will look at SWR count, duration, Power, IRI, and
% CSD
clear all, close all, clc

cd('C:\Users\ipzach\Documents\dbdb electrophy\General_Scripts')
load('SpkInfo.mat')
cd('C:\Users\ipzach\Documents\dbdb electrophy');
animals = dir;

rip.DB2 = [];
rip.DB4 = [];
rip.DBDB2 = [];
rip.DBDB4 = [];

label.DB2a = [];
label.DB4a = [];
label.DBDB2a = [];
label.DBDB4a = [];

for i = 1:4
    if i ==1
        grouping = 3:9; % DB+ 200D
    elseif i ==2
        grouping = 10:14; % DB+ 400D
    elseif i ==3
        grouping = [15:18 20 21]; % DBDB 200D
    elseif i ==4
        grouping = [22 24:27]; % DBDB 400D
    end
    counter = 0;
    for j = grouping
        cd(animals(j).name)
        % Load index file, containts H/LTD Dur SWRFreq and SWRIdx
        load('SWR_Index.mat');
        
        % Find and load Full SWR files
        %         l_files = dir('SWR_L_*');
        %         l_files = {l_files.name};
        %
        r_files = dir('SWR_R_*');
        r_files = {r_files.name};
        
        counter = counter +1;
        
        for k = 1:size(SWRLTDIdx,2)
            if ~isempty(SWRLTDIdx(k).R) % makes sure ripple occured during this period
                load(char(r_files(k)));
                if i ==1
                    rip.DB2 = [rip.DB2; SWRevents(SWRLTDIdx(k).R,:)]; % DB+ 200D
                    temp_label = zeros(size(SWRevents(SWRLTDIdx(k).R,:),1),1);
                    temp_label(:) = counter;
                    label.DB2a = [label.DB2a; temp_label];
                elseif i ==2
                    rip.DB4 = [rip.DB4; SWRevents(SWRLTDIdx(k).R,:)]; % DB+ 400D
                    temp_label = zeros(size(SWRevents(SWRLTDIdx(k).R,:),1),1);
                    temp_label(:) = counter;
                    label.DB4a = [label.DB4a; temp_label];
                elseif i ==3
                    rip.DBDB2 = [rip.DBDB2; SWRevents(SWRLTDIdx(k).R,:)]; % DBDB 200D
                    temp_label = zeros(size(SWRevents(SWRLTDIdx(k).R,:),1),1);
                    temp_label(:) = counter;
                    label.DBDB2a = [label.DBDB2a; temp_label];
                elseif i ==4
                    rip.DBDB4 = [rip.DBDB4; SWRevents(SWRLTDIdx(k).R,:)]; % DBDB 400D
                    temp_label = zeros(size(SWRevents(SWRLTDIdx(k).R,:),1),1);
                    temp_label(:) = counter;
                    label.DBDB4a = [label.DBDB4a; temp_label];
                end
                
            end
        end
        cd ..
    end
end

%% Make labels
label.DB2age = cell(length(rip.DB2),1);
label.DB2treat = cell(length(rip.DB2),1);
label.DB2age(:) = {'200'};
label.DB2treat(:) = {'Control'};

label.DB4age = cell(length(rip.DB4),1);
label.DB4treat = cell(length(rip.DB4),1);
label.DB4age(:) = {'400'};
label.DB4treat(:) = {'Control'};

label.DBDB2age = cell(length(rip.DBDB2),1);
label.DBDB2treat = cell(length(rip.DBDB2),1);
label.DBDB2age(:) = {'200'};
label.DBDB2treat(:) = {'DBDB'};

label.DBDB4age = cell(length(rip.DBDB4),1);
label.DBDB4treat = cell(length(rip.DBDB4),1);
label.DBDB4age(:) = {'400'};
label.DBDB4treat(:) = {'DBDB'};


%% Run stats
% Frank Lab code,
% output
% 1: start index
% 2: end index
% 3: peak_value
% 4: peak index
% 5: total area
% 6: mid area
% 7: total energy
% 8: mid energy
% 9: max threshold

%%  Counts
count_vals = [];
count_age = {};
count_treat = {};


for n = 1:4
    switch n
        case 1
            group = label.DB2a;
            age = '200';
            treat = 'Control';
        case 2
            group = label.DB4a;
            age = '400';
            treat = 'Control';
        case 3 
            group = label.DBDB2a;
            age = '200';
            treat = 'DBDB';
        case 4 
            group = label.DBDB4a;
            age = '400';
            treat = 'DBDB';
    end
        aMax = max(group);
        for o = 1:aMax
            temp_count = length(group(group == o));
            count_vals = [count_vals; temp_count];
            count_age = [count_age; age];
            count_treat = [count_treat; treat];
        end
end


[cP,cT,count_stats] = anovan(count_vals, {count_treat, count_age},'model','interaction'); % ,'display','off');
[cC,cM,~,cNames] = multcompare(count_stats,'Dimension',[1 2],'CType','bonferroni');

%% IRI
IRI_vals = [];
IRI_age = {};
IRI_treat = {};
IRI_big = NaN(4,2000);
for l = [1 3 2 4]
    switch l
        case 1
            group = rip.DB2(:,1);
            age = '200';
            treat = 'Control';
        case 2
            group = rip.DB4(:,1);
            age = '400';
            treat = 'Control';
        case 3 
            group = rip.DBDB2(:,1);
            age = '200';
            treat = 'DBDB';
        case 4 
            group = rip.DBDB4(:,1);
            age = '400';
            treat = 'DBDB';
    end
    for m = 1:length(group)-1
        if group(m+1) > group(m)
            IRI_vals = [IRI_vals; (group(m+1) - group(m))];
            IRI_age = [IRI_age; {age}];
            IRI_treat = [IRI_treat; {treat}];
            IRI_big(l,m) = (group(m+1) - group(m));
            
        end
    end
end
IRIdb2 = rmoutliers(IRI_big(1,:));
IRIdb4 = rmoutliers(IRI_big(2,:));
IRIdbdb2 = rmoutliers(IRI_big(3,:));
IRIdbdb4 = rmoutliers(IRI_big(4,:));

IRIdb2 = IRIdb2(~isnan(IRIdb2))./1250;
IRIdb4 = IRIdb4(~isnan(IRIdb4))./1250;
IRIdbdb2 = IRIdbdb2(~isnan(IRIdbdb2))./1250;
IRIdbdb4 = IRIdbdb4(~isnan(IRIdbdb4))./1250;

[cleanIRI,TF] = rmoutliers(IRI_vals,'quartiles');
IRI_age(TF==1) = [];
IRI_treat(TF==1) = [];

%% Create graphs
% power
figure
set(gcf,'Color','w')
[durBar] = UCSF_graph([powerM(1:2,2),powerM(3:4,2)]',[powerM(1:2,1),powerM(3:4,1)]',powerC);
ylabel('Power (mV)','Fontsize',20)
%set(gca,'ytick',[0.1 0.2 0.3])
l = legend('db/+','db/db');
legend('boxoff')
legend('Location','northoutside')
age_sig = sig_check(powerP(2));
db_sig = sig_check(powerP(1));
if powerP(2) <= 0.05
A = suplabel(['age effect: ' age_sig],'t',[0.8 0.08 0.01 0.8]);
set(A,'FontSize',12)
end
if powerP(1) <= 0.05
B = suplabel(['db effect: ' db_sig],'t',[0.8 0.08 0.01 0.75]);
set(B,'FontSize',12)
end

% IRI
figure
set(gcf,'Color','w')
[iriBar] = UCSF_graph([iriM(1:2,2),iriM(3:4,2)]',[iriM(1:2,1),iriM(3:4,1)]',iriC);
ylabel('Inter-ripple Interval (s)','Fontsize',18)
set(gca,'ytick',[2500 5000 7500])
l = legend('db/+','db/db');
legend('boxoff')
legend('Location','northoutside')
age_sig = sig_check(iriP(2));
db_sig = sig_check(iriP(1));
if iriP(2) <= 0.05
A = suplabel(['age effect: ' age_sig],'t',[0.8 0.08 0.01 0.8]);
set(A,'FontSize',12)
end
if iriP(1) <= 0.05
B = suplabel(['db effect: ' db_sig],'t',[0.8 0.08 0.01 0.75]);
set(B,'FontSize',12)
end

% Duration
figure
set(gcf,'Color','w')
[durBar] = UCSF_graph([durM(1:2,2),durM(3:4,2)]',[durM(1:2,1),durM(3:4,1)]',durC);
ylabel('Ripple duration (s)','Fontsize',20)
set(gca,'ytick',[0.1 0.2 0.3])
l = legend('db/+','db/db');
legend('boxoff')
legend('Location','northoutside')
age_sig = sig_check(durP(2));
db_sig = sig_check(durP(1));
if iriP(2) <= 0.05
A = suplabel(['age effect: ' age_sig],'t',[0.8 0.08 0.01 0.8]);
set(A,'FontSize',12)
end
if iriP(1) <= 0.05
B = suplabel(['db effect: ' db_sig],'t',[0.8 0.08 0.01 0.75]);
set(B,'FontSize',12)
end

% Events
figure
set(gcf,'Color','w')
[cBar] = UCSF_graph([cM(1:2,2),cM(3:4,2)]',[cM(1:2,1),cM(3:4,1)]',cC);
ylabel('Number of SWRs','Fontsize',20)
set(gca,'ytick',[0.1 0.2 0.3])
l = legend('db/+','db/db');
legend('boxoff')
legend('Location','northoutside')
age_sig = sig_check(cP(2));
db_sig = sig_check(cP(1));
if cP(2) <= 0.05
A = suplabel(['age effect: ' age_sig],'t',[0.8 0.08 0.01 0.8]);
set(A,'FontSize',12)
end
if cP(1) <= 0.05
B = suplabel(['db effect: ' db_sig],'t',[0.8 0.08 0.01 0.75]);
set(B,'FontSize',12)
end
%
% cd('C:\Users\ipzach\Documents\dbdb electrophy\General_Scripts')
% save('DBDB_SPWR_stats',...
%     'cC','cM','cT','count_age','count_stats','count_treat','count_vals',...
%     'dur_stats','dur_vals','durC','durM','durT',...
%     'IRI_age','IRI_stats','IRI_treat','IRI_vals','iriC','iriM','iriT',...
%     'power_stats','power_vals','powerC','powerM','powerT')

function sig = sig_check(P)
if P > 0.05
    sig = 'n.s.';
elseif P <= 0.05 && P >0.01
    sig = '*';
elseif P <= 0.01 && P >0.001
    sig = '**';
elseif P <= 0.001
    sig = '***';
end
end

