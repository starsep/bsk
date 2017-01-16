1. Napisać skrypt tworzący indywidualne certyfikaty dla użytkowników serwera OpenVPN. Dane wejściowe: imię i nazwisko użytkownika oraz jego adres email (imienia i nazwiska należy użyć jako CN w generowanym certyfikacie). Wcześniej trzeba oczywiście zadbać o utworzenie CA na potrzeby VPN.

2. Napisać skrypt tworzący listę odwołanych certyfikatów dla użytkowników, którzy mają utracić dostęp. Uwzględnić listę CRL w konfiguracji serwera VPN.

3. Skonfigurować serwer OpenVPN oparty o transport tcp i ww. certyfikaty wraz z uwzględnieniem CRL.

4. Skonfigurować klienta OpenVPN tak, aby użytkownik mógł się połączyć z serwerem za pomocą swojego certyfikatu.

5. Na serwerze skonfigurować firewalla tak, aby można było wykonywać połączenia przychodzące jedynie do portu OpenVPN tcp tylko z podsieci 192.168.0.0/16.
