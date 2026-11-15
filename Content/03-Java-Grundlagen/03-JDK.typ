#import "/Template/Lernzettel.typ": *

== JDK – Java Development Kit <sec-jdk>

Das #abk("JDK", kurz: true) liefert alles, was man als Entwickler*in benötigt.

#abbildung(
  image("/Assets/jdk.png"),
  titel: [Alles, was das #abk("JDK", kurz: true) mitbringt],
)

=== JRE – Java Runtime Environment <sec-jre>

Die #abk("JRE", kurz: true) bringt wiederum zwei Dinge mit: zum einen die Standardbibliothek, zum anderen die #abk("JVM").

==== Standardbibliothek

Die Java-Standardbibliothek umfasst alle Pakete, die im Paket `java.*` liegen.

#tabelle(
  stdtable(
    columns: (auto, 1fr),
    header: ([Paket], [Inhalt]),
    [`java.lang`], [`String`, `Math`, `Thread`, `Exception` (automatisch importiert)],
    [`java.util`], [`List`, `Map`, `Set`, `Optional`, `Scanner`],
    [`java.util.stream`], [Stream-#abk("API", kurz: true) (`stream().filter().map()`)],
    [`java.io` / `java.nio.file`], [Dateien, Ein- und Ausgabe],
    [`java.net` / `java.net.http`], [Netzwerk, `HttpClient`],
    [`java.time`], [`LocalDate`, `LocalDateTime`, `Duration`],
    [`java.math`], [`BigDecimal`, `BigInteger`],
    [`java.text`], [Formatierung (Zahlen, Datum)],
    [`java.sql`], [#abk("JDBC", kurz: true) (Datenbankzugriff)],
    [`java.security`], [Hashing, Signaturen],
  ),
  titel: [Die wichtigsten Pakete der Standardbibliothek],
)

==== JVM – Java Virtual Machine <sec-jvm>

Die Java Virtual Machine ist die Komponente, die Java als Sprache so weit gebracht hat. Durch die #abk("JVM") wird Bytecode auf einer virtuellen Maschine – der #abk("JVM") – ausgeführt.

#merksatz(title: [Plattformunabhängigkeit])[
  Die #abk("JVM") kann auf verschiedenen Prozessorarchitekturen und Betriebssystemen ausgeführt werden, ohne dass Entwickler*innen den Code neu kompilieren oder anpassen müssen.
]
