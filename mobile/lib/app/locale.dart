import 'package:intl/find_locale.dart';
import 'package:intl/intl.dart';
import 'package:moodiary_i18n/moodiary_i18n.dart';
import 'package:moodiary_preferences/moodiary_preferences.dart';
import 'package:moodiary_storage/moodiary_storage.dart';

Future<void> applyStoredLanguage() async {
  final stored = MoodiaryKVs.language.get() ?? Language.system.languageCode;
  var language = Language.values.firstWhere(
    (e) => e.languageCode == stored,
    orElse: () => Language.system,
  );
  if (language == .system) {
    final systemLocale = await findSystemLocale();
    final systemLanguageCode = systemLocale.replaceAll('_', '-');
    language = Language.values.firstWhere(
      (e) => e.languageCode == systemLanguageCode,
      orElse: () => systemLanguageCode.startsWith('pt')
          ? Language.brazilianPortuguese
          : Language.english,
    );
  }
  Intl.defaultLocale = language.languageCode;
  await LocaleSettings.setLocale(switch (language) {
    .chinese => AppLocale.zh,
    .brazilianPortuguese => AppLocale.ptBr,
    .english || .system => AppLocale.en,
  });
}
