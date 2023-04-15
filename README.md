# Obraz wykorzystujący metodę budowania wieloetapowego

# Budowanie :
docker build -t react --build-arg VERSION="<i>{dowolna wartosc}</i>" .

# Uruchamianie :
docker run -dt -p 80:80 --name test1 react

# Testowanie :
<b>Zalecane:</b> 'localhost' jako adres w przegladarce\
Opcjonalne: curl localhost (odpowiedz w formie tekstowej - nie widac efektu)

# Uwagi :
- Pierwsze budowanie może potrwać nawet kilka minut - proces tworzenia aplikacji React
- Zmiana portów <b>nie jest zalecana</b> - wymagana edycja pliku konfiguracyjnego serwera
- W katalogu 'ss' znajdują sie zrzuty ekranu
- Podczas testowania wystąpił problem z przekazaniem wartości zadeklarowanej zmiennej - problem rozwiązało dodanie <b>REACT_APP_</b> na poczatku nazwy zmiennej
- W zależności od urządzenia, wymagane może być pobranie innej wersji obrazu alpine i dokonanie zmian w pliku Dockerfile
