## Opis sytuacji:
Jesteś architektem w dużej firmie (20 000 pracowników, ponad 5000 maszyn wirtualnych, ponad 200 maszyn fizycznych pod środowiskiem wirtualnym), która podjęła decyzję o migracji do Chmury. W firmie jest dość znaczna ilość systemów „legacy” i pierwszy kroki migracji to będzie migracja typu Lift&Shift, gdzie głównie wykorzystasz środowiska maszyn wirtualnych, ale postarasz się zautomatyzować cały proces powoływania i zarządzania środowiskami.

## Zadania:
- #TYDZIEN4.1 Na bazie swoich doświadczeń i podstawowej wiedzy o maszynach wirtualnych oraz Scale Set zaproponuj kilka kroków, które byś zrealizował w ramach takiej migracji. Przy każdym kroku napisz maksymalnie 2-3 zdania, jakie czynności w takim kroku byś zrealizował.
Pamiętaj o ograniczeniach w chmurze, limitach oraz ograniczeniach co do tego, jakie parametry wirtualnych maszyn, możesz uzyskać w Azure.

    Wszelkie dodatkowe komentarz mile widziane! Wiem, że masz mało danych, ale… wiesz, ja też mam zawsze za mało danych do migracji, co nie powinno mnie powstrzymać, by zaplanować proces.

- #TYDZIEN4.2 Virtual Machine Scale Set
VMSS nie są często używane w projektach. W ramach zadania nr. 2 napisz mi proszę do jakich warstw aplikacji użyłbyś Scale Set a następnie spróbuj za pomocą Azure CLI zbudować swój prosty Scale Set.


# Zadanie 1

Pomysły:

Myślę, że ponad połowa z 5000 VM to maszyny realizujące zadania środowisk testowych, wsparcia produkcji itd.

1. Inwentaryzacja obecnych systemów operacyjnych

- Jeśli istnieją np. VM z systemem Windows Server 2008 wymagają prac związanych z migracją na systemy nowsze
    - takie systemy byłyby migrowane side-by-side w celu jednoczenym podnisienienia OS

- Określenie zasobów dla maszyn

1. Pierwszy krok to oszacowanie zasobów sprzętowych dla środowisk produkcyjnych.
(jakie narzędzia w tym celu?)

2. Między czasie wyznaczyłbym właśnie takie maszyny do migracji typu Lift&Shift w celu kompatybilności testów systemów.

### Linki:
-https://www.nigelfrank.com/blog/migrating-and-extending-your-on-premises-environment-with-azure/

# Zadanie 2

Wykorzystanie VMSS byłoby uzależnione od tego czy w środowisku istnieją systemy których infrastruktura wykorzystuję nody o identycznej konfiguracji.

Z doświadczenia mogę powiedzieć, że widziałbym zastosowanie takiego podejścia dla np. serwerów Web aplikacji.
