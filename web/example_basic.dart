import 'dart:html';
import '../lib/dart_events.dart';


void main() {
  EventEmitter emitter = new EventEmitter();
  emitter.on('test', (List<dynamic> args) {
      window.alert(args.toString());
  });

  /* < M3
  ButtonElement btn = new ButtonElement()
    ..text = 'Click me!'
    ..on.click.add((e) {
      emitter.emit('test', [1, 2, 3]);
    });
  */

  // >= M3
  ButtonElement btn = new ButtonElement()
    ..text = 'Click me'
    ..onClick.listen((e) {
      emitter.emit('test', [1, 2, 3]);
    });

  document.body.append(btn);
}


