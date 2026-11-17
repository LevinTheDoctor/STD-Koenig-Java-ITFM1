#import "../Template/Lernzettel.typ": *

// --- Hilfsfunktionen für UML-Darstellungen ------------------------------------
// Eine Klasse als UML-Kasten mit drei Bereichen: Name, Attribute, Methoden.
#let uml-klasse(name, attribute: (), methoden: (), breite: 7cm) = table(
  columns: (breite,),
  stroke: 0.8pt + black,
  inset: (x: 8pt, y: 6pt),
  fill: (x, y) => if y == 0 { luma(235) } else { white },
  align(center, text(weight: "bold", name)),
  attribute.map(a => block(above: 0.4em, raw(a))).join(),
  methoden.map(m => block(above: 0.4em, raw(m))).join(),
)

// Ein Beziehungspfeil (Länge 2 cm) mit verschiedenen Pfeilspitzen.
//   kopf: "offen" | "dreieck" | "raute-leer" | "raute-voll" | "keiner"
#let uml-pfeil(kopf: "offen", gestrichelt: false) = box(width: 2.2cm, height: 0.6cm, {
  let s = (paint: black, thickness: 0.8pt, dash: if gestrichelt { "dashed" } else { none })
  let y = 0.3cm
  let ende = if kopf in ("dreieck",) { 1.85cm } else if kopf.starts-with("raute") { 1.7cm } else { 2.2cm }
  place(line(start: (0cm, y), end: (ende, y), stroke: s))
  let k = (paint: black, thickness: 0.8pt)
  if kopf == "offen" {
    place(line(start: (1.95cm, y - 0.15cm), end: (2.2cm, y), stroke: k))
    place(line(start: (1.95cm, y + 0.15cm), end: (2.2cm, y), stroke: k))
  } else if kopf == "dreieck" {
    place(polygon(fill: white, stroke: k, (1.85cm, y - 0.18cm), (2.2cm, y), (1.85cm, y + 0.18cm)))
  } else if kopf.starts-with("raute") {
    let f = if kopf == "raute-voll" { black } else { white }
    place(polygon(fill: f, stroke: k, (1.7cm, y), (1.95cm, y - 0.13cm), (2.2cm, y), (1.95cm, y + 0.13cm)))
  }
})

= Klassendiagramm <sec-klassendiagramm>

Ein Klassendiagramm ist ein Strukturdiagramm der #abk("UML"). Es zeigt die *Klassen* eines Systems mit ihren *Attributen* und *Methoden* sowie die *Beziehungen* zwischen den Klassen. Klassendiagramme werden vor der Programmierung zur Planung (Entwurf) und danach zur Dokumentation eingesetzt. Sie sind unabhängig von einer konkreten Programmiersprache, lassen sich aber direkt in Java-Code übersetzen.

== Aufbau einer Klasse

Eine Klasse wird als Rechteck mit drei Bereichen dargestellt:

#zweispaltig(
  align(center, uml-klasse(
    [Klassenname],
    attribute: ("- attribut : Datentyp",),
    methoden: ("+ methode(param : Typ) : Rückgabetyp",),
    breite: 7.2cm,
  )),
  [
    + *Klassenname:* fett und zentriert, beginnt mit einem Großbuchstaben (z. B. `Kreis`).
    + *Attribute:* die Eigenschaften der Klasse in der Form \ `Sichtbarkeit name : Datentyp`.
    + *Methoden:* die Operationen der Klasse in der Form \ `Sichtbarkeit name(Parameter) : Rückgabetyp`.
  ],
)

#infobox(title: [Unterschied zu Java])[
  Im Klassendiagramm steht der Datentyp *hinter* dem Namen, getrennt durch einen Doppelpunkt (`radius : double`). In Java steht er *davor* (`double radius`). Methoden ohne Rückgabewert erhalten den Typ `void` oder lassen ihn weg.
]

== Elemente

=== Sichtbarkeiten (Plus und Minus)

Das Zeichen vor einem Attribut oder einer Methode gibt die *Sichtbarkeit* an, also von wo aus darauf zugegriffen werden darf. Es entspricht den Zugriffsmodifikatoren in Java.

#tabelle(
  stdtable(
    columns: (auto, auto, 1fr),
    header: ([Symbol], [Java], [Zugriff möglich von …]),
    [`+`], [`public`], [überall (jede andere Klasse)],
    [`-`], [`private`], [nur innerhalb der eigenen Klasse],
    [`#`], [`protected`], [eigener Klasse, Unterklassen und Klassen im selben Paket],
    [`~`], [_package-private_ \ (kein Schlüsselwort)], [nur Klassen im selben Paket],
  ),
  titel: [Sichtbarkeiten im Klassendiagramm],
)

#merksatz(title: [Faustregel: Attribute Minus, Methoden Plus])[
  Attribute werden in der Regel `-` (private) gesetzt, damit niemand sie von außen unkontrolliert verändern kann (*Kapselung*). Der Zugriff erfolgt über `+` (public) Methoden wie Getter und Setter, die z. B. ungültige Werte abfangen können.
]

=== Weitere Kennzeichnungen

#tabelle(
  stdtable(
    columns: (auto, 1fr, auto),
    header: ([Darstellung], [Bedeutung], [Java]),
    [#underline[`- anzahl : int`]], [*statisch*: gehört zur Klasse, nicht zum einzelnen Objekt], [`static`],
    [_`Form`_ (kursiv) bzw. `{abstract}`], [*abstrakte* Klasse oder Methode], [`abstract`],
    [`«interface»` über dem Namen], [*Schnittstelle*], [`interface`],
    [`- PI : double {readOnly}` bzw. GROSSBUCHSTABEN], [*Konstante*], [`final`],
    [`+ Kreis(radius : double)`], [*Konstruktor*: gleicher Name wie die Klasse, kein Rückgabetyp], [–],
  ),
  titel: [Weitere Kennzeichnungen],
)

=== Beziehungen

Klassen stehen selten allein. Die Beziehungen zwischen ihnen werden durch Linien mit unterschiedlichen Pfeilspitzen dargestellt.

#tabelle(
  stdtable(
    columns: (auto, auto, 1fr),
    header: ([Linie], [Beziehung], [Bedeutung und Beispiel]),
    [#uml-pfeil(kopf: "keiner")], [*Assoziation*], [Klassen kennen sich (_„kennt“_). \ z. B. `Lehrer` — `Schüler`],
    [#uml-pfeil(kopf: "offen")], [*gerichtete Assoziation*], [nur eine Klasse kennt die andere. \ z. B. `Auto` → `Motor`],
    [#uml-pfeil(kopf: "dreieck")], [*Vererbung* (Generalisierung)], [_„ist ein“_, Pfeil zeigt auf die Oberklasse. \ z. B. `Hund` → `Tier` (`extends`)],
    [#uml-pfeil(kopf: "dreieck", gestrichelt: true)], [*Realisierung*], [Klasse implementiert ein Interface. \ z. B. `Kreis` → `Form` (`implements`)],
    [#uml-pfeil(kopf: "raute-leer")], [*Aggregation*], [_„hat ein“_, Teile können auch ohne das Ganze existieren. \ z. B. `Mannschaft` ◇— `Spieler`],
    [#uml-pfeil(kopf: "raute-voll")], [*Komposition*], [_„besteht aus“_, Teile existieren nicht ohne das Ganze. \ z. B. `Gebäude` ◆— `Raum`],
    [#uml-pfeil(kopf: "offen", gestrichelt: true)], [*Abhängigkeit*], [eine Klasse benutzt die andere kurzzeitig, z. B. als Parameter.],
  ),
  titel: [Beziehungen im Klassendiagramm],
)

Die Raute sitzt immer auf der Seite des *Ganzen*.

==== Multiplizitäten

An den Enden einer Beziehung steht, *wie viele* Objekte beteiligt sind:

#tabelle(
  stdtable(
    columns: (auto, 1fr),
    header: ([Angabe], [Bedeutung]),
    [`1`], [genau eins],
    [`0..1`], [keins oder eins (optional)],
    [`*` bzw. `0..*`], [beliebig viele (auch keins)],
    [`1..*`], [mindestens eins],
    [`2..5`], [zwischen zwei und fünf],
  ),
  titel: [Multiplizitäten],
)

#beispiel(title: [Multiplizität])[
  `Mannschaft 1 ◇—— 11..* Spieler`: Eine Mannschaft hat mindestens elf Spieler, ein Spieler gehört zu genau einer Mannschaft.
]

== Beispiel: Klasse `Kreis`

Ein Kreis wird durch seinen Radius beschrieben. Daraus lassen sich Flächeninhalt ($A = pi r^2$) und Umfang ($U = 2 pi r$) berechnen.

#abbildung(
  image("../Assets/kreis-klassendiagramm.png", width: 60%),
  titel: [Klassendiagramm der Klasse `Kreis`],
)

=== Erklärung von Plus und Minus

- *`- radius : double`*: Das Minus macht den Radius *privat*. Von außen kann niemand `kreis.radius = -5` schreiben, nur die Klasse `Kreis` selbst greift direkt darauf zu.
- *`+ Kreis(radius : double)`*: Der Konstruktor ist *öffentlich*, damit andere Klassen mit `new Kreis(2.5)` einen Kreis erzeugen können.
- *`+ getRadius()` / `+ setRadius(…)`*: Öffentliche Getter und Setter sind der kontrollierte Weg nach außen. Der Setter prüft, dass der Radius nicht negativ ist.
- *`+ berechneFlaeche()` / `+ berechneUmfang()`*: Öffentliche Methoden, die jede andere Klasse aufrufen darf. Sie speichern nichts, sondern berechnen den Wert jedes Mal aus dem aktuellen Radius.

=== Implementierung in Java

Jede Zeile im Diagramm wird zu genau einem Element im Code:

```java
public class Kreis {
    // - radius : double
    private double radius;

    // + Kreis(radius : double)
    public Kreis(double radius) {
        setRadius(radius);
    }

    // + getRadius() : double
    public double getRadius() {
        return radius;
    }

    // + setRadius(radius : double) : void
    public void setRadius(double radius) {
        if (radius < 0) {
            throw new IllegalArgumentException("Der Radius darf nicht negativ sein");
        }
        this.radius = radius;
    }

    // + berechneFlaeche() : double
    public double berechneFlaeche() {
        return Math.PI * radius * radius;
    }

    // + berechneUmfang() : double
    public double berechneUmfang() {
        return 2 * Math.PI * radius;
    }
}
```

Verwendung:

```java
public class Main {
    public static void main(String[] args) {
        Kreis k = new Kreis(2.0);

        System.out.println(k.getRadius());        // 2.0
        System.out.println(k.berechneFlaeche());  // 12.566370614359172
        System.out.println(k.berechneUmfang());   // 12.566370614359172

        k.setRadius(3.0);
        System.out.println(k.berechneFlaeche());  // 28.274333882308138

        // k.radius = 5;  // Fehler: radius ist private (-)
    }
}
```
