# include "gt.h"

/*

	GT Compiler
	Section 4: Parsing Tables

*/

extern	int	copflag, amopl[], c_amopl, coplist;
extern	int	mactab[], macdef[], cmacro, lineno;

extern int val, line, *pv, *pl;

ar3 ()
	{fs1();}

ar4 ()
	{fs2();}

ar21 ()
	{error(4025,lineno);}

ar22 ()
	{ftype();}

ar23 ()
	{error(4022,lineno);}

ar24 ()
	{foploc();}

ar25 ()
	{error(4023,lineno);}

ar26 ()
	{fmacro();}

ar27 ()
	{error(4024,lineno);}

ar56 ()
	{amopl[c_amopl++]= -1;coplist=0;}

ar57 ()
	{asave(pv[2]);}

ar58 ()
	{asize(pv[1],pv[3]);}

ar59 ()
	{aalign(pv[1],pv[3]);}

ar60 ()
	{apoint(pv[1],pv[3]);}

ar61 ()
	{aclass(pv[1],pv[3]);}

ar62 ()
	{aretreg(pv[1],pv[3]);}

ar63 ()
	{atype(pv[1],pv[3]);}

ar64 ()
	{aconf(pv[2],pv[4]);}

ar65 ()
	{push(pv[3]);}

ar66 ()
	{val=push(pv[1]);}

ar67 ()
	{push(pv[3]);}

ar68 ()
	{val=push(pv[1]);}

ar69 ()
	{atnames(pv[3]);}

ar70 ()
	{amnames(pv[3]);}

ar71 ()
	{arnames(pv[3]);}

ar72 ()
	{aor1(pv[1],pv[3],pv[5]);}

ar73 ()
	{aor2(pv[1],pv[3]);}

ar74 ()
	{aor3(pv[1],pv[4]);}

ar75 ()
	{aor4(pv[1]);}

ar78 ()
	{aoploc(pv[6]);}

ar79 ()
	{aamop(pv[1]);}

ar80 ()
	{aamop(pv[1]);}

ar81 ()
	{aopl(0,copflag,pv[1]);}

ar82 ()
	{aopl(1,copflag,pv[1]);}

ar83 ()
	{aopl(1,0,0);}

ar84 ()
	{aopl(2,copflag,pv[1]);}

ar86 ()
	{copflag=pv[1]+2;val=0;}

ar87 ()
	{val=pv[1] | pv[3];}

ar88 ()
	{val= ~pv[2];}

ar89 ()
	{val=pv[2];}

ar90 ()
	{val=aope(-1);}

ar91 ()
	{val=aope(-2);}

ar92 ()
	{val=aope(pv[1]);}

ar93 ()
	{val=aclobber(pv[2]);}

ar94 ()
	{val=0;}

ar95 ()
	{macdef[cmacro++]=pv[2];mpush(-1);}

ar100 ()
	{mpush(-3);val=pv[2];}

ar101 ()
	{val=mpsh2(3,-3);}

ar102 ()
	{val=mpsh2(copflag,pv[1]);copflag=0;}

ar103 ()
	{val=mpsh2(0,0);}

ar104 ()
	{mactab[pv[1]]=cmacro;}

ar105 ()
	{nmac(pv[1],cmacro);}

ar106 ()
	{push(pv[3]);}

ar107 ()
	{val=push(pv[1]);}

int (*act[])() {
	0, 0, 0, ar3, ar4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, ar21, ar22, ar23, ar24, ar25, ar26, ar27, 0,
	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
	0, 0, 0, 0, 0, 0, 0, 0, ar56, ar57, ar58, ar59, ar60, ar61,
	ar62, ar63, ar64, ar65, ar66, ar67, ar68, ar69, ar70, ar71,
	ar72, ar73, ar74, ar75, 0, 0, ar78, ar79, ar80, ar81, ar82,
	ar83, ar84, 0, ar86, ar87, ar88, ar89, ar90, ar91, ar92,
	ar93, ar94, ar95, 0, 0, 0, 0, ar100, ar101, ar102, ar103,
	ar104, ar105, ar106, ar107, -1};



int r1[] {
	0, 1, 2, 3, 4, 5, 5, 6, 6, 6, 7, 7, 8, 8, 8, 8, 8, 8, 9,
	9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15, 16,
	17, 17, 18, 19, 19, 20, 21, 21, 22, 23, 23, 24, 25, 25,
	26, 27, 27, 28, 29, 29, 30, 31, 31, 32, 33, 34, 35, 36,
	37, 38, 39, 40, 41, 41, 42, 42, 43, 44, 45, 46, 46, 46,
	46, 47, 47, 48, 49, 49, 50, 51, 51, 52, 53, 53, 54, 54,
	54, 54, 54, 54, 55, 55, 56, 57, 57, 58, 58, 59, 59, 60,
	60, 61, 61, 62, 62, -1};

int r2[] {
	0, 2, 8, 1, 1, 2, 0, 1, 1, 1, 2, 0, 1, 1, 1, 1, 1, 1, 1,
	0, 1, 0, 1, 0, 1, 0, 1, 0, 2, 1, 2, 1, 3, 3, 1, 3, 3, 1,
	3, 3, 1, 3, 3, 1, 3, 3, 1, 3, 3, 1, 3, 3, 1, 3, 3, 1, 2,
	3, 4, 4, 4, 4, 4, 4, 5, 3, 1, 3, 1, 5, 5, 5, 6, 5, 5, 4,
	2, 1, 7, 3, 2, 1, 1, 0, 1, 1, 1, 3, 2, 3, 1, 1, 1, 3, 0,
	2, 3, 2, 2, 1, 9, 1, 1, 0, 1, 1, 3, 1, -1};

int g[] {
	0, 0, 2, 0, 3, 0, 5, 0, 4, 0, 10, 0, 6, 0, 23, 0, 15, 0,
	37, 0, 66, 0, 98, 0, 152, 0, 99, 0, 153, 0, 24, 0, 52,
	0, 25, 0, 40, 0, 26, 0, 43, 0, 27, 0, 46, 0, 16, 0, 34,
	0, 38, 0, 63, 0, 67, 0, 95, 0, 28, 0, 49, 99, 126, 0, 100,
	0, 29, 82, 111, 0, 53, 70, 103, 0, 41, 73, 105, 0, 44,
	76, 107, 0, 47, 93, 120, 0, 64, 123, 148, 0, 96, 79, 109,
	0, 50, 0, 50, 31, 57, 32, 58, 68, 102, 74, 106, 80, 110,
	91, 119, 121, 147, 185, 188, 0, 56, 0, 11, 0, 12, 0, 13,
	61, 90, 0, 35, 0, 133, 133, 159, 0, 134, 124, 149, 0, 101,
	0, 135, 0, 173, 0, 182, 160, 174, 180, 183, 0, 136, 127,
	157, 128, 158, 161, 175, 166, 176, 181, 176, 187, 176,
	0, 137, 0, 186, 153, 165, 0, 154, 0, 155, 0, 168, 168,
	178, 0, 169, 181, 184, 187, 190, 0, 177, 155, 170, 0, 156,
	0, 156, -1};

int pg[] {
	0, 0, 1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27,
	29, 31, 33, 35, 37, 39, 41, 43, 45, 47, 49, 51, 53, 55,
	57, 59, 61, 65, 67, 71, 75, 79, 83, 87, 91, 95, 97, 115,
	117, 119, 121, 125, 127, 131, 135, 137, 139, 141, 147,
	161, 163, 167, 169, 171, 175, 181, 185, -1};

int nbpw {16};

int nwpbt {2};

int a[] {
	0, 0, 0, 60, 30, 85, 185, 191, 124, 61, 161, 128, 97, 7,
	17, 18, 19, 20, 65, 8, 125, 21, 129, 9, 36, 22, 14, 130,
	33, 39, 167, 12294, 4097, 16384, 0, 12299, 20481, 8192,
	136, 12291, 4122, 8206, 12307, 20481, 49152, 547, 12292,
	4100, 8222, 0, 4100, 8223, 0, 4100, 8224, 0, 12293, 12295,
	12297, 12296, 4124, 8225, 0, 4120, 8228, 12309, 12306,
	4125, 8231, 0, 4124, 8234, 0, 4124, 8237, 0, 4100, 8240,
	0, 4125, 8243, 0, 4125, 8246, 0, 12298, 12300, 12301, 12304,
	12302, 12303, 12305, 4124, 8247, 0, 4100, 8251, 0, 4099,
	8252, 4105, 8253, 0, 12334, 4124, 8254, 0, 4114, 8257,
	12311, 12308, 4100, 8260, 0, 4099, 8261, 4105, 8262, 0,
	12325, 4100, 8263, 0, 4099, 8264, 4105, 8265, 0, 12328,
	4100, 8266, 0, 4099, 8267, 4105, 8268, 0, 12331, 4124,
	8269, 0, 4099, 8270, 4105, 8271, 0, 12343, 4100, 8272,
	0, 4099, 8273, 4105, 8274, 0, 12322, 4099, 8275, 0, 12356,
	4101, 8277, 4105, 8276, 0, 4101, 8278, 4105, 8276, 0, 4101,
	8279, 4105, 8276, 0, 4105, 8281, 4125, 8280, 0, 12332,
	4124, 8225, 0, 4100, 8283, 0, 4099, 8284, 4105, 8285, 0,
	12337, 4124, 8286, 0, 4108, 8289, 12313, 12310, 12323,
	4125, 8231, 0, 4125, 8296, 0, 12326, 4124, 8234, 0, 12329,
	4124, 8237, 0, 4105, 8300, 0, 12341, 4100, 8240, 0, 12320,
	4125, 8243, 0, 12345, 4124, 8304, 0, 4099, 8305, 0, 4099,
	8306, 0, 4099, 8307, 0, 4105, 8308, 0, 4101, 8310, 4125,
	8309, 0, 12333, 12335, 4124, 8254, 0, 4100, 8313, 0, 4099,
	8314, 4105, 8315, 0, 12340, 4104, 8316, 0, 4116, 8317,
	0, 4108, 8289, 12312, 12317, 20481, 2048, 2112, 4100, 8319,
	4124, 8323, 4125, 8324, 0, 4101, 8330, 4105, 8276, 0, 12324,
	4101, 8331, 0, 12327, 4101, 8332, 4105, 8276, 0, 12330,
	4124, 8333, 0, 12342, 4101, 8334, 4105, 8276, 0, 12321,
	12355, 12357, 12358, 12359, 4101, 8336, 4125, 8335, 0,
	4101, 8337, 0, 12363, 4101, 8338, 4105, 8276, 0, 12336,
	12338, 4124, 8286, 0, 4108, 8289, 12368, 4108, 8342, 4124,
	8343, 12315, 12316, 20481, 2048, 2112, 4100, 8319, 4124,
	8323, 0, 12378, 12379, 12380, 12374, 20481, 2048, 2112,
	4100, 8319, 4124, 8323, 4125, 8324, 12344, 12365, 4105,
	8352, 0, 12369, 4106, 8353, 12373, 12347, 12348, 12349,
	4101, 8354, 0, 12346, 4101, 8355, 0, 12361, 12362, 12350,
	4101, 8356, 4105, 8276, 0, 12339, 12367, 12392, 12393,
	12290, 4108, 8342, 4124, 8343, 12314, 12319, 4100, 8358,
	4108, 8342, 4124, 8343, 4126, 8359, 0, 4104, 8363, 0, 4101,
	8364, 4106, 8353, 0, 12376, 12364, 20481, 2048, 2112, 4100,
	8319, 4124, 8323, 4125, 8324, 12371, 12352, 12360, 12351,
	12318, 20481, 2048, 2112, 4100, 8319, 4124, 8323, 12391,
	12389, 4100, 8358, 4126, 8359, 12383, 12387, 4104, 8371,
	0, 12385, 12377, 4105, 8372, 0, 12370, 12375, 4106, 8353,
	12390, 4105, 8373, 0, 12386, 12384, 20481, 2048, 2112,
	4100, 8319, 4124, 8323, 4125, 8324, 0, 20481, 2048, 2112,
	4100, 8319, 4124, 8323, 12391, 4102, 8377, 12382, 12372,
	4105, 8379, 0, 4099, 8381, 0, 20481, 2048, 2112, 4100,
	8319, 4124, 8323, 12391, 4103, 8383, 4105, 8276, 0, 12366,
	4101, 8384, 0, 12381, 4104, 8385, 0, 4126, 8386, 0, 12388,
	-1};

int pa[] {
	0, 31, 32, 35, 36, 40, 43, 47, 50, 53, 56, 57, 58, 59,
	60, 63, 66, 67, 70, 73, 76, 79, 82, 85, 86, 87, 88, 89,
	90, 91, 92, 92, 92, 95, 98, 103, 104, 107, 110, 111, 114,
	119, 120, 123, 128, 129, 132, 137, 138, 141, 146, 147,
	150, 155, 156, 159, 160, 165, 170, 175, 180, 181, 184,
	187, 192, 193, 196, 199, 92, 200, 201, 204, 207, 208, 92,
	211, 212, 215, 218, 219, 92, 222, 223, 226, 227, 230, 233,
	236, 239, 242, 247, 92, 248, 249, 252, 255, 260, 261, 264,
	267, 270, 271, 281, 286, 287, 290, 291, 296, 297, 300,
	301, 306, 307, 308, 309, 310, 311, 316, 319, 320, 325,
	92, 326, 327, 330, 333, 338, 339, 339, 347, 348, 349, 350,
	351, 361, 362, 365, 366, 369, 370, 371, 372, 375, 376,
	379, 380, 381, 382, 387, 388, 389, 390, 391, 392, 397,
	398, 407, 410, 415, 416, 417, 339, 427, 428, 429, 430,
	431, 439, 440, 445, 446, 449, 450, 451, 454, 455, 456,
	459, 462, 463, 464, 474, 482, 485, 486, 92, 489, 492, 500,
	505, 506, 509, 510, 513, 516, -1};

