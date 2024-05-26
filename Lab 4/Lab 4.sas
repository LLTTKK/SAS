Data Lab4;
Infile '/home/u62236541/SAS totural/Lab 4/lab4_2022.dat';
INPUT Model $1-9 
		Year 10-13 
		Brand $15-20 
		price :COMMA9.;
Length cost $10;
Length country $5;

If price = '.' then cost = '.';
else IF price < 10000 then cost = "LOW";
else if price > 30000 then cost = "HIGH";
else cost = "MISSING";

IF Model = "Corvette" Then do;
Brand = "Chevy";
country = "USA";
END;
Else IF Model = "Miata" then do;
 Brand = "Mazda";
 country = "Japan";
END;
Else if Model = "Supra" then do;
Brand = "Toyota";
country = "Japan";
END;
IF Brand in ("Mazda", "Toyota" ,"Honda") then country = "Japan";
Else country = "USA";
IF country = "Japan";

RUN;

PROC Print Data = Lab4;
	Format Price Dollar10.;
	