# Copilot Instructions

Diese Datei ist der zentrale Einstiegspunkt für Repository-weit geltende Copilot-Vorgaben.

## Priorität

Bei Konflikten gilt folgende Reihenfolge:

1. Explizite Anweisungen aus der aktuellen User-Anfrage
2. Diese Datei
3. Passende thematische Instructions unter `.github/copilot-shared/instructions/`
4. Passende Skills unter `.github/copilot-shared/skills/`
5. Standardverhalten von Copilot

## Anzuwendende Instructions

Für allgemeine Arbeit im Repository:
- Siehe `.github/copilot-shared/instructions/copilot-instructions.common.md`

Für ausführlichere Arbeitsweise, Begründungen und Beispiele:
- Siehe `.github/copilot-shared/instructions/copilot-instructions.detailed.md`

Für CI-, Review- und streng minimierte Änderungen:
- Siehe `.github/copilot-shared/instructions/copilot-instructions.ci-review.md`

## Auswahlregel

- Verwende standardmäßig `copilot-instructions.common.md`.
- Ziehe `copilot-instructions.detailed.md` heran, wenn die Aufgabe komplex ist, mehrere Dateien betrifft oder genauere Leitplanken benötigt.
- Verwende `copilot-instructions.ci-review.md` bei Review-, Prüf-, CI- oder Minimaländerungs-Aufgaben.
- Wenn mehrere Dateien passen, gilt die spezifischere Datei für den jeweiligen Kontext.

## Projektspezifische Ergänzungen

- Repository-spezifische Skills unter `.github/copilot-shared/skills/` ergänzen diese Instructions.
- Bestehende Muster im Repository haben Vorrang vor generischen Beispielen.