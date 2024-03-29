per_data = xlsread('nonstop50_baregrey_2layer_heat_slp1_spe25_pull20_per.xlsx');
% per = smooth(per_data(:,2), 15);
per = per_data(:,2);
time_per = per_data(:,1);

[pks,locs] = findpeaks(per,time_per);
[troughs,loc_ts] = findpeaks(-per,time_per);
troughs = -troughs;

id = find(locs(:,1) < 5 | locs(:,1) > 71);
locs(id,:) = [];
pks(id,:) = [];
locs_1 = locs(6:end)-5;
pks_1 = pks(6:end);

id_t = find(loc_ts(:,1) < 5 | loc_ts(:,1) > 71);
loc_ts(id_t,:) = [];
troughs(id_t,:) = [];
loc_ts = loc_ts(5:end)-5;
troughs = troughs(5:end);

% subplot(212);
hold on
plot(time_per-5,per,'k');  
grid;
title('Res vs Time (med)');
xlabel('Time/s'); ylabel('Res Ratio/N');
% xlim([locs(1,1)-1,locs(end,1)+1]);
ylim([0 inf]);

p = polyfit(locs_1,pks_1,1);
y1 = polyval(p,locs_1);
plot(locs_1,y1,'--');
r1 = corrcoef(locs_1,pks_1);
matrix = [locs_1 y1];

q = polyfit(loc_ts,troughs,1);
y2 = polyval(q,loc_ts);
plot(loc_ts,y2,'--');
r2 = corrcoef(loc_ts,troughs);
matrix_1 = [loc_ts y2];
legend('Raw Data',['y=' num2str(p(1,1)) 'x+' num2str(p(1,2)) '  r=' num2str(r1(1,2))],...
    ['y=' num2str(q(1,1)) 'x+' num2str(q(1,2)) '  r=' num2str(r2(1,2))]);

xlswrite('peaks_25.xls',matrix,'Sheet1');
xlswrite('troughs_25.xls',matrix_1,'Sheet1');