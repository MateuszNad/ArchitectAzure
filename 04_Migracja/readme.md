## Opis sytuacji:
Jesteś architektem w dużej firmie (20 000 pracowników, ponad 5000 maszyn wirtualnych, ponad 200 maszyn fizycznych pod środowiskiem wirtualnym), która podjęła decyzję o migracji do Chmury. W firmie jest dość znaczna ilość systemów „legacy” i pierwszy kroki migracji to będzie migracja typu Lift&Shift, gdzie głównie wykorzystasz środowiska maszyn wirtualnych, ale postarasz się zautomatyzować cały proces powoływania i zarządzania środowiskami.

## Zadania:
- #TYDZIEN4.1 Na bazie swoich doświadczeń i podstawowej wiedzy o maszynach wirtualnych oraz Scale Set zaproponuj kilka kroków, które byś zrealizował w ramach takiej migracji. Przy każdym kroku napisz maksymalnie 2-3 zdania, jakie czynności w takim kroku byś zrealizował.
Pamiętaj o ograniczeniach w chmurze, limitach oraz ograniczeniach co do tego, jakie parametry wirtualnych maszyn, możesz uzyskać w Azure.

> Wszelkie dodatkowe komentarz mile widziane! Wiem, że masz mało danych, ale… wiesz, ja też mam zawsze za mało danych do migracji, co nie powinno mnie powstrzymać, by zaplanować proces.

---

### Odpowiedź

#### 1. Zbieranie danych

Wykonanie inwentaryzacji systemu, która musiałaby obejmować takie informacje jak krytyczność systemu, stos technologiczny, integrację (zależności) pomiędzy systemami, wykorzystywane elementy infrastruktury (AD, dns, content switch), ilość środowisk testowych (myślę, że 60-70% maszyn w organizacji jest wykorzystywanych na potrzeby środowisk testowych) oraz przewidywane plany rozwoju konkretnych systemów.

Dodatkowo duże organizacje posiadają, politykę przestarzałości który informują o systemach z komponentami niespieranymi. Takie informację byłby przydatne do przygotowania migracji (lub zaniechanie działań) dla konkretnych systemów.

#### 2. Konsultacje z dostawcami systemów

Migracje pewnych systemów musiałby zostać poprzedzone konsultacjami z dostawcami  o planach na migrację do chmury publicznej. Ten krok również traktowałbym jako wymianę doświadczeń w temacie takiej migracji.

#### 3. Ułożenie planu migracji

Plan obejmowałbym, wytypowanie systemów "wspólnych", kolejność wykonywać migracji, osoby odpowiedzialne za przeprowadzenie migracji oraz osoby za walidację środowiska.

> Plan uwzględniałbym również, które systemy zostały wykluczone z migracji typu Lift&Shift, np. ze względu na planowane wdrożenie nowego systemu już w podejściu cloud-native.

#### 4. Migracja

W pierwszej kolejności migracją Lift&Shift zostałbym objęte:
- migracja lub rozciągnięcie komponentów "wspólnych", np. Active Directory
- środowiska testowe systemów niekrytycznych
- środowiska testowe systemów krytycznych
- niekrytyczne systemu produkcyjne (uwzględniając zależności)
- krytyczne systemu produkcyjne

> ⚠️ Decyzja o migracji środowisk produkcyjnych musiałby być poprzedzona poprawnym działaniem przez 2-3 miesiące środowisk testowych.

Sposoby migracji:
   - oszacowanie gotowości, wielkości, kosztów oraz automatyczna migracja za pomocą [Azure Migration](https://azure.microsoft.com/en-us/services/azure-migrate/)

   - lub provisioning za pomocą [IaC](https://akademiapowershell.pl/2020/02/infrastracture-as-code-powershell/) oraz konfiguracja np. z wykorzystaniem Azure Automation lub z wykorzystaniem istniejących narzędzi typu Configuration Manager (Ansible, Chef)


### Linki:
- [About Azure Migrate](https://docs.microsoft.com/en-us/azure/migrate/migrate-services-overview)
- [Azure Migrate support matrix](https://docs.microsoft.com/en-us/azure/migrate/migrate-support-matrix)
---

- #TYDZIEN4.2 Virtual Machine Scale Set
VMSS nie są często używane w projektach. W ramach zadania nr. 2 napisz mi proszę do jakich warstw aplikacji użyłbyś Scale Set a następnie spróbuj za pomocą Azure CLI zbudować swój prosty Scale Set.

---

### Odpowiedź

Zastosowanie [Virtual Machine Scale Set](https://azure.microsoft.com/en-us/services/virtual-machine-scale-sets/) widziałbym dla warstwy web aplikacji, jeśli hostowana aplikacja nie przetrzymuję stanu sesji użytkownika.

Utworzenie VMSS za pomocą Azure CLI

```powershell
az group create --name vmss-temporary --location westeurop

# create Azure Virtual Machine Scale Set
az vmss create \
    --resource-group vmss-temporary \
    --name vmss-scaleset \
    --image Win2016Datacenter \
    --upgrade-policy-mode Automatic \
    --admin-username useradmin

az vmss extension set \
  --publisher Microsoft.Azure.Extensions \
  --version 2.0 \
  --name CustomScript \
  --resource-group vmss-temporary  \
  --vmss-name vmss-scaleset \
  --settings '{"fileUris":[""],"commandToExecute":"./vmss-deploy-web.ps1"}'
```

Linki:
