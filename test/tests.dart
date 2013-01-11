// import 'dart:html';
import '../web/packages/unittest/unittest.dart';
// import '../web/packages/unittest/html_enhanced_config.dart';

import '../lib/dart_events.dart';


void handler(List<dynamic> a) {
  args = a;
}

List<dynamic> args;

void main() {

  // useHtmlEnhancedConfiguration();
  group('basic tests', () {
    EventEmitter emitter = new EventEmitter();

    test('it only add the same Function once', () {
      emitter.on('test', handler);
      emitter.on('test', handler);
      expect(emitter.listeners().length, equals(1));
    });

    test('it should remove a Function if it exists', () {
      emitter.off('NON_EXISTING', handler);
      expect(emitter.listeners().length, equals(1));
    });

    test('''
      it should call a listener Function 
      if a type of "event" is emitted and 
      is associtated to this type\'s listeners
  ''', () {
      emitter.emit('test', [1, 2, 3]);
      expect(args, equals([1, 2, 3]));
    });
  });

}


