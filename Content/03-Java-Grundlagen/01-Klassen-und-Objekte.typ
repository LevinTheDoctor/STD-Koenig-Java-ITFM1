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

== Konstruktoren
Konstruktoren sind spezielle Methoden, mit denen ein Objekt einer Klasse instanziiert (also erzeugt) wird. Sie werden mit `new` aufgerufen.

- Ein Konstruktor heißt *genauso wie die Klasse* und hat *keinen Rückgabetyp* (auch nicht `void`).
- Er initialisiert die Attribute des neuen Objekts.
- Schreibt man keinen eigenen Konstruktor, erzeugt Java automatisch einen leeren *Standardkonstruktor* ohne Parameter. Sobald man selbst einen Konstruktor schreibt, fällt dieser weg.
- Mit `this.attribut` unterscheidet man das Attribut vom gleichnamigen Parameter.

=== Überladen
Konstruktoren können überladen werden. Das bedeutet, dass es mehrere Konstruktoren mit *unterschiedlicher Parameterliste* (Anzahl oder Datentypen) gibt. So kann ein Objekt einer Klasse auf unterschiedliche Arten erzeugt werden. Mit `this(...)` kann ein Konstruktor einen anderen Konstruktor derselben Klasse aufrufen. Der Aufruf muss dann die *erste Anweisung* sein. So steht die eigentliche Logik (z. B. die Prüfung der Werte) nur an einer Stelle.

#beispiel(title: [Klasse `Rechteck`])[
  Ein Rechteck hat eine Höhe und eine Breite. Daraus lassen sich Umfang und Flächeninhalt berechnen. Umgekehrt lässt sich das Rechteck auch aus der Höhe oder der Breite zusammen mit dem Umfang oder dem Flächeninhalt bestimmen:
  - Breite $= "Flächeninhalt" / "Höhe"$
  - Breite $= "Umfang" / 2 - "Höhe"$
]

#warnbox(title: [Gleiche Signatur nicht möglich])[
  `Rechteck(double hoehe, double flaeche)` und `Rechteck(double hoehe, double umfang)` hätten dieselbe Parameterliste `(double, double)` wie `Rechteck(double hoehe, double breite)`. Der Compiler kann sie nicht unterscheiden, denn Parameternamen zählen nicht zur Signatur. Für diese Fälle verwendet man deshalb *statische Fabrikmethoden* mit sprechenden Namen, die intern den Konstruktor aufrufen.
]

```java
public class Rechteck {
    private double hoehe;
    private double breite;

    // 1. Standardkonstruktor: Einheitsrechteck 1 x 1
    public Rechteck() {
        this(1, 1);
    }

    // 2. Quadrat: nur eine Seitenlänge
    public Rechteck(double seite) {
        this(seite, seite);
    }

    // 3. Hauptkonstruktor: Höhe und Breite
    public Rechteck(double hoehe, double breite) {
        if (hoehe <= 0 || breite <= 0) {
            throw new IllegalArgumentException("Seiten müssen größer als 0 sein");
        }
        this.hoehe = hoehe;
        this.breite = breite;
    }

    // 4. Kopierkonstruktor: Kopie eines anderen Rechtecks
    public Rechteck(Rechteck andere) {
        this(andere.hoehe, andere.breite);
    }

    // Fabrikmethoden für Umfang/Flächeninhalt
    public static Rechteck ausHoeheUndFlaeche(double hoehe, double flaeche) {
        return new Rechteck(hoehe, flaeche / hoehe);
    }

    public static Rechteck ausBreiteUndFlaeche(double breite, double flaeche) {
        return new Rechteck(flaeche / breite, breite);
    }

    public static Rechteck ausHoeheUndUmfang(double hoehe, double umfang) {
        return new Rechteck(hoehe, umfang / 2 - hoehe);
    }

    public static Rechteck ausBreiteUndUmfang(double breite, double umfang) {
        return new Rechteck(umfang / 2 - breite, breite);
    }

    public double getHoehe() {
        return hoehe;
    }

    public double getBreite() {
        return breite;
    }

    public double getUmfang() {
        return 2 * (hoehe + breite);
    }

    public double getFlaecheninhalt() {
        return hoehe * breite;
    }

    @Override
    public String toString() {
        return "Rechteck[hoehe=" + hoehe + ", breite=" + breite
                + ", umfang=" + getUmfang() + ", flaeche=" + getFlaecheninhalt() + "]";
    }
}
```

Verwendung der Konstruktoren und Fabrikmethoden:

```java
public class Main {
    public static void main(String[] args) {
        Rechteck a = new Rechteck();                            // 1 x 1
        Rechteck b = new Rechteck(4);                           // Quadrat 4 x 4
        Rechteck c = new Rechteck(3, 5);                        // 3 x 5
        Rechteck d = new Rechteck(c);                           // Kopie von c
        Rechteck e = Rechteck.ausHoeheUndFlaeche(3, 15);        // 3 x 5
        Rechteck f = Rechteck.ausBreiteUndUmfang(5, 16);        // 3 x 5

        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
        System.out.println(d);
        System.out.println(e);
        System.out.println(f);
    }
}
```
