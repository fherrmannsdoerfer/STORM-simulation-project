function main()
    figHandle = findobj('Type','figure');
    close(figHandle);
	rng(5);
    loa = 10; %length of both antibodies combined
    aoa = 90/180*pi; %angle of antibody
    bspnm = 0.27; %binding sites per nm
    pabs = 0.40; %part of available binding sites
    abpf = 14;% average blinking per fluorophor
    rof = 11;%radius of filament

    cEM = [0,0,0]; %color of EM data
    cSTORM = [1,0,0]; %color of STORM result
    cAB = [0,1,0]; %color of Antibody
    sxy = 8; %sigma of fitting error in xy direction
    sz = 35; %sigma of fitting error in z direction
    
    doc = 0; %degree of clustering, part of all localizations that are clustered
    nocpsmm = 1; %number of clusters per square micrometer
    docpsnm = 0.01; %denstiy of clusters in antibodies per square nm
    
    bspsnm = .0159/2; %binding sites per square nanometer
    %fname = 'Y:\Users_shared\Superresolution Simulation Software Project- Frank and Varun\Organelle Library\Microtubules\EM Tomography Data\Microtubules.wimp';
    fname = 'Y:\Users_shared\Superresolution Simulation Software Project- Frank and Varun\Organelle Library\Mitochondria\EM Tomography Model\Mitochondria-Tomogram-beta-islet-cells.nff';
    %outputname = 'Y:\Users_shared\Superresolution Simulation Software Project- Frank and Varun\Organelle Library\Mitochondria\STORM Simulation\Mitochondria-Tomogram-beta-islet-cells.nff';
    objects = importTriangles(fname);
    %objects = getActinRings({});
    %objects = getCrossingLines({});
    %objects = importEMData('141208-STORMmodel');
    %objects = importFilamentousStructures(fname);
    %objects = swapColumns(objects,2,3);
    %objects = rescaleObjects(objects,10);
    if isSurfaceData(objects)
        [ap,ep] = findAntibodiesTri(objects, bspsnm, pabs, loa, aoa, doc, nocpsmm, docpsnm);
    else
        [ap,ep,idx]=findLines(objects, bspnm, pabs,aoa,loa,rof);
    end
    [stormPoints, idxF ,idxSt] = findStormPoints(ep, abpf, sxy, sz,false);

    %writeStormPointsForVisp(stormPoints,outputname,loa,aoa,bspnm,pabs,abpf,rof,sxy,sz,bspsnm);
    %writeOutputFileMalk(stormPoints,outputname,loa,aoa,bspnm,pabs,abpf,rof,sxy,sz,bspsnm);
    %writeStormPointsForAmira(stormPoints,outputname,loa,aoa,bspnm,pabs,abpf,rof,sxy,sz,bspsnm);
    showEM(objects)
    showAntibodies(ap,ep)
    showEMAntibodies(objects,ap,ep)
    showStormPoints(stormPoints)
    showEMAntibodiesStormPoints(objects,ap,ep,stormPoints)

    setViewForFigures(150,30)
end

function showEMAntibodiesStormPoints(objects,ap,ep,stormPoints)
    fig = figure(findNextFigure);
    clf
    hold on
    if isSurfaceData(objects)
        printTriangles(objects,fig)
    else
        printEMLines(objects,fig,[0,0,0])
    end
    printAntibodies(ap, ep,fig, [0,1,0])
    printSTORMPoints(stormPoints,fig)
end

function showStormPoints(stormPoints)
    fig = figure(findNextFigure);
    clf
    hold on
    printSTORMPoints(stormPoints,fig)
end

function showEMAntibodies(objects,ap,ep)
    fig = figure(findNextFigure);
    clf
    hold on
    if isSurfaceData(objects)
        printTriangles(objects,fig)
    else
        printEMLines(objects,fig,[0,0,0])
    end
    printAntibodies(ap, ep,fig, [0,1,0])
end

function showAntibodies(ap,ep)
    fig = figure(findNextFigure);
    clf
    hold on
    printAntibodies(ap, ep,fig, [0,1,0])
end

function showEM(objects)
    fig = figure(findNextFigure);
    clf
    hold on
    if isSurfaceData(objects)
        printTriangles(objects,fig,[0,0,0])
    else
        printEMLines(objects,fig,[0,0,0])
    end
end

function issd = isSurfaceData(objects)
    issd = 1;
    for i = 1:size(objects,2)
        if size(objects{i},1)>4
            issd = 0;
            break;
        end
    end
end

function idx = findNextFigure()
    figureHandles = findobj('Type','figure');
    if size(figureHandles,1) == 0
        idx = 1;
    else
        idx = max(figureHandles)+1;
    end
end
