## Opis sytuacji:
Jesteś architektem w firmie, która tworzy systemy w branży e-commerce dla innych firm, które sprzedają w modelu business-to-consumer w całej Europie. Systemy budujesz w oparciu o Microsoft Azure i strategia budowania systemów Cloud Native została przyjęta i jest w pełni akceptowana przez Twoich klientów.

Jako architekt możesz zdecydować zarówno o architekturze systemu jak i wzorcach, które wykorzystasz. Klienci oczekują dobrze zaprojektowanego systemu, nie wnikają w Twoje decyzje.
System, który projektujesz, będzie odwiedzany przez klientów końcowych, a więc możesz się spodziewać, że:
1)	W wybranych godzinach będzie zarówno dużo odwiedzin strony jak i dużo zamówień
2)	System będzie miał bardzo nieprzewidywalną liczbę zamówień – zdarzą się okresy, że z systemu nikt nie będzie korzystał, ale też zdarzy się promocja typu „Black Friday”
3)	Do systemu importują swoje towary również partnerzy firmy, którzy w różnych okresach roku promują wybrane produkty
4)	System musi być jak najbardziej odporny na sytuacje awaryjne – jego podstawowa funkcjonalność, czyli sprzedaż i prezentacja ofert dla klientów powinna być dostępna „zawsze”

## Zadanie:
## [#TYDZIEN2.1]
Na bazie poznanych wzorców projektowych wybierz 3, które chciałbyś zastosować wraz z uzasadnieniem przy każdym z nich, dlaczego właśnie ten wzorzec projektowy będzie przydatny i jakie problemy ew. może rozwiązać. Uzasadnienie nie może być długie – przy każdym wzorcu postaraj się nie przekroczyć 5 punktów maksymalnie. Wystarczą mi 3 dobre powody.

## Odpowiedz:

### [Throttling Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/throttling)
- zapewnienie dostępności systemu dla firm zgodnie z SLA
- zapewnia równowagę pomiędzy skalowaniem (kosztami) a nagłymi, krótkotrwałymi pikami ruchu
- większa odporność systemu na masowe działania jednego klienta

\
Usługi: API Managment

Dodatkowe:
- [Advanced Request Throttling with Azure API Management](https://azure.microsoft.com/pl-pl/resources/videos/advanced-request-throttling-with-azure-api-management/)

 ### [Competing Consumer Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/competing-consumers)
 - zwiększenie niezawodności systemu
 - umożliwi skalowania usług w zależności od ilości zamówień w systemie (obniżanie kosztów do minimum w momencie braku ruchu)

\
Usługi: Azure Storage (queue),  Service Bus

### [Static Content Hosting](https://docs.microsoft.com/en-us/azure/architecture/patterns/static-content-hosting):
  - krótsze czasy odpowiedzi systemu
  - lepszy UX użytkownika
  - minimalizacja żądań o statyczny content do usługi źródłowej

\
Usługi: Content Delivery Network

### [Command and Query Responsibility Segregation (CQRS)](https://docs.microsoft.com/en-us/azure/architecture/patterns/cqrs)
  - rozdzielenie operacji przeszukiwania bazy produktów od składowania informacji o zamówieniach
  - możliwość wykorzystania relacyjnej bazy danych dla operacji zamówień,
  - łatwiejsza optymalizacja systemu dla operacji odczytu (częste przeszukiwanie bazy produktów)

\
Usługi: SQL Database, Cosmo DB

### Wzorce, które miałby również zastosowanie:
- Index Table pattern - wyszukiwarka to podstawowa funkcjonalność systemu takiego typu (Azure Cognitive Search)
- Load balancing
- [Sharding](https://docs.microsoft.com/en-us/azure/architecture/patterns/sharding) -


## [#TYDZIEN2.2]
Jeśli to możliwe, przy wybranym wzorcu projektowym, zaproponuj, których usług byś użył, by wzorzec ten zaimplementować. Krótko uzasadnij, dlaczego będzie to najbardziej efektywne podejście.

> Pamiętaj: tu nie ma jednej dobrej odpowiedzi więc każdy pomysł może być cenny i adresować różny aspekt rozwiązania.

### Throttling Pattern
- API Managment

### Competing Consumer Pattern
- Azure Storage (queue)
- Service Bus queues
  - [Storage queues and Service Bus queues - compared and contrasted](https://docs.microsoft.com/en-us/azure/service-bus-messaging/service-bus-azure-and-service-bus-queues-compared-contrasted)
  - [Asynchronous messaging options in Azure](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/messaging)

### Static Content Hosting
- Content Delivery Network

### Command and Query Responsibility Segregation (CQRS)
-  SQL Database
- Cosmo DB
  - [Choose the right data store](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/data-store-overview)

### Index Table pattern
- Azure Cognitive Search

### Load balancing
- Traffic Manager
- Front Door
- Application Gateway
- Azure Load Balancer
  - [Overview of load-balancing options in Azure](https://docs.microsoft.com/en-us/azure/architecture/guide/technology-choices/load-balancing-overview)