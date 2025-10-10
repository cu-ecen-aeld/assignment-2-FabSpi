#!/bin/bash

# Das erste Argument ist writefile (der Pfad zur Datei)
WRITEFILE=$1
# Das zweite Argument ist writestr (der zu schreibende Text)
WRITESTR=$2

# 1. Argumentprüfung: Beendet sich mit dem Fehlerwert 1, wenn nicht beide Argumente angegeben wurden.
# -z überprüft, ob der übergebene String leer ist
if [ -z "$WRITEFILE" ] || [ -z "$WRITESTR" ]; then
    echo "Fehler: Es werden zwei Argumente benötigt."
    echo "Verwendung: $0 <Dateipfad> <Text>"
    exit 1
fi

# 2. Dateipfad erstellen und schreiben
# Erstellt den Pfad zum Verzeichnis, falls er nicht existiert.
# dirname extrahiert den Verzeichnispfad aus dem vollständigen Dateipfad.
mkdir -p "$(dirname "$WRITEFILE")"

# Schreibt den Text in die Datei. ">" überschreibt die Datei, falls sie existiert.
echo "$WRITESTR" > "$WRITEFILE"

# 3. Fehlerprüfung beim Schreiben
# Überprüft den Exit-Status des letzten Befehls (echo). 0 bedeutet Erfolg.
if [ $? -ne 0 ]; then
    echo "Fehler: Die Datei $WRITEFILE konnte nicht erstellt werden oder der Schreibvorgang ist fehlgeschlagen."
    exit 1
fi

# Erfolg: Das Skript endet standardmäßig mit dem Wert 0.
exit 0