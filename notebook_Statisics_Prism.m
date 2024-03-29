% Manually copying data from Prism files to create figures.
load('C:\Users\ipzach\Documents\MATLAB\Toolbox Zach\Colors.mat');
age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400]';
db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'}]';

alpha_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 ]';
alpha_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'}]';

beta_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400]';
beta_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} ]';

mi_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400]';
mi_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'}]';

cells_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400]';
cells_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} ]';

area_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400]';
area_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'}]';
% Histology 
% No pic BRDU & DCX
brdu_age_labs =  [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400]';
brdu_db_labs  =  [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'}]';

dcx_age_labs =  [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 ]';
dcx_db_labs  =  [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} ]';


brdu_vals = log10([198 192 300 180 276 240 468 480 279 480 192 108 72 162 132 204 144 288 216 156 180 180 153	108	132 96 108 171 171 171	180	180	144	189	117	204	72	63	84	36	72	96	96]');
dcx_vals = log10([420	480	594	648	864	888	576	1380 882 1440 132 96 162	108	96	636	504	456	594	492	288 120	90	84 156 144	276	126	225	300	360	144	312	180	198	48	48	18	45	96	108	72]');

[brdu_P, brdu_T, brdu_Stats] = anovan(brdu_vals,{brdu_db_labs, brdu_age_labs}, 'model', 'interaction','display','off');
[brdu_C,brdu_M,~,brdu_N] = multcompare(brdu_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');

[dcx_P, dcx_T, dcx_Stats] = anovan(dcx_vals,{dcx_db_labs, dcx_age_labs}, 'model', 'interaction','display','off');
[dcx_C,dcx_M,~,dcx_N] = multcompare(dcx_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');


figure
set(gcf,'Position',[100 100 900  400])
subplot(1,2,1)
create_bar_figure(brdu_M(:,2), brdu_M(:,1), brdu_C);
xtickangle(60)
box off

subplot(1,2,2)
create_bar_figure(dcx_M(:,2), dcx_M(:,1), dcx_C);
xtickangle(60)
box off

% Triple pics CV, BRDu, DCX
DCX_area_age_labs  = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 ]';
DCX_area_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} ]';
DCX_area_vals = [0.86905428	0.40203504	0.61880966	0.96045872	0.59835453	0.76930995	0.57231413	0.66077933	0.63941011	0.55605886 0.30577565	0.82527817	0.54625988	0.51994375	0.86898684		0.66492079	0.49467394	0.63386285	0.62273342	0.288 0.35631714	0.38152388	0.50035393	0.40593881	0.72359952	0.48474846	0.50949774	0.47484167	0.39605664						0.30277759	0.3116963	0.66197221	0.41141166	0.31725581	0.49430311	0.57633195]';

[DCX_area_P, DCX_area_T, DCX_area_Stats] = anovan(DCX_area_vals,{DCX_area_db_labs, DCX_area_age_labs}, 'model', 'interaction','display','off');
[DCX_area_C,DCX_area_M,~,DCX_area_N] = multcompare(DCX_area_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');


SVZ_area_age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400 400]';
SVZ_area_db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} ]';
SVZ_area_vals = [1.14910433	1.15187916	1.45288016	1.26325729	0.96277997	1.30006284	0.95256623	1.01916796	1.01737855	0.97594866	1.00761731	0.90286391	1.09079694		0.89506044	1.18214604	1.15794379	0.77721419	0.92112363	0.86397362	0.89019276	0.77860856	1.04603338	0.9916208	1.04311233	0.86216188	0.748431 0.91308736	0.70173132	0.98842323	0.98417843	1.13546348	0.75589647	0.7848981	0.7183573	0.74536513						0.8703761	0.88873734	0.81507973	0.84761724	0.86056048	0.78401774	0.77375563]';

[SVZ_area_P, SVZ_area_T, SVZ_area_Stats] = anovan(SVZ_area_vals,{SVZ_area_db_labs, SVZ_area_age_labs}, 'model', 'interaction','display','off');
[SVZ_area_C,SVZ_area_M,~,SVZ_area_N] = multcompare(SVZ_area_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');

Brdu_svz_vals = [1272	996;
                1470	324;
                1236	876;
                1516	636;
                1201	746;
                1401	860;
                1184	894;
                1212	810;
                1368	868;
                756     860];
brdu_svz_labs = {'ctrl','DB'};

[brdu_svz_P,~,brdu_svz_S] = anova1(Brdu_svz_vals,brdu_svz_labs,'off');

[brdu_svz_Comp,brdu_svz_Means,~,brdu_svz_Names] = multcompare(brdu_svz_S,'CType','bonferroni','Display','off');

%%
figure
set(gcf,'color','w','position',[100  100 1550 300])
subplot(1,3,1)
create_bar_figure(SVZ_area_M(:,2), SVZ_area_M(:,1), SVZ_area_C);
xtickangle(60)

subplot(1,3,2)
create_bar_figure(DCX_area_M(:,2), DCX_area_M(:,1), DCX_area_C);
xtickangle(60)

subplot(1,3,3)
control_200 = [194, 194, 194] ./255;DB_200 = [247,149,114] ./255;
xlabels = {'Ctrl','DB'};
b= bar(brdu_svz_Means(:,1));
set(gca,'xTickLabel',xlabels)
hold on
er = errorbar([1 2]',brdu_svz_Means(:,1)', brdu_svz_Means(:,2)');
er.LineStyle = 'none';
er.Color = 'k';
% er.CapSize = 0;
box off
set(gca, 'FontSize',14,'TickDir','out');
b(1).FaceColor = 'flat';
b(1).EdgeColor = 'flat';
b(1).CData(1,:) = control_200;
b(1).CData(2,:) = DB_200;
for i = 1:size(brdu_svz_Comp,1)
    a = brdu_svz_Comp(i,1);
    b = brdu_svz_Comp(i,2);
   if brdu_svz_Comp(i,6) <= 0.05
       sigstar2([a b],brdu_svz_Comp(i,6));
   end 
end

%% CA1 Signal Power
hgamma_vals = [1.45 2.17 1.95 2.53 2.61 2.47 2.35 2.2 2.474356 2.519189 2.5 2.52 2.22 1.98 2.18 2.3 1.75 2.04 1.51 2.06 1.75 2.37 2.23]';

[hg_P, hg_T, hg_Stats] = anovan(hgamma_vals,{db_labs, age_labs}, 'model', 'interaction','display','off');
[hg_C,hg_M,~,hg_N] = multcompare(hg_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
figure
%subplot(1,5,5)
create_bar_figure(hg_M(:,2), hg_M(:,1), hg_C);
sig_values(hg_P(2), hg_P(1));
box off
title('High Gamma')
% ylabel('Signal power')
xtickangle(60)

gamma_vals = [1.7 1.91 1.95 2.53 2.61 2.47 2.35 2.2 2.474356 2.519189 2.27 2.52 2.22 2.11 2.08 2.29 1.75 2.04 1.56 1.62 1.75 2.37 2.23]';

[g_P, g_T, g_Stats] = anovan(gamma_vals,{db_labs, age_labs}, 'model', 'interaction','display','off');
[g_C,g_M,~,g_N] = multcompare(g_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
figure % subplot(1,5,4)
create_bar_figure(g_M(:,2), g_M(:,1), g_C);
 sig_values(g_P(2), g_P(1));
title('Gamma')
% ylabel('Signal power')
xtickangle(60)


beta_vals = [1.34950482 1.55844095 1.74690263 1.81025 1.99365971 1.98514479 1.94581509 1.58091928 1.58761893 1.57640586 2.09187298 2.16557667 2.17884002 2.0363426 1.87704979 1.54918426 1.41560703 1.90251585 1.98142855 1.58822292 1.2177576 1.93655496 2.2634429 1.69193156 1.73124135 1.96524546 2.08606997 1.75531448 1.76712172 1.70379848 1.82157706 1.29212255 1.31918659 1.30799712 1.68278633 1.66416467 1.35539404 1.55342301 1.40265164 1.67008064]';

[b_P, b_T, b_Stats] = anovan(beta_vals,{beta_db_labs, beta_age_labs}, 'model', 'interaction','display','off');
[b_C,b_M,~,b_N] = multcompare(b_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
figure % subplot(1,5,3)
create_bar_figure(b_M(:,2), b_M(:,1), b_C);
sig_values(b_P(2), b_P(1));
title('Beta')
% ylabel('Signal power')
xtickangle(60)

alpha_vals = [1.27309623 1.59222674 1.60791267 1.88288355 1.97323087 2.05837211 1.90369757	1.37201488 1.4943383 1.5657109 2.03637096 1.96390394 1.52369705 1.74371682 1.80092794 1.77118182 1.90571273 2.02184647 1.75802724 1.42493225 1.89729162 2.29471306 1.90265819 0.58575392 1.83079646 1.80382843 1.65021716 1.69384474 1.82683254 1.64497891 1.85646243 1.22806396 1.39269144 1.35052349 1.6957178 1.6488733 1.34416033 1.57941886 1.36890209]';

[a_P, a_T, a_Stats] = anovan(alpha_vals,{alpha_db_labs, alpha_age_labs}, 'model', 'interaction','display','off');
[a_C,a_M,~,a_N] = multcompare(a_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
figure % subplot(1,5,2)
create_bar_figure(a_M(:,2), a_M(:,1), a_C);
sig_values(a_P(2), a_P(1));
title('Alpha')
% ylabel('Signal power')
xtickangle(60)
theta_vals = [1.45 2.17 1.95 2.53 2.61 2.47 2.35 2.2 2.474356 2.519189 2.5 2.52 2.22 1.98 2.18 2.3 1.75 1.99 1.47 2.06 1.75 2.37 2.23]';

[t_P, t_T, t_Stats] = anovan(theta_vals,{db_labs, age_labs}, 'model', 'interaction','display','off');
[t_C,t_M,~,t_N] = multcompare(t_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
figure % subplot(1,5,1)
create_bar_figure(t_M(:,2), t_M(:,1), t_C);
sig_values(t_P(2), t_P(1));
title('Theta')
% ylabel('Signal power')
xtickangle(60)
%% Modulation index
% 7 6 5 4
CA1_ctx_DHG_vals = [-3.41 -2.93 -3 -3.43 -3.77 -3.02 -3.35 -2.91 -2.248 -2.95731 -3.1 -3.53 -2.42 -3.02 -3.05 -2.51 -3.19 -2.89 -2.76 -1.92 -2.1 -2.62]';
CA1_ctx_DLG_vals = [-2.91 -2.09 -2.69 -3.07 -3.58 -2.75 -3.02 -2.5 -2.08301 -3.09798 -2.62 -3.63 -2.15 -2.56 -2.61 -2.15 -2.76 -2.54 -2.59 -1.8 -1.79 -2.36]';

CA1_ctx_THG_vals = [-4.16 -3.53 -3.48 -3.54 -3.31 -3.14 -3.75 -3.82 -3.88286 -4.10672 -3.41 -3.67 -3.86 -3.85 -3.84 -3.16 -3.8 -3.61 -3.97 -3.77 -3.79 -3.47]';
CA1_ctx_TLG_vals = [-3.88 -3.28 -3.02 -3.35 -3 -2.93 -3.42 -3.22 -3.86646 -4.08613 -3.12 -3.35 -3.72 -3.37 -3.17 -2.91 -3.63 -3.4 -3.99 -3.94 -3.65 -3.12]';




[CA1_ctx_DHG_P, CA1_ctx_DHG_T, CA1_ctx_DHG_stats] = anovan(CA1_ctx_DHG_vals,{mi_db_labs, mi_age_labs}, 'model', 'interaction','display','off');
[CA1_ctx_DHG_C,CA1_ctx_DHG_M,~,CA1_ctx_DHG_N] = multcompare(CA1_ctx_DHG_stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');

[CA1_ctx_DLG_P, CA1_ctx_DLG_T, CA1_ctx_DLG_stats] = anovan(CA1_ctx_DLG_vals,{mi_db_labs, mi_age_labs}, 'model', 'interaction','display','off');
[CA1_ctx_DLG_C,CA1_ctx_DLG_M,~,CA1_ctx_DLG_N] = multcompare(CA1_ctx_DLG_stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');

[CA1_ctx_THG_P, CA1_ctx_THG_T, CA1_ctx_THG_stats] = anovan(CA1_ctx_THG_vals,{mi_db_labs, mi_age_labs}, 'model', 'interaction','display','off');
[CA1_ctx_THG_C,CA1_ctx_THG_M,~,CA1_ctx_THG_N] = multcompare(CA1_ctx_THG_stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');

[CA1_ctx_TLG_P, CA1_ctx_TLG_T, CA1_ctx_TLG_stats] = anovan(CA1_ctx_TLG_vals,{mi_db_labs, mi_age_labs}, 'model', 'interaction','display','off');
[CA1_ctx_TLG_C,CA1_ctx_TLG_M,~,CA1_ctx_TLG_N] = multcompare(CA1_ctx_TLG_stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
%%
figure
create_bar_figure(CA1_ctx_DHG_M(:,2), CA1_ctx_DHG_M(:,1), CA1_ctx_DHG_C);
%sig_values(CA1_ctx_DHG_P(2), CA1_ctx_DHG_P(1));
title('DHG')
figure
create_bar_figure(CA1_ctx_DLG_M(:,2), CA1_ctx_DLG_M(:,1), CA1_ctx_DLG_C);
%sig_values(CA1_ctx_DLG_P(2), CA1_ctx_DLG_P(1));
title('DLG')
figure
create_bar_figure(CA1_ctx_THG_M(:,2), CA1_ctx_THG_M(:,1), CA1_ctx_THG_C);
%sig_values(CA1_ctx_THG_P(2), CA1_ctx_THG_P(1));
title('THG')
figure
create_bar_figure(CA1_ctx_TLG_M(:,2), CA1_ctx_TLG_M(:,1), CA1_ctx_TLG_C);
%sig_values(CA1_ctx_TLG_P(2), CA1_ctx_TLG_P(1));
title('TLG')
%%
figure
subplot(2,2,1)
create_bar_figure(CA1_ctx_DHG_M(:,2), CA1_ctx_DHG_M(:,1), CA1_ctx_DHG_C);

subplot(2,2,2)
create_bar_figure(CA1_ctx_THG_M(:,2), CA1_ctx_THG_M(:,1), CA1_ctx_THG_C);

subplot(2,2,3)
create_bar_figure(CA1_ctx_DLG_M(:,2), CA1_ctx_DLG_M(:,1), CA1_ctx_DLG_C);

subplot(2,2,4)
create_bar_figure(CA1_ctx_TLG_M(:,2), CA1_ctx_TLG_M(:,1), CA1_ctx_TLG_C);
%title('Ctx-CA1 Modulation')
%ylabel('Ctx Amplitude')
%xlabel('CA1 Phase')




% SLM_ctx_vals = [-3.3 -3.25 -2.96 -3.43 -3.68 -3.02 -3.33 -3.09 -2.27091 -3.05403 -2.75 -3.61 -1.95 -2.83 -2.96 -2.79 -2.38 -3.2 -2.62 -1.63 -2.08 -2.36]';
% 
% [ms_P, ms_T, ms_Stats] = anovan(SLM_ctx_vals,{mi_db_labs, mi_age_labs}, 'model', 'interaction','display','off');
% [ms_C,ms_M,~,ms_N] = multcompare(ms_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');
% figure
% create_bar_figure(ms_M(:,2), ms_M(:,1), ms_C);
% sig_values(ms_P(2), ms_P(1));
% title('Ctx-SLM Modulation')
% ylabel('Ctx Amplitude')
% xlabel('SLM Phase')

%% TD ratio
age_labs = [200 200 200 200 200 200 200 200 200 200 200 200 200 400 400 400 400 400 400 400 400 400 400]';
db_labs = [{'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'ctrl'} {'DB'} {'DB'} {'DB'} {'DB'} {'DB'}]';

td_vals = [0.602 0.31 1.11 0.774 0.969 0.506 0.553 0.531 0.923932 0.628 0.633 0.78 0.392 0.453 0.666 0.395 0.552 0.3 0.292 0.306 0.273 0.553 0.569]';
%td_anti_log = 10 .^td_vals;
td_data = NaN(7,4);
td_data(:,1) = td_vals(1:7)';
td_data(1:6,2) = td_vals(8:13)';
td_data(1:5,3) = td_vals(14:18)';
td_data(1:5,4) = td_vals(19:end)';
groups = {'Ctrl 200','DB 200','Ctrl 400','DB 400'};

[td_P, td_T, td_Stats] = anovan(td_vals,{db_labs, age_labs}, 'model', 'interaction','display','off');
[td_C,td_M,~,td_N] = multcompare(td_Stats, 'Dimension', [1 2], 'CType', 'bonferroni','display','off');


figure
%plot_bee(td_data, groups, td_C, [RGB.c200; RGB.db200; RGB.c400; RGB.db400]);
create_bar_figure(td_M(:,2), td_M(:,1), td_C);
ylim([0 1])
sig_values(td_P(2), td_P(1));
ylabel('Time in HTD (%)')







