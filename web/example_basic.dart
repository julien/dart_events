import 'dart:html';
import '../lib/dart_events.dart';


void handler(List<dynamic> a) {
  args = a;
  window.alert(args.toString());
}

List<dynamic> args;

void main() {
  EventEmitter emitter = new EventEmitter();
  emitter.on('test', handler);

  ButtonElement btn = new ButtonElement()
    ..text = 'Click me!'
    ..on.click.add((e) {
      emitter.emit('test', [1, 2, 3]);
    });
  document.body.append(btn);
}

