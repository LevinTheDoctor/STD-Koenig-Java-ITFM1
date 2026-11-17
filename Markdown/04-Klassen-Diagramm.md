# Klassendiagramm

Ein Klassendiagramm ist ein Strukturdiagramm der Unified Modeling Language (UML). Es zeigt die **Klassen** eines Systems mit ihren **Attributen** und **Methoden** sowie die **Beziehungen** zwischen den Klassen. Klassendiagramme werden vor der Programmierung zur Planung (Entwurf) und danach zur Dokumentation eingesetzt. Sie sind unabhängig von einer konkreten Programmiersprache, lassen sich aber direkt in Java-Code übersetzen.

## Aufbau einer Klasse

Eine Klasse wird als Rechteck mit drei Bereichen dargestellt:

align(center, uml-klasse( \[Klassenname\], attribute: (“- attribut: Datentyp“,), methoden: (“+ methode(param: Typ): Rückgabetyp“,), breite: 7.2cm, ))

1.  **Klassenname:** fett und zentriert, beginnt mit einem Großbuchstaben (z. B. `Kreis`).

    1.  **Attribute:** die Eigenschaften der Klasse in der Form\
        `Sichtbarkeit name: Datentyp`.

    2.  **Methoden:** die Operationen der Klasse in der Form\
        `Sichtbarkeit name(Parameter): Rückgabetyp`.

> **Info: Unterschied zu Java**
>
> Im Klassendiagramm steht der Datentyp **hinter** dem Namen, getrennt durch einen Doppelpunkt (`radius: double`). In Java steht er **davor** (`double radius`). Methoden ohne Rückgabewert erhalten den Typ `void` oder lassen ihn weg.

## Elemente

### Sichtbarkeiten (Plus und Minus)

Das Zeichen vor einem Attribut oder einer Methode gibt die **Sichtbarkeit** an, also von wo aus darauf zugegriffen werden darf. Es entspricht den Zugriffsmodifikatoren in Java.

**Sichtbarkeiten im Klassendiagramm**

| Symbol | Java | Zugriff möglich von … |
| --- | --- | --- |
| `+` | `public` | überall (jede andere Klasse) |
| `-` | `private` | nur innerhalb der eigenen Klasse |
| `#` | `protected` | eigener Klasse, Unterklassen und Klassen im selben Paket |
| `~` | *package-private*\ (kein Schlüsselwort) | nur Klassen im selben Paket |

> **Merke: Faustregel: Attribute Minus, Methoden Plus**
>
> Attribute werden in der Regel `-` (private) gesetzt, damit niemand sie von außen unkontrolliert verändern kann (**Kapselung**). Der Zugriff erfolgt über `+` (public) Methoden wie Getter und Setter, die z. B. ungültige Werte abfangen können.

### Weitere Kennzeichnungen

**Weitere Kennzeichnungen**

| Darstellung | Bedeutung | Java |
| --- | --- | --- |
| <u>`- anzahl: int`</u> | **statisch**: gehört zur Klasse, nicht zum einzelnen Objekt | `static` |
| *`Form`* (kursiv) bzw. `{abstract}` | **abstrakte** Klasse oder Methode | `abstract` |
| `«interface»` über dem Namen | **Schnittstelle** | `interface` |
| `- PI: double {readOnly}` bzw. GROSSBUCHSTABEN | **Konstante** | `final` |
| `+ Kreis(radius: double)` | **Konstruktor**: gleicher Name wie die Klasse, kein Rückgabetyp | – |

### Beziehungen

Klassen stehen selten allein. Die Beziehungen zwischen ihnen werden durch Linien mit unterschiedlichen Pfeilspitzen dargestellt.

**Beziehungen im Klassendiagramm**

| Linie | Beziehung | Bedeutung und Beispiel |
| --- | --- | --- |
| #uml-pfeil(kopf: "keiner") | **Assoziation** | Klassen kennen sich (*„kennt“*).\ z\. B. `Lehrer` — `Schüler` |
| #uml-pfeil(kopf: "offen") | **gerichtete Assoziation** | nur eine Klasse kennt die andere.\ z\. B. `Auto` → `Motor` |
| #uml-pfeil(kopf: "dreieck") | **Vererbung** (Generalisierung) | *„ist ein“*, Pfeil zeigt auf die Oberklasse.\ z\. B. `Hund` → `Tier` (`extends`) |
| #uml-pfeil(kopf: "dreieck", gestrichelt: true) | **Realisierung** | Klasse implementiert ein Interface.\ z\. B. `Kreis` → `Form` (`implements`) |
| #uml-pfeil(kopf: "raute-leer") | **Aggregation** | *„hat ein“*, Teile können auch ohne das Ganze existieren.\ z\. B. `Mannschaft` ◇— `Spieler` |
| #uml-pfeil(kopf: "raute-voll") | **Komposition** | *„besteht aus“*, Teile existieren nicht ohne das Ganze.\ z\. B. `Gebäude` ◆— `Raum` |
| #uml-pfeil(kopf: "offen", gestrichelt: true) | **Abhängigkeit** | eine Klasse benutzt die andere kurzzeitig, z. B. als Parameter. |

Die Raute sitzt immer auf der Seite des **Ganzen**.

#### Multiplizitäten

An den Enden einer Beziehung steht, **wie viele** Objekte beteiligt sind:

**Multiplizitäten**

| Angabe | Bedeutung |
| --- | --- |
| `1` | genau eins |
| `0..1` | keins oder eins (optional) |
| `*` bzw. `0..*` | beliebig viele (auch keins) |
| `1..*` | mindestens eins |
| `2..5` | zwischen zwei und fünf |

> **Beispiel: Multiplizität**
>
> `Mannschaft 1 ◇—— 11..* Spieler`: Eine Mannschaft hat mindestens elf Spieler, ein Spieler gehört zu genau einer Mannschaft.

## Beispiel: Klasse `Kreis`

Ein Kreis wird durch seinen Radius beschrieben. Daraus lassen sich Flächeninhalt ($A = \pi r^{2}$) und Umfang ($U = 2\pi r$) berechnen.

![Klassendiagramm der Klasse `Kreis`](../Assets/kreis-klassendiagramm.png)

### Erklärung von Plus und Minus

- **`- radius: double`**: Das Minus macht den Radius **privat**. Von außen kann niemand `kreis.radius = -5` schreiben, nur die Klasse `Kreis` selbst greift direkt darauf zu.

- **`+ Kreis(radius: double)`**: Der Konstruktor ist **öffentlich**, damit andere Klassen mit `new Kreis(2.5)` einen Kreis erzeugen können.

- **`+ getRadius()` / `+ setRadius(…)`**: Öffentliche Getter und Setter sind der kontrollierte Weg nach außen. Der Setter prüft, dass der Radius nicht negativ ist.

- **`+ berechneFlaeche()` / `+ berechneUmfang()`**: Öffentliche Methoden, die jede andere Klasse aufrufen darf. Sie speichern nichts, sondern berechnen den Wert jedes Mal aus dem aktuellen Radius.

### Implementierung in Java

Jede Zeile im Diagramm wird zu genau einem Element im Code:

``` java
public class Kreis {
    // - radius: double
    private double radius;

    // + Kreis(radius: double)
    public Kreis(double radius) {
        setRadius(radius);
    }

    // + getRadius(): double
    public double getRadius() {
        return radius;
    }

    // + setRadius(radius: double): void
    public void setRadius(double radius) {
        if (radius < 0) {
            throw new IllegalArgumentException("Der Radius darf nicht negativ sein");
        }
        this.radius = radius;
    }

    // + berechneFlaeche(): double
    public double berechneFlaeche() {
        return Math.PI * radius * radius;
    }

    // + berechneUmfang(): double
    public double berechneUmfang() {
        return 2 * Math.PI * radius;
    }
}
```

Verwendung:

``` java
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
