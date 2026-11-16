#import "/Template/Lernzettel.typ": *
== Speicherbereiche
=== Heap
Der Heap ist ein großer, gemeinsamer Speicherbereich für Objekte, die länger leben können als die Methode, die sie erzeugt hat. Alles, was du mit `new` anlegst, landet dort. Objekte werden erst dann vom Garbage Collector gelöscht, wenn keine Referenz mehr auf sie existiert.

Auf dem Heap liegen *alle Objekte* – also neben Arrays und Listen z. B. auch `String`, `Integer` und Objekte eigener Klassen. Auch die Attribute eines Objekts (selbst primitive wie `int alter`) liegen zusammen mit dem Objekt auf dem Heap.
=== Stack
Der Stack funktioniert nach dem LIFO-Prinzip (Last In, First Out), wie ein Tellerstapel. Bei jedem Methodenaufruf wird ein Stack-Frame oben draufgelegt. Darin stehen die lokalen Variablen, die Parameter und die Rücksprungadresse. Endet die Methode, wird ihr Frame sofort wieder entfernt. 
Im Stack liegen *lokale Variablen und Parameter*: Bei primitiven Datentypen steht dort direkt der Wert, bei Objekten nur die Referenz, die auf das Objekt im Heap zeigt.