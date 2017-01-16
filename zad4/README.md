1. Przeczytaj uważnie specyfikację protokołu POP3 w wersji podstawowej:
https://tools.ietf.org/html/rfc1939

2. Obsługa laboratorium komputerowego pewnego wydziału w jednym z
uniwersytetów postanowiła skorzystać z podstawowej wersji
protokołu POP3 do zapewniania dostarczania poczty na komputery
studentów. Jednocześnie nie zastosowali żadnych rozwiązań
kryptograficznych zabezpieczających korzystanie z tej usługi
(nie użyli ani SSL, ani SSH, ani innego podobnego rozwiązania),
można tutaj na przykład wyobrazić sobie, że z jakiegoś powodu postanowili
napisać serwer POP3 na własną rękę i zaimplementowali wyłącznie
to, co zostało zapisane w RFC 1939. Jednocześnie dla zapewnienia
wygody studentów administratorzy zdecydowali, że do uwierzytelnienia
będą stosowane te same hasła, jak do wszystkich innych usług wymagających
uwierzytelniania w tej jednostce (mają oni jakiś system podobny do
naszego centralnego systemu uwierzytelniania).

3. Opracuj drzewo ataku przeciwko takiemu rozwiązaniu. Opisz chronione
wartości oraz przyjmij model odpowiednio silnego atakującego, aby
wyłapać jak najwięcej zagrożeń. Zapisz drzewo w postaci wypunktowanej
listy. Jeśli uznasz za stosowne, możesz zapisać rozwiązanie w postaci
kilku drzew lub drzewa o kilku korzeniach.

Uwagi dotyczące rozwiązania:

1. To zadanie jest z rozmysłem źle postawione. To złe postawienie ma na celu
wybadanie w Was wrażliwości na sprawy bezpieczeństwa.

2. Dodatkowo problemy związane z analizą bepieczeństwa w prawdziwym życiu są
zawsze źle postawione.

3. W zadaniu chcemy, żeby Państwo przeprowadzili raczej analizę sytemu niż
konkretnego protokołu. Sam protokół jednak powinien przewinąć się w Waszej
analizie.

4. W zadaniu nie ma mowy o protokołach kryptograficznych, żeby mocniej zwrócić
Państwa uwagę na fakt, że bezpieczeństwo to nie tylko kryptografia.

5. Bardzo ważną rzeczą w tego typu analizie jest jej systematyczność.

6. Można sobie obejrzeć przykładowe rozwiązanie z zeszłego roku, żeby lepiej
zrozumieć, jak mają wyglądać rozwiązania. W szczególności należy zwrócić
uwagę, że rozwiązania istotnie krótsze będą uważane za istotnie gorsze.
