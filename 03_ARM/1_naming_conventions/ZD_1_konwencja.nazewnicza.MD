# TYDZIEN 3.

## Zadanie 1

„Zbuduj prostą konwencję nazewniczą dla min. takich zasobów jak Grupa Zasobów, VNET, Maszyn Wirtualna, Dysk, Konta składowania danych. Pamiętaj o ograniczeniach w nazywaniu zasobów, które występują w Azure”

---
## Rozwiązanie

Przyjęta konwencja nazewnicza dla zasobów:

```
<system><envirnoment><service><number>
<system><envirnoment><service><number><zaleznosc>
```

## `<system>`

Każdy zasób przypisany jest do konkretnego systemu.

| Nazwa system | Skrót `<system>` |
| ------------ | ---------------- |
| SAP          | sap              |

## `<envirnoment>`

Każde zasób oznaczone jest typ środowiska.

| Środowisko  | Skrót `<envirnoment>` |
| ----------- | --------------------- |
| Production  | s                     |
| Staging     | s                     |
| Testing     | t                     |
| Development | d                     |

## `<service>`

Każdy zasób oznaczone jest odpowiednim skrótem w zależności od rodzaju utworzonego zasobu.

| Usługa                  | Skrót `<service>` |
| ----------------------- | ----------------- |
| Storage                 | storage           |
| Virtual Machine         | vm                |
| SQL Database            | sql               |
| Network Security Groups | nsg               |

## `number`

W zależności od potrzeby dodajemy kolejny numer, np. gdy tworzymy kolejną instancje SQL Database dla konkretnego systemu i środowiska to dodajemy numer 1.

### Przykład

```
workflowpsql
workflowpsql1
...
workflowpsql3
```

## `<depends>`



## Linki
- https://docs.microsoft.com/pl-pl/azure/architecture/best-practices/naming-conventions#use-affixes-to-avoid-ambiguity
- https://www.ironstoneit.com/blog/naming-conventions-for-azure
- https://www.liammoat.com/blog/2019/naming-convention-for-azure-resources