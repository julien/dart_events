import 'dart:html';
import '../lib/dart_events.dart';


void main() {
  EventEmitter emitter = new EventEmitter();
  emitter.on('test', (data) {
      window.alert(data);
  });

  /* < M3
  ButtonElement btn = new ButtonElement()
    ..text = 'Click me!'
    ..on.click.add((e) {
      emitter.emit('test', 'hello dart');
    });
  */

  // >= M3
  ButtonElement btn = new ButtonElement()
    ..text = 'Click me'
    ..onClick.listen((e) {
      emitter.emit('test', 'back to the 90ies');
    });

  document.body.append(btn);
}


