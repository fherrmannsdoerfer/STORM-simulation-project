function liste = importSelfMeassuredMicrotubuli()

l1 = [286	24
316	48
354	94
402	170
440	228
470	284
492	310
546	402
598	476
648	542
686	588
726	638
772	678
824	722];
l2 = [380	107
414	127
452	153
506	167
540	183
606	201];
l3=[494	7
502	25
514	47
522	65
534	79
548	103
562	125
574	147
590	163
612	203
];
l4=[512	7
522	35
536	45
550	73
566	107
582	139
592	161
610	201
636	227
664	263
702	311
728	359
768	411
804	467
828	495
];
l5=[738	5
768	23
786	27
810	47
836	65
];
l6=[42	7
72	35
100	77
144	117
180	161
212	191
240	213
278	263
312	307
354	349
388	381
428	425
466	465
500	503
526	535
558	561
578	585
608	607
660	657
728	701
790	741
826	755
];
l7=[78	13
88	67
102	107
132	169
156	231
188	295
212	345
244	403
272	445
312	487
348	517
376	539
402	555
432	565
468	575
496	581
518	591
540	616
554	650
559	690
548	723
537	743
536	756
];
l8=[6	161
28	191
50	219
68	237
88	269
110	301
138	335
156	359
184	395
206	425
228	445
249	461
279	484
310	509
342	529
375	550
413	578
446	601
481	626
527	650
575	672
609	692
658	710
698	731
746	752];
l9=[8	249
28	293
40	321
52	345
68	359
86	411
98	435
108	461
120	499
140	539
148	557
164	577
178	599
198	629
218	667
238	697
252	717
270	729
292	743
310	753
];
liste = {l1,l2,l3,l4,l5,l6,l7,l8,l9};

for i = 1:size(liste,2)
    liste{i} = [liste{i},zeros(size(liste{i},1),1)];
end

end