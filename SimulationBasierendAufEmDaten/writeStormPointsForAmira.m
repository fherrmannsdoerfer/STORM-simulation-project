function writeStormPointsForAmira(stormPoints,fname,loa,aoa,bspnm,pabs,abpf,rof,sxy,sz,bspsnm,fpab)
    parts = strsplit(fname,'.'); 
    params = sprintf('loa%2.2faoa%2.2fbspnm%2.2fpabs%2.2fabpf%2.2frof%2.2fsxy%2.2fsz%2.2fbspsnm%2.2ffpab%2.2f',loa,aoa,bspnm,pabs,abpf,rof,sxy,sz,bspsnm,fpab);
    outputFname = [parts{1},params,'_AmiraOutput.txt'];
    
    fid = fopen(outputFname,'w+t');
    fprintf(fid,'# PSI Format 1.0\n');
    fprintf(fid,'#\n');
    fprintf(fid,'# column[0] = "x"\n');
    fprintf(fid,'# column[1] = "y"\n');
    fprintf(fid,'# column[2] = "z"\n');
    fprintf(fid,'# column[3] = "Intensity"\n');
    fprintf(fid,'# column[4] = "Frame"\n');
    fprintf(fid,'#\n');
    fprintf(fid,'# type[3] = float\n');
    fprintf(fid,'# type[4] = int\n');
    fprintf(fid,'\n');
    fprintf(fid,'%d 0 0\n',size(stormPoints,1));
    fprintf(fid,'1.00 0.00 0.00\n');
    fprintf(fid,'0.00 1.00 0.00\n');
    fprintf(fid,'0.00 0.00 1.00\n');
    fprintf(fid,'\n');
    fclose(fid);
    %stormPoints = [stormPoints,zeros(size(stormPoints,1),1)];

    dlmwrite(outputFname,stormPoints,'-append','Delimiter',' ');
end