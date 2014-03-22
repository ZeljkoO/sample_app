$title CLSP-RM-SS

Sets
         k                       Produkte
         t                       Perioden;

Parameters
         c(t)                    vorhandene Produktionskapazität in der Periode t
         cr(t)                   vorhandene Wiederaufbereitungskapazität in der Periode t
         d(k,t)                  Nachfrage nach Produkt k in der Periode t
         hc(k)                   holding Kosten für Produkt k pro Einheit und Periode
         hcr(k)                  holding Kosten für Produktrückkehrer von Produkt k pro Einheit und Periode
         M                       hinreichen große Zahl für Produkt k in Periode t
         pc(k)                   Produktionskosten pro Einheit des Produkts k
         pcr(k)                  Wiederaufbereitungskosten pro Einheit des Produkts k
         r(k,t)                  Produktrückkehrer von Produkt k in der Periode t
         sc(k)                   Rüstkosten für Produkt k
         scr(k)                  Rüstkosten für Produktrückkehrer des Produkts k
         tp(k)                   Produktionsdauer pro Einheit des Produkts k
         tpr(k)                  Wiederaufbereitungsdauer pro Einheit des Produkts k
         ts(k)                   Rüstdauer für Produktion des Produkts k
         tsr(k)                  Rüstdauer für Wiederaufbereitung des Produkts k
         Y0(k)                   Lageranfangsbestand des absatzfähigen Produkts k
         Y0r(k)                  Lageranfangsbestand von Produktrückkehrern des Produkts k;

Positive Variables
         Q(k,t)                  Produktionsmenge des Produkts k in Periode t
         Qr(k,t)                 Wiederaufbereitungsmenge des Produkts k in Periode t
         Y(k,t)                  Lagerbestand des Produkts k am Ende der Periode t
         Yr(k,t)                 Lagerbestand von Produktrückkehrern des Produkts k am Ende der Periode t;

Binary Variables
         gamma(k,t)              binaere Rüstvariable für Produkt k in Periode t
         gammar(k,t)             binaere Rüstvariable für Wiederverarbeitung des Produkts k in Periode t
;

Variables
         ZF                      Zielfunktionswert;

Equations
         ZFkt                    Minimierung der Gesamtkosten
         Lbil(k,t)               Lagerbilanzgleichung für verarbeitete Produkte
         Lbilr(k,t)              Lagerbilanzgleichung für Produktrückkehrer
         Kapres(t)               Kapazitaetrestriktion für Produktion
         Kapresr(t)              Kapazitaetsrestriktion für Wiederverarbeitung
         Ruestbedingung(k,t)     Ruestbedingung für Produktion
         Ruestbedingungr(k,t)    Ruestbedingung für Wiederverarbeitung
;

ZFkt..                   ZF =e= sum((k,t), hc(k)*Y(k,t) + hcr(k)*Yr(k,t)) + sum((k,t), sc(k)*gamma(k,t) + scr(k)*gammar(k,t)) + sum((k,t), pc(k)*Q(k,t) + pcr(k)*Qr(k,t));
Lbil(k,t)..              Y0(k)$(ord(t)=1) + Y(k,t-1)$(ord(t)>1) + Q(k,t) + Qr(k,t) =e= d(k,t) + Y(k,t);
Lbilr(k,t)..             Y0r(k)$(ord(t)=1) + Yr(k,t-1)$(ord(t)>1) + r(k,t) =e= Qr(k,t) + Yr(k,t);
Kapres(t)..              sum(k, tp(k)*Q(k,t) + ts(k)*gamma(k,t)) =l= c(t);
Kapresr(t)..             sum(k, tpr(k)*Qr(k,t) + tsr(k)*gammar(k,t)) =l= cr(t);
Ruestbedingung(k,t)..    Q(k,t) =l= M*gamma(k,t);
Ruestbedingungr(k,t)..   Qr(k,t) =l= M*gammar(k,t);

Model CLSPRMSS /all/;

$include CLSP_RM_SS_Input.inc

Option optcr =0.0;
M=100000;

Solve CLSPRMSS using mip minimizing ZF;

display
         Q.l
         Qr.l
         Y.l
         Yr.l

file outputfile1 / 'Produktionsprogramm.txt'/;
put outputfile1;

put 'Zielfunktionswert:  ',ZF.l /

loop(t,
     loop(k,
             put t.tl:0, ' ; ' k.tl:0, ' ; ', Q.l(k,t), ' ; ' Qr.l(k,t), ' ; ' Y.l(k,t), ' ; ' Yr.l(k,t)/
     );
);

putclose outputfile1;

file outputfile2 / 'Zielfunktionswert.txt'/;
put outputfile2;


put 'Zielfunktionswert:  ',ZF.l /
put '**************************'

putclose outputfile2;
