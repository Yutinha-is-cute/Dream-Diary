library;

import 'i18n/strings.g.dart';

export 'i18n/strings.g.dart';

Future<void> setupPluralResolvers() async {
  await LocaleSettings.setPluralResolver(
    language: 'zh',
    cardinalResolver: (n, {zero, one, two, few, many, other}) => switch (n) {
      0 => zero ?? other ?? '$n',
      1 => one ?? other ?? '$n',
      _ => other ?? '$n',
    },
    ordinalResolver: (n, {zero, one, two, few, many, other}) => other ?? '$n',
  );
  await LocaleSettings.setPluralResolver(
    language: 'pt',
    cardinalResolver: (n, {zero, one, two, few, many, other}) => switch (n) {
      1 => one ?? other ?? '$n',
      _ => other ?? '$n',
    },
    ordinalResolver: (n, {zero, one, two, few, many, other}) => other ?? '$n',
  );
}
