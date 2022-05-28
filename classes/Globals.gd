extends Node

enum {
	CAMERA_HALF_LOCK
	CAMERA_FULL_LOCK
}

enum {
	MAPR_FILE = 0
	MAPR_FILE_ABSOLUTE = 1
	MAPR_FILE_SONG_ABSOLUTE = 2
	MAPR_EMBEDDED = 3
	MAPR_EMBEDDED_SONG_ABSOLUTE = 4
}

enum {
	REGISTRY_MAP
	REGISTRY_COLORSET
}

enum {
	SPEED_NORMAL = 0
	SPEED_MMM = 1
	SPEED_MM = 2
	SPEED_M = 3
	SPEED_P = 4
	SPEED_PP = 5
	SPEED_PPP = 6
	SPEED_CUSTOM = 7
}

onready var speed_multi:Array = [
	1,
	1/1.35,
	1/1.25,
	1/1.15,
	1.15,
	1.25,
	1.35,
	SSP.custom_speed,
]

enum {
	END_PASS
	END_FAIL
	END_GIVEUP
}

enum {
	NSTATE_ACTIVE
	NSTATE_HIT
	NSTATE_MISS
}

enum {
	SEARCH_ALLTEXT
	SEARCH_ID
	SEARCH_NAME
	SEARCH_CREATOR
	SEARCH_RARITY
	SEARCH_DIFFICULTY
	SEARCH_TYPE
}

enum {
	DIFF_UNKNOWN = -1
	DIFF_EASY = 0
	DIFF_MEDIUM = 1
	DIFF_HARD = 2
	DIFF_LOGIC = 3
	DIFF_AMOGUS = 4
}

enum {
	MAP_TXT = 0
	MAP_RAW = 1
	MAP_VULNUS = 2
	MAP_SSPM = 3
}

const difficulty_names:Dictionary = {
	-1: "N/A",
	0: "EASY",
	1: "MEDIUM",
	2: "HARD",
	3: "LOGIC?",
	4: "助",
#	4: "包",
}

const difficulty_colors:Dictionary = {
	-1: Color("#ffffff"),
	0: Color("#00ff00"),
	1: Color("#ffb900"),
	2: Color("#ff0000"),
	3: Color("#d76aff"),
	4: Color("#36304f"),
#	4: Color("#00f3ff"),
}

const official_map_difficulties:Dictionary = {
	2078819639: 0, 3666416563: 0, 2075061500: 1, 238047242: 0, 245187339: 0, 1699595302: 0, 249267198: 0,
	559268903: 0, 386985639: 0, 650896988: 1, 281483823: 0, 681860111: 1, 578191186: 1, 1575860312: 3,
	1062766900: 1, 214902446: 1, 504638621: 1, 669964370: 1, 274104495: 1, 1427790366: 1, 6231292063: 1,
	6163286595: 3, 5677056394: 3, 365812441: 2, 1097842314: 2, 6231305963: 0, 1442181643: 2, 2541137828: 2,
	1327560508: 2, 1963320587: 2, 212377911: 0, 168715430: 0, 222370123: 0, 2622446812: 0, 1288525393: 2,
	534878097: 2, 4004758494: 2, 438461952: 0, 1000138668: 2, 2682607269: 3, 4465441577: 0, 207858659: 3,
	2576727651: 0, 599547742: 2, 1737513255: 2, 1709482868: 2, 1467404779: 3, 313282457: 0, 790687989: 0,
	1622422458: 1, 148090019: 0, 1284335817: 3, 477994892: 0, 5849814763: 2, 585362578: 0, 191807472: 0,
	2651084031: 1, 567017848: 1, 2499997892: 0, 2628545297: 0, 2351332739: 0, 1890794190: 0, 2147155642: 1,
	2499459824: 2, 934855994: 2, 1189093836: 3, 1955219093: 2, 1876458625: 1, 1467307249: 0, 2025316001: 1,
	512340370: 3, 603265655: 2, 2099686208: 1, 1876363591: 0, 1436613096: 2, 2319863103: 0, 548184018: 0,
	2499473632: 3, 834756398: 3, 2723566837: 1, 327095350: 1, 1702113991: 2, 2533880583: 2, 1039275233: 1,
	1539123469: 1, 538345128: 3, 934857550: 1, 934859927: 3, 1921667881: 0, 2559287331: 2, 2415462372: 3,
	5639284536: 3, 1167981609: 3, 2348097648: 1, 996640965: 2, 6219793013: 1, 1826422056: 0, 705261901: 1,
	786062578: 1, 142563912: 2, 6219795567: 1, 964577011: 2, 2617841807: 2, 2820299090: 1, 453400361: 1,
	1876273954: 1, 657142623: 3, 2608469000: 0, 716547078: 2, 1467372748: 2, 1203808893: 2, 2038608693: 3,
	912973031: 0, 884411590: 0, 1080148668: 2, 658952256: 2, 1166214458: 1, 640955545: 1, 2835656051: 1,
	363371982: 3, 2464178962: 3, 2944328447: 2, 704445922: 2, 622532814: 0, 2975575778: 1, 991376771: 3,
	1528965854: 1, 317952034: 2, 515604325: 2, 525666932: 3, 380903765: 0, 1167151479: 3, 3220928971: 2,
	1617737624: 1, 3066084243: 1, 3042939950: 0, 1467474940: 1, 2930695397: 1, 1531299266: 3, 1937552794: 1,
	155303605: 1, 1702235117: 3, 3028022157: 2, 619724986: 0, 2829935390: 3, 2042967573: 2, 575299478: 0,
	2017858643: 3, 912161089: 1, 2085298709: 3, 3017252605: 1, 855408519: 2, 2007187018: 3, 412333048: 0,
	3105441821: 2, 1317683014: 3, 3161147345: 3, 2770905615: 3, 257620996: 3, 2400723864: 2, 1594180022: 2,
	1838925187: 3, 3274940709: 1, 530528640: 2, 2960126597: 2, 1990992677: 1, 315363007: 1, 1326681176: 2,
	686446289: 2, 2310792453: 2, 2523582586: 0, 1570855153: 2, 2551800344: 0, 2108165267: 2, 982687613: 3,
	5998353444: 2, 301404094: 1, 1214465121: 0, 4932781132: 3, 2322714790: 3, 181292438: 0, 1164630932: 3,
	2232798331: 1, 1280706499: 2, 2348127083: 3, 1547067732: 2, 2124900294: 2, 2025062017: 2, 5798051610: 2,
	1836553363: 1, 1167128948: 2, 1473560932: 1, 577543579: 3, 2601727984: 1, 393700652: 2, 167375447: 2,
	977599206: 1, 1477438406: 0, 507880003: 2, 2743813268: 3, 1426355953: 3, 3035778842: 3, 3212501476: 3,
	1332404059: 2, 1120415412: 3, 183142252: 3, 2879145983: 2, 919050740: 3, 256251217: 2, 1617749268: 2,
	992074603: 2, 632469399: 1, 2200197510: 2, 398159550: 0, 3274918813: 2, 3044791372: 3, 1192813052: 0,
	3040802954: 3, 1509605355: 3, 997901199: 3, 3382858796: 2, 318062766: 3, 392370456: 3, 719234755: 2,
	2858597387: 3, 341628710: 2, 1460224315: 1, 179034620: 0, 2136861512: 3, 408532470: 0, 904930498: 2,
	382412237: 2, 5668572995: 2, 3312498559: 3, 2671401222: 3, 3475558934: 3, 1163819774: 3, 1953337238: 3,
	2377109284: 3, 2567531741: 3, 999133984: 2, 391793570: 3, 3440168066: 1, 2234873423: 3, 2539170448: 3,
	1709490106: 2, 5410085863: 0, 905367562: 2, 1150512000: 0, 1853410104: 2, 331194969: 3, 2747577875: 1,
	567268874: 3, 3271586490: 1, 712013220: 3, 5565404836: 3, 3216367999: 2, 1027377207: 1, 3214119047: 0,
	907914007: 3, 699219962: 2, 1483974553: 1, 1358402354: 2, 1904501177: 2, 1367698276: 2, 2158235112: 2,
	1481130031: 1, 576523293: 1, 1282584035: 3, 5644239853: 1, 1445664742: 2, 2422624921: 2, 1278973941: 2,
	2906576599: 1, 3808583341: 2, 3432354520: 3, 3043909447: 3, 807477694: 2, 3943319031: 3, 1655671033: 3,
	3672323517: 1, 2687938889: 2, 3740458244: 3, 154305943: 2, 667719600: 3, 3688424557: 3, 4158401079: 2,
	2904013375: 3, 2176415014: 3, 1617762754: 3, 1931001768: 3, 3878033300: 3, 180242200: 3, 5621288677: 3,
	5796383884: 2, 381898250: 2, 2083334760: 3, 683479799: 3, 466747595: 0, 3495127317: 2, 270874103: 2,
	345835112: 0, 1296538196: 3, 2418560979: 3, 2981460485: 3, 1327553658: 3, 1588735924: 3, 408070278: 3,
	5624074401: 3, 3200851349: 0, 2931109543: 3, 3812596123: 3, 1197831449: 3, 986907724: 2, 374501448: 3,
	1916505674: 2, 833795559: 3, 149146201: 2, 2013329960: 3, 1132955649: 3, 195692041: 3, 3386725682: 3,
	1492179112: 3, 1531369470: 3, 1388107109: 3, 306878812: 3, 3504325841: 3, 3823148664: 3, 5544099256: 0,
	592222839: 3, 2027652726: 3, 395351949: 3, 1347311045: 3, 579807914: 3, 738770341: 3, 3610973184: 1,
	3169148983: 1, 5809093396: 1, 189133683: 2, 1257503235: 3, 404480840: 2, 2915863581: 2, 2634532649: 2,
	1868933606: 1, 1499837940: 2, 1167830584: 1, 1037245665: 3, 164730417: 3, 1747451164: 3, 3014143676: 3,
	1747430851: 3, 2266075091: 3, 2892496927: 3, 6910034784: 2, 3273522421: 3, 3086224250: 3, 1188211449: 3,
	846869190: 3, 2461094832: 3, 1848368992: 3, 3955060642: 3, 1880847183: 3, 2878403701: 3, 3246780051: 3,
	180110109: 1, 3778546754: 3, 753598780: 3, 2992906610: 3, 3771401877: 3, 5852342274: 3, 1981569146: 0,
	2996149487: 3, 3814956141: 3, 318062185: 3, 1173915974: 3, 2022987037: 3, 2592962812: 3, 2623483302: 3,
	4281075694: 3, 2124850053: 3, 305047121: 3, 2759838450: 2, 1481949785: 2, 2883061097: 3, 395845961: 2,
	1861803115: 3, 160139345: 1, 549238713: 3, 4315879021: 3, 2506806350: 3, 4214638493: 3, 1130296074: 1,
	495875391: 0, 2193955215: 3, 1340933088: 1, 2791574457: 3, 1902036963: 2, 3584584668: 1, 317631102: 2,
	6092141221: 1, 1448870823: 3, 3032094578: 0, 835458580: 2, 2028287791: 3, 628743356: 3, 2237242791: 3,
	3330414980: 3, 2632564761: 3, 3369407590: 3, 1224359066: 1, 882108716: 3, 165065112: 2, 192360508: 3,
	6200899362: 3, 2256762093: 2, 2462446287: 3, 4229327966: 3, 4202803251: 3, 1693948941: 3, 1001888338: 2,
	1973159142: 3, 4107343551: 1, 342674648: 2, 6085581855: 3, 3776053617: 2, 3065635125: 2, 3850537223: 2,
	4255301368: 2, 1228725788: 2, 289523078: 2, 2626267559: 2, 895610819: 2, 1226735921: 1, 3438951568: 2,
	3081234269: 0, 3712406821: 1, 1428850587: 2, 904815294: 3, 1546244519: 3, 295032735: 2, 6230701644: 1,
	531057711: 0, 1305368527: 1, 5686598715: 3, 2908153516: 2, 1588724716: 3, 511231293: 2, 1359043798: 1,
	3062757771: 1, 2477584498: 0, 2785457487: 1, 2641135385: 0, 6910785033: 1, 455214011: 2, 3547321834: 1,
	6061798175: 0, 3517221921: 2, 393237211: 3, 398952458: 3, 1861780345: 3, 556067598: 2, 1412585598: 3,
	6477870301: 3, 284932572: 1, 2466855471: 2, 195822354: 2, 3586422832: 1, 703465717: 3, 3504927248: 3,
	2982960392: 3, 1062246632: 3, 2609076173: 1, 945885035: 1, 4663224110: 3, 2725838964: 1, 3127352706: 2,
	1838904377: 3, 1425453563: 3, 2168518839: 3, 1234149214: 3, 751160152: 3, 3163893412: 3, 3237924374: 3,
	337742747: 3, 145755979: 2, 3573130923: 3, 3476595500: 3, 1859929072: 3, 1165802639: 3, 1344881572: 3,
	1838943441: 3, 569045108: 3, 1891287391: 3, 2578070891: 3, 5539953370: 1, 2849809652: 0, 2611332070: 3,
	2478408753: 2, 636747478: 2, 2769551418: 3, 571197225: 3, 526400606: 3, 213559002: 1, 257065805: 2,
	2112578134: 3, 6453142509: 2, 161498572: 2, 586732256: 3, 2919152103: 3, 633330382: 2, 562446893: 2,
	589973177: 2, 1097844835: 2, 1483090408: 2, 958411320: 2, 2878659587: 3, 1703736010: 3, 3239613048: 1,
	2103386764: 0, 5058165392: 1, 469226699: 1, 190591230: 3, 803238333: 0, 6086414617: 3, 1387133587: 2,
	2371543268: 2, 5403767069: 3, 1305251774: 0, 1975809924: 2, 150200166: 0, 2808581936: 3, 1327600769: 3,
	281136047: 3, 455246798: 3, 2603339119: 3, 1839086666: 3, 3108634904: 3, 3598762744: 3, 2532740352: 3,
	1226886109: 2, 2410587346: 0, 2669836031: 0, 3043964557: 2, 3216503634: 3, 1531334069: 3, 2682319388: 2,
	280036577: 1, 5563466338: 3, 431432734: 3, 1714980768: 2, 919850557: 1, 1674132944: 2, 1579326038: 1,
	147930134: 3, 1231106030: 1, 1211795202: 1, 1199443456: 1, 192946240: 3, 3110190504: 3, 823062320: 3,
	448997675: 3, 346102116: 3, 145031622: 3, 583634411: 3, 3181553805: 3, 3108672499: 3, 3233325099: 3,
	360366727: 3, 2475400182: 3, 2810948982: 3, 723509680: 3, 938216265: 3, 1004991456: 3, 1521664624: 3,
	3620723141: 3, 803525903: 3, 3470774669: 3, 1588725965: 3, 5673252521: 1, 1369817860: 1, 320729139: 3,
	4397684229: 3, 727979905: 3, 5337989837: 2, 2512501939: 3, 347070212: 2, 2587275169: 3, 750763984: 2,
	1973180103: 3, 2778255092: 3, 908535806: 1, 1682735449: 2, 285995415: 3, 1241225380: 3, 4447465339: 3,
	2479013718: 0, 487295316: 3, 1784512071: 3, 927739239: 1, 4461287318: 3, 1228696343: 3, 2820815076: 3,
	4027028379: 3, 4487067901: 3, 3180278564: 3, 3154480366: 3, 4136439434: 2, 1861761046: 3, 1930926455: 3,
	2011847746: 3, 924246374: 2, 166238074: 0, 6534554744: 3, 639099888: 3, 266634124: 2, 5758310799: 1,
	6077554081: 3, 1038041441: 1, 1189907783: 2, 3104010515: 3, 3824017809: 3, 2049950976: 3, 4483123832: 3,
	3288591680: 3, 2285919139: 1, 2362396604: 1, 3944651911: 3, 500263933: 3, 631314940: 3, 526391483: 3,
	4526437609: 3, 2536650205: 3, 1073303999: 3, 1747455288: 3, 3840038012: 3, 1747459493: 3, 3530606394: 3,
	1405179485: 3, 786862044: 0, 943961217: 3, 4510440689: 3, 5297935165: 2, 1337807659: 0, 2080539455: 3,
	214278472: 3, 889271083: 3, 4407135933: 3, 2606277947: 3, 4407184482: 3, 4407281731: 3, 2790846194: 2,
	6058219929: 3, 567269055: 3, 1425902111: 3, 5570101297: 3, 4576414216: 3, 888580379: 3, 922347354: 0,
	2659531944: 2, 685641412: 3, 1343241846: 3, 4483951049: 3, 3861544817: 3, 887606344: 3, 1296518458: 3,
	4460583975: 3, 1459988581: 3, 343812231: 1, 2989003883: 1, 865068453: 2, 966837797: 3, 1496224456: 3,
	3517231661: 3, 3505731310: 3, 4498588465: 3, 4513484957: 3, 1973190958: 3, 3457535290: 3, 333650510: 3,
	4511798261: 3, 2305698813: 3, 3061057426: 3, 4492941290: 3, 4418740715: 3, 3587691321: 2, 2229175823: 3,
	2912280581: 3, 4582109272: 3, 3906571314: 1, 4434210811: 3, 1817932404: 3, 2820826019: 3, 4493613001: 3,
	3169164988: 3, 4553381316: 3, 1486089074: 3, 4073415486: 3, 2130593682: 3, 4584835738: 3, 4102155984: 3,
	641813059: 3, 2607577532: 3, 190835390: 0, 3252056632: 3, 3501084556: 3, 332294424: 3, 1555752960: 3,
	4756913153: 3, 142334905: 2, 4543942611: 2, 483285684: 0, 4324887277: 1, 2496689181: 3, 4134631174: 3,
	4492553978: 1, 146240452: 1, 4529588665: 1, 4564159616: 1, 1840443760: 3, 729936476: 3, 142722650: 2,
	3408478004: 3, 4570828955: 3, 5919571399: 2, 1036139885: 0, 622555911: 3, 151012576: 3, 166457117: 1,
	149001869: 3, 1160329570: 1, 566032971: 1, 4384598945: 3, 3934973293: 3, 4332287334: 3, 2547027048: 3,
	4563274529: 3, 4572362923: 3, 2909149559: 3, 2996886734: 3, 3091807773: 3, 3965441599: 3, 4376664313: 3,
	3416014069: 3, 4389781533: 3, 4543822326: 3, 4059178173: 3, 5468184715: 3, 298977146: 3, 4553059227: 3,
	4539453521: 3, 214288662: 3, 4453697067: 3, 2011699225: 3, 2175354529: 3, 3073979435: 3, 3416527804: 3,
	2664981194: 1, 1540814179: 1, 563427593: 3, 202697708: 3, 614157675: 3, 6007444975: 3, 912554197: 3,
	5188543714: 3, 3248914574: 0, 5348965486: 3, 4597706377: 3, 145154345: 2, 560639145: 3, 601322809: 3,
	2296616521: 3, 155519850: 3, 758304140: 3, 2159399671: 3, 1100239357: 3, 2598224585: 3, 3628899080: 3,
	2520368801: 3, 2982966292: 3, 6227961925: 2, 615921924: 3, 508568148: 3, 603146550: 1, 2499247772: 3,
	1842199505: 1, 3241753311: 3, 4579586053: 3, 1788630507: 3, 4598228356: 3, 1417103027: 3, 2714450604: 3,
	1225131077: 3, 2084935139: 3, 4565796080: 3, 1788749499: 3, 2496909049: 2, 881468729: 0, 3944976860: 0,
	1074314048: 1, 592906411: 1, 4009323776: 3, 837104892: 3, 1899750327: 3, 1853477332: 3, 3519915980: 0,
	3057452125: 1, 1066003252: 3, 1452831919: 3, 317494709: 3, 2157127290: 3, 1689534670: 1, 1330843199: 3,
	2976247028: 2, 2922488492: 3, 4453518004: 3, 2918076842: 3, 703156943: 3, 1725886358: 3, 2022787645: 3,
	330542165: 3, 1193198184: 3, 1532334872: 3, 642463830: 3, 315581552: 3, 3101827030: 3, 4053428641: 3,
	4636430551: 3, 4665619979: 3, 2011520798: 3, 879036027: 1, 1671333980: 1, 1993437271: 3, 2614211983: 3,
	1222970152: 3, 173813043: 3, 2704518251: 3, 3598825735: 3, 290233559: 3, 2878084262: 3, 2581112923: 3,
	4580529122: 3, 4597547490: 3, 4597675057: 3, 4484390702: 3, 2139879062: 3, 1315411616: 3, 2617725119: 3,
	185429260: 3, 1449693083: 3, 1134696007: 3, 4287153669: 0, 5569788610: 3, 1588442296: 3, 348768395: 3,
	1098075189: 1, 4586442848: 2, 5732653525: 3, 3325502420: 1, 2930704688: 1, 1117522463: 3, 1132669649: 3,
	2723376203: 2, 720696725: 3, 1494747651: 3, 2538022177: 3, 4506513047: 3, 2248992726: 3, 4485470674: 3,
	255475084: 2, 5725807335: 3, 4595263031: 3, 4561920206: 3, 4686197301: 3, 2430210303: 3, 2480714937: 3,
	3990368863: 3, 4621805129: 3, 1409668861: 3, 397753092: 3, 4574994840: 3, 1584472434: 2, 1833385948: 3,
	158199510: 3, 4608433782: 3, 284819869: 2, 1828832147: 3, 2307031443: 2, 4618921414: 2, 4093545325: 3,
	304734939: 2, 4651243865: 3, 1786652362: 2, 2627574953: 2, 3420451833: 3, 3239622642: 3, 4670194047: 3,
	2606280160: 3, 4631136332: 3, 4637535538: 3, 4632835261: 3, 4012487579: 3, 4531941788: 3, 4637175522: 3,
	4606981902: 3, 4606970883: 3, 1447402904: 3, 4192714699: 3, 1228718279: 3, 2655172776: 3, 3401292474: 3,
	3239898150: 3, 2499151718: 3, 195622274: 3, 1847080398: 1, 1000716888: 1, 174766799: 2, 2733661658: 0,
	494244670: 3, 409413677: 2, 4644498037: 3, 4606767503: 3, 1112915270: 3, 2279965133: 3, 4638334747: 3,
	148893804: 1, 3564300625: 3, 320177036: 0, 188988878: 3, 2687907395: 1, 705578871: 3, 260312442: 3,
	5405984372: 2, 936083868: 3, 1022302550: 3, 6361879452: 2, 2260400455: 3, 4484432079: 2, 4500444800: 3,
	627848963: 1, 952774272: 1, 913921166: 3, 3325542259: 3, 3103840888: 3, 4605282482: 3, 589970745: 3,
	273161324: 3, 372648313: 3, 4553414604: 0, 4239221655: 3, 1130617379: 3, 1150867044: 3, 144555174: 3,
	2631079584: 3, 639942473: 3, 265910142: 2, 4598655987: 3, 1716982053: 0, 4045680569: 3, 2641710505: 3,
	4550283509: 3, 4485501404: 3, 2192332629: 3, 2964842403: 3, 1009867561: 2, 1390536810: 1, 317808056: 1,
	657813878: 2, 1394377490: 3, 1927145416: 2, 4602001352: 3, 4622124220: 3, 4645487369: 3, 6211106971: 1,
	2727198844: 1, 1932847108: 3, 2098633770: 3, 1257930279: 3, 833779944: 3, 4548531060: 3, 6618073233: 3,
	361511879: 3, 4684939499: 3, 4588611550: 3, 1274882749: 3, 612836673: 2, 273866348: 3, 1293160092: 3,
	3014693247: 2, 951211027: 2, 2803513116: 3, 154482026: 3, 4607908174: 3, 2581161873: 1, 602760395: 3,
	4648413816: 1, 3638591385: 3, 1430298215: 2, 4947099982: 3, 4526748106: 3, 1315870515: 1, 380567867: 2,
	373501958: 3, 1891600872: 3, 4613636314: 2, 4650130360: 3, 1591899649: 3, 4708183236: 3, 3890747311: 3,
	4546909371: 3, 4725775998: 3, 4757592127: 3, 4749059137: 3, 1088254259: 3, 700654812: 3, 3500058222: 3,
	2989079481: 3, 1280474133: 3, 1327401624: 3, 1588869658: 3, 3204400277: 3, 3312885910: 3, 379984356: 3,
	4515400409: 3, 1459142928: 2, 2415630988: 3, 233580752: 3, 2912255141: 3, 3580086314: 3, 1356425939: 3,
	4620686206: 3, 4480544702: 2, 4708142164: 3, 3559665809: 3, 247347920: 2, 4688248194: 3, 4660743645: 3,
	1025128859: 2, 2541080632: 0, 1453664941: 3, 2496246958: 3, 4708074037: 3, 2855353064: 0, 4072828872: 2,
	1111121678: 3, 3736939466: 1, 4510458290: 3, 178313176: 2, 4729633365: 3, 4696427093: 3, 5186752366: 3,
	4685112165: 3, 4770587176: 3, 5450501358: 3, 6234848552: 0, 1973385328: 3, 1999907410: 3, 612829976: 3,
	4708150700: 3, 4752608036: 3, 416048076: 3, 3216450165: 3, 4708108755: 3, 2476454506: 2, 2990945325: 3,
	2011649557: 3, 4532131777: 3, 4735862368: 3, 2052816147: 3, 1839241605: 3, 1903277935: 3, 4669076145: 3,
	5011220077: 3, 4719887857: 3, 4209201202: 3, 4751717243: 3, 3007729519: 3, 5931783375: 3, 4739777595: 3,
	4583366656: 3, 2747869710: 3, 386471577: 2, 4729783338: 1, 1947120512: 3, 1441915711: 3, 250662571: 2,
	3308421927: 3, 4681819429: 1, 4741036128: 3, 4164489413: 1, 966357735: 1, 4733843054: 3, 1848195066: 2,
	204244549: 1, 1844272474: 3, 1734977296: 3, 4644861799: 3, 3028026428: 3, 4767123008: 3, 4769639470: 3,
	2506446443: 3, 819373905: 3, 4764105409: 3, 4804624137: 3, 4109746518: 3, 2516594215: 2, 4835430965: 3,
	4757074392: 3, 4734545607: 3, 1414381193: 3, 2065334370: 3, 635908787: 3, 4706736407: 2, 272564773: 2,
	949663014: 3, 300672187: 2, 688772998: 2, 869060291: 3, 760930588: 2, 187163530: 2, 902433825: 2,
	2632144245: 3, 841462765: 3, 944423818: 2, 205960490: 2, 2566605392: 3, 1384112429: 1, 198590337: 1,
	1228558002: 3, 2468581020: 3, 716543423: 3, 171128305: 3, 861656138: 1, 1117752059: 3, 1292441853: 3,
	4747081399: 3, 251955405: 2, 833804133: 3, 1189925849: 3, 6219793887: 0, 3191997224: 3, 192116711: 0,
	4700104289: 3, 1008563115: 3, 631578220: 2, 4708115815: 2, 4621310875: 3, 4810925915: 3, 4796931599: 1,
	402668289: 3, 1111834813: 3, 1886511705: 2, 2379930732: 3, 2110759486: 3, 1032975381: 3, 515664417: 3,
	319472299: 3, 4749836067: 3, 2248297943: 3, 1444036716: 3, 2104164026: 3, 4654978499: 3, 2889745460: 3,
	2011481162: 3, 1826428190: 3, 2535918679: 3, 4589451080: 3, 4742256513: 3, 6701564681: 3, 4452585285: 3,
	217643593: 3, 4708725778: 2, 376565757: 3, 2539762709: 2, 5790785664: 3, 1175400249: 2, 6246352549: 3,
	2912237657: 3, 1163862389: 3, 4702395444: 3, 5283336131: 3, 3512535833: 3, 2271297369: 3, 4769213227: 3,
	4782774248: 3, 852947793: 2, 6789893128: 3, 5711628730: 3, 1518997709: 2, 2089441665: 0, 3310217049: 3,
	455488002: 2, 1004123955: 1, 2763603224: 1, 4710989656: 3, 2295361069: 3, 3175704999: 2, 276600186: 2,
	539755262: 3, 3044055111: 3, 4960127581: 3, 144360940: 3, 2560642136: 0, 4562781217: 3, 241307802: 2,
	4569332872: 3, 1117441322: 3, 4548366066: 3, 1308045778: 3, 2029808250: 3, 301671784: 2, 1596102020: 3,
	1953766309: 3, 4871213934: 3, 4786516191: 3, 911295747: 2, 4884700281: 3, 1408622736: 3, 4829425205: 3,
	4521921674: 0, 1864891284: 1, 3556806276: 3, 4720758619: 3, 3089991101: 3, 4792445971: 3, 324512446: 1,
	4817790015: 3, 3504015202: 3, 2695573983: 3, 5709729529: 3, 4629318284: 3, 4928231779: 3, 4947898624: 3,
	220548357: 2, 5966588406: 3, 2090890309: 3, 4848647491: 3, 4866475588: 3, 3715049824: 3, 2554666021: 3,
	2816536873: 3, 4882670158: 3, 4873325201: 3, 2677339487: 3, 4899538751: 3, 2455415408: 3, 4379802810: 3,
	4449554300: 3, 2131108282: 3, 1839149994: 3, 4955690328: 3, 1901159334: 3, 4839869527: 3, 1419029928: 3,
	4871228338: 3, 4798846498: 3, 4801481857: 3, 4858222156: 3, 4987249792: 3, 4838133374: 3, 3137702847: 3,
	635195287: 3, 742951792: 3, 6225345868: 3, 819648270: 3, 442044864: 2, 4714024367: 1, 360983296: 2,
	4852745167: 2, 707724331: 1, 1189654292: 2, 3417267904: 3, 4810042965: 3, 1050392312: 2, 1679333885: 2,
	1427344405: 2, 3292899529: 1, 445803246: 2, 631670511: 3, 2976489348: 3, 4119360169: 3, 6404627730: 3,
	6343759433: 3, 168337558: 3, 5955089884: 2, 3650040936: 2, 4657250518: 3, 4983842748: 3, 6343745946: 2,
	4771444872: 2, 6109997472: 1, 4666570939: 2, 178491945: 2, 1843002183: 1, 277065470: 2, 4772209005: 1,
	2977547523: 3, 1119709168: 3, 4954675950: 3, 1938028153: 3, 2705081807: 3, 3315186243: 3, 2048690454: 3,
	2130908028: 3, 2557874969: 3, 792221404: 3, 4972651322: 3, 4706426069: 3, 2893487116: 3, 1424797352: 2,
	1652039106: 3, 716114804: 2, 4895959372: 3, 1402748531: 3, 4585325052: 1, 4951449728: 3, 4979799444: 3,
	328799528: 2, 1889855782: 2, 262005432: 2, 142545037: 3, 3136284650: 3, 4608493701: 3, 3366834116: 1,
	1505487022: 3, 3376030615: 3, 4945258579: 3, 4932868167: 2, 3649888483: 3, 2296322183: 3, 4500553651: 2,
	3208758673: 2, 1448689113: 3, 4891004794: 0, 249362645: 2, 2130913015: 3, 2165317022: 3, 3037591984: 3,
	2577048151: 2, 2260733299: 2, 190835260: 1, 3065864647: 3, 2746555965: 3, 231733504: 3, 844693851: 2,
	1679978314: 2, 2383110752: 3, 2385999365: 2, 842660229: 3, 1391045180: 3, 246467474: 3, 218308959: 2,
	3024934059: 3, 180975577: 3, 168478650: 1, 3606161685: 3, 900308654: 3, 862684851: 1, 3282736971: 2,
	376831940: 3, 3926167929: 2, 151517074: 1, 2056658111: 2, 1736027377: 2, 4702149828: 2, 590936038: 3,
	710626436: 3, 986312879: 2, 1158388934: 3, 4592215517: 3, 4941075364: 3, 3039593257: 2, 844545210: 2,
	2934688642: 3, 1714985851: 3, 1147723044: 2, 2835035033: 3, 4928890611: 2, 3242256956: 2, 1380513332: 3,
	4164643179: 3, 3515959328: 3, 3283059478: 3, 4922742822: 2, 2840329478: 3, 4829068664: 3, 4925744610: 3,
	4486063139: 3, 1148385088: 3, 2668792068: 2, 5001592142: 3, 297343361: 2, 4911001528: 3, 4899476033: 3,
	4881123603: 3, 4899617907: 3, 981914802: 3, 4818746335: 3, 4758926780: 3, 622985617: 3, 2903949957: 3,
	2217725205: 3, 3158208394: 3, 4811764347: 3, 4589567906: 3, 4159278280: 3, 5396892469: 2, 2862153471: 2,
	2743962594: 3, 4617493898: 3, 4863016802: 3, 676690677: 3, 1073477665: 3, 4102169069: 3, 1856198546: 3,
	6699870105: 3, 6043319987: 1, 4551255431: 3, 1124568641: 3, 2903778520: 3, 439926316: 1, 885888223: 3,
	3043553081: 3, 231311035: 2, 4577316125: 3, 231717956: 2, 4748037425: 3, 2920078671: 3, 3231930564: 1,
	2014296322: 1, 575636737: 2, 4990815876: 1, 1489894522: 1, 197189786: 1, 2582370452: 2, 6343758418: 2,
	3234130397: 3, 2754291315: 2, 4708128416: 3, 4510436552: 3, 4842973011: 3, 3416514930: 3, 4928369444: 3,
	4961060026: 3, 4339820625: 3, 4828017890: 3, 4878478896: 3, 4896063838: 3, 2717554604: 3, 4863401524: 3,
	4713487086: 3, 360366376: 3, 455249417: 3, 4902670486: 3, 1588783159: 3, 4862070895: 3, 4835049962: 3,
	4991650687: 3, 469081214: 3, 4618118873: 3, 4898192387: 3, 1211635847: 3, 2992138119: 3, 4662918271: 3,
	4893214065: 3, 4947531485: 3, 151245550: 0, 4357942209: 3, 4585245347: 3, 2136889623: 3, 2829301673: 3,
	5116297559: 3, 4888796339: 1, 3049165129: 3, 3975607085: 3, 1057842305: 3, 806947472: 3, 4788633985: 3,
	3517185628: 2, 2023007450: 3, 166026102: 3, 1858168936: 3, 2316688638: 2, 1033438052: 3, 513291861: 3,
	991175420: 2, 4617650071: 2, 4537090692: 3, 2038976967: 3, 4484742690: 3, 633424370: 3, 4962015370: 3,
	2736533997: 3, 1839308834: 3, 4377268995: 3, 2784410477: 3, 5124107801: 3, 5130591047: 2, 2271112402: 3,
	338190586: 3, 533737539: 1, 4885737471: 3, 1210128228: 2, 5225956843: 3, 774752285: 2, 5138020800: 3,
	5148493505: 3, 315205728: 2, 4868273382: 3, 5210814851: 3, 5191673123: 3, 3230572904: 3, 318890513: 3,
	2191161131: 3, 3553604276: 3, 186197721: 2, 5166474743: 3, 5135404272: 0, 2912277821: 0, 1104771310: 2,
	5116152143: 3, 5116269848: 3, 3034135985: 3, 4633953195: 3, 1401609670: 3, 5156910594: 3, 5228250004: 3,
	5126344871: 3, 974461021: 3, 5191865727: 3, 164603401: 3, 1326552262: 3, 552396416: 0, 4864150686: 3,
	5125833187: 3, 5126355480: 3, 5135502643: 3, 4899600658: 3, 4935581914: 3, 5002102513: 3, 225557046: 3,
	485221165: 2, 1730011099: 3, 684376608: 3, 5146162218: 3, 4725093228: 3, 4867295319: 3, 5071008248: 3,
	3085056584: 3, 985181837: 3, 5149924031: 3, 4785045339: 2, 5051322683: 2, 4993603874: 3, 5125598453: 3,
	4787704428: 3, 1175659162: 2, 3168753912: 3, 189467369: 3, 1589396874: 3, 2554670231: 3, 5100703232: 3,
	1491646117: 3, 5095909025: 2, 2704485071: 3, 4618135786: 3, 4618195909: 2, 305163432: 2, 384418761: 1,
	2153740127: 3, 5161352196: 1, 262903777: 0, 868854128: 3, 3565336438: 3, 576075040: 3, 2987397546: 3,
	851486083: 2, 1521668385: 3, 1904133008: 3, 264393227: 3, 930280770: 3, 5075098989: 3, 4993662667: 3,
	420540999: 2, 863276523: 3, 440557058: 3, 5169662210: 3, 4882886326: 3, 5156135350: 3, 3638123910: 3,
	531165030: 1, 2583045807: 3, 5034732210: 3, 590071128: 3, 4976242579: 3, 1335576925: 2, 4472015589: 1,
	4064792609: 3, 4475711093: 3, 159827731: 3, 5104114450: 3, 1747491419: 3, 5130492303: 3, 5035444937: 3,
	4939677429: 3, 4033783099: 3, 5153518445: 3, 2248253843: 3, 4770530418: 2, 5067223253: 3, 5166099740: 3,
	5007279401: 1, 5070969960: 2, 5209452585: 3, 574828953: 3, 3534212527: 3, 5187510186: 3, 5003875295: 3,
	5249233043: 3, 2569365263: 3, 2415559038: 1, 5224214431: 3, 2056422435: 3, 3137461323: 3, 5130390667: 2,
	217911531: 3, 1084180609: 3, 5074716067: 2, 2361591278: 2, 2461782152: 2, 4739235085: 3, 4739148210: 3,
	5831767928: 3, 3727388982: 3, 5071037890: 3, 5023922016: 2, 5153185120: 2, 263607745: 3, 2470730992: 2,
	2901159515: 3, 5039356260: 3, 5222388539: 3, 4517242376: 3, 2506844836: 3, 1962070908: 3, 3233069375: 3,
	142493309: 2, 5126868124: 3, 5017338170: 3, 320085894: 0, 740793705: 3, 3416165251: 3, 981567932: 3,
	5209125937: 3, 977968113: 3, 5000552639: 3, 3091824455: 3, 2655754727: 2, 4996833282: 3, 4554493729: 0,
	2089389490: 3, 1438319463: 3, 4111133500: 3, 142314927: 2, 3538921718: 2, 1345496670: 3, 493647101: 3,
	2990346670: 3, 5101181387: 2, 1603200923: 3, 1081037156: 3, 4889836240: 3, 1266052151: 3, 1385436317: 2,
	4635544601: 3, 1470500967: 3, 4693548494: 3, 5439684846: 3, 5410084802: 3, 1571816370: 3, 5292294083: 3,
	4673632294: 3, 4904176849: 3, 5065857666: 3, 4691471746: 2, 2821179745: 3, 5569784014: 3, 5256612278: 1,
	1289266752: 3, 4653364798: 3, 5280461784: 3, 705159356: 1, 5352817906: 3, 5321020744: 3, 2878464971: 0,
	338857256: 3, 5588620542: 3, 5462849843: 3, 5412060375: 3, 5544727115: 3, 3728779403: 0, 3178735939: 3,
	5545514564: 3, 5268658986: 3, 6135265434: 3, 253498065: 3, 253498223: 3, 5272433527: 3, 5448945110: 3,
	5322357708: 3, 5569793307: 3, 5326608251: 3, 5322260118: 3, 4942104022: 0, 1327382469: 3, 5008008970: 3,
	2298319128: 2, 2324863168: 3, 5649546559: 3, 5552567483: 3, 5266141436: 3, 451990667: 3, 4969649275: 3,
	5391731254: 3, 243735671: 2, 5036592186: 3, 5073273263: 3, 4760733670: 3, 5630923998: 3, 5385599722: 3,
	5361367314: 3, 4521542086: 3, 3405798808: 3, 627185060: 2, 5446874017: 3, 1047567668: 3, 2246489608: 2,
	4785290144: 1, 5150856372: 3, 558018936: 3, 3043904571: 3, 4970686423: 3, 5043076332: 3, 2150401647: 2,
	1277687237: 3, 5026373045: 3, 4547989923: 3, 3338439770: 3, 3113187018: 1, 4457994858: 3, 5100342416: 3,
	5100467103: 2, 287794839: 3, 4588373978: 3, 5982267821: 1, 3243508638: 3, 2226911502: 1, 302968539: 2,
	322005043: 2, 511170994: 1, 511170556: 1, 313391614: 0, 2098624159: 3, 5337740336: 3, 247264550: 3,
	216836510: 3, 929457020: 3, 2010482777: 2, 854459393: 2, 4634498437: 3, 982538854: 2, 649414035: 3,
	5542231453: 0, 2562631515: 3, 216295506: 3, 5010591914: 2, 143673926: 1, 1451429628: 2, 4714165472: 3,
	4698458969: 3, 4757845911: 3, 3892895408: 3, 944707205: 3, 570821582: 3, 4773240889: 3, 5561528227: 3,
	2503393589: 3, 1228561391: 3, 5627739817: 3, 5096176801: 1, 5464176504: 3, 5514291406: 3, 5070541005: 3,
	2501449520: 3, 4798681409: 3, 2624348893: 3, 5151403745: 3, 5372522495: 3, 5492718133: 3, 165495300: 3,
	1526929904: 3, 5349078244: 3, 3941423920: 0, 5508772633: 3, 5477846129: 3, 4551424609: 3, 4735721809: 3,
	302445460: 3, 5520443979: 2, 5649314596: 3, 5272336250: 3, 5324500415: 1, 5174368198: 1, 5621291643: 3,
	4973922685: 3, 5439427299: 3, 591637639: 1, 1914067519: 3, 3230098686: 3, 5630117178: 3, 5610299127: 3,
	5467408059: 3, 1895435563: 3, 5327008248: 3, 2232828527: 3, 5292229100: 3, 1359099759: 3, 5208453942: 2,
	5208481597: 0, 1180374876: 1, 3045100264: 2, 4984897316: 2, 5477398575: 3, 5304907831: 3, 5368462143: 2,
	4492458458: 2, 5164803780: 3, 324935345: 3, 5260826244: 3, 5299197145: 3, 4690231231: 0, 1994909505: 3,
	5243591850: 3, 2008462135: 3, 586027716: 2, 389334223: 1, 848209501: 3, 264917939: 3, 300924308: 0,
	1916277261: 3, 5006036023: 2, 5146439429: 3, 706817339: 2, 4801223256: 3, 507826882: 3, 4732586390: 3,
	4705080128: 3, 888825687: 3, 2243368013: 3, 5306063478: 3, 3610440492: 3, 4944670182: 3, 5280452281: 3,
	5317538912: 3, 3328381840: 3, 2645255671: 3, 3184479363: 3, 609229025: 2, 5717167972: 3, 5736404176: 2,
	5589469624: 3, 5625352355: 3, 5725808687: 3, 5723102232: 3, 5942038647: 3, 5981556405: 3, 6018160253: 3,
	1083649139: 3, 3394235925: 1, 2385920846: 3, 5722345370: 3, 5722343765: 3, 5622403448: 3, 5722212226: 3,
	5722218987: 3, 5644789505: 3, 6017753647: 3, 4761196587: 2, 3202691738: 3, 656303364: 2, 4848464738: 3,
	1972830777: 2, 945964262: 3, 3641784500: 3, 623002290: 3, 1266309392: 3, 833793672: 3, 2691171280: 3,
	5172902740: 3, 5701209391: 3, 5096789641: 3, 5292223808: 3, 4586650348: 3, 5831899938: 3, 5546225793: 3,
	5780605179: 3, 5372958439: 3, 5616948242: 3, 5771730494: 3, 7575732085: 0, 5648020597: 3, 5851755177: 3,
	5701359298: 3, 5366250622: 1, 5803377247: 3, 949399870: 3, 5725859181: 3, 2810116237: 3, 5721558248: 3,
	4490217716: 2, 1953528755: 3, 5349636568: 3, 5171019710: 3, 5924838391: 3, 5105166609: 1, 5638106424: 1,
	2766892349: 2, 1920545139: 3, 4693652098: 3, 567892306: 3, 251887449: 3, 1128484160: 3, 1612507548: 3,
	948226507: 3, 5776863589: 3, 5789980424: 3, 4749056050: 3, 5495488839: 3, 5835017472: 3, 4821740682: 3,
	5949888091: 3, 6032308131: 3, 6018942240: 3, 2526491140: 1, 1532863070: 1, 5670926068: 3, 5784128407: 3,
	5423574790: 0, 5661772097: 3, 5619199697: 3, 2985051471: 3, 6069943916: 3, 5965695816: 3, 5975953181: 3,
	5766507915: 3, 5937208166: 3, 2577425375: 2, 6072176344: 2, 676175314: 2, 932638993: 2, 6078852562: 3,
	4277041927: 2, 5037985125: 2, 3512671715: 2, 6072672024: 3, 6023939661: 3, 6231516068: 3, 6169121761: 3,
	6156931106: 3, 6118251157: 3, 2928057191: 3, 6170138568: 3, 6219715662: 3, 6065418936: 2, 874653548: 0,
	3210200812: 1, 1318955341: 2, 6135473006: 1, 4461630504: 3, 5764494448: 3, 6163483528: 3, 3835561878: 3,
	186267011: 3, 2605467044: 3, 5263792164: 3, 5305329391: 3, 5763285378: 3, 5054663695: 3, 6142410147: 3,
	6248258619: 3, 6167234622: 3, 5988060792: 3, 6196350014: 3, 5727283340: 3, 6114141620: 3, 6163620000: 3,
	6198841558: 3, 5379373529: 3, 6144956510: 3, 6143637296: 3, 656390264: 3, 6018576355: 3, 6074204488: 3,
	6013726024: 3, 3370858002: 3, 3029446500: 3, 6433169423: 1, 6874771841: 3, 6674221682: 3, 6448238302: 1,
	6554714060: 3, 6419343273: 3, 6589832499: 3, 6403898157: 3, 6471097582: 2, 4645449717: 3, 6134302106: 3,
	2761937631: 2, 6401635620: 3, 2564431241: 3, 6167774209: 3, 6455789833: 3, 4392577421: 3, 6433221665: 3,
	184721435: 2, 6531292018: 3, 6485202429: 3, 6427969046: 3, 6410318401: 2, 1691170420: 3, 6100280695: 3,
	6271990141: 3, 4991378741: 3, 6395412797: 3, 5597476693: 2, 4239127654: 3, 2576808051: 3, 5991452236: 2,
	5471076085: 3, 6271154390: 3, 4700081056: 3, 5104528753: 3, 6471628946: 0, 6361877391: 0, 6552518861: 2,
	6600129516: 1, 6603735676: 2, 3103933890: 3, 6418630949: 1, 6301591753: 3, 6327414414: 2, 6447347281: 0,
	4933702688: 3, 5274735921: 3, 5678564704: 2, 6185627974: 3, 244912480: 3, 6066724077: 0, 6230515114: 3,
	6270993169: 1, 6345516067: 3, 5832675714: 3, 6407348262: 3, 6069599050: 3, 5438895257: 3, 6440770006: 3,
	6464178031: 3, 6394939009: 3, 6223515270: 3, 943708987: 3, 6468932417: 3, 988607882: 3, 5291208932: 3,
	1150508616: 1, 5501375134: 3, 641175763: 3, 1189929238: 3, 5785521470: 3, 2465927771: 3, 1973837494: 3,
	6415278786: 3, 6172133772: 2, 5876223564: 3, 6044311928: 3, 4877212163: 3, 5498981640: 2, 5528073501: 3,
	6643352173: 3, 5620798964: 3, 6054711102: 3, 6499469519: 3, 6421710646: 3, 3173493024: 3, 5221753024: 3,
	4945489580: 3, 4823873413: 3, 5649409964: 2, 6471606891: 3, 5711838871: 3, 6432731271: 3, 6008092792: 3,
	7575722904: 1, 6233534893: 3, 5596645628: 3, 6048147591: 3, 1566840411: 1, 168915768: 2, 6535845862: 3,
	6560191068: 2, 5986678929: 3, 3091483741: 1, 5563452322: 3, 5391651223: 2, 6003782961: 3, 1107681951: 3,
	5993502265: 3, 6192299934: 3, 4652171462: 3, 5723447832: 3, 6362870142: 3, 3292326010: 3, 5725568960: 3,
	925714702: 3, 6428554848: 3, 6252553649: 3, 6555332898: 3, 6192366498: 2, 6163645402: 3, 4772008742: 3,
	6521867791: 3, 3040164458: 2, 5857447912: 2, 1374158689: 3, 6244094753: 2, 6196070923: 3, 6361523169: 2,
	6151973993: 2, 6100076283: 2, 6547771002: 3, 6234762681: 3, 7566799358: 1, 1587331752: 3, 6554704748: 1,
	6215119984: 3, 6573177583: 0, 6362520475: 3, 5376037550: 2, 203181567: 3, 2601052788: 2, 5809325003: 3,
	2922592018: 3, 1881689580: 3, 5183171842: 3, 6535256612: 3, 6533140692: 3, 5410081404: 3, 5014841712: 3,
	5199979597: 0, 6499466263: 3, 3333905869: 2, 1428045893: 3, 5231857700: 3, 4366866223: 3, 6428784374: 3,
	2437243292: 3, 5332163289: 3, 6395235172: 3, 6144044012: 3, 5005088275: 3, 6168331683: 3, 5072159217: 3,
	3777439632: 2, 6234805459: 2, 6648722444: 1, 7576500558: 0, 4927402217: 3, 1208798090: 3, 5979913939: 3,
	6288127800: 3, 6528987469: 3, 4628219855: 1, 6468660915: 1, 6132502285: 3, 6727781917: 3, 6501289496: 1,
	6735674760: 3, 2286046454: 3, 2968541790: 3, 6864536101: 1, 6817544668: 1, 6910804592: 1, 6808632955: 0,
	6244085956: 0, 4009209899: 3, 6464194089: 2, 7170502075: 1, 5330949888: 1, 6910765774: 3, 4660197111: 0,
	6655389008: 3, 6450046902: 3, 6390779289: 1, 6037397908: 3, 586943362: 3, 6637997544: 2, 6854968932: 3,
	6407220559: 3, 5835116213: 3, 5113228942: 3, 6144321290: 3, 6989097556: 3, 6691400409: 3, 7062044125: 3,
	6511749526: 3, 6869133434: 3, 6866801046: 3, 6739430572: 3, 5753850155: 3, 6601742360: 3, 7076193469: 3,
	2019031963: 3, 5911147337: 3, 887123203: 3, 2934673089: 3, 4807309456: 3, 906347387: 3, 6034265860: 3,
	5195000383: 3, 6782068013: 3, 6792984033: 2, 6443250315: 3, 1434548579: 3, 6704035520: 3, 6451576960: 3,
	6098116259: 2, 6905865976: 2, 6823905803: 3, 6808243141: 3, 6929077195: 3, 6163542413: 3, 6166944270: 3,
	6714093869: 2, 6163525044: 3, 6685940317: 3, 1343510795: 3, 6148078603: 3, 6615280109: 3, 4866206472: 3,
	7094878688: 3, 7076263099: 3, 6923686884: 3, 2506640651: 2, 7546851963: 2, 7586075868: 3, 5251923454: 3,
	7607527463: 3, 6972935934: 3
}

var error_sound:AudioStream

var audioLoader:AudioLoader = AudioLoader.new()
