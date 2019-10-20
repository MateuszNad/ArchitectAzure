## Opis sytuacji:
Jesteś architektem w firmie o europejskim zasięgu i rozpoczynasz w swojej firmie budowanie rozwiązań opartych o Microsoft Azure.
Jako architekt ustaliłeś kilka pryncypiów projektowych, które powinny być respektowane przy każdym wdrożeniu:
1) Każdy projekt powinien używać konwencji nazw dla grup i zasobów zgodnych z konwencją firmy
2) Infrastruktura, budowana w Azure pod środowiska czy aplikacje powinna być zawsze budowana z wykorzystaniem Azure Resource Managera i template’ów. Jeśli jest to duże wdrożenie, powinny być użyte tzw. Linked Templates.
3) Jeśli to konieczne, należy zbudować własny model ról za pomocą RBAC
4) Docelowo, wszystkie kluczowe ustawienia, tak jak np. nazwy lokalnych administratorów i hasła powinny być pobierane z Azure KeyVault

### Zadanie:
Zadanie ma 4 etapy, zrób wszystkie 4 by zebrać jak największą liczbę punktów!

- #TYDZIEN3.1 „Zbuduj prostą konwencję nazewniczą dla min. takich zasobów jak Grupa Zasobów, VNET, Maszyn Wirtualna, Dysk, Konta składowania danych. Pamiętaj o ograniczeniach w nazywaniu zasobów, które występują w Azure”
- #TYDZIEN3.2 „ Zbuduj prosty ARM Template (możesz wykorzystać już gotowe wzorce z GitHub), który wykorzystuje koncepcję Linked Templates. Template powinien zbudować środowisko złożone z jednej sieci VNET, podzielonej na dwa subnety. W każdy subnecie powinna powstać najprostsza maszyna wirtualna z systemem Ubuntu 18.04 a na każdym subnecie powinny zostać skonfigurowane NSG.”
- #TYDZIEN3.3 „Zbuduj najprostszą własną rolę RBAC, która pozwala użytkownikowi uruchomić maszynę, zatrzymać ją i zgłosić zgłoszenie do supportu przez Portal Azure”
- #TYDZIEN3.4 „Spróbuj na koniec zmodyfikować template tak, by nazwa użytkownika i hasło do każdej maszyny z pkt. 2 było pobierane z KeyVault.„


## Linki
1. https://azurecitadel.com/automation/arm/lab1/
2. https://docs.microsoft.com/pl-pl/azure/azure-resource-manager/resource-manager-tutorial-create-linked-templates
3. https://docs.microsoft.com/pl-pl/azure/azure-resource-manager/resource-manager-keyvault-parameter
4. https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
5. https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles
6. https://docs.microsoft.com/en-us/azure/role-based-access-control/resource-provider-operations
7. https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-keyvault-parameter#reference-a-secret-with-static-id
