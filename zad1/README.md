### Zaliczenie 2016
#### Część 1
Wyobraź sobie, że jesteś nauczycielem informatyki w liceum i chcesz na szkolnym serwerze założyć i skonfigurować strukturę katalogów dla klas o profilu mat-fiz-inf w następujący sposób:

1. Identyfikatorem użytkownika jest numer jego legitymacji. W klasie 1e są to numery od 424201 do 424215, w klasie 2e - numery od 424401 do 424415, a w klasie 3e - numery od 424601 do 424615.

2. Katalogi domowe uczniów znajdują się w /home.

3. W każdym katalogu domowym ucznia znajduje się podkatalog public.

4. Każdy uczeń ma prawo do odczytu i wykonywania plików, które powstaną w katalogu /home/424xxx/public należącym do ucznia z tej samej klasy.

5. Grupa staff ma prawo do odczytu, wykonywania i modyfikacji plików/katalogów, które powstaną w katalogach /home/424xxx/public, nie ma natomiast prawa do tworzenia nowych plików w tym katalogu ani do usuwania już istniejących.

6. Użytkownik master ma wszystkie uprawnienia do plików i katalogów, które powstaną w katalogach /home/424xxx/public.

7. Do pozostałych katalogów i plików, które powstaną w katalogu domowym ucznia ma wyłączne (wszystkie) prawa jego właściciel.

8. Użytkownicy, którzy nie zostali wymienieni wyżej nie mają żadnych praw do katalogów domowych uczniów.

Napisz skrypt, który założy konta Twoim uczniom i odpowiednio skonfiguruje strukturę katalogów. Stwórz potrzebne grupy użytkowników. Przetestuj poprawność swojej konfiguracji.

Przydatne polecenia (oprócz setfacl):

useradd - zakłada użytkownika, opcja -m powoduje założenie katalogu domowego dla nowego użytkownika
groupadd - zakłada grupę
adduser - dodaje użytkownika do grupy
chown/chgrp - zmienia właściciela/grupę pliku lub katalogu

#### Część 2
Zmień konfigurację rsyslog w taki sposób, aby:

1. wszystkie zapisy z poziomu debug trafiały do pliku /var/log/debug.log i nie pojawiały się w żadnych innych plikach katalogu /var/log,

2. wszystkie komunikaty o poziomie wyższym niż debug dotyczące uwierzytelniania użytkowników były zapisywane do pliku /var/log/useradm.log,

3. wszystkie komunikaty zawierające wzorzec "424" trafiały do pliku /var/log/students.log,

4. korzystając z xconsole można było śledzić informacje związane z drukowaniem z poziomów od notice do alert,

5. komunikaty najwyższego poziomu pochodzące od jądra lub local2 zostały wypisane na ekranach wszystkich zalogowanych użytkowników,

6. konfiguracja elementów nie wymienionych wyżej pozostała domyślna, czyli taka jaka jest w oryginalnym pliku konfiguracyjnym rsyslog

Użyj polecenia logger do sprawdzenia poprawności konfiguracji.
Sprawdź zawartość dzienników po uruchomieniu skryptu z części 1.
