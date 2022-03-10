cd('C:\Users\ipzach\Documents\dbdb electrophy\Diabetes-Saved-Files')
load('LFP Measures')

%% Make labels for stats
% We need two labels for a 2-way anova test, one for each variable we are
% testing
label.DB2age = cell(size(Spec.DB2Pyr,3),1);
label.DB2treat = cell(size(Spec.DB2Pyr,3),1);
label.DB2age(:) = {'200'};
label.DB2treat(:) = {'Control'};

label.DB4age = cell(size(Spec.DB4Pyr,3),1);
label.DB4treat = cell(size(Spec.DB4Pyr,3),1);
label.DB4age(:) = {'400'};
label.DB4treat(:) = {'Control'};

label.DBDB2age = cell(size(Spec.DBDB2Pyr,3),1);
label.DBDB2treat = cell(size(Spec.DBDB2Pyr,3),1);
label.DBDB2age(:) = {'200'};
label.DBDB2treat(:) = {'DBDB'};

label.DBDB4age = cell(size(Spec.DBDB4Pyr,3),1);
label.DBDB4treat = cell(size(Spec.DBDB4Pyr,3),1);
label.DBDB4age(:) = {'400'};
label.DBDB4treat(:) = {'DBDB'};

% CSD labels
label.cDB2age = cell(size(CSD.DB2,3),1);
label.cDB2treat = cell(size(CSD.DB2,3),1);
label.cDB2age(:) = {'200'};
label.cDB2treat(:) = {'Control'};

label.cDB4age = cell(size(CSD.DB4,3),1);
label.cDB4treat = cell(size(CSD.DB4,3),1);
label.cDB4age(:) = {'400'};
label.cDB4treat(:) = {'Control'};

label.cDBDB2age = cell(size(CSD.DBDB2,3),1);
label.cDBDB2treat = cell(size(CSD.DBDB2,3),1);
label.cDBDB2age(:) = {'200'};
label.cDBDB2treat(:) = {'DBDB'};

label.cDBDB4age = cell(size(CSD.DBDB4,3),1);
label.cDBDB4treat = cell(size(CSD.DBDB4,3),1);
label.cDBDB4age(:) = {'400'};
label.cDBDB4treat(:) = {'DBDB'};

% Final set of labels for groups without removed values for windowing
label.rDB2age = cell(length(rip.DB2),1);
label.rDB2treat = cell(length(rip.DB2),1);
label.rDB2age(:) = {'200'};
label.rDB2treat(:) = {'Control'};

label.rDB4age = cell(length(rip.DB4),1);
label.rDB4treat = cell(length(rip.DB4),1);
label.rDB4age(:) = {'400'};
label.rDB4treat(:) = {'Control'};

label.rDBDB2age = cell(length(rip.DBDB2),1);
label.rDBDB2treat = cell(length(rip.DBDB2),1);
label.rDBDB2age(:) = {'200'};
label.rDBDB2treat(:) = {'DBDB'};

label.rDBDB4age = cell(length(rip.DBDB4),1);
label.rDBDB4treat = cell(length(rip.DBDB4),1);
label.rDBDB4age(:) = {'400'};
label.rDBDB4treat(:) = {'DBDB'};
%% stats
ageLabs = [label.DB2age; label.DBDB2age; label.DB4age; label.DBDB4age];
treatLabs = [label.DB2treat; label.DBDB2treat; label.DB4treat; label.DBDB4treat];

r_ageLabs = [label.rDB2age; label.rDBDB2age; label.rDB4age; label.rDBDB4age];
r_treatLabs = [label.rDB2treat; label.rDBDB2treat; label.rDB4treat; label.rDBDB4treat];

c_ageLabs = [label.cDB2age; label.cDBDB2age; label.rDB4age; label.rDBDB4age];
c_treatLabs = [label.cDB2treat; label.cDBDB2treat; label.rDB4treat; label.rDBDB4treat];


% CSD
CSD.DB2max = squeeze(max(max(CSD.DB2,[],1),[],2)); %squeeze(CSD.DB2(625:1500,4,:));
CSD.DB4max = squeeze(max(max(CSD.DB4,[],1),[],2)); %squeeze(CSD.DB4(625:1500,4,:));
CSD.DBDB2max = squeeze(max(max(CSD.DBDB2,[],1),[],2)); %squeeze(CSD.DBDB2(625:1500,3,:));
CSD.DBDB4max = squeeze(max(max(CSD.DBDB4,[],1),[],2)); %squeeze(CSD.DBDB4(625:1500,4,:));

CSD.DB2min = squeeze(min(min(CSD.DB2,[],1),[],2)); %squeeze(CSD.DB2(625:1500,3,:));
CSD.DB4min = squeeze(min(min(CSD.DB4,[],1),[],2)); %squeeze(CSD.DB4(625:1500,3,:));
CSD.DBDB2min = squeeze(min(min(CSD.DBDB2,[],1),[],2)); %squeeze(CSD.DBDB2(625:1500,2,:));
CSD.DBDB4min = squeeze(min(min(CSD.DBDB4,[],1),[],2)); %squeeze(CSD.DBDB4(625:1500,3,:));

CSD.DB2i = CSD.DB2max - CSD.DB2min;
CSD.DB4i = CSD.DB4max - CSD.DB4min;
CSD.DBDB2i = CSD.DBDB2max - CSD.DBDB2min;
CSD.DBDB4i = CSD.DBDB4max - CSD.DBDB4min;

CSD_vals = [CSD.DB2i; CSD.DBDB2i; CSD.DB4i; CSD.DBDB4i];

[csdP,csdTable,CSD_stats] = anovan(CSD_vals,{c_treatLabs c_ageLabs},'model','interaction');
[csdC,csdM,~,csdNames] = multcompare(CSD_stats,'Dimension',[1 2],'CType','bonferroni');

% Spectrogram
ctxVals = [Spec.DB2CtxVals; Spec.DBDB2CtxVals;Spec.DB4CtxVals; Spec.DBDB4CtxVals];
pyrVals = [Spec.DB2PyrVals; Spec.DBDB2PyrVals;Spec.DB4PyrVals; Spec.DBDB4PyrVals];
slmVals = [Spec.DB2SLMVals; Spec.DBDB2SLMVals;Spec.DB4SLMVals; Spec.DBDB4SLMVals];

[ctxP,ctxT,ctxStats] = anovan(ctxVals,{treatLabs ageLabs},'model','interaction');
[ctxC,ctxM,~,ctxN] = multcompare(ctxStats,'Dimension',[1 2],'CType','bonferroni');

[pyrP,pyrT,pyrStats] = anovan(pyrVals,{treatLabs ageLabs},'model','interaction');
[pyrC,pyrM,~,pyrN] = multcompare(pyrStats,'Dimension',[1 2],'CType','bonferroni');

[slmP,slmT,slmStats] = anovan(slmVals,{treatLabs ageLabs},'model','interaction');
[slmC,slmM,~,slmN] = multcompare(slmStats,'Dimension',[1 2],'CType','bonferroni');



% Power
power_vals = [rip.DB2(:,7); rip.DB4(:,7); rip.DBDB2(:,7); rip.DBDB4(:,7)];
[powerP,powerT,power_stats] = anovan(power_vals, {r_treatLabs, r_ageLabs},'model','interaction');% ,'display','off');
[powerC,powerM,~,powerNames] = multcompare(power_stats,'Dimension',[1 2],'CType','bonferroni');

% Duration
dur_vals = [rip.DB2(:,2)-rip.DB2(:,1);  rip.DBDB2(:,2)-rip.DBDB2(:,1); rip.DB4(:,2)-rip.DB4(:,1); rip.DBDB4(:,2)-rip.DBDB4(:,1)] ./1250;
[durP,durT,dur_stats] = anovan(dur_vals, {r_treatLabs, r_ageLabs},'model','interaction'); % ,'display','off');
[durC,durM,~,durNames] = multcompare(dur_stats,'Dimension',[1 2],'CType','bonferroni');






