# GitHub Copilot Instructions und Skills

Das ist meine persönliche zentrale Sammlung von GitHub Copilot Instructions und Skills.

Sie enthält sowohl selbst erstellte Anleitungen als auch ausgewählte Inhalte aus der Community, insbesondere von [Awesome Copilot](https://github.com/github/awesome-copilot/).

## Verwendung als Git-Submodul

Dieses Repository dient als zentrale Quelle für wiederverwendbare Copilot-Inhalte. Es wird von anderen Projekten typischerweise als Git-Submodul unter `.github/copilot-shared` eingebunden.

Da dieses Repository sowohl `instructions/` als auch `skills/` an der Wurzel enthält, sollte es im Zielprojekt an einen neutralen Pfad eingebunden werden, zum Beispiel unter `.github/copilot-shared`:

```bash
git submodule add https://github.com/fabianmarcus/copilot .github/copilot-shared
git submodule update --init --recursive
```

Danach liegen die zentral gepflegten Inhalte im Zielprojekt unter:

- `.github/copilot-shared/instructions/`
- `.github/copilot-shared/skills/`
- `.github/copilot-shared/copilot-instructions.md`

Wichtig:

- Die mit diesem Repository ausgelieferte Datei `.github/copilot-shared/copilot-instructions.md` dient als Vorlage und muss bei Bedarf manuell nach `.github/copilot-instructions.md` ins Zielprojekt kopiert werden.
- Die projektspezifische Datei `.github/copilot-instructions.md` bleibt im Zielprojekt und wird dort lokal gepflegt.
- Diese Datei kann auf weitere projektlokale Instructions unter `.github/instructions/` sowie auf die zentral eingebundenen Inhalte unter `.github/copilot-shared/` verweisen.
- Wenn Inhalte exakt unter `.github/instructions/` oder `.github/skills/` liegen muessen, ist dafuer ein separates Distributions-Repo oder ein zusaetzlicher Sync-Schritt sinnvoller als dieses Gesamt-Repo direkt an diese Zielpfade zu mounten.
- Updates aus diesem Repository werden im Zielprojekt per normalem Submodul-Update nachgezogen.

Ein moeglicher Kopiervorgang im Zielprojekt ist zum Beispiel:

```bash
cp .github/copilot-shared/copilot-instructions.md .github/copilot-instructions.md
```

Alternativ kann die Struktur unter macOS- oder Linux-Systemen auch per Symlink gespiegelt werden. Eine passende Copilot-Anweisung dafuer waere zum Beispiel:

```text
- Lege Symlink für den Instructions Ordner `.github/copilot-shared/instructions` entsprechend unter `.github/instructions` an.
- Lege Symlink für den Skills Ordner `.github/copilot-shared/skills` entsprechend unter `.github/skills` an.
```

Diese Variante ist vor allem dann nuetzlich, wenn Copilot die Inhalte zusaetzlich unter den Standardpfaden `.github/instructions` und `.github/skills` finden soll. Sie ist jedoch eher fuer Unix-artige Umgebungen geeignet als fuer plattformuebergreifende Repositories.

## Git-Submodul aktualisieren

Wenn das Submodul bereits im Zielprojekt eingebunden ist, kann es spaeter auf den neuesten Stand dieses Repositories aktualisiert werden.

Ein typischer Ablauf im Zielprojekt ist:

```bash
git submodule update --remote --merge
git add .github/copilot-shared
git commit -m "Update shared Copilot skills"
```

Alternativ kann das Submodul auch direkt im eingebundenen Verzeichnis aktualisiert werden:

```bash
cd .github/copilot-shared
git pull
cd ../..
git add .github/copilot-shared
git commit -m "Update shared Copilot skills"
```

Falls auch die mitgelieferte Vorlage fuer `copilot-instructions.md` aktualisiert werden soll, kann sie anschliessend erneut ins Zielprojekt kopiert und dort projektspezifisch angepasst werden:

```bash
cp .github/copilot-shared/copilot-instructions.md .github/copilot-instructions.md
```
