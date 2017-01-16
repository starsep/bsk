Niech `xx` będzie numerem w nazwie komputera, przy którym pracujesz (np. 10 dla solab10).

1. Utwórz i uruchom kontener Dockera o nazwie vsolab`xx`.

2. W kontenerze zainstaluj serwer http (apache2), tak, aby dało się z nim połączyć przeglądarką uruchomioną w systemie gospodarza. Możesz wyłączyć serwer http na systemie gospodarza. Zmień domyślną zawartość pliku /var/www/index.html na vsolab`xx` oraz /etc/hosts na solab`xx`. Powinieneś móc połączyć się z http://vsolabxx.mimuw.edu.pl. Skonfiguruj kontener tak, aby polecenie docker run dla tego kontenera uruchamiało serwer apache2.

3. W systemie gospodarza utwórz własne CA o następujących parametrach:
```
C = PL
ST = Mazowieckie
LN = Warsaw
ON = MIMUW
OU = BSK
CN = BSK Certification Authority 16
mail = ca@mimuw.edu.pl
```
Termin ważności: 10 lat

4. Wygeneruj prośbę o wydanie certyfikatu dla:
```
C = PL
ST = Mazowieckie
LN = Warsaw
ON = MIMUW
OU = BSK
CN = bsklab`xx`.mimuw.edu.pl
mail = bsk@mimuw.edu.pl
```
Termin ważności: 4 lata

5. Wystaw certyfikat dla bsklab`xx`.mimuw.edu.pl za pomocą utworzonego CA.

6. W pliku Dockerfile kontenera vsolab`xx` skonfiguruj serwer http apache tak, aby można było połączyć się z użyciem protokołu https. Wykorzystaj wygenerowany wcześniej certyfikat. Zadbaj o to, aby pod nazwą https://bsklabxx.mimuw.edu.pl był dostępny Twój serwer z zainstalowanym wcześniej certyfikatem i aby nie pojawiały się ostrzeżenia przy próbie połączenia https z przeglądarki.

7. Połącz się z https://vsolabxx.mimuw.edu.pl.
