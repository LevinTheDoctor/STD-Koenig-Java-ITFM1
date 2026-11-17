// =============================================================================
// Lernzettel – Einstiegspunkt
// =============================================================================
// Kompilieren:  typst compile main.typ lernzettel.pdf
// Live-Vorschau: typst watch main.typ lernzettel.pdf
//
// Hier wird nur konfiguriert und eingebunden. Die Bausteine liegen unter
// Template/, die Farben unter Config/Styles.typ, die Kapitel unter Content/.

#import "Template/Lernzettel.typ": *
#import "Config/Author.typ": author, date
#import "Config/Topic.typ": description, subject, subtitel, titel

#show: lernzettel.with(
  // --- Deckblatt ---------------------------------------------------------------
  titel: titel,
  subtitel: subtitel,
  subject: subject,
  description: description,
  autor: author,
  datum: date,

  // --- Seitenlayout (frei einstellbar) ------------------------------------------
  papier: "a4", // "a4", "a5", "us-letter", ...
  raender: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
  schriftgroesse: 11pt,
  spalten: 1, // 2 = zweispaltiger Fließtext
  blocksatz: false,

  // --- Struktur ------------------------------------------------------------------
  // Jedes Verzeichnis lässt sich einzeln abschalten; Abbildungs- und
  // Tabellenverzeichnis erscheinen ohnehin nur, wenn es etwas zu listen gibt.
  deckblatt: true,
  inhaltsverzeichnis-anzeigen: true,

  // --- Zitieren --------------------------------------------------------------------
  zitierweise: "chicago", // "chicago" = Fußnoten, "harvard"/"apa" = im Text

  // --- Abkürzungen ------------------------------------------------------------------
  // Im Text mit #abk("KI") verwenden. Die erste Verwendung schreibt die Langform
  // aus; das Abkürzungsverzeichnis listet nur, was auch benutzt wurde.
  abkuerzungen: (
    "JDK": "Java Development Kit",
    "JVM": "Java Virtual Machine",
    "API": "Application Programming Interface",
    "JDBC":"Java Database Connectivity",
    "JRE":"Java Runtime Environment",
    "REPL":"Read-eval-print loop",
    "UML": "Unified Modeling Language"
  ),
)

// --- Kapitel ---------------------------------------------------------------------------
#include "Content/01-Programierparadigma.typ"
#include "Content/02-Ausführungsmodell.typ"
#include "Content/03-Java-Grundlagen.typ"
#include "Content/04-Klassen-Diagramm.typ"

// --- Literaturverzeichnis ---------------------------------------------------------------
#literaturverzeichnis(datei: "/Bibliography/literatur.bib")
