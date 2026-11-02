///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class MuiLocalizationsDataPtBr extends MuiLocalizationsData with BaseTranslations<MuiLocale, MuiLocalizationsData> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [MuiLocale.build] is preferred.
	MuiLocalizationsDataPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<MuiLocale, MuiLocalizationsData>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: MuiLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	final TranslationMetadata<MuiLocale, MuiLocalizationsData> _meta;
	@override TranslationMetadata<MuiLocale, MuiLocalizationsData> get $meta => _meta;

	late final MuiLocalizationsDataPtBr _root = this; // ignore: unused_field

	@override 
	MuiLocalizationsDataPtBr $copyWith({TranslationMetadata<MuiLocale, MuiLocalizationsData>? meta}) => MuiLocalizationsDataPtBr(meta: meta ?? this.$meta);

	// Translations
	@override String get ok => 'OK';
	@override String get cancel => 'Cancelar';
	@override String get back => 'Voltar';
	@override String get colorPickerTitle => 'Escolher uma cor';
	@override String get toastLoading => 'Carregando';
	@override String get toastSuccess => 'Sucesso';
	@override String get toastError => 'Erro';
	@override String get configured => 'Configurado';
	@override String get notConfigured => 'Não configurado';
	@override String get input => 'Inserir';
	@override String get save => 'Salvar';
	@override String get moveUp => 'Mover para cima';
	@override String get moveDown => 'Mover para baixo';
}
