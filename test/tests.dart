import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

import '../lib/dart_events.dart';

void handler(a) {
  arg = a;
}
var arg;

void main() {
  
  useHtmlEnhancedConfiguration(false);

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
      expect(arg, equals([1, 2, 3]));      
      emitter.emit('test', 'hello world');
      expect(arg, equals('hello world'));
    });
    
    test('should stop invoking handler after calling off', () {
      // Set "arg" to our desired value
      // to make sure it isn't affected.
      arg = 'changed before test';
      
      emitter.off('test', handler);
      emitter.emit('test', 'this is a test event');
      expect(arg, equals('changed before test'));
    });

  });
}
