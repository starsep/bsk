### Zaliczenie 2016
#### Zadanie zaliczeniowe 2016/17 - moduły 5 i 6
Wszystkie wydawane polecenia należy zapisać w skryptach wykonywalnych, będą one częścią rozwiązania. Sprawdzający będzie jednak wymagał osobistej prezentacji rozwiązania.

Jeśli trzeba zainstaluj serwer SSH, rsync i sshfs, na przykład:
```
sudo apt-get update
sudo apt-get install openssh-server rsync sshfs
```
Załóż konto, hasło i katalog domowy użytkownikowi U.

Serwer ssh można zrestartować np. tak:
```
service ssh restart
```

#### ZADANIA
Uwaga: U oznacza nazwę generyczną, ponieważ do rozwiązania każdemu potrzebne
będą dwie maszyny, z których jedna będzie używana jako serwer SSH (nazwiemy ją S), a druga jako klient SSH (nazwiemy ją K). Serwer na danym komputerze może konfigurować jedna osoba, natomiast z jednej maszyny jako klienta może korzystać wiele osób, o ile użyją różnych kont. Proponuję komputer lokalny potraktować jako S, a jakiś inny w labie traktować jako K oraz wymyślić unikalną nazwę użytkownika.

1. Klucze i konfiguracja klienta.
  - Stwórz guestowi parę kluczy SSH, klucz prywatny chroniony hasłem. Umieść klucz publiczny na komputerze students.
  - Użytkownikowi U na maszynie K utwórz parę kluczy SSH i wykonaj czynności umożliwiające U logowanie się z kluczem z K na S.
  - Skonfiguruj klienta ssh tak, aby Twój login na students był używany jako domyślna nazwa użytkownika, gdy guest łączy się ze students, oraz aby używany był odpowiedni klucz.

2. Skonfiguruj serwer SSH:
  - Ogranicz wersję protokołu do 2.
  - Zabroń zdalnego logowania przez roota.
  - Zezwól U na zdalne logowanie jedynie przy pomocy klucza, a guest także przy pomocy hasła.

3. Kopiowanie i montowanie
  - Ustaw w ten sposób montowanie, żebyś mógł obejrzeć w przeglądarce odpalonej na komputerze w labie BSK dowolny plik z katalogu /home/students/inf/PUBLIC/BSK/Obrazy z maszyny students (oczywiście tylko taki, do którego masz uprawnienia).
  - Używając programu rsync skopiuj (jako guest) ze students katalog
/home/students/inf/PUBLIC/BSK.
  - Dodatkowo prowadzący może poprosić Cię o włączenie/wyłączenie kompresji oraz o pominięcie plików określonego typu.

4. PGP
  - Utwórz własną parę kluczy PGP.
  - Wyślij prowadzącemu klucz publiczny do zaimportowania.
  - Pliki skryptów z poleceniami, z dodanym w komentarzu swoim imieniem, nazwiskiem i loginem, podpisz (kluczem prywatnym) i wyślij do prowadzącego emalią.
