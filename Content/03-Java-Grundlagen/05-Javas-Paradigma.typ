#import "/Template/Lernzettel.typ": *

== Java-OOP-Paradigmen

=== Abstraktion
- *Prinzip:* Reduktion komplexer Sachverhalte der realen Welt auf die für das Programm wesentlichen Eigenschaften (Attribute) und Verhaltensweisen (Methoden).
- *Umsetzung in Java:* Abstrakte Klassen (`abstract class`) und Schnittstellen (`interface`).

=== Kapselung (Encapsulation)
- *Prinzip:* Verbergen interner Daten und Implementierungsdetails vor direktem Zugriff von außen (*Information Hiding*).
- *Umsetzung in Java:* Steuerung über Sichtbarkeitsmodifikatoren (`private`, `protected`, *package-private*, `public`). Zugriff auf `private`-Attribute erfolgt kontrolliert über *Getter* und *Setter* (inkl. Validierung).

=== Vererbung (Inheritance)
Weitergabe von Attributen und Methoden einer Oberklasse (Superklasse) an eine Unterklasse (Subklasse) über das Schlüsselwort `extends` (*„is-a“*-Beziehung). Java unterstützt nur *Einfachvererbung* bei Klassen.

==== Entwurfsansätze
- *Generalisierung (Bottom-up):* Gemeinsamkeiten bestehender Klassen erkennen und in eine neue Oberklasse auslagern (z. B. `Hund` und `Katze` $->$ Oberklasse `Vierbeiner`).
- *Spezialisierung (Top-down):* Eine bestehende Klasse um spezifische Eigenschaften oder Methoden erweitern (z. B. `Fahrzeug` $->$ `EAuto`).

==== Wichtige Java-Regeln
- *`java.lang.Object`:* Jede Klasse erbt implizit von `Object` (Wurzel der Klassenhierarchie; liefert z. B. `toString()`, `equals()`, `hashCode()`).
- *`super`:* Referenz auf die direkte Oberklasse – dient zum Aufruf von Konstruktoren (`super(...)`) oder überschriebenen Methoden (`super.methode()`).
- *Überladen (Overloading):* Mehrere Methoden mit *gleichem Namen*, aber *unterschiedlicher Parameterliste* (Anzahl/Datentypen) innerhalb derselben Klasse.

== Polymorphie (Vielgestaltigkeit)
Polymorphie bedeutet, dass eine Referenzvariable vom Typ einer Basisklasse (oder eines Interfaces) Objekte verschiedener abgeleiteter Klassen aufnehmen kann und der passende Methodencode erst zur Laufzeit bestimmt wird.

=== Kernmechanismen
- *Generalisierter Code:* Programmierung gegen die Basisklasse/das Interface statt gegen konkrete Unterklassen (z. B. eine `List<Tier>`, die `Hund`- und `Katze`-Objekte gemeinsam verarbeitet).
- *Überschreiben (Overriding):* Eine Subklasse definiert eine geerbte Methode mit *identischer Signatur* neu (`@Override`-Annotation). Die ursprüngliche Implementierung bleibt über `super.methode()` erreichbar.
- *Dynamic Dispatch (Dynamische Bindung):* Zur Laufzeit entscheidet die JVM anhand des tatsächlichen Objekttyps auf dem Heap (nicht anhand des Variablentyps), welche überschriebene Methode ausgeführt wird.

#abbildung(
  image("../../Assets/Polymorphie.png"),
  titel: [Polymorphie-Beispiel],
)