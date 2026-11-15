#import "../Template/Lernzettel.typ": *
= Ausführungsmodelle
Das Ausführungsmodell beeinflusst, wie ein Programm ausgeführt wird.
== Compiler
Bei einem Compiler, wie bei *Rust* oder *C*, wird der geschriebene Quellcode genommen und direkt in Maschinencode übersetzt. So erhält man ein direkt ausführbares Artefakt. Unter Windows ist das eine *.exe*-Datei, unter Linux und macOS eine Datei ohne Dateiendung. Mittlerweile geben Compiler auch Hinweise bei Fehlern im Code. Der Rust-Compiler liefert z. B. sehr genaue Hinweise und Hilfestellungen. Außerdem optimieren heutige Standard-Compiler den Code zusätzlich, sodass sogar die Komplexität von Code wegoptimiert werden kann.
== Interpreter
Ein Interpreter geht den Code zur Laufzeit Befehl für Befehl durch. Dadurch ist er langsamer, was heutzutage für Menschen kaum noch merkbar ist. Bei Sprachen wie Python, die mit einem Interpreter arbeiten, gibt es oft eine #abk("REPL"), in der man Code direkt in der Kommandozeile schreiben kann.
== Java, der Zwitter
Java wird oft als Zwitter bezeichnet, da Java-Code zu Bytecode kompiliert wird und dieser Bytecode anschließend von der #abk("JVM") interpretiert wird.
