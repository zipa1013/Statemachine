% Aufbau des Hardware-Modells einer E/E-Architektur und dessen Transformation in ein Simulationsmodell
% Dissertation
% Autor: (Platzhalter) | Betreuer: M. Sc. Kevin Neubauer | Datum: in Bearbeitung

\newpage

## Vorwort
Diese Arbeit adressiert die modellbasierte Entwicklung moderner E/E-Architekturen für autonomes Fahren und zeigt einen durchgängigen Ansatz vom Architekturmodell über eine erweiterte Synthese-Metrik bis zur Ausführung als Simulationsmodell.

## Abstract
(Wird in Kapitel „Einleitung“ inhaltlich vorverdichtet; finale Fassung am Ende konsolidiert.)

## Zusammenfassung (Deutsch)
(Platzhalter – wird nach Abschluss der Evaluation konsolidiert.)

## Abstract (English)
(Placeholder – to be finalized after results are consolidated.)

## Danksagung
(Platzhalter)

## Abkürzungsverzeichnis
- ECU – Electronic Control Unit
- AD – Automated Driving
- TSN – Time-Sensitive Networking
- SWC – Software Component
- KPI – Key Performance Indicator
- E2E – Ende-zu-Ende
- ASIL – Automotive Safety Integrity Level
- DDS – Data Distribution Service

## Abbildungsverzeichnis
(Automatisch generiert; Platzhalter-Referenzen in den Kapiteln.)

## Tabellenverzeichnis
(Automatisch generiert; Platzhalter-Referenzen in den Kapiteln.)

\newpage

## 0 Einleitung und Motivation
Autonomes Fahren führt zu einer rapiden Zunahme der funktionalen, zeitlichen und infrastrukturellen Komplexität in Fahrzeug-E/E-Architekturen. Diese Arbeit adressiert die frühzeitige Evaluierung des Zusammenspiels verteilter Funktionen über eine in das Entwicklungstool (z.B. PREEvision) integrierte Simulation. Ziel ist ein erweiterbares Hardware-Modell, eine belastbare Synthese-Metrik und eine deterministische Transformation in ein ausführbares Simulationsmodell, das an realitätsnahen Szenarien überprüft wird.

Zentrale Beiträge dieser Arbeit sind: (i) eine domänenspezifische Komponententaxonomie und ein erweiterbares Metamodell, (ii) eine methodische Erweiterung der Synthese-Metrik zur quantitativen Ableitung von Ressourcen-, Timing- und Verfügbarkeitsparametern, (iii) ein regelbasiertes Transformationsframework in ein Simulationsziel (z.B. OMNeT++/INET, NS-3, FMI-Co-Sim) sowie (iv) eine systematische Evaluation entlang repräsentativer Use-Cases inklusive Fehlerszenarien.

Forschungsfragen: Welche Modellattribute sind erforderlich, um E2E-Latenzen, Jitter, Auslastungen und Verfügbarkeit in frühen Konzeptständen belastbar abzuschätzen? Wie müssen Architektur- und Kommunikationsdetails abgebildet werden, um die Simulation als Designentscheidungswerkzeug nutzbar zu machen? Wie überführt man heterogene Architekturdaten konsistent in Simulationskonfigurationen?

\newpage

## 1 Zielbild, Scope und Anforderungen
### 1.1 Zielbild
Das Zielbild ist eine eingebettete Simulation innerhalb der Architekturentwicklungsumgebung, die es erlaubt, Designvarianten zu vergleichen, Bottlenecks aufzudecken und Nichtfunktionales (Timing, Bandbreite, Verfügbarkeit, Energie) quantitativ zu bewerten.

### 1.2 Scope
- Funktionsdomänen: Perzeption, Sensorfusion, Lokalisierung, Planung, Fahrzeugführung
- Ebenen: Sensorik, Rechenknoten (ECUs), Aktorik, Kommunikationsinfrastruktur
- Reifegrad: Vom Konzept bis zur Vorserienarchitektur

### 1.3 Anforderungen und KPIs
- Funktional: vollständige Abbildbarkeit relevanter Funktionsketten und Datenflüsse
- Nichtfunktional: E2E-Latenz, Jitter, Deadline-Misses, Busauslastung, CPU/GPU-Last, Energie, ASIL
- Randbedingungen: Hardware-Budgets, Kosten, Packaging, Temperaturbereiche

### 1.4 Abnahmekriterien
Quantifizierbare Grenzwerte je Use-Case (z.B. E2E-Latenz < 100 ms für L2/L3-Funktionen, TSN-Jitterbudgets, Paketverlustraten < 10^-6 in sicherheitsrelevanten Pfaden).

\newpage

## 2 Komponententaxonomie und Metamodell
### 2.1 Komponententypen
- ECUs: AD-Domain-Controller, Zonen-ECUs, Gateways, HMI-ECUs
- Sensoren: Kamera, Radar, LiDAR, GNSS/IMU, Ultraschall
- Aktoren: Lenkung, Bremse, Antrieb, Fahrwerk
- Kommunikation: Ethernet/TSN, CAN/CAN-FD, LIN, FlexRay (optional), DDS/SOME/IP
- Infrastruktur: Switches, Power-Verteilung, Speicher

### 2.2 Metamodell-Elemente und Attribute
- Node, Port, Interface, Bus/Netz
- Message/Signal, TrafficFlow, QoS/Prio, Deadline
- Software-Komponente, Task, Chain, Scheduling-Policy
- Deployment, Partition, Redundanzgruppe, SafetyLevel
- Ressourcenprofile: CPU/GPU/NPU, Speicher, Energiezustände

### 2.3 Erweiterbarkeit
Stereotypen mit versionierten Attributen, sensor- und buspezifische Zusatzfelder (z.B. Field-of-View, Preprocessing-Level, TSN-Slot-Konfiguration), kompatibel mit AUTOSAR-Paketen und PREEvision-Attributmodellen.

### 2.4 Qualitätsregeln
Namenskonventionen, Pflichtfelder, Bereichsprüfungen, Referenzintegrität, Versionsführung. Automatisierte Validierung mittels Schema-Checks.

\newpage

## 3 Architekturmodellierung in PREEvision
### 3.1 Topologiemodell
Abbildung der Knoten (ECUs, Sensoren, Aktoren, Switches) mit Ports, Interfaces und Leitungen. Ressourcen- und Energieprofile werden als Attributkataloge hinterlegt.

### 3.2 Kommunikationsmodell
Netzwerke, Routen, Frames/Signale, Konfiguration von TSN (Zeitslots, Prioritäten), Gateways und deren Mapping-Regeln.

### 3.3 Software- und Deployment-Modell
SWCs, Tasks, Aktivierungen, WCET/BCET, Scheduling-Policies, Partitionierung und Zuordnung zu ECUs. Diagnose- und Redundanzmechanismen als Gruppen mit Umschaltzeiten.

### 3.4 Datenqualität und Governance
Attributkataloge, Validierungsprofile, Review-Gates. Exportprofile (REST, CSV, AUTOSAR-XML, XMI/JSON) für die Transformation.

\newpage

## 4 Synthese-Metrik: Konzeption und Erweiterung
### 4.1 Zielsetzung
Ableitung simulativer Parameter aus Architekturmerkmalen: Rechenlast, Netzwerklast, Timingpfade, Verfügbarkeits- und Energieprofile.

### 4.2 Erweiterungen
- Flow-Aggregation von Nachrichtenströmen zu Funktionsketten
- Lastabschätzung: Datenrate × Algorithmenkomplexität → CPU/GPU-Last
- Netzwerkmodele: Bandbreite, Jitter, Queueing, TSN-Prioritäten
- Ausfall-/Degradationsprofile und Umschaltlogiken
- Energieprofile über Duty-Cycles und Lastzustände

### 4.3 Validierung der Metrik
Plausibilisierung mittels analytischer Ober-/Untergrenzen und Microbenchmarks. Sensitivitätsanalysen zur Robustheit.

\newpage

## 5 Transformationskonzept zum Simulationsmodell
### 5.1 Zielplattformen
OMNeT++/INET, NS-3, Simulink/Truetime, Modelica, ROS 2/DDS, FMI-Co-Simulation.

### 5.2 Mapping-Regeln (Beispiele)
- ECU → Rechenknoten mit Ressourcen- und Schedulerparametern
- Netzwerk → Kanal mit Bandbreite, Latenz, Jitter, Priorisierung (TSN)
- Messages/Signals → Traffic-Flows (Periodizität, Payload, Deadline, QoS)
- SWC/Chain → Tasks/Pipelines mit WCET/BCET, Preemption, Aktivierung
- Redundanzgruppe → parallele Pfade mit Diagnose und Umschaltzeiten

### 5.3 Artefakte und Exporte
Export aus PREEvision (REST/CSV/AUTOSAR-XML/XMI); Zwischendarstellung (Intermediate Model, IM) als stabile Schicht.

\newpage

## 6 Technische Realisierung der Transformation
### 6.1 Datenaufnahme und Normalisierung
Strukturierte, versionierte Exporte; Parser/Adapter nach IM.

### 6.2 Regel-Engine und Generator
Regelkatalog (YAML) für Mapping; Code- und Konfigurations-Generator (z.B. Python + Jinja2).

### 6.3 Automatisierte Validierung und CI
Schema-Validierung, Konsistenzchecks und reproduzierbare Build-Pipelines der Simulation.

\newpage

## 7 Szenarien und Use-Cases
Nominal-, Stress- und Fehlerszenarien (Stau, Wetter, ECU-/Link-Ausfall, Switch-Queue-Überlauf, Clock-Drift). Designvarianten (Redundanz, Bandbreite, Scheduling).

\newpage

## 8 Simulation und Auswertung
### 8.1 Messgrößen
E2E-Latenz je Chain, Jitter, Deadline-Misses, Busauslastung, Paketverluste; CPU/GPU-Last, Wartezeiten; Verfügbarkeit/MTBF; Energie.

### 8.2 Akzeptanzkriterien
Grenzwerte gemäß OEM/Normen; TSN-Latenz-/Jitterbudgets; Sicherheitsanforderungen.

### 8.3 Ergebnisaufbereitung
Dashboards (Python/Plotly); Variantenvergleich; Trace-basierte Analysen.

\newpage

## 9 Validierung und Iteration
Plausibilisierung gegen analytische Modelle; Sensitivitätsanalysen; Rückkopplung ins Architekturmodell zur Bottleneck-Beseitigung.

\newpage

## 10 Dokumentation und Deliverables
Metamodell-Spezifikation, Transformationsregeln, Generator, Beispiel-Architekturen/Simulationen, Szenarienkatalog, KPI-Definitionen, Evaluationsbericht.

\newpage

## 11 Grobe Zeitplanung
Zeitplan für 12–16 Wochen (anpassbar) mit Phasen für Anforderungen, Modellierung, Metrik, Transformation, Evaluation, Validierung, Dokumentation.

\newpage

## 12 Risiken und Gegenmaßnahmen
Toolkopplung/Exportformate, Datenlücken (WCET, Raten), Komplexität, Reproduzierbarkeit; Gegenmaßnahmen durch IM-Schicht, Benchmarks, inkrementelle Inkremente, CI.

\newpage

## 13 Konkreter Minimalstart
Kleinste End-to-End-Kette: Kamera → AD-ECU → Lenkaktor über Ethernet/CAN; Attribute, mapping rules, erstes Simulationssetup; KPI-Messungen und erste Stressvariante.

\newpage

## Schlussfolgerungen und Ausblick
Die Arbeit etabliert eine reproduzierbare, validierte Kette von der Architektur bis zur Simulation und zeigt, wie frühe, datengetriebene Architekturentscheidungen möglich werden. Künftige Arbeiten adressieren detailliertere physikalische Sensor-/Aktormodelle, adaptive Scheduling-Strategien und Closed-Loop-Verifikation mit HIL/SiL-Co-Simulation.

## Literaturverzeichnis
(Platzhalter – wird mit Zitaten nachgetragen.)

## Anhang
- A: Attributkataloge (ECU, Sensor, Netzwerk, SWC)
- B: Export-/IM-Schemata (JSON/YAML)
- C: Transformationsregeln (Beispielsatz)
- D: Szenarien- und Variablenkatalog


