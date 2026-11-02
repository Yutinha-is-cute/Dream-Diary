import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('all Flutter namespaces have pt-BR with identical keys and interpolators', () {
    final dir = Directory('i18n/flutter');
    final baseFiles = dir.listSync().whereType<File>().where((f) => f.path.endsWith('_zh.i18n.json'));
    expect(baseFiles, isNotEmpty);
    Map<String, dynamic> flatten(Map<String, dynamic> map, [String prefix = '']) {
      final out = <String, dynamic>{};
      for (final entry in map.entries) {
        final key = prefix.isEmpty ? entry.key : '$prefix.${entry.key}';
        if (entry.value is Map<String, dynamic>) {
          out.addAll(flatten(entry.value as Map<String, dynamic>, key));
        } else { out[key] = entry.value; }
      }
      return out;
    }
    Set<String> vars(Object? value) => RegExp(r'\{(\w+)\}').allMatches(value.toString()).map((m) => m.group(1)!).toSet();
    for (final base in baseFiles) {
      final name = base.uri.pathSegments.last.replaceAll('_zh.i18n.json', '');
      for (final locale in ['en', 'pt_BR']) {
        final file = File('${dir.path}/${name}_$locale.i18n.json');
        expect(file.existsSync(), isTrue, reason: '${file.path} missing');
        final expected = flatten(jsonDecode(base.readAsStringSync()) as Map<String, dynamic>);
        final actual = flatten(jsonDecode(file.readAsStringSync()) as Map<String, dynamic>);
        expect(actual.keys.toSet(), expected.keys.toSet(), reason: '$name $locale key parity');
        for (final key in expected.keys) {
          expect(vars(actual[key]), vars(expected[key]), reason: '$name $locale $key interpolators');
        }
      }
    }
  });
}
