# AirportDatabase

### About the DB: (Lithuanian only)
1. DB yra kurta naudojant PostgreSQL linux aplinkoje
2. DB sudaro 6 logiškai pagrįstos lentelės.
3. DB yra 4-je norminėje formoje.
4. Lentelės turi visus reikiamus pirminius ir išorinius raktus.
5. Panaudoti deklaratyvūs reikalavimai reikšmėms, panaudojant skirtingus predikatus.
6. Apibrėžtos numatytosios reikšmės.
7. DB-je apibrėžti 4 indeksai, iš kurių 2 yra unikalūs
8. DB-je apibrėžtos 3 virtualiosios lentelės.
9. DB-je apibrėžta 1 materializuota virtualioji lentelė ir jos duomenų atnaujinimo sakinys.
10. DB-je užtikrinama 10 dalykinių taisyklių (ne reikalavimai reikšmėms), apibrėžiamos trigeriais
11. Trigeriai naudojami tik tokiems duomenų vientisumo reikalavimams užtikrinti, kurių negalima užtikrinti kitomis SQL priemonėmis.
12. DB-je yra 2 tapatumo požymis (numeris), kuris užtikrinamas automatiškai (trigeriu).

### ER Model
![ER Model](https://user-images.githubusercontent.com/65735690/104131859-f4548b00-5381-11eb-876e-90338731d04a.png)

### DB Schema
![DB Schema](https://user-images.githubusercontent.com/65735690/104131928-7ba1fe80-5382-11eb-97ab-93bd8615f49e.png)
