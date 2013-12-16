function y = Lpf(x)
%LPF Filters input x and returns output y.

%
% MATLAB Code
% Generated by MATLAB(R) 7.14 and the DSP System Toolbox 8.2.
%
% Generated on: 05-Dec-2013 09:01:02
%

%#codegen

% To generate C/C++ code from this function use the codegen command. Type
% 'help codegen' for more information.

persistent Hd;

if isempty(Hd)
    
    % The following code was used to design the filter coefficients:
    % % FIR Window Lowpass filter designed using the FIR1 function.
    %
    % % All frequency values are in Hz.
    % Fs = 200000;  % Sampling Frequency
    %
    % Fpass = 1200;            % Passband Frequency
    % Fstop = 2400;            % Stopband Frequency
    % Dpass = 0.057501127785;  % Passband Ripple
    % Dstop = 0.0001;          % Stopband Attenuation
    % flag  = 'scale';         % Sampling Flag
    %
    % % Calculate the order from the parameters using KAISERORD.
    % [N,Wn,BETA,TYPE] = kaiserord([Fpass Fstop]/(Fs/2), [1 0], [Dstop Dpass]);
    %
    % % Calculate the coefficients using the FIR1 function.
    % b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
    
    Hd = dsp.FIRFilter( ...
        'Numerator', [-2.02173837226202e-06 -2.18798297148905e-06 ...
        -2.35412314089279e-06 -2.51874164066528e-06 -2.68032947012609e-06 ...
        -2.83729032904487e-06 -2.98794586334732e-06 -3.13054170040083e-06 ...
        -3.26325427467948e-06 -3.38419844003552e-06 -3.49143586007791e-06 ...
        -3.58298416329708e-06 -3.65682684460214e-06 -3.7109238898754e-06 ...
        -3.74322309502384e-06 -3.75167204584553e-06 -3.73423071985579e-06 ...
        -3.68888466606382e-06 -3.61365871358173e-06 -3.5066311549163e-06 ...
        -3.36594834486769e-06 -3.189839651171e-06 -2.97663268839421e-06 ...
        -2.7247687621841e-06 -2.43281844675708e-06 -2.09949721459918e-06 ...
        -1.72368103369456e-06 -1.30442184427914e-06 -8.40962824139489e-07 ...
        -3.32753348880454e-07 2.20536448611844e-07 8.19001617048698e-07 ...
        1.46248892280873e-06 2.15058408288371e-06 2.8825997947229e-06 ...
        3.65756466282042e-06 4.47421312117854e-06 5.3309764495203e-06 ...
        6.22597497930528e-06 7.15701158321248e-06 8.12156653878671e-06 ...
        9.11679385339666e-06 1.01395191335193e-05 1.11862390766519e-05 ...
        1.22531226588586e-05 1.33360140850991e-05 1.44304375630592e-05 ...
        1.55316039542401e-05 1.66344193485592e-05 1.77334956007144e-05 ...
        1.88231628580654e-05 1.98974841008369e-05 2.09502717060681e-05 ...
        2.197510603695e-05 2.29653560490587e-05 2.39142018945285e-05 ...
        2.48146594944657e-05 2.56596070389273e-05 2.64418133626208e-05 ...
        2.7153968133169e-05 2.77887137773883e-05 2.83386790595938e-05 ...
        2.87965142145281e-05 2.91549275261735e-05 2.94067232325006e-05 ...
        2.95448406251974e-05 2.95623942026614e-05 2.94527147240993e-05 ...
        2.92093910025071e-05 2.88263122646744e-05 2.82977108972231e-05 ...
        2.76182053891161e-05 2.67828432731119e-05 2.57871438613593e-05 ...
        2.46271405637762e-05 2.3299422572093e-05 2.18011756875173e-05 ...
        2.01302220659439e-05 1.82850586515392e-05 1.62648940674174e-05 ...
        1.40696837310317e-05 1.17001629618835e-05 9.15787785021116e-06 ...
        6.44521365751937e-06 3.56542052313732e-06 5.22636255518355e-07 ...
        -2.67809400732607e-06 -6.03080147696501e-06 -9.5285809338901e-06 ...
        -1.31635816783899e-05 -1.69270023938166e-05 -2.08090900914325e-05 ...
        -2.47991432932086e-05 -2.88855195949713e-05 -3.30556477372265e-05 ...
        -3.72960442948329e-05 -4.1592335079521e-05 -4.59292813310832e-05 ...
        -5.02908107539578e-05 -5.46600534359653e-05 -5.90193826651712e-05 ...
        -6.33504606393409e-05 -6.76342890402677e-05 -7.18512644225099e-05 ...
        -7.59812383428164e-05 -8.00035821328792e-05 -8.38972561940795e-05 ...
        -8.7640883668741e-05 -9.1212828318121e-05 -9.45912764131053e-05 ...
        -9.77543224194039e-05 -0.000100680058235112 -0.000103346665714883 ...
        -0.000105732512191817 -0.000107816248685572 -0.000109576910463296 ...
        -0.000110994019598881 -0.000112047689155856 -0.000112718728600063 ...
        -0.000112988750030289 -0.000112840274798238 -0.000112256840073899 ...
        -0.000111223104898436 -0.000109724955254407 -0.000107749607672523 ...
        -0.000105285710885215 -0.000102323445030354 -9.88546179033478e-05 ...
        -9.48727577528207e-05 -9.03732021141323e-05 -8.53531821761855e-05 ...
        -7.98119021803783e-05 -7.37506133562306e-05 -6.71726819061435e-05 ...
        -6.00836505620418e-05 -5.24912932492338e-05 -4.44056624078101e-05 ...
        -3.58391285391697e-05 -2.68064115649319e-05 -1.73246036074303e-05 ...
        -7.41318282523879e-06 2.90598203634857e-06 1.36086366912751e-05 ...
        2.46681562357198e-05 3.60555701958815e-05 4.77395979134737e-05 ...
        5.96866944451638e-05 7.18611071137382e-05 8.42249428086657e-05 ...
        9.67382460920958e-05 0.000109359088123313 0.000122043666370414 ...
        0.000134746415032601 0.000147420126050236 0.000160016080532727 ...
        0.000172484190386716 0.000184773149879047 0.000196830596820713 ...
        0.000208603283009807 0.000220037253523424 0.00023107803440083 ...
        0.000241670828213158 0.000251760716968662 0.000261292871757356 ...
        0.00027021276849487 0.00027846640908287 0.000286000547262474 ...
        0.000292762918398153 0.000298702472392651 0.000303769608898841 ...
        0.000307916413962262 0.000311096897198613 0.000313267228583807 ...
        0.000314385973910645 0.000314414327945721 0.000313316344303183 ...
        0.000311059161038444 0.000307613220955095 0.000302952485612177 ...
        0.000297054642016853 0.000289901300989283 0.0002814781861925 ...
        0.000271775312830102 0.000260787155028956 0.000248512800942614 ...
        0.000234956094634068 0.000220125763823554 0.000204035532618675 ...
        0.000186704218379714 0.000168155811913055 0.000148419540229638 ...
        0.000127529911153647 0.000105526739118705 8.24551515449836e-05 ...
        5.83655752503148e-05 3.3313702411801e-05 7.36043566117628e-06 ...
        -1.94281880328337e-05 -4.69810949688962e-05 -7.52222940020871e-05 ...
        -0.000104071017637067 -0.00013344188496417 -0.00016324508639445 ...
        -0.000193386590065128 -0.00022376836970086 -0.000254288653629038 ...
        -0.000284842194559216 -0.000315320559648167 -0.000345612440283163 ...
        -0.000375603980927422 -0.000405179126283357 -0.000434219985941903 ...
        -0.000462607215599893 -0.000490220413842856 -0.000516938533407673 ...
        -0.000542640305759171 -0.000567204677736611 -0.000590511258951277 ...
        -0.000612440778544552 -0.00063287554984808 -0.000651699941423479 ...
        -0.000668800852899564 -0.000684068193969968 -0.000697395364864015 ...
        -0.000708679736558904 -0.000717823128961985 -0.000724732285258343 ...
        -0.000729319340591497 -0.000731502283223706 -0.000731205406307639 ...
        -0.000728359748392982 -0.000722903520790239 -0.000714782519919543 ...
        -0.000703950522784958 -0.000690369663734556 -0.000674010790693543 ...
        -0.000654853799091983 -0.000632887941750178 -0.000608112113033571 ...
        -0.000580535105644965 -0.000550175838485027 -0.000517063554082162 ...
        -0.00048123798416993 -0.000442749482073977 -0.000401659120660878 ...
        -0.000358038754697989 -0.000311971046576331 -0.00026354945445721 ...
        -0.000212878182017576 -0.000160072089088666 -0.000105256562606864 ...
        -4.85673474247121e-05 9.84966333696161e-06 6.98386785779168e-05 ...
        0.000131234300190531 0.000193861854613992 0.00025753776472457 ...
        0.000322069961668446 0.000387258336095238 0.000452895228100707 ...
        0.000518765955037556 0.000584649376203477 0.000650318493266995 ...
        0.000715541085143909 0.000780080375891694 0.000843695734045798 ...
        0.00090614340168163 0.000967177251349136 0.00102654956889435 ...
        0.00108401186005409 0.00113931567858706 0.00119221347358763 ...
        0.00124245945351712 0.00128981046438337 0.00133402687940209 ...
        0.00137487349738386 0.00141212044700926 0.00144554409408146 ...
        0.00147492794878155 0.00150006356989712 0.0015207514629488 ...
        0.00153680196910482 0.0015480361417476 0.00155428660754205 ...
        0.00155539840885075 0.00155122982434803 0.00154165316470198 ...
        0.00152655554022255 0.00150583959741289 0.00147942422141247 ...
        0.00144724520138169 0.00140925585595108 0.00136542761594188 ...
        0.00131575056165922 0.00126023391216479 0.00119890646405128 ...
        0.00113181697736681 0.00105903450647344 0.000980648673768945 ...
        0.000896769884355539 0.000807529479902292 0.00071307983011966 ...
        0.000613594360443593 0.000509267514713356 0.000400314651820612 ...
        0.000286971875506638 0.000169495796689838 4.81632279155176e-05 ...
        -7.67291902656263e-05 -0.000204865430966154 -0.000335910590432557 ...
        -0.000469511464850056 -0.00060529719378911 -0.000742879969376211 ...
        -0.000881855810046492 -0.00102180539751153 -0.00116229497535312 ...
        -0.00130287730743374 -0.00144309269409721 -0.00158247004392025 ...
        -0.00172052799856707 -0.00185677610809636 -0.00199071605387327 ...
        -0.00212184291604943 -0.00224964648239173 -0.00237361259506726 ...
        -0.00249322453182685 -0.00260796441787486 -0.0027173146645683 ...
        -0.00282075943095469 -0.0029177861040356 -0.00300788679353299 ...
        -0.00309055983683762 -0.0031653113097339 -0.00323165653842455 ...
        -0.0032891216083206 -0.00333724486501858 -0.00337557840285808 ...
        -0.0034036895364377 -0.00342116225046795 -0.00342759862335455 ...
        -0.00342262021993592 -0.00340586944884351 -0.00337701088001402 ...
        -0.00333573251795748 -0.00328174702647532 -0.00321479290062704 ...
        -0.00313463558186326 -0.0030410685123762 -0.00293391412486564 ...
        -0.00281302476407928 -0.0026782835366598 -0.00252960508601739 ...
        -0.00236693628914482 -0.00219025687250191 -0.00199957994431721 ...
        -0.00179495244088571 -0.00157645548468186 -0.00134420465235703 ...
        -0.00109835015094806 -0.000839076900888273 -0.000566604524684254 ...
        -0.00028118724039842 1.68863406404404e-05 0.000327293512190718 ...
        0.000649677867518889 0.000983649789600132 0.00132878703651903 ...
        0.00168463542119858 0.00205070958429422 0.00242649385880013 ...
        0.00281144322462789 0.00320498435113432 0.00360651672529659 ...
        0.00401541386295952 0.00443102460031302 0.00485267446249852 ...
        0.00527966710599153 0.00571128583116595 0.00614679516121307 ...
        0.00658544248336692 0.00702645974817767 0.00746906522237702 ...
        0.00791246529069466 0.00835585630181362 0.00879842645349547 ...
        0.00923935771176387 0.00967782775890822 0.0101130119649577 ...
        0.0105440853771813 0.0109702247220906 0.0113906104143613 ...
        0.0118044285670431 0.0122108729974041 0.0126091472227416 ...
        0.0129984664405026 0.0133780594870821 0.0137471707697094 ...
        0.0141050621658935 0.0144510148849785 0.0147843312864514 ...
        0.0151043366497604 0.0154103808905273 0.0157018402181841 ...
        0.0159781187302233 0.0162386499384282 0.0164828982226374 ...
        0.0167103602078054 0.0169205660603373 0.0171130806999058 ...
        0.0172875049232044 0.0174434764363412 0.0175806707928461 ...
        0.0176988022345358 0.0177976244327673 0.0178769311278977 ...
        0.0179365566650711 0.017976376424754 0.0179963071467519 ...
        0.0179963071467519 0.017976376424754 0.0179365566650711 ...
        0.0178769311278977 0.0177976244327673 0.0176988022345358 ...
        0.0175806707928461 0.0174434764363412 0.0172875049232044 ...
        0.0171130806999058 0.0169205660603373 0.0167103602078054 ...
        0.0164828982226374 0.0162386499384282 0.0159781187302233 ...
        0.0157018402181841 0.0154103808905273 0.0151043366497604 ...
        0.0147843312864514 0.0144510148849785 0.0141050621658935 ...
        0.0137471707697094 0.0133780594870821 0.0129984664405026 ...
        0.0126091472227416 0.0122108729974041 0.0118044285670431 ...
        0.0113906104143613 0.0109702247220906 0.0105440853771813 ...
        0.0101130119649577 0.00967782775890822 0.00923935771176387 ...
        0.00879842645349547 0.00835585630181362 0.00791246529069466 ...
        0.00746906522237702 0.00702645974817767 0.00658544248336692 ...
        0.00614679516121307 0.00571128583116595 0.00527966710599153 ...
        0.00485267446249852 0.00443102460031302 0.00401541386295952 ...
        0.00360651672529659 0.00320498435113432 0.00281144322462789 ...
        0.00242649385880013 0.00205070958429422 0.00168463542119858 ...
        0.00132878703651903 0.000983649789600132 0.000649677867518889 ...
        0.000327293512190718 1.68863406404404e-05 -0.00028118724039842 ...
        -0.000566604524684254 -0.000839076900888273 -0.00109835015094806 ...
        -0.00134420465235703 -0.00157645548468186 -0.00179495244088571 ...
        -0.00199957994431721 -0.00219025687250191 -0.00236693628914482 ...
        -0.00252960508601739 -0.0026782835366598 -0.00281302476407928 ...
        -0.00293391412486564 -0.0030410685123762 -0.00313463558186326 ...
        -0.00321479290062704 -0.00328174702647532 -0.00333573251795748 ...
        -0.00337701088001402 -0.00340586944884351 -0.00342262021993592 ...
        -0.00342759862335455 -0.00342116225046795 -0.0034036895364377 ...
        -0.00337557840285808 -0.00333724486501858 -0.0032891216083206 ...
        -0.00323165653842455 -0.0031653113097339 -0.00309055983683762 ...
        -0.00300788679353299 -0.0029177861040356 -0.00282075943095469 ...
        -0.0027173146645683 -0.00260796441787486 -0.00249322453182685 ...
        -0.00237361259506726 -0.00224964648239173 -0.00212184291604943 ...
        -0.00199071605387327 -0.00185677610809636 -0.00172052799856707 ...
        -0.00158247004392025 -0.00144309269409721 -0.00130287730743374 ...
        -0.00116229497535312 -0.00102180539751153 -0.000881855810046492 ...
        -0.000742879969376211 -0.00060529719378911 -0.000469511464850056 ...
        -0.000335910590432557 -0.000204865430966154 -7.67291902656263e-05 ...
        4.81632279155176e-05 0.000169495796689838 0.000286971875506638 ...
        0.000400314651820612 0.000509267514713356 0.000613594360443593 ...
        0.00071307983011966 0.000807529479902292 0.000896769884355539 ...
        0.000980648673768945 0.00105903450647344 0.00113181697736681 ...
        0.00119890646405128 0.00126023391216479 0.00131575056165922 ...
        0.00136542761594188 0.00140925585595108 0.00144724520138169 ...
        0.00147942422141247 0.00150583959741289 0.00152655554022255 ...
        0.00154165316470198 0.00155122982434803 0.00155539840885075 ...
        0.00155428660754205 0.0015480361417476 0.00153680196910482 ...
        0.0015207514629488 0.00150006356989712 0.00147492794878155 ...
        0.00144554409408146 0.00141212044700926 0.00137487349738386 ...
        0.00133402687940209 0.00128981046438337 0.00124245945351712 ...
        0.00119221347358763 0.00113931567858706 0.00108401186005409 ...
        0.00102654956889435 0.000967177251349136 0.00090614340168163 ...
        0.000843695734045798 0.000780080375891694 0.000715541085143909 ...
        0.000650318493266995 0.000584649376203477 0.000518765955037556 ...
        0.000452895228100707 0.000387258336095238 0.000322069961668446 ...
        0.00025753776472457 0.000193861854613992 0.000131234300190531 ...
        6.98386785779168e-05 9.84966333696161e-06 -4.85673474247121e-05 ...
        -0.000105256562606864 -0.000160072089088666 -0.000212878182017576 ...
        -0.00026354945445721 -0.000311971046576331 -0.000358038754697989 ...
        -0.000401659120660878 -0.000442749482073977 -0.00048123798416993 ...
        -0.000517063554082162 -0.000550175838485027 -0.000580535105644965 ...
        -0.000608112113033571 -0.000632887941750178 -0.000654853799091983 ...
        -0.000674010790693543 -0.000690369663734556 -0.000703950522784958 ...
        -0.000714782519919543 -0.000722903520790239 -0.000728359748392982 ...
        -0.000731205406307639 -0.000731502283223706 -0.000729319340591497 ...
        -0.000724732285258343 -0.000717823128961985 -0.000708679736558904 ...
        -0.000697395364864015 -0.000684068193969968 -0.000668800852899564 ...
        -0.000651699941423479 -0.00063287554984808 -0.000612440778544552 ...
        -0.000590511258951277 -0.000567204677736611 -0.000542640305759171 ...
        -0.000516938533407673 -0.000490220413842856 -0.000462607215599893 ...
        -0.000434219985941903 -0.000405179126283357 -0.000375603980927422 ...
        -0.000345612440283163 -0.000315320559648167 -0.000284842194559216 ...
        -0.000254288653629038 -0.00022376836970086 -0.000193386590065128 ...
        -0.00016324508639445 -0.00013344188496417 -0.000104071017637067 ...
        -7.52222940020871e-05 -4.69810949688962e-05 -1.94281880328337e-05 ...
        7.36043566117628e-06 3.3313702411801e-05 5.83655752503148e-05 ...
        8.24551515449836e-05 0.000105526739118705 0.000127529911153647 ...
        0.000148419540229638 0.000168155811913055 0.000186704218379714 ...
        0.000204035532618675 0.000220125763823554 0.000234956094634068 ...
        0.000248512800942614 0.000260787155028956 0.000271775312830102 ...
        0.0002814781861925 0.000289901300989283 0.000297054642016853 ...
        0.000302952485612177 0.000307613220955095 0.000311059161038444 ...
        0.000313316344303183 0.000314414327945721 0.000314385973910645 ...
        0.000313267228583807 0.000311096897198613 0.000307916413962262 ...
        0.000303769608898841 0.000298702472392651 0.000292762918398153 ...
        0.000286000547262474 0.00027846640908287 0.00027021276849487 ...
        0.000261292871757356 0.000251760716968662 0.000241670828213158 ...
        0.00023107803440083 0.000220037253523424 0.000208603283009807 ...
        0.000196830596820713 0.000184773149879047 0.000172484190386716 ...
        0.000160016080532727 0.000147420126050236 0.000134746415032601 ...
        0.000122043666370414 0.000109359088123313 9.67382460920958e-05 ...
        8.42249428086657e-05 7.18611071137382e-05 5.96866944451638e-05 ...
        4.77395979134737e-05 3.60555701958815e-05 2.46681562357198e-05 ...
        1.36086366912751e-05 2.90598203634857e-06 -7.41318282523879e-06 ...
        -1.73246036074303e-05 -2.68064115649319e-05 -3.58391285391697e-05 ...
        -4.44056624078101e-05 -5.24912932492338e-05 -6.00836505620418e-05 ...
        -6.71726819061435e-05 -7.37506133562306e-05 -7.98119021803783e-05 ...
        -8.53531821761855e-05 -9.03732021141323e-05 -9.48727577528207e-05 ...
        -9.88546179033478e-05 -0.000102323445030354 -0.000105285710885215 ...
        -0.000107749607672523 -0.000109724955254407 -0.000111223104898436 ...
        -0.000112256840073899 -0.000112840274798238 -0.000112988750030289 ...
        -0.000112718728600063 -0.000112047689155856 -0.000110994019598881 ...
        -0.000109576910463296 -0.000107816248685572 -0.000105732512191817 ...
        -0.000103346665714883 -0.000100680058235112 -9.77543224194039e-05 ...
        -9.45912764131053e-05 -9.1212828318121e-05 -8.7640883668741e-05 ...
        -8.38972561940795e-05 -8.00035821328792e-05 -7.59812383428164e-05 ...
        -7.18512644225099e-05 -6.76342890402677e-05 -6.33504606393409e-05 ...
        -5.90193826651712e-05 -5.46600534359653e-05 -5.02908107539578e-05 ...
        -4.59292813310832e-05 -4.1592335079521e-05 -3.72960442948329e-05 ...
        -3.30556477372265e-05 -2.88855195949713e-05 -2.47991432932086e-05 ...
        -2.08090900914325e-05 -1.69270023938166e-05 -1.31635816783899e-05 ...
        -9.5285809338901e-06 -6.03080147696501e-06 -2.67809400732607e-06 ...
        5.22636255518355e-07 3.56542052313732e-06 6.44521365751937e-06 ...
        9.15787785021116e-06 1.17001629618835e-05 1.40696837310317e-05 ...
        1.62648940674174e-05 1.82850586515392e-05 2.01302220659439e-05 ...
        2.18011756875173e-05 2.3299422572093e-05 2.46271405637762e-05 ...
        2.57871438613593e-05 2.67828432731119e-05 2.76182053891161e-05 ...
        2.82977108972231e-05 2.88263122646744e-05 2.92093910025071e-05 ...
        2.94527147240993e-05 2.95623942026614e-05 2.95448406251974e-05 ...
        2.94067232325006e-05 2.91549275261735e-05 2.87965142145281e-05 ...
        2.83386790595938e-05 2.77887137773883e-05 2.7153968133169e-05 ...
        2.64418133626208e-05 2.56596070389273e-05 2.48146594944657e-05 ...
        2.39142018945285e-05 2.29653560490587e-05 2.197510603695e-05 ...
        2.09502717060681e-05 1.98974841008369e-05 1.88231628580654e-05 ...
        1.77334956007144e-05 1.66344193485592e-05 1.55316039542401e-05 ...
        1.44304375630592e-05 1.33360140850991e-05 1.22531226588586e-05 ...
        1.11862390766519e-05 1.01395191335193e-05 9.11679385339666e-06 ...
        8.12156653878671e-06 7.15701158321248e-06 6.22597497930528e-06 ...
        5.3309764495203e-06 4.47421312117854e-06 3.65756466282042e-06 ...
        2.8825997947229e-06 2.15058408288371e-06 1.46248892280873e-06 ...
        8.19001617048698e-07 2.20536448611844e-07 -3.32753348880454e-07 ...
        -8.40962824139489e-07 -1.30442184427914e-06 -1.72368103369456e-06 ...
        -2.09949721459918e-06 -2.43281844675708e-06 -2.7247687621841e-06 ...
        -2.97663268839421e-06 -3.189839651171e-06 -3.36594834486769e-06 ...
        -3.5066311549163e-06 -3.61365871358173e-06 -3.68888466606382e-06 ...
        -3.73423071985579e-06 -3.75167204584553e-06 -3.74322309502384e-06 ...
        -3.7109238898754e-06 -3.65682684460214e-06 -3.58298416329708e-06 ...
        -3.49143586007791e-06 -3.38419844003552e-06 -3.26325427467948e-06 ...
        -3.13054170040083e-06 -2.98794586334732e-06 -2.83729032904487e-06 ...
        -2.68032947012609e-06 -2.51874164066528e-06 -2.35412314089279e-06 ...
        -2.18798297148905e-06 -2.02173837226202e-06]);
end

y = step(Hd,x);


% [EOF]
