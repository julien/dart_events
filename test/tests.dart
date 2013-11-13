import 'package:unittest/unittest.dart';
import '../lib/dart_events.dart';

void handler(List<dynamic> a) {
  args = a;
}

List<dynamic> args;

void main() {

  group('basic tests', () {
    EventEmitter emitter = new EventEmitter();

    test('shouldnt add the same event handler', () {
      emitter.on('test', handler);
      emitter.on('test', handler);
      expect(emitter.listeners().length, equals(1));
    });

    test('should not remove non existing handler', () {
      emitter.off('NON_EXISTING', handler);
      expect(emitter.listeners().length, equals(1));
    });

    test('should invoke handler when emitting events', () {
      emitter.emit('test', [1, 2, 3]);
      expect(args, equals([1, 2, 3]));
    });

  });
}
