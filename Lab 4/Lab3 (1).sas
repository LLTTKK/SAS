LIBNAME LAB3 '/home/u62236541';
data lab3.partA;
infile "/home/u62236541/SAS totural/Lab 3/lab3_2022.dat" DLM = ' ';
Input Name $ OldMaths OldEnglish OldChinese OldPhysics OldICT;

	Array array1(5) OldMaths OldEnglish OldChinese OldPhysics OldICT;
	Array newarray (5) Maths English Chinese Physics ICT;
	Array totalarr(5) Mathtotal ENGtotal Chitotal PHYtotal ICTtotal;
	 Do i = 1 to 5;
	 if array1(i) ='.' then newarray(i) = '.';
	 else If array1(i) < 0 then newarray(i) = 0;
	 else  newarray(i) = array1(i) ;
	 totalarr(i)=newarray(i);
	 END;
	
	MAXSCORE = max(newarray(1),newarray(2),newarray(3),newarray(4),newarray(5));
	DROP OldMaths OldEnglish OldChinese OldPhysics OldICT i;

RUN;

proc print data = Lab3;
	var Lab3;
	Title 'Summary performance of students';
	
RUN;



/*
Data Lab3;
set lab3.partA;	
if OldMaths = . then Maths = .;
else if OldMaths < 35 then Maths = 0;
else Maths = OldMaths;

if OldEnglish = . then English = .;
else if OldEnglish < 35 then English = 0;
else English = OldEnglish;

if OldChinese = . then Chinese = .;
else if OldChinese < 35 then Chinese = 0;
else Chinese = OldChinese;

if OldPhysics = . then Physics = .;
else if OldPhysics < 35 then Physics = 0;
else Physics = OldPhysics;

if OldICT = . then ICT = .;
else if OldICT < 35 then ICT = 0;
else ICT = OldICT;

ToTal=sum(Maths , English , Chinese , Physics , ICT);

MINS = min(Maths , English , Chinese , Physics , ICT);

MAXS = max(Maths , English , Chinese , Physics , ICT);

MEANSC = mean(Maths , English , Chinese , Physics , ICT);

WVM = 0.1*Maths+0.3*English+0.3*Chinese+0.1*Physics+0.2*ICT;

RUN;

proc print data = Lab3;
	var Name Maths English Chinese Physics ICT Total MINS MAXS MEANSC WVM;
	Title 'Summary performance of students';
	
RUN;
