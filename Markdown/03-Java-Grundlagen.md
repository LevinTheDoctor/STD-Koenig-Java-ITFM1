# Java Grundlagen

Java ist eine Programmiersprache, die ursprünglich von James Gosling bei Sun Microsystems entwickelt wurde. Später wurde sie von Oracle erworben. Java ist eine objektorientierte Sprache. Heutzutage gibt es viele Frameworks, wie z. B. *Spring Boot*, die die Entwicklung großer Anwendungen mit Java vereinfachen.

## Primitive Datentypen

Die primitiven (einfachen) Typen sind fest in der Sprache Java eingebaute Datentypen für Zahlen, Unicode-Zeichen und Wahrheitswerte. Die Namen der primitiven Datentypen werden immer kleingeschrieben.

**Überblick über die primitiven Datentypen**

|  |  |
| --- | --- |
| table.header(\[**Typ**\], \[**Belegung (Wertebereich)**\]) | `boolean` |
| `true` oder `false` | `char` |
| 16-Bit-Unicode-Zeichen (`0x0000` … `0xFFFF`) | `byte` |
| $- 2^{7}$ bis $2^{7} - 1$ ($- 128$ … $127$) | `short` |
| $- 2^{15}$ bis $2^{15} - 1$ ($- 32.768$ … $32.767$) | `int` |
| $- 2^{31}$ bis $2^{31} - 1$ ($- 2.147.483.648$ … $2.147.483.647$) | `long` |
| $- 2^{63}$ bis $2^{63} - 1$ ($- 9.223.372.036.854.775.808$ … $9.223.372.036.854.775.807$) | `float` |
| $1,4 \times 10^{- 45}$ … $3,4 \times 10^{38}$ | `double` |
| $4,9 \times 10^{- 324}$ … $1,7 \times 10^{308}$ |  |

## Wrapper-Klassen

Wrapper-Klassen verweisen immer auf ein Objekt. `Integer` ist zum Beispiel eine Klasse, die um den primitiven Typ `int` herumgebaut wurde und zusätzliche Methoden bereitstellt.
