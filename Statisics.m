cd('C:\Users\ipzach\Documents\dbdb electrophy\Diabetes-Saved-Files')
load('LFP Measures')
hotcold = redblue();
%% Make labels for stats
% We need two labels for a 2-way anova test, one for each variable we are
% testing
label.DB2_age = cell(size(Spec.DB2_Pyr,1),1);
label.DB2_treat = cell(size(Spec.DB2_Pyr,1),1);
label.DB2_age(:) = {'200'};
label.DB2_treat(:) = {'Control'};

label.DB4_age = cell(size(Spec.DB4_Pyr,1),1);
label.DB4_treat = cell(size(Spec.DB4_Pyr,1),1);
label.DB4_age(:) = {'400'};
label.DB4_treat(:) = {'Control'};

label.DBDB2_age = cell(size(Spec.DBDB2_Pyr,1),1);
label.DBDB2_treat = cell(size(Spec.DBDB2_Pyr,1),1);
label.DBDB2_age(:) = {'200'};
label.DBDB2_treat(:) = {'DBDB'};

label.DBDB4_age = cell(size(Spec.DBDB4_Pyr,1),1);
label.DBDB4_treat = cell(size(Spec.DBDB4_Pyr,1),1);
label.DBDB4_age(:) = {'400'};
label.DBDB4_treat(:) = {'DBDB'};

% extra set of labels for groups without removed values for windowing
label.r_DB2_age = cell(length(rip.DB2),1);
label.r_DB2_treat = cell(length(rip.DB2),1);
label.r_DB2_age(:) = {'200'};
label.r_DB2_treat(:) = {'Control'};

label.r_DB4_age = cell(length(rip.DB4),1);
label.r_DB4_treat = cell(length(rip.DB4),1);
label.r_DB4_age(:) = {'400'};
label.r_DB4_treat(:) = {'Control'};

label.r_DBDB2_age = cell(length(rip.DBDB2),1);
label.r_DBDB2_treat = cell(length(rip.DBDB2),1);
label.r_DBDB2_age(:) = {'200'};
label.r_DBDB2_treat(:) = {'DBDB'};

label.r_DBDB4_age = cell(length(rip.DBDB4),1);
label.r_DBDB4_treat = cell(length(rip.DBDB4),1);
label.r_DBDB4_age(:) = {'400'};
label.r_DBDB4_treat(:) = {'DBDB'};

age_Labs = [label.DB2_age; label.DBDB2_age; label.DB4_age; label.DBDB4_age];
treat_Labs = [label.DB2_treat; label.DBDB2_treat; label.DB4_treat; label.DBDB4_treat];

r_age_Labs = [label.r_DB2_age; label.r_DBDB2_age; label.r_DB4_age; label.r_DBDB4_age];
r_treat_Labs = [label.r_DB2_treat; label.r_DBDB2_treat; label.r_DB4_treat; label.r_DBDB4_treat];


% Process CSD into single value
CSD.DB2_max = squeeze(max(CSD.DB2,[],[1 2])); %squeeze(CSD.DB2(625:1500,4,:));
CSD.DB4_max = squeeze(max(CSD.DB4,[],[1 2])); %squeeze(CSD.DB4(625:1500,4,:));
CSD.DBDB2_max = squeeze(max(CSD.DBDB2,[],[1 2])); %squeeze(CSD.DBDB2(625:1500,3,:));
CSD.DBDB4_max = squeeze(max(CSD.DBDB4,[],[1 2])); %squeeze(CSD.DBDB4(625:1500,4,:));

CSD.DB2_min = squeeze(min(min(CSD.DB2,[],1),[],2)); %squeeze(CSD.DB2(625:1500,3,:));
CSD.DB4_min = squeeze(min(min(CSD.DB4,[],1),[],2)); %squeeze(CSD.DB4(625:1500,3,:));
CSD.DBDB2_min = squeeze(min(min(CSD.DBDB2,[],1),[],2)); %squeeze(CSD.DBDB2(625:1500,2,:));
CSD.DBDB4_min = squeeze(min(min(CSD.DBDB4,[],1),[],2)); %squeeze(CSD.DBDB4(625:1500,3,:));

CSD.DB2_full_amp = CSD.DB2_max - CSD.DB2_min;
CSD.DB4_full_amp = CSD.DB4_max - CSD.DB4_min;
CSD.DBDB2_full_amp = CSD.DBDB2_max - CSD.DBDB2_min;
CSD.DBDB4_full_amp = CSD.DBDB4_max - CSD.DBDB4_min;

% Try a more specific window
CSD.DB2_rip = mean(squeeze(CSD.DB2(650:1400,4,:)),1)';
CSD.DB4_rip = mean(squeeze(CSD.DB4(650:1400,4,:)),1)';
CSD.DBDB2_rip = mean(squeeze(CSD.DBDB2(650:1400,4,:)),1)';
CSD.DBDB4_rip = mean(squeeze(CSD.DBDB4(650:1400,4,:)),1)';

CSD.DB2_wav = mean(squeeze(CSD.DB2(650:1400,2,:)),1)';
CSD.DB4_wav = mean(squeeze(CSD.DB4(650:1400,2,:)),1)';
CSD.DBDB2_wav = mean(squeeze(CSD.DBDB2(650:1400,2,:)),1)';
CSD.DBDB4_wav = mean(squeeze(CSD.DBDB4(650:1400,2,:)),1)';

CSD.DB2_amp = CSD.DB2_rip - CSD.DB2_wav;
CSD.DB4_amp = CSD.DB4_rip - CSD.DB4_wav;
CSD.DBDB2_amp = CSD.DBDB2_rip - CSD.DBDB2_wav;
CSD.DBDB4_amp = CSD.DBDB4_rip - CSD.DBDB4_wav;
%% Stats
CSD_vals = [CSD.DB2_amp; CSD.DBDB2_amp; CSD.DB4_amp; CSD.DBDB4_amp];
CSD_full_vals = [CSD.DB2_full_amp; CSD.DBDB2_full_amp; CSD.DB4_full_amp; CSD.DBDB4_full_amp];
disp('Specific CSD')
[csdP,csdTable,CSD_stats] = anovan(CSD_vals,{treat_Labs age_Labs},'model','interaction');
[csdC,csdM,~,csdNames] = multcompare(CSD_stats,'Dimension',[1 2],'CType','bonferroni');

disp('Full CSD')
[csdfP,csdfTable,CSDf_stats] = anovan(CSD_full_vals,{treat_Labs age_Labs},'model','interaction');
[csdfC,csdfM,~,csdfNames] = multcompare(CSDf_stats,'Dimension',[1 2],'CType','bonferroni');
% Spectrogram
disp('Ctx Spec')
ctxVals = [Spec.DB2_Ctx; Spec.DBDB2_Ctx;Spec.DB4_Ctx; Spec.DBDB4_Ctx];
pyrVals = [Spec.DB2_Pyr; Spec.DBDB2_Pyr;Spec.DB4_Pyr; Spec.DBDB4_Pyr];
slmVals = [Spec.DB2_SLM; Spec.DBDB2_SLM;Spec.DB4_SLM; Spec.DBDB4_SLM];

[ctxP,ctxT,ctxStats] = anovan(ctxVals,{treat_Labs age_Labs},'model','interaction');
[ctxC,ctxM,~,ctxN] = multcompare(ctxStats,'Dimension',[1 2],'CType','bonferroni');

disp('Pyr Spec')
[pyrP,pyrT,pyrStats] = anovan(pyrVals,{treat_Labs age_Labs},'model','interaction');
[pyrC,pyrM,~,pyrN] = multcompare(pyrStats,'Dimension',[1 2],'CType','bonferroni');

disp('Slm Spec')
[slmP,slmT,slmStats] = anovan(slmVals,{treat_Labs age_Labs},'model','interaction');
[slmC,slmM,~,slmN] = multcompare(slmStats,'Dimension',[1 2],'CType','bonferroni');

% Power

disp('Power')
power_vals = [rip.DB2(:,7); rip.DB4(:,7); rip.DBDB2(:,7); rip.DBDB4(:,7)];

[powerP,powerT,power_stats] = anovan(power_vals, {r_treat_Labs, r_age_Labs},'model','interaction');% ,'display','off');
[powerC,powerM,~,powerNames] = multcompare(power_stats,'Dimension',[1 2],'CType','bonferroni');

% Duration
disp('Duration')
dur_vals = [rip.DB2(:,2)-rip.DB2(:,1);  rip.DBDB2(:,2)-rip.DBDB2(:,1); rip.DB4(:,2)-rip.DB4(:,1); rip.DBDB4(:,2)-rip.DBDB4(:,1)] ./1250;

[durP,durT,dur_stats] = anovan(dur_vals, {r_treat_Labs, r_age_Labs},'model','interaction'); % ,'display','off');
[durC,durM,~,durNames] = multcompare(dur_stats,'Dimension',[1 2],'CType','bonferroni');

% Slowing score
disp('Slowing score')
% Group,Animal,Layer_comb
for lay_comb = 1:3
    % First we want to grab individual values, create 2-way labels for
    % them, then concatenate everything together
    temp = slowing_score(:,:,lay_comb)';
    
    SS_Ct200 = temp(:,1);
    SS_DB200 = temp(1:6,2);
    SS_Ct400 = temp(1:5,3);
    SS_DB400 = temp(1:5,4);
    
    Ct2AgeLab = cell(length(SS_Ct200),1);
    Ct2AgeLab(:) = {'200'};
    Ct2DbLab = cell(length(SS_Ct200),1);
    Ct2DbLab(:) = {'Ctrl'};
    
    Ct4AgeLab = cell(length(SS_Ct400),1);
    Ct4AgeLab(:) = {'400'};
    Ct4DbLab = cell(length(SS_Ct400),1);
    Ct4DbLab(:) = {'Ctrl'};
    
    Db2AgeLab = cell(length(SS_DB200),1);
    Db2AgeLab(:) = {'200'};
    Db2DbLab = cell(length(SS_DB200),1);
    Db2DbLab(:) = {'DBDB'};
    
    Db4AgeLab = cell(length(SS_DB400),1);
    Db4AgeLab(:) = {'400'};
    Db4DbLab = cell(length(SS_DB400),1);
    Db4DbLab(:) = {'DBDB'};
    
    vals = [SS_Ct200; SS_DB200; SS_Ct400; SS_DB400];
    ageLabs = [Ct2AgeLab; Db2AgeLab;Ct4AgeLab; Db4AgeLab];
    dbLabs = [Ct2DbLab; Db2DbLab; Ct4DbLab; Db4DbLab];
    
    [ssP,ssT,ssStats] = anovan(vals,{dbLabs ageLabs},'model','interaction'); %,'display','off');
    [ssC,ssM,~,ssN] = multcompare(ssStats,'Dimension',[1 2],'CType','bonferroni'); % ,'display','off');
end

%% Coherence
disp('Coherence')
% Group, Animal, freq_band, Layer_comb
Ct2AgeLab = cell(sum(~isnan(Co(1,:,1,1))),1);
Ct2AgeLab(:) = {'200'};
Ct2DbLab = cell(sum(~isnan(Co(1,:,1,1))),1);
Ct2DbLab(:) = {'Ctrl'};

Ct4AgeLab = cell(sum(~isnan(Co(2,:,1,1))),1);
Ct4AgeLab(:) = {'400'};
Ct4DbLab = cell(sum(~isnan(Co(2,:,1,1))),1);
Ct4DbLab(:) = {'Ctrl'};

Db2AgeLab = cell(sum(~isnan(Co(3,:,1,1))),1);
Db2AgeLab(:) = {'200'};
Db2DbLab = cell(sum(~isnan(Co(3,:,1,1))),1);
Db2DbLab(:) = {'DBDB'};

Db4AgeLab = cell(sum(~isnan(Co(4,:,1,1))),1);
Db4AgeLab(:) = {'400'};
Db4DbLab = cell(sum(~isnan(Co(4,:,1,1))),1);
Db4DbLab(:) = {'DBDB'};

for lay_comb = 1:3
    switch lay_comb
        case 1
            comb_name = 'Ctx-Pyr';
        case 2
            comb_name = 'Ctx-Slm';
        case 3
            comb_name = 'Pyr-Slm';
    end % switch layComb
    disp(comb_name)
    for band = 1:7
        switch band
            case 1
                groupName = 'Delta';
            case 2
                groupName = 'Theta';
            case 3
                groupName = 'Alpha';
            case 4
                groupName = 'Beta';
            case 5
                groupName = 'Gamma';
            case 6
                groupName = 'High Gamma';
            case 7
                groupName = 'Full';
        end
        
            Coh_Ct200_w_nan = Co(1,:,band,lay_comb)';
            Coh_Ct200 = Coh_Ct200_w_nan(~isnan(Coh_Ct200_w_nan));
            
            Coh_Ct400_w_nan = Co(2,:,band,lay_comb)';
            Coh_Ct400 = Coh_Ct400_w_nan(~isnan(Coh_Ct400_w_nan));
            
            Coh_DB200_w_nan = Co(3,:,band,lay_comb)';
            Coh_DB200 = Coh_DB200_w_nan(~isnan(Coh_DB200_w_nan));
            
            Coh_DB400_w_nan = Co(4,:,band,lay_comb)';
            Coh_DB400 = Coh_DB400_w_nan(~isnan(Coh_DB400_w_nan));
          
        % First we want to grab individual values, create 2-way labels for
        % them, then concatenate everything together
        
        vals = [Coh_Ct200; Coh_DB200; Coh_Ct400; Coh_DB400];
        ageLabs = [Ct2AgeLab; Db2AgeLab;Ct4AgeLab; Db4AgeLab];
        dbLabs = [Ct2DbLab; Db2DbLab; Ct4DbLab; Db4DbLab];
        disp(groupName)
        [cohP,cohT,cohStats] = anovan(vals,{dbLabs ageLabs},'model','interaction');% ,'display','off');
        [cohC,cohM,~,cohN] = multcompare(cohStats,'Dimension',[1 2],'CType','bonferroni'); %,'display','off');
        
    end
end

