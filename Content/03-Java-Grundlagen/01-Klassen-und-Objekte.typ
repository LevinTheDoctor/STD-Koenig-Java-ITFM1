#import "/Template/Lernzettel.typ": *

== Klassen <sec-klassen>

- Enthalten Anweisungen
- Arbeiten typbasiert

#tabelle(
  stdtable(
    columns: (auto, 1fr, 1fr),
    header: ([Begriff], [Bedeutung], [Wann?]),
    [*Deklaration*], [Speicherplatz reservieren], [bei unbekannten Werten deklarieren],
    [*Initialisierung*], [Wertzuweisung], [bei einem bekannten Wert direkt initialisieren],
  ),
  titel: [Deklaration und Initialisierung],
)

=== Sichten auf Klassen

#zweispaltig(
  konzeptkarte(title: [Sicht A])[
    Eine Klasse ist ein Bauplan, aus dem Objekte gebaut werden.
  ],
  konzeptkarte(title: [Sicht B])[
    Objekte werden aufgrund von Ähnlichkeiten als Klasse zusammengefasst:
    - relevante Attribute
    - Methoden zur Kommunikation über Schnittstellen
    - Nutzung von Ähnlichkeiten über Vererbung
  ],
)

#beispiel(title: [Sicht B])[
  Schüler und Lehrer können als Klasse _Mensch_ zusammengefasst werden.
]

== Objekte <sec-objekte>

#merksatz[Objekte sind Instanzen von Klassen.]
