---
name: push-documentation-check
description: "Use when preparing a commit or push, reviewing whether code changes require README or other documentation updates, or deciding which docs must be updated before a push is allowed."
user-invocable: false
---

# Push Documentation Check

Diese Skill-Datei beschreibt die inhaltliche Doku-Pruefung vor einem Push.
Sie wird verwendet, wenn geprueft werden soll, ob die geplanten Aenderungen auch README-Dateien oder andere Dokumentationsartefakte anpassen muessen.

## Ziel

- Vor einem Push feststellen, ob die zu pushenden Aenderungen eine Doku-Anpassung erfordern.
- Falls ja, die noetigen Dateien identifizieren und die Dokumentation vor dem Push aktualisieren.

## Wann ein Doku-Update typischerweise noetig ist

- Setup, Start, Build, Test, Deployment oder lokale Entwicklungsablaeufe haben sich geaendert.
- Neue Umgebungsvariablen, externe Abhaengigkeiten oder Infrastrukturannahmen wurden eingefuehrt.
- API-Verhalten, Request- oder Response-Formate, Routen oder Integrationspunkte haben sich geaendert.
- User-visible Verhalten, Screens, Texte, Bedienablaeufe oder bekannte Einschraenkungen haben sich geaendert.
- Architektur-, Sicherheits-, Betriebs- oder Wartungshinweise sind nicht mehr aktuell.

## Typische Zielorte fuer Doku-Updates

- README-Dateien im Root oder in Teilprojekten.
- Dateien unter docs/.
- Architektur- oder Betriebsdokumentation.
- Migrations-, Changelog- oder Entwicklerdokumentation.

## Pruefablauf

1. Die zu pushenden Aenderungen funktional zusammenfassen.
2. Fuer jede Aenderung pruefen, ob sie Build, Betrieb, Nutzung, Schnittstellen oder Entwicklung beeinflusst.
3. Falls ja, die naheliegenden Doku-Dateien bestimmen.
4. Wenn keine passende Datei existiert, README oder docs an geeigneter Stelle erweitern.
5. Erst pushen, wenn die fachlich notwendige Dokumentation mit den Codeaenderungen konsistent ist.

## Entscheidungsregel

- Wenn ein Teammitglied ohne implizites Vorwissen die Aenderung aus vorhandener Doku nicht mehr korrekt verstehen, starten oder benutzen koennte, ist ein Doku-Update noetig.
- Wenn die Aenderung rein intern ist und weder Bedienung, Setup, Schnittstellen noch Betrieb beeinflusst, ist oft kein Doku-Update noetig.
