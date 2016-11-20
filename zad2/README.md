### Zaliczenie 2016
#### Zadanie zaliczeniowe 2016/17 - moduły 3 i 4
Wzorując się na przykładowym programie, napisz w języku C program znajdujący w podanym na wejściu tekście pięć najczęściej użytych słów (czyli takich, które wystąpiły najwięcej razy). Przez słowo w tym przypadku rozumiemy dowolny ciąg liter, otoczony innymi znakami.

Tekst zakończony jest wierszem zawierającym jedynie symbol "==". Po napotkaniu końca tekstu należy wypisać pierwszy wiersz tekstu i pięć znalezionych słów.

Na wejściu może wystąpić więcej niż jeden tekst, wtedy należy tę operację wykonać dla każdego tekstu osobno. Po napotkaniu wiersza zawierającego kropkę program powinien kończyć pracę.

Program powinien używać PAM: dostęp do programu powinien być dozwolony tylko dla autoryzowanych hasłem użytkowników. O nazwę (login) użytkownika program powinien pytać ,,Badania korpusowe?''.

Ponadto program powinien umożliwiać nakładanie ograniczeń na liczbę jednoczesnych uruchomień programu przez użytkownika.

Uwaga: wierszy tekstu może być dużo i mogą mieć różną długość. Program konsumujący za dużo pamięci (tzn. nie zwracający nieużytków) zostanie potraktowany limitami na rozmiar pamięci.

Zezwól użytkownikowi user2 (należy go założyć) na używanie tego programu z urządzeń znakowych tty2, tty3 lub tty4. Inni użytkownicy mogą go używać wyłącznie z terminala tty4.

Zezwól użytkownikowi user2 (należy go założyć) tylko na dwukrotne odpalenie programu.

Używanie programu SSH powinno być dozwolone między 11:00 i 11:30 w dni powszednie (lub w innym pasującym do labu terminie - ustaw odpowiednie ograniczenie.

Skonfiguruj sudo, aby użytkownik user2 mógł instalować pakiety (polecenie apt-get).

Pliki źródłowe programu (wraz z Makefile) proszę umieścić w osobnym katalogu,który należy wysłać prowadzącym w postaci spakowanego archiwum do godziny 22:30 dnia poprzedzającego zajęcia. Nazwa katalogu i nazwa archiwum powinny zawierać login autora (np. ab123456.tgz).
