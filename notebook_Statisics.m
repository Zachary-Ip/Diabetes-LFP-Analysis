%%%%%%
user = 'Z'; %'Z' for Zach or 'S' for Shahram for path stuff


switch user
    case 'Z'
        cd('C:\Users\ipzach\Documents\MATLAB\output\Diabetes-Saved-Files')
        addpath('C:\Users\ipzach\Documents\MATLAB\Toolbox Zach', ...
            'C:\Users\ipzach\Documents\MATLAB\spectral-analysis-tools')
        load('C:\Users\ipzach\Documents\MATLAB\Toolbox Zach\Colors.mat');
        
    case 'S'
        cd('C:\COM\ePhy\dbdb\Data\Outputs\Data')
end
load('LFP Measures')

hotcold = redblue();

%% Make labels for stats
% We need two labels for a 2-way anova test, one for each variable we are
% testing
label.DB2_age = cell(size(Gamma.DB2_Pyr, 2), 1);
label.DB2_treat = cell(size(Gamma.DB2_Pyr, 2), 1);
label.DB2_age(:) = {'200'};
label.DB2_treat(:) = {'Control'};

label.DB4_age = cell(size(Gamma.DB4_Pyr, 2), 1);
label.DB4_treat = cell(size(Gamma.DB4_Pyr, 2), 1);
label.DB4_age(:) = {'400'};
label.DB4_treat(:) = {'Control'};

label.DBDB2_age = cell(size(Gamma.DBDB2_Pyr, 2), 1);
label.DBDB2_treat = cell(size(Gamma.DBDB2_Pyr, 2), 1);
label.DBDB2_age(:) = {'200'};
label.DBDB2_treat(:) = {'DBDB'};

label.DBDB4_age = cell(size(Gamma.DBDB4_Pyr, 2), 1);
label.DBDB4_treat = cell(size(Gamma.DBDB4_Pyr, 2), 1);
label.DBDB4_age(:) = {'400'};
label.DBDB4_treat(:) = {'DBDB'};

% extra set of labels for groups without removed values for windowing
label.r_DB2_age = cell(length(rip.DB2), 1);
label.r_DB2_treat = cell(length(rip.DB2), 1);
label.r_DB2_age(:) = {'200'};
label.r_DB2_treat(:) = {'Control'};

label.r_DB4_age = cell(length(rip.DB4), 1);
label.r_DB4_treat = cell(length(rip.DB4), 1);
label.r_DB4_age(:) = {'400'};
label.r_DB4_treat(:) = {'Control'};

label.r_DBDB2_age = cell(length(rip.DBDB2), 1);
label.r_DBDB2_treat = cell(length(rip.DBDB2), 1);
label.r_DBDB2_age(:) = {'200'};
label.r_DBDB2_treat(:) = {'DBDB'};

label.r_DBDB4_age = cell(length(rip.DBDB4), 1);
label.r_DBDB4_treat = cell(length(rip.DBDB4), 1);
label.r_DBDB4_age(:) = {'400'};
label.r_DBDB4_treat(:) = {'DBDB'};

age_Labs = [label.DB2_age; label.DBDB2_age; label.DB4_age; label.DBDB4_age];
treat_Labs = [label.DB2_treat; label.DBDB2_treat; label.DB4_treat; label.DBDB4_treat];

r_age_Labs = [label.r_DB2_age; label.r_DBDB2_age; label.r_DB4_age; label.r_DBDB4_age];
r_treat_Labs = [label.r_DB2_treat; label.r_DBDB2_treat; label.r_DB4_treat; label.r_DBDB4_treat];

slowing_score_Ct2AgeLab = cell(sum(~isnan(slowing_score(1, :, 1))), 1);
slowing_score_Ct2AgeLab(:) = {'200'};
slowing_score_Ct2DbLab = cell(sum(~isnan(slowing_score(1, :, 1))), 1);
slowing_score_Ct2DbLab(:) = {'Ctrl'};

slowing_score_Ct4AgeLab = cell(sum(~isnan(slowing_score(2, :, 1))), 1);
slowing_score_Ct4AgeLab(:) = {'400'};
slowing_score_Ct4DbLab = cell(sum(~isnan(slowing_score(2, :, 1))), 1);
slowing_score_Ct4DbLab(:) = {'Ctrl'};

slowing_score_Db2AgeLab = cell(sum(~isnan(slowing_score(3, :, 1))), 1);
slowing_score_Db2AgeLab(:) = {'200'};
slowing_score_Db2DbLab = cell(sum(~isnan(slowing_score(3, :, 1))), 1);
slowing_score_Db2DbLab(:) = {'DBDB'};

slowing_score_Db4AgeLab = cell(sum(~isnan(slowing_score(4, :, 1))), 1);
slowing_score_Db4AgeLab(:) = {'400'};
slowing_score_Db4DbLab = cell(sum(~isnan(slowing_score(4, :, 1))), 1);
slowing_score_Db4DbLab(:) = {'DBDB'};


slowing_score_age_Labs = [slowing_score_Ct2AgeLab; slowing_score_Db2AgeLab; slowing_score_Ct4AgeLab; slowing_score_Db4AgeLab];
slowing_score_db_Labs = [slowing_score_Ct2DbLab; slowing_score_Db2DbLab; slowing_score_Ct4DbLab; slowing_score_Db4DbLab];


state_changes_Ct2AgeLab = cell(sum(~isnan(state_changes(1, :))), 1);
state_changes_Ct2AgeLab(:) = {'200'};
state_changes_Ct2DbLab = cell(sum(~isnan(state_changes(1, :))), 1);
state_changes_Ct2DbLab(:) = {'Ctrl'};

state_changes_Ct4AgeLab = cell(sum(~isnan(state_changes(2, :))), 1);
state_changes_Ct4AgeLab(:) = {'400'};
state_changes_Ct4DbLab = cell(sum(~isnan(state_changes(2, :))), 1);
state_changes_Ct4DbLab(:) = {'Ctrl'};

state_changes_Db2AgeLab = cell(sum(~isnan(state_changes(3, :))), 1);
state_changes_Db2AgeLab(:) = {'200'};
state_changes_Db2DbLab = cell(sum(~isnan(state_changes(3, :))), 1);
state_changes_Db2DbLab(:) = {'DBDB'};

state_changes_Db4AgeLab = cell(sum(~isnan(state_changes(4, :))), 1);
state_changes_Db4AgeLab(:) = {'400'};
state_changes_Db4DbLab = cell(sum(~isnan(state_changes(4, :))), 1);
state_changes_Db4DbLab(:) = {'DBDB'};


state_changes_age_Labs = [state_changes_Ct2AgeLab; state_changes_Db2AgeLab; state_changes_Ct4AgeLab; state_changes_Db4AgeLab];
state_changes_db_Labs = [state_changes_Ct2DbLab; state_changes_Db2DbLab; state_changes_Ct4DbLab; state_changes_Db4DbLab];

clear per_animal_Ct2AgeLab per_animal_Ct2DbLab per_animal_Ct4AgeLab per_animal_Ct4DbLab per_animal_Db2AgeLab per_animal_Db2DbLab per_animal_Db4AgeLab per_animal_Db4DbLab

%% Slowing score
disp('Slowing score')

figure
set(gcf, 'Position', [100, 100, 800, 400])
for lay_comb = 1:3
    switch lay_comb
        case 1
            layer = 'cortex';
        case 2
            layer = 'pyramidal';
        case 3
            layer = 'slm';
    end
    
    % First we want to grab individual values, create 2-way labels for
    % them, then concatenate everything together
    SS_Ct200_w_nan = slowing_score(1, :, lay_comb)';
    SS_Ct200 = SS_Ct200_w_nan(~isnan(SS_Ct200_w_nan));
    
    SS_Ct400_w_nan = slowing_score(2, :, lay_comb)';
    SS_Ct400 = SS_Ct400_w_nan(~isnan(SS_Ct400_w_nan));
    
    SS_DB200_w_nan = slowing_score(3, :, lay_comb)';
    SS_DB200 = SS_DB200_w_nan(~isnan(SS_DB200_w_nan));
    
    SS_DB400_w_nan = slowing_score(4, :, lay_comb)';
    SS_DB400 = SS_DB400_w_nan(~isnan(SS_DB400_w_nan));
    
    slow_score_vals = [SS_Ct200; SS_DB200; SS_Ct400; SS_DB400];
    summary_slow_score.means = [mean(SS_Ct200), mean(SS_DB200), mean(SS_Ct400), mean(SS_DB400)];
    summary_slow_score.SD = [std(SS_Ct200), std(SS_DB200), std(SS_Ct400), std(SS_DB400)];
    summary_slow_score.n = [length(SS_Ct200), length(SS_DB200), length(SS_Ct400), length(SS_DB400)];
    disp(num2str(lay_comb))
    
    UCSF_create_excel('SlowingScore', summary_slow_score, ['slow_score_', layer], user)
    [ssP, ssT, ssStats] = anovan(slow_score_vals, {slowing_score_db_Labs, slowing_score_age_Labs}, 'model', 'interaction', 'display', 'off');
    [ssC, ssM, ~, ssN] = multcompare(ssStats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
    disp(ssP)
    %MS subplot(1, 2, lay_comb-1) %This line was replaced by the next line
    figure
    set(gcf, 'Color', 'w', 'Position',[100 100 300 450]);
    pli_data = NaN(7,4);
    pli_data(:,1) = SS_Ct200';
    pli_data(1:6,2) = SS_DB200';
    pli_data(1:5,3) = SS_Ct400';
    pli_data(1:5,4) = SS_DB400';
    plot_bee(pli_data,...
        {'Ctrl 200','DB 200','Ctrl 400','DB 400'},...
        ssC,...
        [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
    title(layer)
    ylabel('Slowing Score')
    % create_bar_figure(summary_slow_score.SD, summary_slow_score.means, ssC);
    %sig_values(ssP(2), ssP(1));
    
    %set(gca, 'ytick', [0, 6, 12])
    ylim([0, 25])
    xtickangle(60)
    
end

%% Spectral exponent

% First we want to grab individual values, create 2-way labels for
% them, then concatenate everything together
idx = ~cellfun('isempty', intSlo0_Store);
SE = NaN(size(intSlo_Store));
SE(idx) = cellfun(@(v)v(2), intSlo0_Store(idx));
for i = 1:3
    switch i
        case 1
            layer = 'ctx';
        case 2
            layer = 'pyr';
        case 3
            layer = 'slm';
    end
    SE_Ct200_w_nan = SE(1, :, i)';
    SE_Ct200 = SE_Ct200_w_nan(~isnan(SE_Ct200_w_nan));
    
    SE_Ct400_w_nan = SE(2, :, i)';
    SE_Ct400 = SE_Ct400_w_nan(~isnan(SE_Ct400_w_nan));
    
    SE_DB200_w_nan = SE(3, :, i)';
    SE_DB200 = SE_DB200_w_nan(~isnan(SE_DB200_w_nan));
    
    SE_DB400_w_nan = SE(4, :, i)';
    SE_DB400 = SE_DB400_w_nan(~isnan(SE_DB400_w_nan));
    
    SE_vals = [SE_Ct200; SE_DB200; SE_Ct400; SE_DB400];
    
    summary_SE.means = [mean(SE_Ct200), mean(SE_DB200), mean(SE_Ct400), mean(SE_DB400)];
    summary_SE.SD = [std(SE_Ct200), std(SE_DB200), std(SE_Ct400), std(SE_DB400)];
    summary_SE.n = [length(SE_Ct200), length(SE_DB200), length(SE_Ct400), length(SE_DB400)];
    
    
    [seP, seT, seStats] = anovan(SE_vals, {slowing_score_db_Labs, slowing_score_age_Labs}, 'model', 'interaction', 'display', 'off');
    [seC, seM, ~, seN] = multcompare(seStats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
    disp(layer)
    disp(seT)
    % Spectral exponent figure
    XXi = Pows_store(1, 1).frex;
    YYi = NaN(7, 516);
    int_Slo = NaN(7, 2);
    figure
    set(gcf, 'Position', [100, 100, 700, 300])
    subplot(1, 2, 1)
    for j = [4, 3, 2, 1]
        switch j
            case 1
                %color = [194, 194, 194] ./255;
                color = RGB.c200;
            case 2
                %color = [128, 128, 128] ./255;
                color = RGB.c400;
            case 3
                %color = [247,149,114] ./255;
                color = RGB.db200;
            case 4
                %color = [212, 120, 86] ./255;
                color = RGB.db400;
        end
        for k = 1:7
            try
                YYi(k, :) = Pows_store(j, k, i).obs;
                int_Slo(k, :) = intSlo0_Store{j, k, i};
            catch
                continue
            end
        end
        YYi = rmmissing(YYi);
        int = nanmean(int_Slo(:, 1));
        slo = nanmean(int_Slo(:, 2));
        Xi = log10(XXi);
        
        stdshade(log(YYi), 0.2, color, log(XXi)); hold on,
        YYpred0 = 10.^(int + slo * (Xi))';
        plot(log(XXi([1, end])), log(YYpred0([1, end])), 'LineWidth', 1.5, 'color', color);
        set(gca, 'FontSize', 14, 'TickDir', 'out');
        box off
        xlim([0, 3.6])
        xticks([0.2 1.2 2.2 3.2])
        xticklabels({'1','5','10','50'});
    end
    subplot(1, 2, 2)
    se_data = NaN(7,4);
    se_data(:,1) = SE_Ct200';
    se_data(1:6,2) = SE_DB200';
    se_data(1:5,3) = SE_Ct400';
    se_data(1:5,4) = SE_DB400';
    plot_bee(se_data,...
        {'Ctrl 200','DB 200','Ctrl 400','DB 400'},...
        seC,...
        [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
    %create_bar_figure(summary_SE.SD, summary_SE.means, seC);
    %    UCSF_create_excel('SpecExpoB', summary_SE, 'Spectral_Exponent', user)
    %xtickangle(60)
    set(gcf, 'Color', 'w');
    
    title(layer)
    if strcmp(user, 'S')
        Datetime_SpecExpoB = string(datetime('now'));
        cd('C:\COM\ePhy\dbdb\Data\Outputs\Data\SpecExpoB')
        Filename_SpecExpoB = sprintf('Spectral_Exponent_Figure_%s.tiff', Datetime_SpecExpoB);
        Filename_SpecExpoB = regexprep(Filename_SpecExpoB, ' ', '_');
        Filename_SpecExpoB = regexprep(Filename_SpecExpoB, ':', '_');
        saveas(gcf, Filename_SpecExpoB);
    end
end
%% PLI
% group,animal, band, layer

for lay_comb = 1:3
    switch lay_comb
        case 1
            comb_name = 'Ctx-Pyr';
        case 2
            comb_name = 'Ctx-Slm';
        case 3
            comb_name = 'Pyr-Slm';
    end % switch layComb
    figure
set(gcf, 'Position', [100, 100, 900, 200])
    for band = 1:6
        switch band
            case 1
                group_name = 'Delta ';
            case 2
                group_name = 'Theta ';
            case 3
                group_name = 'Alpha ';
            case 4
                group_name = 'Beta ';
            case 5
                group_name = 'Gamma ';
            case 6
                group_name = 'High Gamma ';
            case 7
                group_name = 'Full ';
        end
        
        % First we want to grab individual values, create 2-way labels for
        % them, then concatenate everything together
        PLI_Ct200_w_nan = PLI(1, :, band, lay_comb)';
        PLI_Ct200 = PLI_Ct200_w_nan(~isnan(PLI_Ct200_w_nan));
        
        PLI_Ct400_w_nan = PLI(2, :, band, lay_comb)';
        PLI_Ct400 = PLI_Ct400_w_nan(~isnan(PLI_Ct400_w_nan));
        
        PLI_DB200_w_nan = PLI(3, :, band, lay_comb)';
        PLI_DB200 = PLI_DB200_w_nan(~isnan(PLI_DB200_w_nan));
        
        PLI_DB400_w_nan = PLI(4, :, band, lay_comb)';
        PLI_DB400 = PLI_DB400_w_nan(~isnan(PLI_DB400_w_nan));
        
        PLI_vals = [PLI_Ct200; PLI_DB200; PLI_Ct400; PLI_DB400];
        
        [pliP, pliT, pliStats] = anovan(PLI_vals, {slowing_score_db_Labs, slowing_score_age_Labs}, 'model', 'interaction', 'display', 'off');
        [pliC, pliM, ~, pliN] = multcompare(pliStats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
        
        summary_PLI.means = [mean(PLI_Ct200), mean(PLI_DB200), mean(PLI_Ct400), mean(PLI_DB400)];
        summary_PLI.SD = [std(PLI_Ct200), std(PLI_DB200), std(PLI_Ct400), std(PLI_DB400)];
        summary_PLI.n = [length(PLI_Ct200), length(PLI_DB200), length(PLI_Ct400), length(PLI_DB400)];
        %MS
        %UCSF_create_excel('PLI', summary_PLI, [group_name, '_PLI'], user)
        %ME
        subaxis(1, 6, band, 'SpacingHoriz', 0.01)
        pli_data = NaN(7,4);
        pli_data(:,1) = PLI_Ct200';
        pli_data(1:6,2) = PLI_DB200';
        pli_data(1:5,3) = PLI_Ct400';
        pli_data(1:5,4) = PLI_DB400';
        plot_bee(pli_data,...
            {'Ctrl 200','DB 200','Ctrl 400','DB 400'},...
            pliC,...
            [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
        set(gca, 'ytick',[0 1],'XColor', 'none')
        ylim([0 1])
        % create_bar_figure(summary_PLI.SD, summary_PLI.means, pliC);
        %title(group_name)
        
        %sig_values(pliP(2), pliP(1));
        if band == 1
        ylabel(comb_name)
        else
            set(gca, 'YColor', 'none')
        end
        set(gcf, 'Color', 'w');
        xtickangle(60)
        
        %ME
        %set(gca,'ytick',[0 1])
        %ylim([0 1])
        %         switch lay_comb
        %             case 1
        %                 title([group_name comb_name])
        %             case 2
        %                 title([group_name comb_name])
        %             case 3
        %                 title([group_name comb_name])
        %         end
    end
end
%MS

if strcmp(user, 'S')
    
    
    Datetime_PLI = string(datetime('now'));
    cd('C:\COM\ePhy\dbdb\Data\Outputs\Data\PLI')
    Filename_PLI = sprintf('PLI_Figure_%s.tiff', Datetime_PLI);
    Filename_PLI = regexprep(Filename_PLI, ' ', '_');
    Filename_PLI = regexprep(Filename_PLI, ':', '_');
    saveas(gcf, Filename_PLI);
end

%% State changes
SC_Ct200_w_nan = state_changes(1, :)';
SC_Ct200 = SC_Ct200_w_nan(~isnan(SC_Ct200_w_nan));

SC_Ct400_w_nan = state_changes(2, :)';
SC_Ct400 = SC_Ct400_w_nan(~isnan(SC_Ct400_w_nan));

SC_DB200_w_nan = state_changes(3, :)';
SC_DB200 = SC_DB200_w_nan(~isnan(SC_DB200_w_nan));

SC_DB400_w_nan = state_changes(4, :)';
SC_DB400 = SC_DB400_w_nan(~isnan(SC_DB400_w_nan));

state_changes_vals = [SC_Ct200; SC_DB200; SC_Ct400; SC_DB400];

summary_SC.means = [mean(SC_Ct200), mean(SC_DB200), mean(SC_Ct400), mean(SC_DB400)];
summary_SC.SD = [std(SC_Ct200), std(SC_DB200), std(SC_Ct400), std(SC_DB400)];
summary_SC.n = [length(SC_Ct200), length(SC_DB200), length(SC_Ct400), length(SC_DB400)];

[scP, scT, scStats] = anovan(state_changes_vals, {state_changes_db_Labs, state_changes_age_Labs}, 'model', 'interaction', 'display', 'off');
[scC, scM, ~, scN] = multcompare(scStats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
figure

create_bar_figure(summary_SC.SD, summary_SC.means, scC);
sig_values(scP(2), scP(1));
title('State changes')
ylabel('Number of states')

%% Coherence
disp('Coherence')
count = 0;
figure
set(gcf, 'Color', 'w', 'Position', [100, 100, 900, 450])
for lay_comb = 1:2 % 1:3
    switch lay_comb
        case 1
            comb_name = 'Ctx-Pyr';
        case 2
            comb_name = 'Ctx-Slm';
        case 3
            comb_name = 'Pyr-Slm';
    end % switch layComb
    disp(comb_name)
    for band = 1:6
        switch band
            case 1
                group_name = 'Delta';
            case 2
                group_name = 'Theta';
            case 3
                group_name = 'Alpha';
            case 4
                group_name = 'Beta';
            case 5
                group_name = 'Gamma';
            case 6
                group_name = 'High Gamma';
            case 7
                group_name = 'Full';
        end
        
        count = count + 1;
        
        Coh_Ct200_w_nan = Co(1, :, band, lay_comb)';
        Coh_Ct200 = Coh_Ct200_w_nan(~isnan(Coh_Ct200_w_nan));
        
        Coh_Ct400_w_nan = Co(2, :, band, lay_comb)';
        Coh_Ct400 = Coh_Ct400_w_nan(~isnan(Coh_Ct400_w_nan));
        
        Coh_DB200_w_nan = Co(3, :, band, lay_comb)';
        Coh_DB200 = Coh_DB200_w_nan(~isnan(Coh_DB200_w_nan));
        
        Coh_DB400_w_nan = Co(4, :, band, lay_comb)';
        Coh_DB400 = Coh_DB400_w_nan(~isnan(Coh_DB400_w_nan));
        
        % First we want to grab individual values, create 2-way labels for
        % them, then concatenate everything together
        
        coh_vals = [Coh_Ct200; Coh_DB200; Coh_Ct400; Coh_DB400];
        %MS
        summary_Coh.means = [mean(Coh_Ct200), mean(Coh_DB200), mean(Coh_Ct400), mean(Coh_DB400)];
        summary_Coh.SD = [std(Coh_Ct200), std(Coh_DB200), std(Coh_Ct400), std(Coh_DB400)];
        summary_Coh.n = [length(Coh_Ct200), length(Coh_DB200), length(Coh_Ct400), length(Coh_DB400)];
        %ME
        disp(group_name)
        [cohP, cohT, cohStats] = anovan(coh_vals, {slowing_score_db_Labs, slowing_score_age_Labs}, 'model', 'interaction', 'display', 'off');
        [cohC, cohM, ~, cohN] = multcompare(cohStats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
        %
        disp(cohP)
        coh_data = NaN(7,4);
        coh_data(:,1) = Coh_Ct200';
        coh_data(1:6,2) = Coh_DB200';
        coh_data(1:5,3) = Coh_Ct400';
        coh_data(1:5,4) = Coh_DB400';
        
        subaxis(2, 6, count, 'SpacingHoriz', 0.01, 'SpacingVert', 0.05)
        % create_bar_figure(summary_Coh.SD, summary_Coh.means, cohC);
        plot_bee(coh_data,...
            {'Ctrl 200','DB 200','Ctrl 400','DB 400'},...
            cohC,...
            [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
        ylim([0 1])
        
        
        %UCSF_create_excel('Coherence', summary_Coh, [comb_name, '_', group_name, '_Coherence'], user)
        if strcmp(user, 'S')
            Datetime_coherence = string(datetime('now'));
            cd('C:\COM\ePhy\dbdb\Data\Outputs\Data\Coherence')
            Filename_coherence = sprintf('Coherence_Figure_%s.tiff', Datetime_coherence);
            Filename_coherence = regexprep(Filename_coherence, ' ', '_');
            Filename_coherence = regexprep(Filename_coherence, ':', '_');
            saveas(gcf, Filename_coherence);
            %ME
        end
        set(gca, 'ytick', [0, 1], 'fontsize', 12)
        %      sig_values(cohP(2), cohP(1));
        xtickangle(25)
        ylim([0, 1])
        if count <= 6
            title(group_name)
            set(gca, 'XColor','none')
        end
        
        if band == 1
            ylabel(comb_name)
        else
            set(gca, 'YColor', 'none')
        end
    end
end

%% Not being used in manuscript anymore
% disp('Power')
% power_vals = [rip.DB2(:, 7); rip.DB4(:, 7); rip.DBDB2(:, 7); rip.DBDB4(:, 7)];
%
% [powerP, powerT, power_stats] = anovan(power_vals, {r_treat_Labs, r_age_Labs}, 'model', 'interaction', 'display', 'off');
% [powerC, powerM, ~, powerNames] = multcompare(power_stats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
%

%% % Duration
disp('Duration')
dur_Ct200 = [rip.DB2(:, 2) - rip.DB2(:, 1)] ./ 1250;
dur_DB200 = [rip.DBDB2(:, 2) - rip.DBDB2(:, 1)] ./ 1250;
dur_Ct400 = [rip.DB4(:, 2) - rip.DB4(:, 1)] ./ 1250;
dur_DB400 = [rip.DBDB4(:, 2) - rip.DBDB4(:, 1)] ./ 1250;

dur_vals = [dur_Ct200; dur_DB200; dur_Ct400; dur_DB400];

[durP, durT, dur_stats] = anovan(dur_vals, {r_treat_Labs, r_age_Labs}, 'model', 'interaction', 'display', 'off');
[durC, durM, ~, durNames] = multcompare(dur_stats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');

summary_dur.means = [mean(dur_Ct200), mean(dur_DB200), mean(dur_Ct400), mean(dur_DB400)];
summary_dur.SD = [std(dur_Ct200), std(dur_DB200), std(dur_Ct400), std(dur_DB400)];
summary_dur.n = [length(dur_Ct200), length(dur_DB200), length(dur_Ct400), length(dur_DB400)];

figure
create_bar_figure(summary_dur.SD, summary_dur.means, durC);
sig_values(durP(2), durP(1));
ylabel('SWR Duration (s)')
set(gca, 'ytick', [0, 0.15, 0.3])
ylim([0, 0.4])
UCSF_create_excel('SPWRs', summary_dur, 'SPWR_Duration', user)

%% IRI

IRICt2 = iri_all.DB2;
IRICt4 = iri_all.DB4;
IRIDB2 = iri_all.DBDB2;
IRIDB4 = iri_all.DBDB4;

IRI_vals = [IRICt2; IRIDB2; IRICt4; IRIDB4];
IRI_treat = [repmat("Ctrl",length(IRICt2),1); repmat("DB",length(IRIDB2),1); repmat("Ctrl",length(IRICt4),1); repmat("DB",length(IRIDB4),1)];
IRI_age = [repmat("200",length(IRICt2),1); repmat("200",length(IRIDB2),1); repmat("400",length(IRICt4),1); repmat("400",length(IRIDB4),1)];

[iriP, iriT, IRI_stats] = anovan(IRI_vals, {IRI_treat, IRI_age,}, 'model', 'interaction', 'display', 'off');
[iriC, iriM, ~, iriNames] = multcompare(IRI_stats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');

%set(gca, 'ytick', [0, 3000, 6000])
%ylim([0, 8500])


summary_IRI.means = [mean(IRICt2), mean(IRIDB2), mean(IRICt4), mean(IRIDB4)];
summary_IRI.SD = [std(IRICt2), std(IRIDB2), std(IRICt4), std(IRIDB4)];
summary_IRI.n = [length(IRICt2), length(IRIDB2), length(IRICt4), length(IRIDB4)];

figure
create_bar_figure(summary_IRI.SD, summary_IRI.means, iriC);
sig_values(iriP(2), iriP(1));
ylabel('Inter-ripple interval (s)')

UCSF_create_excel('SPWRs', summary_IRI, 'SPWR_IRI', user)

%% Gamma power
%[clean_data, boolean] = rmoutliers(data);
clean_gamma_DB2 = rmoutliers(Gamma.DB2_Pyr);
clean_gamma_DBDB2 = rmoutliers(Gamma.DBDB2_Pyr);
clean_gamma_DB4 = rmoutliers(Gamma.DB4_Pyr);
clean_gamma_DBDB4 = rmoutliers(Gamma.DBDB4_Pyr);

pyr_Vals = [Gamma.DB2_Pyr, Gamma.DBDB2_Pyr, Gamma.DB4_Pyr, Gamma.DBDB4_Pyr]';

summary_Gamma.means = [mean(Gamma.DB2_Pyr), mean(Gamma.DBDB2_Pyr), mean(Gamma.DB4_Pyr), mean(Gamma.DBDB4_Pyr)];
summary_Gamma.SD = [std(Gamma.DB2_Pyr), std(Gamma.DBDB2_Pyr), std(Gamma.DB4_Pyr), std(Gamma.DBDB4_Pyr)];
summary_Gamma.n = [length(Gamma.DB2_Pyr), length(Gamma.DBDB2_Pyr), length(Gamma.DB4_Pyr), length(Gamma.DBDB4_Pyr)];

disp('Pyr Gamma')
[pyr_P, pyr_Table, pyr_Stats] = anovan(pyr_Vals, {treat_Labs, age_Labs}, 'model', 'interaction', 'display', 'off');
[pyr_Comparions, pyr_Means, ~, pyr_Names] = multcompare(pyr_Stats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');
figure
create_bar_figure(summary_Gamma.SD, summary_Gamma.means, pyr_Comparions);
sig_values(pyr_P(2), pyr_P(1));
ylabel('Pyramidal Gamma power')
UCSF_create_excel('SPWRs', summary_Gamma, 'SPWR_Gamma_Power', user)

%% Basic features of SPWRs
both = 0.1;
toph = 0.55;
h = 0.32;
lw = 0.1;
mw = 0.55;
w = 0.35;
riph = 0.174;
mod = 0.175;

control_200 = RGB.c200;
control_400 = RGB.c400;
DB_200 = RGB.db200;
DB_400 = RGB.db400;


fig_lim = 5e-3;
% [][] |    |
% [][] |____|
%|    ||    |
%|____||____|
figure

set(gcf, 'color', 'w', 'Position', [100, 100, 1200, 700])
% top left ripple
subplot('Position', [lw, toph + mod, riph, riph])
plot(mean(rip_wav.DB2, 2), 'color', control_200)
% title('DB2')
axis off
ylim([-fig_lim, fig_lim])
vline(625, 'k:')

%bottom left ripple
subplot('Position', [lw + mod, toph + mod, riph, riph])
plot(mean(rip_wav.DBDB2, 2), 'color', DB_200)
ylim([-fig_lim, fig_lim])

%title('DBDB2')
vline(625, 'k:')
axis off


% top right ripple
subplot('Position', [lw, toph, riph, riph])
plot(mean(rip_wav.DB4, 2), 'color', control_400)
ylim([-fig_lim, fig_lim])
yticks([-5e-3 -3e-3])
yticklabels({'','2 mV'})
xticks([0 250])
xticklabels({'','200 ms'})
box off
vline(625, 'k:')


%bottom right ripple
subplot('Position', [lw + mod, toph, riph, riph])
plot(mean(rip_wav.DBDB4, 2), 'color', DB_400)
ylim([-fig_lim, fig_lim])
%title('DBDB4')
vline(625, 'k:')
axis off
% top right quad
%Gamma power
subplot('Position', [mw, toph, w, h])
create_bar_figure(summary_Gamma.SD, summary_Gamma.means, pyr_Comparions);


%ylabel('SWR Gamma power')
%sig_values(pyr_P(2), pyr_P(1));
%set(gca,'ytick',[0 5e-7 1e-6])
%ylim([0 1.15e-6])

% bottom left quad
% Duration
subplot('Position', [lw, both, w, h])
dur_fig = create_bar_figure(summary_dur.SD, summary_dur.means, durC);


%bottom right quad
% IRI
subplot('Position', [mw, both, w, h])
irir_fig = create_bar_figure(summary_IRI.SD, summary_IRI.means, iriC);

%sig_values(iriP(2), iriP(1));
%ylabel('Inter-ripple interval (s)')
%set(gca,'ytick',[0 3000 6000])
%ylim([0 8500])

%% Define windows of interest
high_chan = 7; %pyramidal channel
low_chan = 11; % Radiatum channel
pre_win = 1:550; % pre indices
win = 650:750; % ripple indices
post_win = 850:1300; % post indices

CSDm.DB2 = mean(CSD.DB2, 3);
CSDm.DB4 = mean(CSD.DB4, 3);
CSDm.DBDB2 = mean(CSD.DBDB2, 3);
CSDm.DBDB4 = mean(CSD.DBDB4, 3);

dipole_DB2_pre = calculate_CSD_dipole(CSD.DB2, high_chan, low_chan, pre_win);
dipole_DB4_pre = calculate_CSD_dipole(CSD.DB4, high_chan, low_chan, pre_win);
dipole_DBDB2_pre = calculate_CSD_dipole(CSD.DBDB2, high_chan, low_chan, pre_win);
dipole_DBDB4_pre = calculate_CSD_dipole(CSD.DBDB4, high_chan, low_chan, pre_win);

dipole_vals_pre = [dipole_DB2_pre; dipole_DBDB2_pre; dipole_DB4_pre; dipole_DBDB4_pre];

summary_CSD_pre.means = [mean(dipole_DB2_pre), mean(dipole_DBDB2_pre), mean(dipole_DB4_pre), mean(dipole_DBDB4_pre)];
summary_CSD_pre.SD = [std(dipole_DB2_pre), std(dipole_DBDB2_pre), std(dipole_DB4_pre), std(dipole_DBDB4_pre)];
summary_CSD_pre.n = [length(dipole_DB2_pre), length(dipole_DBDB2_pre), length(dipole_DB4_pre), length(dipole_DBDB4_pre)];


dipole_DB2 = calculate_CSD_dipole(CSD.DB2, high_chan, low_chan, win);
dipole_DB4 = calculate_CSD_dipole(CSD.DB4, high_chan, low_chan, win);
dipole_DBDB2 = calculate_CSD_dipole(CSD.DBDB2, high_chan, low_chan, win);
dipole_DBDB4 = calculate_CSD_dipole(CSD.DBDB4, high_chan, low_chan, win);

dipole_vals = [dipole_DB2; dipole_DBDB2; dipole_DB4; dipole_DBDB4];

summary_CSD.means = [mean(dipole_DB2), mean(dipole_DBDB2), mean(dipole_DB4), mean(dipole_DBDB4)];
summary_CSD.SD = [std(dipole_DB2), std(dipole_DBDB2), std(dipole_DB4), std(dipole_DBDB4)];
summary_CSD.n = [length(dipole_DB2), length(dipole_DBDB2), length(dipole_DB4), length(dipole_DBDB4)];

dipole_DB2_post = calculate_CSD_dipole(CSD.DB2, high_chan, low_chan, post_win);
dipole_DB4_post = calculate_CSD_dipole(CSD.DB4, high_chan, low_chan, post_win);
dipole_DBDB2_post = calculate_CSD_dipole(CSD.DBDB2, high_chan, low_chan, post_win);
dipole_DBDB4_post = calculate_CSD_dipole(CSD.DBDB4, high_chan, low_chan, post_win);

dipole_vals_post = [dipole_DB2_post; dipole_DBDB2_post; dipole_DB4_post; dipole_DBDB4_post];

summary_CSD_post.means = [mean(dipole_DB2_post), mean(dipole_DBDB2_post), mean(dipole_DB4_post), mean(dipole_DBDB4_post)];
summary_CSD_post.SD = [std(dipole_DB2_post), std(dipole_DBDB2_post), std(dipole_DB4_post), std(dipole_DBDB4_post)];
summary_CSD_post.n = [length(dipole_DB2_post), length(dipole_DBDB2_post), length(dipole_DB4_post), length(dipole_DBDB4_post)];

%% Make labels
label.DB2age = cell(size(CSD.DB2, 3), 1);
label.DB2treat = cell(size(CSD.DB2, 3), 1);
label.DB2age(:) = {'200'};
label.DB2treat(:) = {'Control'};

label.DB4age = cell(size(CSD.DB4, 3), 1);
label.DB4treat = cell(size(CSD.DB4, 3), 1);
label.DB4age(:) = {'400'};
label.DB4treat(:) = {'Control'};

label.DBDB2age = cell(size(CSD.DBDB2, 3), 1);
label.DBDB2treat = cell(size(CSD.DBDB2, 3), 1);
label.DBDB2age(:) = {'200'};
label.DBDB2treat(:) = {'DBDB'};

label.DBDB4age = cell(size(CSD.DBDB4, 3), 1);
label.DBDB4treat = cell(size(CSD.DBDB4, 3), 1);
label.DBDB4age(:) = {'400'};
label.DBDB4treat(:) = {'DBDB'};

ageLabs = [label.DB2age; label.DBDB2age; label.DB4age; label.DBDB4age];
treatLabs = [label.DB2treat; label.DBDB2treat; label.DB4treat; label.DBDB4treat];

%% Stats

[csdP, csdTable, CSD_stats] = anovan(dipole_vals, {treatLabs, ageLabs}, 'model', 'interaction', 'display', 'off');
[csdC, csdM, ~, csdNames] = multcompare(CSD_stats, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');

[csdP_pre, csdTable_pre, CSD_stats_pre] = anovan(dipole_vals_pre, {treatLabs, ageLabs}, 'model', 'interaction', 'display', 'off');
[csdC_pre, csdM_pre, ~, csdNames_pre] = multcompare(CSD_stats_pre, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');

[csdP_post, csdTable_post, CSD_stats_post] = anovan(dipole_vals_post, {treatLabs, ageLabs}, 'model', 'interaction', 'display', 'off');
[csdC_post, csdM_post, ~, csdNames_post] = multcompare(CSD_stats_post, 'Dimension', [1, 2], 'CType', 'bonferroni', 'display', 'off');

%% Plot
figure
set(gcf, 'Color', 'w', 'Position', [100, 100, 1200, 600])
xstart = 0.07;
x2start = 0.37;
toph = 0.55;
h = 0.35;
both = 0.15;
w = 0.28;
ylims = [0, 8];
clim = 4.5;
for i = 1:4
    switch i
        case 1
            subplot('Position', [xstart, toph, w, h])
            hand = pcolor(flipud(CSDm.DB2(:, 2:end-1)'));
            title('200 d', 'FontSize', 14)
            ylabel('db/+', 'FontSize', 14, 'FontWeight', 'bold')
        case 2
            subplot('Position', [x2start, toph, w, h])
            hand = pcolor(flipud(CSDm.DB4(:, 2:end-1)'));
            title('400 d', 'FontSize', 14) %M needs alteration
            
        case 3
            subplot('Position', [xstart, both, w, h])
            hand = pcolor(flipud(CSDm.DBDB2(:, 2:end-1)'));
            ylabel('db/db', 'FontSize', 14, 'FontWeight', 'bold')
        case 4
            subplot('Position', [x2start, both, w, h])
            hand = pcolor(flipud(CSDm.DBDB4(:, 2:end-1)'));
            
    end
    set(hand, 'EdgeColor', 'none'), colormap(flipud(hotcold)), shading interp
    rectangle('Position', [pre_win(1), 12 - high_chan(end), pre_win(end) - pre_win(1), 1])
    rectangle('Position', [pre_win(1), 12 - low_chan(end), pre_win(end) - pre_win(1), 1])
    
    rectangle('Position', [win(1), 12 - high_chan(end), win(end) - win(1), 1])
    rectangle('Position', [win(1), 12 - low_chan(end), win(end) - win(1), 1])
    
    rectangle('Position', [post_win(1), 12 - high_chan(end), post_win(end) - post_win(1), 1])
    rectangle('Position', [post_win(1), 12 - low_chan(end), post_win(end) - post_win(1), 1])
    
    hline(6, 'k', 'Pyramidal')
    hline(2, 'k', 'Radiatum')
    
    set(gca, 'xtick', [])
    caxis([-clim, clim])
    
end
c = colorbar('Position',[0.69 0.35 0.015 0.4],'Ticks',[-4,0,4],'AxisLocation','in');
c.Label.String = 'Current flow mA/mm^-^3';
%cb.Layout.Tile = 'west';
subplot('Position', [0.75, both + 0.6, 0.2, 0.18])
[csdBar] = create_bar_figure(summary_CSD_pre.SD, summary_CSD_pre.means, csdC_pre);


title('Pre-Ripple')
% ylim(ylims)
set(gca, 'xtick', [])

subplot('Position', [0.75, both + 0.3, 0.2, 0.18])
[csdBar] = create_bar_figure(summary_CSD.SD, summary_CSD.means, csdC);


title('Ripple')
% ylim(ylims)
set(gca, 'xtick', [])

subplot('Position', [0.75, both, 0.2, 0.18])
[csdBar] = create_bar_figure(summary_CSD_post.SD, summary_CSD_post.means, csdC_post);


title('Post-Ripple')
% ylim(ylims)
% l = legend('db/+','db/db');
% legend('boxoff')
% legend('Location','northoutside')
% age_sig = sig_check(csdP(2));
% db_sig = sig_check(csdP(1));

A = suplabel('Time (s)', 'x', [0.1, 0.1, 0.52, 0.5]);
set(A, 'FontSize', 12, 'FontWeight', 'bold')
%% Signal power
% powers(group, counter, freq_band, layer)
current_power = powers;
figure
set(gcf, 'Position',[100 100 100 100])
count = 0;
for band = [2 5 6] %2:6
    for lay_comb = 2% :3 % 1:3
        switch lay_comb
            case 1
                comb_name = 'Ctx';
            case 2
                comb_name = 'Pyr';
            case 3
                comb_name = 'Slm';
        end % switch layComb
        disp(comb_name)
        
        switch band
            case 1
                group_name = 'Delta';
            case 2
                group_name = 'Theta';
            case 3
                group_name = 'Alpha';
            case 4
                group_name = 'Beta';
            case 5
                group_name = 'Gamma';
            case 6
                group_name = 'High Gamma';
            case 7
                group_name = 'Full';
        end
        
        count = count + 1;
        % powers(group, counter, freq_band, layer)
        powers_Ct200_w_nan = current_power(1, :, band, lay_comb)';
        powers_Ct200 = powers_Ct200_w_nan(~isnan(powers_Ct200_w_nan));
        
        powers_Ct400_w_nan = current_power(2, :, band, lay_comb)';
        powers_Ct400 = powers_Ct400_w_nan(~isnan(powers_Ct400_w_nan));
        
        powers_DB200_w_nan = current_power(3, :, band, lay_comb)';
        powers_DB200 = powers_DB200_w_nan(~isnan(powers_DB200_w_nan));
        
        powers_DB400_w_nan = current_power(4, :, band, lay_comb)';
        powers_DB400 = powers_DB400_w_nan(~isnan(powers_DB400_w_nan));
        
        % First we want to grab individual values, create 2-way labels for
        % them, then concatenate everything together
        
        powers_vals = [powers_Ct200; powers_DB200; powers_Ct400; powers_DB400];
        %MS
        summary_powers.means = [mean(powers_Ct200), mean(powers_DB200), mean(powers_Ct400), mean(powers_DB400)];
        summary_powers.SD = [std(powers_Ct200), std(powers_DB200), std(powers_Ct400), std(powers_DB400)];
        summary_powers.n = [length(powers_Ct200), length(powers_DB200), length(powers_Ct400), length(powers_DB400)];
        %ME
        disp(group_name)
        [powersP, powersT, powersStats] = anovan(powers_vals, {slowing_score_db_Labs, slowing_score_age_Labs}, 'model', 'interaction', 'display', 'off');
        [powersC, powersM, ~, powersN] = multcompare(powersStats, 'Dimension', [1, 2], 'CType', 'hsd', 'display', 'off');
        disp(powersP)
        powers_data = NaN(7,4);
        powers_data(:,1) = powers_Ct200';
        powers_data(1:6,2) = powers_DB200';
        powers_data(1:5,3) = powers_Ct400';
        powers_data(1:5,4) = powers_DB400';
        groups = {'Ctrl 200','DB 200','Ctrl 400','DB 400'};
        subaxis(1,3 , count, 'SpacingHoriz', 0.05, 'SpacingVert', 0.05)
%         UCSF_graph(powersM(:,2),powersM(:,1),powersC);
        plot_bee(powers_data,...
            {'Ctrl 200','DB 200','Ctrl 400','DB 400'},...
            powersC,...
            [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
        %      sig_values(cohP(2), cohP(1));
        xtickangle(25)
        set(gca,'FontSize',14)
        title(group_name)
        %ylim([0, 5e-6])
%         if count <= 3
%             title(comb_name)
%             
%         end
%         
%         if count <= 12
%             set(gca, 'XColor', 'none')
%         end
%         
%         if lay_comb == 1
%             ylabel(group_name)
%         else
%             set(gca, 'YColor', 'none')
%         end
        %ylim([0 1])
        
        
        
        
        % UCSF_create_excel('Coherence', summary_Coh, [comb_name, '_', group_name, '_Coherence'], user)
        
        
    end
end
%% M
UCSF_create_excel('CSD', summary_CSD_pre, 'CSD_pre_ripple_dipole', user)
UCSF_create_excel('CSD', summary_CSD, 'CSD_ripple_dipole', user)
UCSF_create_excel('CSD', summary_CSD_post, 'CSD_post_ripple_dipole', user)

if strcmp(user, 'S')
    Datetime_NotyebookCSD = string(datetime('now'));
    Filename_NotyebookCSD = sprintf('NotyebookCSD_Figure_%s.tiff', Datetime_NotyebookCSD);
    Filename_NotyebookCSD = regexprep(Filename_NotyebookCSD, ' ', '_');
    Filename_NotyebookCSD = regexprep(Filename_NotyebookCSD, ':', '_');
    saveas(gcf, Filename_NotyebookCSD);
end
%ME
