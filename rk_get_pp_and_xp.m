% get exceedance probabilities and posterior probabilities of subgroups
clearvars pxp xp exp_r bor
full_data_path = 'D:/MACS/dcm/rAmy_ORB_p9/BMS';
Nregs=2;

cd(full_data_path);
folders=dir('HC_*');

for ngroup=1:length(folders)
    load(fullfile(full_data_path,strcat(folders(ngroup).name,'/BMS.mat')));
    xp(ngroup,:)=BMS.DCM.rfx.model.xp;
    pxp(ngroup,:)=BMS.DCM.rfx.model.pxp;
    bor(ngroup)=BMS.DCM.rfx.model.bor;
    exp_r(ngroup,:)=BMS.DCM.rfx.model.exp_r;
    clearvars BMS
end

    % save to txt file

    %x = 0:.1:1;
    %A = [x; exp(x)];

    % xp
    %fileID = fopen('bms_xp.txt','w');
    %fprintf(fileID,'%10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f\n',xp');
    %fclose(fileID);
    % exp_r
    %fileID = fopen('bms_exp_r.txt','w');
    %fprintf(fileID,'%10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f %10.8f\n',exp_r');
    %fclose(fileID);
