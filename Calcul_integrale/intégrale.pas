program untitled;

uses crt;
var sigma,mx,my,r,teta,rmin,rmax,tetamin,tetamax,x1,x2,x3,x4,y1,y2,volume,trapeze,pave,fmin,fmax,Aire,VTOT: real;
	i,j,N : integer;
	fichier : text;
const 	adresse ='Valeurs.txt';

function f(sigma,mx,my,r,teta : real) : real;

begin
f:=(1/(2*pi*sigma*sigma))*exp(-(r*r-2*r*(mx*cos(teta)+my*sin(teta))+(mx*mx+ my*my))/(2*sigma*sigma))*r
end;

procedure integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax : Real; N : Integer; var VTOT : Real);
var i,j: Integer;
	Volume,Aire : Real;
begin
VTOT:=0;
for i:=0 to N-1 do
	begin
	for j:=0 to N-1 do
		begin
		// N² Aires sont calculées et sommées
		Aire:=((tetamax-tetamin)/N)*f(sigma,mx,my,rmin+i*(rmax-rmin)/N,tetamin+j*(tetamax-tetamin)/N); //le pas pour les téta est égale à (tetamax-tetamin)/N
		Volume:=Aire*((rmax-rmin)/N); //le pas pour les téta est égale à (rmax-rmin)/N
		VTOT:=VTOT+Volume;
		end;
	end;
end;

BEGIN
//Paramètres à fixer
	sigma:= 1     ;
	mx:= 0        ;
	my:= 0        ;
//le pas des deux bornes
N:=1000;	
Volume:=0;
Aire:=0;
VTOT:=0;


//ecrire les valeurs dans le fichier
assign(fichier, adresse);
rewrite(fichier);

//zone rouge
writeln(fichier, 'zone rouge');
rmin:=0; rmax:=0.04 ; tetamin:=0; tetamax:=2*pi;
integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
writeln(fichier, VTOT);
//zone orange
writeln(fichier, 'zone orange');
rmin:=0.04; rmax:=0.09 ; tetamin:=0; tetamax:=2*pi;
integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
writeln(fichier, VTOT);
//zone orange claire
	//de la zone 0 à 10
	writeln(fichier, 'zones oranges claires');
	for i:=0 to 10 do
	begin
	write(fichier,i,' : ');
	rmin:=0.09; rmax:=0.58 ; tetamin:=pi/2-pi/20-i*pi/10; tetamax:=pi/2+pi/20-i*pi/10;
	integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
	writeln(fichier, VTOT);
	end;
//zone bleu
	//de la zone 0 à 10
	writeln(fichier, 'zones bleues');
	for i:=0 to 10 do
	begin
	write(fichier,i,' : ');
	rmin:=0.58; rmax:=0.63 ; tetamin:=pi/2-pi/20-i*pi/10; tetamax:=pi/2+pi/20-i*pi/10;
	integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
	writeln(fichier, VTOT);
	end;
//zone jaune
	//de la zone 0 à 10
	writeln(fichier, 'zones jaunes');
	for i:=0 to 10 do
	begin
	write(fichier,i,' : ');
	rmin:=0.63; rmax:=0.95 ; tetamin:=pi/2-pi/20-i*pi/10; tetamax:=pi/2+pi/20-i*pi/10;
	integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
	writeln(fichier, VTOT);
	end;
//zone rose
	//de la zone 0 à 10
	writeln(fichier, 'zones roses');
	for i:=0 to 10 do
	begin
	write(fichier,i,' : ');
	rmin:=0.95; rmax:=1 ; tetamin:=pi/2-pi/20-i*pi/10; tetamax:=pi/2+pi/20-i*pi/10;
	integrale(sigma,mx,my,rmin,rmax,tetamin,tetamax,N,VTOT);
	writeln(fichier, VTOT);
	end;

close(fichier);

write('C''est bon ! Toutes les valeurs sont ecrites dans le fichier')
END.

