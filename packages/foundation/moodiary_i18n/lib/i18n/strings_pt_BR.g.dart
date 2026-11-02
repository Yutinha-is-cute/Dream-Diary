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
class TranslationsPtBr extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPtBr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ptBr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver);

	/// Metadata for the translations of <pt-BR>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	late final TranslationsPtBr _root = this; // ignore: unused_field

	@override 
	TranslationsPtBr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPtBr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$app$pt_BR app = _Translations$app$pt_BR._(_root);
	@override late final _Translations$assistant$pt_BR assistant = _Translations$assistant$pt_BR._(_root);
	@override late final _Translations$common$pt_BR common = _Translations$common$pt_BR._(_root);
	@override late final _Translations$diary$pt_BR diary = _Translations$diary$pt_BR._(_root);
	@override late final _Translations$dream$pt_BR dream = _Translations$dream$pt_BR._(_root);
	@override late final _Translations$editor$pt_BR editor = _Translations$editor$pt_BR._(_root);
	@override late final _Translations$export$pt_BR export = _Translations$export$pt_BR._(_root);
	@override late final _Translations$insights$pt_BR insights = _Translations$insights$pt_BR._(_root);
	@override late final _Translations$lock$pt_BR lock = _Translations$lock$pt_BR._(_root);
	@override late final _Translations$media$pt_BR media = _Translations$media$pt_BR._(_root);
	@override late final _Translations$picker$pt_BR picker = _Translations$picker$pt_BR._(_root);
	@override late final _Translations$share$pt_BR share = _Translations$share$pt_BR._(_root);
	@override late final _Translations$storage$pt_BR storage = _Translations$storage$pt_BR._(_root);
	@override late final _Translations$sync$pt_BR sync = _Translations$sync$pt_BR._(_root);
	@override late final _Translations$ui$pt_BR ui = _Translations$ui$pt_BR._(_root);
}

// Path: app
class _Translations$app$pt_BR extends Translations$app$zh {
	_Translations$app$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get moodColors => 'Cores do humor';
	@override String get moodPaletteClassic => 'Clássica';
	@override String get moodPaletteDefault => 'Padrão';
	@override String get moodPaletteBlueOrange => 'Azul e laranja';
	@override String get moodPaletteColorblind => 'Acessível para daltonismo';
	@override String get accentTitle => 'Cor de destaque';
	@override String get accentNeutral => 'Padrão';
	@override String get accentSystem => 'Do papel de parede';
	@override String get accentCustomTitle => 'Cor personalizada';
	@override String get accentGroupAccent => 'Destaque';
	@override String get accentGroupSurface => 'Superfície';
	@override String get accentGroupSemantic => 'Semântica';
	@override String get accentSeed => 'Escolhida';
	@override String get language => 'Idioma';
	@override String get homeNavigatorDiary => 'Diário';
	@override String get homeNavigatorAssistant => 'Assistente';
	@override String get homePageAddDiaryButton => 'Criar entrada';
	@override String get categoryDeletedReset => 'Categoria excluída; mostrando todas as entradas';
	@override String get homeNavigatorSetting => 'Configurações';
	@override String get languageSystem => 'Seguir o sistema';
	@override String get languageSimplifiedChinese => '简体中文';
	@override String get languageEnglish => 'English';
	@override String get settingsTitle => 'Configurações';
	@override String get sectionData => 'Dados';
	@override String get recycle => 'Lixeira';
	@override String get syncBackup => 'Sincronização e backup';
	@override String get categoryManager => 'Categorias';
	@override String get placeManager => 'Lugares';
	@override String get mapTitle => 'Por onde passei';
	@override String get sectionDisplay => 'Aparência';
	@override String get diarySettings => 'Preferências de escrita';
	@override String get themeMode => 'Tema';
	@override String get fontStyle => 'Fonte';
	@override String get sectionPrivacy => 'Privacidade';
	@override String get backgroundPrivacy => 'Ocultar conteúdo ao alternar aplicativos';
	@override String get backgroundPrivacySubtitle => 'Desfocar a tela quando o aplicativo ficar em segundo plano';
	@override String get sectionMore => 'Mais';
	@override String get about => 'Sobre';
	@override String get services => 'Serviços de terceiros';
	@override String get themeModeSystem => 'Seguir o sistema';
	@override String get themeModeLight => 'Claro';
	@override String get themeModeDark => 'Escuro';
	@override String homeSelected({required Object count}) => '${count} selecionadas';
	@override String get homeDeleteTitle => 'Excluir as entradas selecionadas?';
	@override String homeDeleteMessage({required Object count}) => '${count} entradas serão movidas para a lixeira, onde poderão ser restauradas.';
	@override String get homeNothingToDelete => 'Nada para excluir';
	@override String homeMovedToRecycle({required Object count}) => '${count} entradas movidas para a lixeira';
	@override String get aboutCheckUpdate => 'Verificar atualizações';
	@override String get aboutUpToDate => 'Você está usando a versão mais recente';
	@override String aboutUpdateAvailable({required Object version}) => 'A versão ${version} está disponível';
	@override String get aboutUpdateDownload => 'Baixar';
	@override String get aboutUpdateFailed => 'Não foi possível verificar atualizações. Tente mais tarde';
	@override String get aboutSource => 'Código-fonte';
	@override String get aboutLicenses => 'Licenças de código aberto';
	@override String get aboutFeedback => 'Feedback e ajuda';
	@override String get fontTitle => 'Fontes';
	@override String get fontImportSubtitle => 'Importe uma fonte TTF ou OTF; toque e segure para remover';
	@override String get fontPreview => 'Prévia';
	@override String get fontPreviewSubtitle => 'O tamanho do texto segue o ajuste do sistema; o aplicativo não tem mais um ajuste próprio';
	@override String get fontSystem => 'Sistema';
	@override String get fontDeleteTitle => 'Remover esta fonte';
	@override String fontDeleteMessage({required Object name}) => 'Remover a fonte “${name}”?';
	@override String get fontVariable => 'Variável';
	@override String get fontAdd => 'Adicionar';
	@override String get fontPreviewTitle => 'Frases de teste';
	@override String get fontPreviewText => 'Um pequeno jabuti xereta viu dez cegonhas felizes.';
	@override String get diaryPrefsEditor => 'Editor';
	@override String get firstLineIndent => 'Recuar a primeira linha';
	@override String get showWritingTime => 'Mostrar tempo de escrita';
	@override String get showWordCount => 'Mostrar contagem de palavras';
	@override String get diaryPrefsWeather => 'Clima e localização';
	@override String get autoWeather => 'Registrar o clima';
	@override String get autoWeatherSubtitle => 'Consultado no QWeather ao iniciar uma entrada';
	@override String get autoPosition => 'Registrar a localização';
	@override String get autoPositionSubtitle => 'Cidade consultada no QWeather ao iniciar uma entrada';
	@override String get autoNearestPlace => 'Usar lugares salvos próximos';
	@override String get autoNearestPlaceSubtitle => 'Ao escrever perto de um lugar salvo, usá-lo em vez da cidade';
	@override String get qweatherRequired => 'Configure o QWeather primeiro';
	@override String get servicesIntro => 'Adicione suas credenciais de terceiros para ativar o assistente de IA, o clima e os mapas. As credenciais ficam somente neste dispositivo.';
	@override String get servicesAssistant => 'Assistente de IA';
	@override String get servicesModelDownload => 'Download de modelos';
	@override String get servicesHfEndpoint => 'Endpoint do Hugging Face';
	@override String get servicesHfOfficial => 'Oficial';
	@override String get servicesHfCustomAddress => 'Endereço personalizado';
	@override String get servicesHfCustomHint => 'Informe um site compatível com Hugging Face';
	@override String get servicesHfEndpointHelp => 'Informe apenas a URL base. Os caminhos dos modelos são adicionados automaticamente.';
	@override String get servicesModelDownloadFailed => 'Falha no download. Tente alterar o endpoint em “Download de modelos”.';
	@override String get servicesQweather => 'QWeather';
	@override String get servicesQweatherHostHint => 'devapi.qweather.com ou seu próprio servidor';
	@override String get servicesMap => 'Mapa';
	@override String get servicesSaved => 'Salvo';
	@override String get servicesSaveFailed => 'Não foi possível salvar. Tente novamente';
	@override String get semanticTitle => 'Busca semântica';
	@override String get semanticModelTitle => 'Modelo de embeddings';
	@override String get semanticStateOff => 'Desativada';
	@override String semanticDownloading({required Object percent}) => 'Baixando ${percent}%';
	@override String get semanticVerifying => 'Verificando modelo…';
	@override String get semanticEnableTitle => 'Ativar busca semântica';
	@override String get semanticEnableConfirm => 'Baixar e ativar';
	@override String get semanticEnabled => 'Ativada — criando índice em segundo plano';
	@override String get semanticEnableFailed => 'Falha ao ativar';
	@override String get semanticDisableTitle => 'Desativar busca semântica';
	@override String get semanticDisableMessage => 'Desativar apaga o índice semântico. Os modelos baixados são mantidos e podem ser reativados a qualquer momento.';
	@override String get semanticDisableConfirm => 'Desativar';
	@override String get semanticRebuildTitle => 'Recriar índice semântico';
	@override String get semanticRebuildSubtitle => 'Use quando o índice parecer incorreto ou desatualizado';
	@override String semanticRebuildDone({required Object count}) => '${count} entradas reindexadas';
	@override String get semanticPickTitle => 'Escolher modelo de embeddings';
	@override String semanticActivateDownloadMessage({required Object size}) => 'Baixa um modelo de ${size} e recria o índice semântico. Toda a inferência e indexação acontece neste dispositivo; seus diários nunca são enviados.';
	@override String get semanticActivateLocalMessage => 'Ativar recriará o índice semântico.';
	@override String get semanticDeleteTitle => 'Excluir arquivo do modelo';
	@override String get semanticDeleteMessage => 'Exclui o modelo baixado. Você poderá baixá-lo novamente depois.';
	@override String get semanticDeleteConfirm => 'Excluir';
	@override String get semanticDescQwen3 => 'Multilíngue, encontra nuances nas frases';
	@override String get dashJournalDays => 'Dias escrevendo';
	@override String get dashWordCount => 'Palavras';
	@override String get dashCategoryCount => 'Categorias';
	@override String get dashTagCount => 'Tags';
	@override String get homeNavigatorMe => 'Eu';
	@override String get meTitle => 'Eu';
	@override String get meYearLabel => 'Último ano';
	@override String meThisMonth({required Object count}) => '${count} neste mês';
	@override String meStreak({required Object count}) => 'Sequência de ${count} dias';
	@override String get meHeatmapHint => 'Toque em um quadrado para ver o dia';
	@override String get meHeatmapEmpty => 'Escreva sua primeira entrada para acender um quadrado';
	@override String get meHeatmapSemantics => 'Mapa de atividade de escrita';
	@override String get meDayNothing => 'Nada escrito';
	@override String get meLegendLess => 'Menos';
	@override String get meLegendMore => 'Mais';
	@override String get meSectionRecall => 'Relembrar';
	@override String get meSectionManage => 'Gerenciar';
	@override String get meCalendar => 'Calendário';
	@override String get sectionFeature => 'Recursos';
	@override String get assistantEntry => 'Assistente de IA';
	@override String get stressTitle => 'Dados de teste de desempenho (depuração)';
	@override String get stressSubtitle => 'Gerar ou remover entradas aleatórias interligadas para testar o grafo';
	@override String get stressDialogTitle => 'Dados de teste de desempenho';
	@override String stressDialogMessage({required Object min, required Object max, required Object prefix}) => 'Para testar os limites do grafo e recursos relacionados. Cada entrada referencia de ${min} a ${max} outras e começa com “${prefix}”, permitindo remover todas de uma vez.';
	@override String get stressClear => 'Remover';
	@override String get stressGenerate => 'Gerar';
	@override String get stressCountTitle => 'Quantidade';
	@override String stressCountRange({required Object min, required Object max}) => 'Escolha um número entre ${min} e ${max}';
	@override String get stressGenerating => 'Gerando';
	@override String get stressGenerateFailed => 'Não foi possível gerar';
	@override String stressGenerated({required Object count}) => '${count} entradas interligadas geradas';
	@override String get stressEmpty => 'Nenhuma entrada de teste';
	@override String get stressClearing => 'Removendo';
	@override String get stressClearFailed => 'Não foi possível remover';
	@override String stressCleared({required Object count}) => '${count} entradas de teste removidas';
	@override String get repairTitle => 'Reparar dados';
	@override String get repairSubtitle => 'Verificar e reparar dados derivados das entradas';
	@override String get repairMessage => 'Verifica todas as entradas para recriar prévias e referências de mídia, remover categorias órfãs e reconstruir o índice de busca. Seu texto nunca é modificado.';
	@override String get repairStart => 'Iniciar';
	@override String get repairRunning => 'Reparando…';
	@override String get repairFailed => 'Falha no reparo';
	@override String repairScanned({required Object count}) => '${count} entradas verificadas.';
	@override String get repairAllGood => 'Tudo certo — nada para reparar.';
	@override String repairFixed({required Object count}) => '${count} entradas reparadas:';
	@override String repairFixedPreview({required Object count}) => '· prévia do cartão: ${count}';
	@override String repairFixedMedia({required Object count}) => '· referências de mídia: ${count}';
	@override String repairFixedOrphan({required Object count}) => '· categorias órfãs: ${count}';
	@override String repairReindexed({required Object count}) => 'Índice de busca recriado (${count} entradas).';
	@override String get repairDoneTitle => 'Reparo concluído';
	@override String get repairOk => 'Entendi';
	@override String get imageOptimizeTitle => 'Otimizar imagens';
	@override String get imageOptimizeSubtitle => 'Converter fotos HEIC antigas e criar miniaturas ausentes';
	@override String get imageOptimizeMessage => 'Fotos HEIC serão convertidas para JPG (o arquivo original será removido e as referências atualizadas), e miniaturas serão criadas para todas as imagens. Pode levar alguns minutos; mantenha o aplicativo aberto.';
	@override String get imageOptimizeStart => 'Iniciar';
	@override String get imageOptimizeRunning => 'Processando imagens';
	@override String get imageOptimizeDoneTitle => 'Concluído';
	@override String imageOptimizeScanned({required Object count}) => '${count} imagens verificadas.';
	@override String imageOptimizeConverted({required Object count}) => '${count} fotos HEIC convertidas para JPG.';
	@override String imageOptimizeConvertFailed({required Object count}) => '${count} não puderam ser convertidas (danificadas ou ilegíveis) e foram mantidas.';
	@override String get imageOptimizeThumbs => 'As miniaturas estão prontas.';
	@override String get imageOptimizeFailed => 'Falha na otimização de imagens';
	@override String get imageOptimizeOk => 'OK';
	@override String get fontNameFailed => 'Não foi possível ler o nome da fonte';
	@override String get fontExists => 'Esta fonte já está instalada';
	@override String get routeErrorTitle => 'Página não encontrada';
	@override String get routeErrorBackHome => 'Voltar ao início';
	@override String get languageBrazilianPortuguese => 'Português (Brasil)';
}

// Path: assistant
class _Translations$assistant$pt_BR extends Translations$assistant$zh {
	_Translations$assistant$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get settingFunctionAIAssistant => 'Assistente de IA';
	@override String get diaryEdit => 'Editar';
	@override String get inputHint => 'Diga alguma coisa...';
	@override String get scrollToBottom => 'Ir para o final';
	@override String get send => 'Enviar';
	@override String get notConfiguredBanner => 'Nenhum provedor de modelos configurado. Toque para configurar.';
	@override String get needProvider => 'Adicione e selecione um provedor disponível em Provedores de modelos primeiro.';
	@override String get needApiKey => 'Configure a chave de API em Provedores de modelos primeiro.';
	@override String get settingTitle => 'Configurações do assistente de IA';
	@override String modelSwitched({required Object model}) => 'Alterado para ${model}';
	@override String get providerEntryLoading => 'Carregando…';
	@override String get providerEntryEmpty => 'Nenhum provedor ainda; toque para adicionar';
	@override String get copied => 'Copiado';
	@override String get copyTooltip => 'Copiar';
	@override String get newChat => 'Nova conversa';
	@override String get menuCompactNow => 'Compactar histórico';
	@override String get menuSettings => 'Configurações do assistente';
	@override String get compactedNow => 'Mensagens anteriores compactadas';
	@override String get compactNothing => 'Nada para compactar';
	@override String get compactFailed => 'Falha na compactação. Tente mais tarde';
	@override String providerKeyMissingBanner({required Object name}) => '“${name}” não tem chave de API. Toque para adicionar';
	@override String providerMissingBanner({required Object name}) => 'O provedor original foi excluído; respondendo com “${name}”. Toque para escolher outro';
	@override String get modelSwitchTitle => 'Trocar modelo';
	@override String modelSwitchNoImages({required Object count}) => 'Este modelo não lê imagens; ${count} imagens do histórico serão ignoradas.';
	@override String get modelSwitchDropPending => 'A imagem selecionada será removida.';
	@override String get modelSwitchSmallerContext => 'Este modelo tem menos contexto; o histórico será compactado antes do envio.';
	@override String get modelSwitchConfirm => 'Trocar mesmo assim';
	@override String get historyEmpty => 'Nenhuma conversa ainda';
	@override String get historyToday => 'Hoje';
	@override String get historyLast7 => 'Últimos 7 dias';
	@override String get historyEarlier => 'Anteriores';
	@override String get historyModelUnset => 'Não definido';
	@override String get stop => 'Parar geração';
	@override String get regenerate => 'Gerar novamente';
	@override String get thinking => 'Pensando…';
	@override String get protocolTitle => 'Protocolo';
	@override String get protocolOpenAiCompletions => 'OpenAI /chat/completions';
	@override String get protocolOpenAiResponses => 'OpenAI /responses';
	@override String get protocolAnthropicMessages => 'Anthropic /messages';
	@override String get modelListFetch => 'Buscar modelos no endpoint';
	@override String get modelListNeedKey => 'Informe uma chave de API primeiro';
	@override String get modelListManualHint => 'Você pode inserir o ID de um modelo manualmente';
	@override String modelListFetched({required Object count}) => '${count} modelos encontrados';
	@override String get netTimeout => 'Tempo de conexão esgotado';
	@override String get netUnreachable => 'Sem rede — verifique sua conexão';
	@override String netStatus({required Object code}) => 'O servidor retornou ${code}';
	@override String get netDecode => 'Não foi possível ler a resposta';
	@override String get netUnknown => 'Falha na solicitação';
	@override String get reasoningOff => 'Sem raciocínio';
	@override String get reasoningLevelMinimal => 'Mínimo';
	@override String get reasoningLevelLow => 'Baixo';
	@override String get reasoningLevelMedium => 'Médio';
	@override String get reasoningLevelHigh => 'Alto';
	@override String get reasoningLevelMax => 'Máximo';
	@override String thoughtFor({required Object duration}) => 'Pensou por ${duration} s';
	@override String get tool => 'Ferramentas';
	@override String get toolSectionNote => 'As ferramentas seguem o modo de permissão: leituras são imediatas; gravações pedem confirmação conforme o modo. Excluir uma entrada a move para a lixeira; excluir um fato salvo é permanente.';
	@override String get personalSectionTitle => 'Personalização';
	@override String get notesTitle => 'Notas para o assistente';
	@override String get notesEmpty => 'Não definido';
	@override String get notesLede => 'Notas lidas em todas as conversas: como chamar você, preferências e assuntos a evitar.';
	@override String get notesFieldLabel => 'Notas';
	@override String get notesSaved => 'Salvo';
	@override String get memoryTitle => 'Memória do assistente';
	@override String get memoryTileSubtitle => 'Quando ativada, o assistente guarda o que você contar somente neste dispositivo';
	@override String get memoryLede => 'O que o assistente salvou sobre você. Fica apenas neste dispositivo e nunca é incluído em sincronizações ou exportações.';
	@override String get memorySearchHint => 'Pesquisar memórias';
	@override String memoryMeta({required Object date, required Object source}) => '${date} · ${source}';
	@override String get memorySourceSaid => 'você contou';
	@override String get memorySourceAsked => 'você pediu para lembrar';
	@override String get memoryKindPreference => 'Preferência';
	@override String get memoryKindTheme => 'Tema';
	@override String get memoryKindGoal => 'Meta';
	@override String get memoryKindFact => 'Fato';
	@override String get memoryDeleteTitle => 'Excluir esta memória?';
	@override String memoryDeleteMessage({required Object text}) => '“${text}” será excluída permanentemente e o assistente não se lembrará mais dela.';
	@override String get memoryClearTitle => 'Apagar todas as memórias?';
	@override String get memoryClearMessage => 'Tudo o que o assistente salvou será excluído permanentemente. Esta ação não pode ser desfeita.';
	@override String get memoryClearConfirm => 'Apagar tudo';
	@override String get memoryEdit => 'Editar';
	@override String get memoryEditTitle => 'Editar memória';
	@override String get memoryFieldText => 'Texto';
	@override String get memoryFieldKind => 'Tipo';
	@override String get memoryEmpty => 'Nada salvo ainda';
	@override String get memoryEmptyDes => 'Diga “lembre-se de que…” em uma conversa ou conte um hábito ao assistente para ele salvar.';
	@override String get memoryNoMatch => 'Nenhuma memória encontrada';
	@override String get toolSearchTitle => 'Pesquisar entradas';
	@override String get toolSearchDes => 'Encontre entradas locais por palavra-chave ou significado, ou navegue por data e categoria. A busca por significado exige o índice semântico local ativado.';
	@override String get toolGetTitle => 'Ler entrada completa';
	@override String get toolGetDes => 'Lê o texto completo de várias entradas pelo ID.';
	@override String get toolOverviewTitle => 'Resumo do diário';
	@override String get toolOverviewDes => 'Conta suas entradas no total e por categoria, e mostra o período registrado.';
	@override String get toolCreateTitle => 'Criar entrada';
	@override String get toolCreateDes => 'Salva o conteúdo como uma nova entrada local quando você pedir.';
	@override String get toolUpdateTitle => 'Editar entrada';
	@override String get toolUpdateDes => 'Altera título, texto, humor ou categoria de várias entradas.';
	@override String get toolDeleteTitle => 'Excluir entrada';
	@override String get toolDeleteDes => 'Move entradas para a lixeira, onde podem ser restauradas.';
	@override String get toolListCategoriesTitle => 'Ver categorias';
	@override String get toolListCategoriesDes => 'Lista todas as categorias do diário.';
	@override String get toolCreateCategoryTitle => 'Criar categoria';
	@override String get toolCreateCategoryDes => 'Adiciona categorias ao diário.';
	@override String get toolUpdateCategoryTitle => 'Renomear categoria';
	@override String get toolUpdateCategoryDes => 'Renomeia categorias.';
	@override String get toolDeleteCategoryTitle => 'Excluir categoria';
	@override String get toolDeleteCategoryDes => 'Exclui categorias somente quando não contêm entradas.';
	@override String get toolRecallMemoryTitle => 'Consultar memória';
	@override String get toolRecallMemoryDes => 'Consulta fatos duradouros salvos sobre você quando necessário.';
	@override String get toolRememberTitle => 'Lembrar um fato';
	@override String get toolRememberDes => 'Salva preferências duradouras, temas recorrentes e metas para lembrar em conversas futuras.';
	@override String get toolForgetTitle => 'Esquecer uma memória';
	@override String get toolForgetDes => 'Exclui memórias salvas.';
	@override String get toolJsTitle => 'Executar script';
	@override String get toolJsDes => 'Executa um pequeno código JavaScript isolado para cálculos. Sem rede nem acesso às entradas.';
	@override String get toolJsEmpty => 'Nenhum valor retornado';
	@override String get compactionNotice => 'Mensagens anteriores resumidas para economizar contexto';
	@override String get compactionSheetTitle => 'Resumo do contexto';
	@override String get compactionSheetNote => 'Para economizar contexto, mensagens anteriores são reunidas no resumo abaixo antes do envio ao modelo. As mensagens completas continuam nesta conversa e podem ser consultadas.';
	@override String get compactionRestore => 'Enviar histórico completo novamente';
	@override String get disclaimerTitle => 'Antes de começar';
	@override String get disclaimerContent => 'O assistente do Dream Diary usa modelos de linguagem de terceiros. Esteja ciente:';
	@override String get disclaimerAgree => 'Aceitar e continuar';
	@override String get disclaimerDecline => 'Agora não';
	@override String get disclaimerGateTitle => 'Aceite o aviso para usar o assistente';
	@override String get disclaimerGateAction => 'Ver aviso';
	@override String get toolSendImage => 'Enviar uma imagem';
	@override String get imageMessageLabel => '[Imagem]';
	@override String get citationRead => 'Ver entradas';
	@override String get citationCreated => 'Criar entrada';
	@override String get citationUpdated => 'Editar entrada';
	@override String get citationDeleted => 'Excluir entrada';
	@override String citationCount({required Object count}) => '${count}';
	@override String get emptyGreetingMorning => 'Bom dia';
	@override String get emptyGreetingAfternoon => 'Boa tarde';
	@override String get emptyGreetingEvening => 'Boa noite';
	@override String get emptySubtitle => 'O que você quer registrar?';
	@override String get modelProviderTitle => 'Provedores de modelos';
	@override String get modelProviderAdd => 'Adicionar';
	@override String get modelProviderNoKey => 'Sem chave';
	@override String get modelProviderEmptyTitle => 'Nenhum provedor de modelos ainda';
	@override String get modelProviderEmptyHint => 'Toque em Adicionar no canto inferior direito para criar um';
	@override String get modelProviderDeleteTitle => 'Excluir provedor';
	@override String modelProviderDeleteContent({required Object name}) => 'Excluir “${name}”? A chave de API também será removida.';
	@override String modelProviderDeleteAffects({required Object count}) => '${count} conversas o utilizam; depois usarão o provedor padrão.';
	@override String get modelProviderDeleted => 'Excluído';
	@override String get modelProviderEditNew => 'Adicionar provedor';
	@override String get modelProviderEditEdit => 'Editar provedor';
	@override String get modelProviderNameHint => 'ex.: DeepSeek / Ollama local';
	@override String get modelProviderBaseUrl => 'URL base';
	@override String get modelProviderBaseUrlHint => 'Deixe vazio para usar o endpoint oficial';
	@override String get modelProviderApiKey => 'Chave de API';
	@override String get modelProviderApiKeyHintSet => 'Configurada; deixe vazio para manter';
	@override String get modelProviderApiKeyHintUnset => 'Cole a chave de API';
	@override String get modelProviderModel => 'Modelo';
	@override String get modelProviderNeedName => 'Informe um nome';
	@override String get modelProviderNeedModel => 'Informe um modelo';
	@override String get modelProviderSaved => 'Salvo';
	@override String get modelProviderGetApiKey => 'Obter chave de API';
	@override String get llmPickerTitle => 'Escolher provedor';
	@override String get llmPickerCustomDes => 'Configurar um provedor manualmente';
	@override String get llmPickerRefresh => 'Atualizar';
	@override String get llmPickerRefreshed => 'Atualizado';
	@override String get llmPickerLoadFailed => 'Falha ao carregar';
	@override String llmPickerModelCount({required Object count}) => '${count} modelos';
	@override String llmPickerUpdatedAt({required Object time}) => 'Atualizado ${time}';
	@override String get llmPickerEmpty => 'Nenhum provedor predefinido disponível';
	@override String get llmPickerDataSource => 'Dados de models.dev';
	@override String get llmPickerSearchHint => 'Pesquisar provedores';
	@override String get modelProviderPickModel => 'Escolher modelo';
	@override String get modelProviderBadgeReasoning => 'Raciocínio';
	@override String get modelProviderBadgeVision => 'Visão';
	@override String get modelProviderCapabilities => 'Capacidades do modelo';
	@override String get modelProviderCapabilitiesHint => 'Ative o que este modelo oferece — controla ferramentas, raciocínio e envio de imagens.';
	@override String get modelProviderSearchModelHint => 'Pesquisar modelos';
	@override String get modelProviderNoModelMatch => 'Nenhum modelo encontrado';
	@override String get modelProviderFillKey => 'Adicionar chave';
	@override String get modelProviderManage => 'Gerenciar provedores';
	@override String get modelCatalogMissing => 'Nenhum catálogo de modelos ainda';
	@override String get modelCatalogDownload => 'Baixar catálogo de modelos';
	@override String modelCatalogUpdatedAt({required Object time}) => 'Catálogo atualizado ${time}';
	@override String get modelNotInCatalog => 'Fora do catálogo';
	@override String get summaryLoading => 'Carregando…';
	@override String get summaryNoProvider => 'Nenhum provedor de modelos configurado';
	@override String get summaryKeySet => 'Chave configurada';
	@override String get summaryKeyUnset => 'Sem chave';
	@override String get summaryTitle => 'Configuração do assistente de IA';
	@override String streamError({required Object error}) => '\n(erro: ${error})';
	@override String requestFailed({required Object error}) => '(falha na solicitação: ${error})';
	@override String get modelProviderDefault => 'Padrão';
	@override String get modelProviderDefaultModel => 'Modelo padrão';
	@override String modelListCount({required Object count}) => '${count} modelos';
	@override String get modelListUpdate => 'Atualizar lista';
	@override String get modelListAdd => 'Adicionar manualmente';
	@override String get modelListEmpty => 'Nenhum modelo disponível ainda';
	@override String get modelDeprecated => 'Descontinuado';
	@override String get composerFullscreen => 'Editor em tela cheia';
	@override String get toolArgs => 'Argumentos';
	@override String get toolResult => 'Resultado';
	@override String get permissionTitle => 'Permissões';
	@override String get permissionConfirm => 'Perguntar antes de alterar';
	@override String get permissionConfirmDes => 'Pergunta antes de criar, editar ou excluir';
	@override String get permissionAuto => 'Edição automática';
	@override String get permissionAutoDes => 'Pergunta apenas antes de sobrescrever texto ou excluir permanentemente';
	@override String get permissionFull => 'Acesso total';
	@override String get permissionFullDes => 'Executa tudo sem perguntar';
	@override String get permissionSessionOnly => 'Somente nesta conversa';
	@override String get approvalSkip => 'Pular';
	@override String get approvalOrReply => 'ou apenas responda';
	@override String get approvalConfirmCreate => 'Criar';
	@override String get approvalConfirmUpdate => 'Aplicar';
	@override String approvalConfirmUpdateCount({required Object count}) => 'Aplicar a ${count}';
	@override String get approvalOverwrite => 'Sobrescrever texto';
	@override String get approvalConfirmTrash => 'Mover para a lixeira';
	@override String get approvalConfirmDelete => 'Excluir';
	@override String get approvalConfirmRemember => 'Lembrar';
	@override String get approvalFieldTitle => 'Título';
	@override String get approvalFieldCategory => 'Categoria';
	@override String get approvalFieldContent => 'Texto';
	@override String get approvalFieldName => 'Nome';
	@override String get approvalNoCategory => 'Sem categoria';
	@override String approvalContentNew({required Object count}) => 'cerca de ${count} caracteres';
	@override String approvalContentRewrite({required Object from, required Object to}) => 'Reescrita completa, cerca de ${from} → ${to} caracteres';
	@override String get approvalOverwriteWarning => 'Sobrescreve o texto atual; não há histórico de versões para restaurar';
	@override String get approvalIrreversible => 'Não pode ser desfeito';
	@override String approvalDiaryCount({required Object count}) => '${count} entradas';
	@override String approvalItemCount({required Object count}) => '${count} itens';
	@override String approvalCategoryTo({required Object name}) => 'categoria → ${name}';
	@override String approvalMore({required Object count}) => 'mais ${count}';
	@override String get toolAwaitingConfirm => 'Aguardando você';
	@override String get toolSkipped => 'Ignorado';
	@override String get truncatedNotice => 'A resposta foi interrompida';
	@override String get continueTurn => 'Continuar';
	@override String get errorMaxTurns => 'Limite de etapas de ferramentas atingido — tente uma pergunta mais específica';
	@override String get errorUnknownTool => 'O modelo chamou uma ferramenta inexistente';
	@override String get errorCancelled => 'Interrompido';
	@override String get toolDone => 'Concluído';
	@override String get toolFailed => 'Falhou';
	@override String get toolNoMatch => 'Nenhum resultado';
	@override String toolMatched({required Object count}) => '${count} entradas';
	@override String toolRead({required Object count}) => '${count} completas';
	@override String toolListed({required Object count}) => '${count} itens';
	@override String get toolUntitled => 'Sem título';
	@override String get toolUpdated => 'Atualizado';
	@override String get toolTrashed => 'Movido para a lixeira';
	@override String toolTrashedCount({required Object count}) => '${count} movidos para a lixeira';
	@override String toolBatchDiaries({required Object count}) => '${count} entradas';
	@override String toolBatchItems({required Object count}) => '${count} itens';
	@override String get toolDeleted => 'Excluído';
}

// Path: common
class _Translations$common$pt_BR extends Translations$common$zh {
	_Translations$common$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get ok => 'OK';
	@override String get weatherSunny => 'Ensolarado';
	@override String get weatherCloudy => 'Nublado';
	@override String get weatherOvercast => 'Encoberto';
	@override String get weatherShowerRain => 'Pancadas de chuva';
	@override String get weatherLightRain => 'Chuva fraca';
	@override String get weatherModerateRain => 'Chuva moderada';
	@override String get weatherHeavyRain => 'Chuva forte';
	@override String get weatherStorm => 'Tempestade';
	@override String get weatherThundershower => 'Chuva com trovoadas';
	@override String get weatherLightSnow => 'Neve fraca';
	@override String get weatherHeavySnow => 'Neve forte';
	@override String get weatherSleet => 'Chuva com neve';
	@override String get weatherFoggy => 'Neblina';
	@override String get weatherHaze => 'Névoa seca';
	@override String get weatherHot => 'Calor';
	@override String get weatherCold => 'Frio';
	@override String get cancel => 'Cancelar';
	@override String get more => 'Mais';
	@override String get custom => 'Personalizado';
	@override String get save => 'Salvar';
	@override String get media => 'Mídia';
	@override String get audio => 'Áudio';
	@override String get video => 'Vídeo';
	@override String get category => 'Categoria';
	@override String get name => 'Nome';
	@override String get delete => 'Excluir';
	@override String get loadFailed => 'Algo deu errado';
	@override String get untitled => 'Sem título';
	@override String get retry => 'Tentar novamente';
	@override String categoryCount({required Object count}) => '${count} categorias';
	@override String get fileName => 'Nome do arquivo';
	@override String get close => 'Fechar';
	@override String get appName => 'Dream Diary';
	@override String get configured => 'Configurado';
	@override String get notConfigured => 'Não configurado';
	@override String get copied => 'Copiado para a área de transferência';
	@override String get legacySceneStudy => 'Estudando';
	@override String get legacySceneWork => 'Trabalhando';
	@override String get legacySceneTravel => 'Viajando';
	@override String get legacySceneSports => 'Treinando';
	@override String get legacySceneFood => 'Comendo bem';
	@override String get legacySceneSlacking => 'Relaxando';
	@override String get moodAwful => 'Péssimo';
	@override String get moodBad => 'Mal';
	@override String get moodOkay => 'Normal';
	@override String get moodGood => 'Bem';
	@override String get moodGreat => 'Ótimo';
	@override String get moodUnset => 'Não registrado';
}

// Path: diary
class _Translations$diary$pt_BR extends Translations$diary$zh {
	_Translations$diary$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get tabViewEmpty => 'Nada por aqui ainda';
	@override String get pageViewModeButton => 'Modo de exibição';
	@override String get categoryNoCategory => 'Sem categoria';
	@override String get allCategories => 'Todas as categorias';
	@override String get categoryAll => 'Todas';
	@override String get categoryColorLabel => 'Cor';
	@override String get search => 'Pesquisar';
	@override String searchResult({required Object count}) => '${count} entradas no total';
	@override String searchTime({required Object ms}) => '${ms} ms';
	@override String get rangeAll => 'Todo o período';
	@override String get rangeLast30 => 'Últimos 30 dias';
	@override String get rangeThisYear => 'Este ano';
	@override String get searchSortRelevance => 'Relevância';
	@override String get searchSortNewest => 'Mais recentes';
	@override String get searchSortOldest => 'Mais antigas';
	@override String get searchNoResult => 'Nenhuma entrada encontrada';
	@override String get searchHistory => 'Histórico de pesquisa';
	@override String get searchHistoryClear => 'Limpar';
	@override String get searchHistoryEmpty => 'Nenhuma pesquisa ainda';
	@override String get viewModeTimeline => 'Linha do tempo';
	@override String get viewModeFeed => 'Feed';
	@override String get linkNotFound => 'Entrada não encontrada ou excluída';
	@override String get knowledgeGraph => 'Grafo de conhecimento';
	@override String graphCount({required Object nodes, required Object edges}) => '${nodes} notas · ${edges} vínculos';
	@override String get graphTimeLast365 => 'Últimos 12 meses';
	@override String get graphOpenDiary => 'Abrir entrada';
	@override String get graphStyle => 'Estilo do layout';
	@override String get graphStyleSparse => 'Disperso';
	@override String get graphStyleNormal => 'Padrão';
	@override String get graphStyleDense => 'Denso';
	@override String get graphView => 'Exibição';
	@override String get graphColorBy => 'Colorir por';
	@override String get graphColorByTime => 'Tempo';
	@override String get graphColorByPlain => 'Sem cor';
	@override String get graphShowLabels => 'Mostrar títulos';
	@override String get graphResetCamera => 'Ajustar à tela';
	@override String get graphEmptyTitle => 'Nenhum vínculo ainda';
	@override String get graphEmptyDesc => 'Digite [[ em uma entrada para referenciar outra; elas aparecerão aqui';
	@override String get graphEmptyAction => 'Escrever uma entrada';
	@override String get graphFilterEmpty => 'Nenhum vínculo corresponde aos filtros';
	@override String get graphClearFilter => 'Limpar filtros';
	@override String get graphLocal => 'Grafo local';
	@override String get graphOutgoing => 'Saída';
	@override String get graphIncoming => 'Entrada';
	@override String graphOutgoingCount({required Object count}) => '${count} de saída';
	@override String graphIncomingCount({required Object count}) => '${count} de entrada';
	@override String get graphSetAsCenter => 'Centralizar nesta entrada';
	@override String get graphBackToCenter => 'Recentralizar';
	@override String get graphLinks => 'Vínculos';
	@override String get graphNoLocalLinks => 'Esta entrada ainda não tem vínculos';
	@override String get categorySearchHint => 'Pesquisar categorias';
	@override String get categoryAllDiary => 'Todas as entradas';
	@override String get categoryNoMatch => 'Nenhuma categoria encontrada';
	@override String get categorySyncingPlaceholder => 'Sincronizando categoria…';
	@override String get categoryManageEntry => 'Gerenciar categorias';
	@override String get sortTitle => 'Ordenar';
	@override String get sortNewestFirst => 'Mais recentes primeiro';
	@override String get sortOldestFirst => 'Mais antigas primeiro';
	@override String get sortModifiedFirst => 'Editadas recentemente primeiro';
	@override String timelineMonthCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '1 entrada',
		other: '${count} entradas',
	);
	@override String get rangeLast7 => 'Últimos 7 dias';
	@override String get categoryManagerTitle => 'Categorias';
	@override String categoryCreated({required Object name}) => '“${name}” criada';
	@override String get categoryCreateFailed => 'Não foi possível criar';
	@override String categoryRenamed({required Object name}) => 'Renomeada para “${name}”';
	@override String get categoryRenameFailed => 'Não foi possível renomear';
	@override String get categoryDeleteTitle => 'Excluir esta categoria?';
	@override String categoryDeleteMessage({required Object name}) => '“${name}” não pode ser excluída enquanto houver entradas nela, inclusive na lixeira. As entradas serão mantidas.';
	@override String get categoryDeleted => 'Excluída';
	@override String get categoryDeleteBlocked => 'Ainda contém entradas (verifique a lixeira)';
	@override String get categoryEmpty => 'Nenhuma categoria ainda';
	@override String get categoryNew => 'Nova categoria';
	@override String categoryDiaryCount({required Object count}) => '${count} entradas';
	@override String get categoryNoDiary => 'Nenhuma entrada';
	@override String get rename => 'Renomear';
	@override String get categoryNameHint => 'Nome da categoria';
	@override String get categoryNameEmpty => 'O nome não pode ficar vazio';
	@override String get recycleTitle => 'Lixeira';
	@override String get recycleClear => 'Esvaziar lixeira';
	@override String get recycleRestored => 'Restaurada';
	@override String get recycleRestoreFailed => 'Não foi possível restaurar';
	@override String get recyclePurgeTitle => 'Excluir permanentemente?';
	@override String get recyclePurgeMessage => 'Esta ação não pode ser desfeita. A entrada será excluída permanentemente.';
	@override String get recyclePurgeConfirm => 'Excluir permanentemente';
	@override String get recyclePurged => 'Excluída permanentemente';
	@override String get recyclePurgeFailed => 'Não foi possível excluir';
	@override String get recycleClearTitle => 'Esvaziar a lixeira?';
	@override String recycleClearMessage({required Object count}) => '${count} entradas serão excluídas permanentemente. Esta ação não pode ser desfeita.';
	@override String get recycleClearConfirm => 'Esvaziar';
	@override String recycleCleared({required Object count}) => '${count} entradas excluídas';
	@override String get recycleEmpty => 'A lixeira está vazia';
	@override String get recycleRestore => 'Restaurar';
	@override String get managerTitle => 'Gerenciar entradas';
	@override String managerSelected({required Object count}) => '${count} selecionadas';
	@override String get managerBatchRecycle => 'Mover para a lixeira';
	@override String get managerEmpty => 'Nenhuma entrada corresponde a este filtro';
	@override String get managerRecycleTitle => 'Mover para a lixeira?';
	@override String managerRecycleMessage({required Object count}) => '${count} entradas serão movidas para a lixeira, onde poderão ser restauradas.';
	@override String get managerRecycleConfirm => 'Mover';
	@override String managerRecycled({required Object done, required Object total}) => '${done} de ${total} movidas para a lixeira';
	@override String get managerAll => 'Todas';
	@override String get mapTitle => 'Por onde passei';
	@override String get mapPlaces => 'Lugares';
	@override String get mapEmpty => 'Nenhum registro de localização ainda';
	@override String get mapExpand => 'Tela cheia';
	@override String get mapFitAll => 'Mostrar tudo';
	@override String get mapSource => 'Fonte do mapa';
	@override String get mapChooseSource => 'Escolher fonte do mapa';
	@override String get mapSourceTianditu => 'Tianditu';
	@override String get mapTiandituKey => 'Chave do Tianditu';
	@override String get mapTiandituNoKey => 'O Tianditu precisa de uma chave';
	@override String get mapLoadFailed => 'Falha ao carregar o mapa';
	@override String get addTag => 'Adicionar tag';
	@override String get tagNameHint => 'Nome da tag';
	@override String get add => 'Adicionar';
	@override String get weatherFailed => 'Não foi possível consultar o clima. Tente mais tarde';
	@override String weatherFetched({required Object weather}) => 'Clima: ${weather}';
	@override String get weatherAuto => 'Consultar automaticamente';
	@override String get weatherClear => 'Limpar clima';
	@override String get positionFailed => 'Não foi possível obter a localização. Tente mais tarde';
	@override String get qweatherNotConfigured => 'O QWeather ainda não foi configurado. Adicione sua chave em Configurações › Serviços de terceiros';
	@override String get positionPermissionDenied => 'A permissão de localização não foi concedida';
	@override String get positionPermissionForever => 'Localização negada — ative-a nas configurações do sistema';
	@override String get positionServiceOff => 'Os serviços de localização estão desativados';
	@override String get positionLocating => 'Localizando';
	@override String get positionAuto => 'Obter automaticamente';
	@override String get positionNewPlace => 'Novo lugar';
	@override String get positionManagePlaces => 'Gerenciar lugares';
	@override String get positionClear => 'Limpar localização';
	@override String get placeManagerTitle => 'Lugares';
	@override String get placeSearchHint => 'Pesquisar lugares';
	@override String get placeNoMatch => 'Nenhum lugar encontrado';
	@override String get placeEmpty => 'Nenhum lugar ainda';
	@override String get placeNew => 'Novo lugar';
	@override String get placeCreateTitle => 'Novo lugar';
	@override String get placeEditTitle => 'Editar lugar';
	@override String get placeNameLabel => 'Nome';
	@override String get placeNameEmpty => 'O nome não pode ficar vazio';
	@override String get placeRelocate => 'Atualizar para a localização atual';
	@override String get placeIconLabel => 'Ícone';
	@override String placeDistanceMeters({required Object meters}) => '${meters} m';
	@override String placeDistanceKilometers({required Object km}) => '${km} km';
	@override String placeDiaryCount({required Object count}) => '${count} entradas';
	@override String get placeNoDiary => 'Nenhuma entrada';
	@override String placeDeleteTitle({required Object name}) => 'Excluir “${name}”?';
	@override String placeDeleteMessage({required Object name}) => '“${name}” não pode ser excluído enquanto houver entradas que o utilizem, inclusive na lixeira. As entradas serão mantidas.';
	@override String get placeDeleteBlocked => 'Ainda usado por entradas (verifique a lixeira)';
	@override String placeCreated({required Object name}) => '“${name}” adicionado';
	@override String get placeSaved => 'Salvo';
	@override String get placeDeleted => 'Excluído';
	@override String get placeSaveFailed => 'Não foi possível salvar';
	@override String placeDistanceAway({required Object distance}) => 'A ${distance} de distância';
	@override String get home => 'Início';
	@override String get goBack => 'Voltar';
	@override String get goForward => 'Avançar';
	@override String get edit => 'Editar';
	@override String get share => 'Compartilhar';
	@override String get askAssistant => 'Perguntar ao assistente';
	@override String get citationRecycled => 'Na lixeira';
	@override String get outline => 'Sumário';
	@override String wordCount({required Object count}) => '${count} caracteres';
	@override String get saving => 'Salvando';
	@override String get saved => 'Salvo';
	@override String get unsaved => 'Não salvo';
	@override String get saveFailed => 'Não foi possível salvar';
	@override String get unknownCategory => 'Categoria desconhecida';
	@override String get searchReindexHint => 'Recrie o índice após atualizar para tornar entradas antigas pesquisáveis';
	@override String get searchReindex => 'Recriar';
	@override String get autoSaved => 'Salvo automaticamente';
	@override String get calendarBackToToday => 'Hoje';
	@override String get calendarEmptyDay => 'Nada escrito neste dia';
	@override String get calendarYearView => 'Visão anual';
	@override String get calendarMonthView => 'Visão mensal';
}

// Path: dream
class _Translations$dream$pt_BR extends Translations$dream$zh {
	_Translations$dream$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get iconTitle => 'Ícone na tela inicial';
	@override String get iconDescription => 'Escolha um ícone real para abrir o Dream Diary. A tela inicial pode demorar um pouco para atualizar e pode aplicar seu próprio formato ou tema.';
	@override String get iconDream => 'Dream';
	@override String get iconMono => 'Monocromático';
	@override String get iconPlum => 'Ameixa';
	@override String get iconApplied => 'Ícone atualizado. A tela inicial pode demorar um pouco para atualizar.';
	@override String get iconError => 'Não foi possível atualizar o ícone. Verifique se a imagem é válida e se sua tela inicial permite atalhos.';
	@override String get iconTooLarge => 'Escolha uma imagem com menos de 20 MB.';
	@override String get iconMaskPreview => 'Prévia com máscara circular';
	@override String get iconMonochromePreview => 'Prévia monocromática';
	@override String get iconMonochromeHint => 'No Android 13+, os ícones temáticos usam a camada monocromática incluída. A prévia é aproximada.';
	@override String get iconRestore => 'Restaurar ícone Dream';
	@override String get iconCropTitle => 'Ajustar imagem do atalho';
	@override String get iconCropHint => 'Arraste para posicionar e use o controle para ampliar. A imagem original nunca é alterada.';
	@override String get shortcutTitle => 'Atalho personalizado';
	@override String get shortcutDescription => 'Use uma foto dos seus arquivos como atalho adicional na tela inicial. Isso não substitui o ícone principal do aplicativo.';
	@override String get shortcutCreate => 'Criar atalho personalizado';
	@override String get shortcutRequested => 'Pedido de atalho enviado. Confirme na tela inicial, se solicitado.';
	@override String get shortcutDeclined => 'Sua tela inicial não aceitou o pedido de atalho. O ícone principal não foi alterado.';
	@override String get shortcutRemove => 'Remover atalho personalizado';
	@override String get shortcutRemoveMessage => 'Desativar este atalho e excluir apenas a cópia privada? Sua imagem original será mantida.';
	@override String get shortcutLimit => 'Algumas telas iniciais mantêm seu próprio estilo de atalho ou não permitem fixação. Atalhos antigos do Moodiary talvez precisem ser adicionados novamente após esta atualização do fork. Desinstalar o app remove as cópias privadas.';
	@override String get musicTitle => 'Tema musical';
	@override String get musicDescription => 'Ouça seus próprios arquivos de áudio enquanto escreve. Eles são copiados para o armazenamento privado do Dream Diary; os originais nunca são alterados ou excluídos.';
	@override String get musicAndroidOnly => 'O tema musical está disponível no Android.';
	@override String get musicEnabled => 'Ativar tema musical';
	@override String get musicBackground => 'Continuar em segundo plano';
	@override String get musicBackgroundHint => 'Mostra controles de mídia durante a reprodução. Desativado: pausa quando o app vai para segundo plano. Remover o app da tela de recentes sempre interrompe a reprodução.';
	@override String get musicAdd => 'Adicionar arquivos de áudio';
	@override String get musicImporting => 'Copiando áudio…';
	@override String get musicEmpty => 'Nenhuma faixa ainda. Adicione arquivos MP3, M4A, AAC, OGG, Opus, FLAC, WAV ou WebM.';
	@override String musicImported({required Object count}) => '${count} faixa(s) adicionada(s).';
	@override String get musicImportError => 'Alguns arquivos não puderam ser importados. Verifique formato, permissões e tamanho (até 200 MB por arquivo).';
	@override String get musicPlaybackError => 'Não foi possível reproduzir esta faixa. Ela pode estar ausente, corrompida ou não ser compatível. Remova-a ou adicione-a novamente.';
	@override String get musicPlaylistError => 'Não foi possível ler a playlist. Os arquivos de áudio privados foram mantidos.';
	@override String get musicUnavailable => 'Arquivo indisponível';
	@override String get musicRemove => 'Remover faixa';
	@override String musicRemoveMessage({required Object title}) => 'Remover "${title}" da playlist e excluir a cópia privada? O arquivo original será mantido.';
	@override String get musicPrevious => 'Anterior';
	@override String get musicNext => 'Próxima';
	@override String get musicPlay => 'Reproduzir';
	@override String get musicPause => 'Pausar';
	@override String get musicStop => 'Parar';
	@override String get musicVolume => 'Volume';
	@override String get musicShuffle => 'Aleatório';
	@override String get musicRepeat => 'Repetir';
	@override String get musicRepeatOff => 'Desativada';
	@override String get musicRepeatAll => 'Todas';
	@override String get musicRepeatOne => 'Uma faixa';
	@override String get musicNoAutoplay => 'A playlist e a posição são restauradas, mas a reprodução só começa quando você toca em Reproduzir.';
	@override String get musicPrivacy => 'As cópias privadas não entram na exportação, no backup nem na sincronização do diário. Limpar os dados do app as remove.';
}

// Path: editor
class _Translations$editor$pt_BR extends Translations$editor$zh {
	_Translations$editor$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get audioFileError => 'Erro no arquivo de áudio';
	@override String get unsupportedPlatform => 'O editor não é compatível com esta plataforma';
	@override String loadFailed({required Object error}) => 'Falha ao carregar o editor\n${error}';
	@override String get pickCategory => 'Escolher categoria';
	@override String get noCategory => 'Sem categoria';
	@override String get migrationTitle => 'Migração de dados da atualização';
	@override String get migrationIntro => 'A versão 2.8.0 usa um novo mecanismo de dados e editor. É necessária uma migração única antes de continuar.';
	@override String get migrationStepEngine => 'Atualização do mecanismo do banco';
	@override String get migrationStepEngineDesc => 'Move entradas, categorias, fontes e todos os outros dados para o novo banco';
	@override String get migrationStepEditor => 'Conversão do formato das entradas';
	@override String get migrationStepEditorDesc => 'Converte o conteúdo antigo para o novo editor; os originais são copiados para backup primeiro';
	@override String get migrationContentIntro => 'O novo editor precisa atualizar o formato das suas entradas antes de continuar.';
	@override String get migrationStepContent => 'Atualização do formato das entradas';
	@override String get migrationStepContentDesc => 'Atualiza para o novo editor; todas as entradas são copiadas para backup primeiro';
	@override String get migrationContentDoneSubtitle => 'Todas as entradas usam o novo formato';
	@override String get migrationStart => 'Iniciar migração';
	@override String get migrationExit => 'Sair do aplicativo';
	@override String get migrationLandingNote => 'Não saia do aplicativo durante a migração. Nenhum dado antigo será excluído antes da conclusão.';
	@override String get migrationRunningTitle => 'Migrando dados';
	@override String get migrationRunningSubtitle => 'Mantenha o aplicativo em primeiro plano e não o feche';
	@override String get migrationStageDone => 'Concluído';
	@override String get migrationStagePending => 'Não iniciado';
	@override String get migrationStageFailed => 'Falhou';
	@override String migrationStageFailedCount({required Object count}) => '${count} falharam';
	@override String get migrationDataSafeNote => 'Nenhum dado antigo será excluído antes da conclusão';
	@override String get migrationFailedTitle => 'Algumas entradas não foram migradas';
	@override String migrationFailedSubtitle({required Object count}) => '${count} entradas não foram migradas; as demais estão prontas. Os originais estão no backup — tentar novamente não perde nada.';
	@override String get migrationErrorTitle => 'Erro na migração';
	@override String get migrationErrorSubtitle => 'Ocorreu um erro durante a migração. Os originais estão no backup — tentar novamente não perde nada.';
	@override String get migrationRetry => 'Tentar novamente';
	@override String get migrationShareLog => 'Compartilhar registro de falhas';
	@override String get migrationFailedNote => 'O registro contém apenas detalhes dos erros, nunca o conteúdo das entradas. Nenhum dado antigo será excluído antes da conclusão.';
	@override String get migrationDoneTitle => 'Migração concluída';
	@override String get migrationDoneSubtitle => 'Todos os dados foram movidos para o novo mecanismo; os antigos foram mantidos como backup';
	@override String get migrationSummaryDiaries => 'Entradas';
	@override String migrationSummaryDiariesCount({required Object count}) => '${count}';
	@override String get migrationSummaryCategories => 'Categorias';
	@override String migrationSummaryCategoriesCount({required Object count}) => '${count}';
	@override String get migrationSummaryMedia => 'Mídia e fontes';
	@override String get migrationSummaryMigrated => 'Migrados';
	@override String get migrationEnter => 'Começar';
	@override late final _Translations$editor$toolbar$pt_BR toolbar = _Translations$editor$toolbar$pt_BR._(_root);
}

// Path: export
class _Translations$export$pt_BR extends Translations$export$zh {
	_Translations$export$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get pageTitle => 'Importar e exportar';
	@override String get sectionExport => 'Exportar';
	@override String get sectionImport => 'Importar';
	@override String get sectionBackup => 'Backup';
	@override String get formatDocx => 'DOCX';
	@override String get backupExport => 'Exportar backup';
	@override String get backupExportSubtitle => 'Inclui todas as entradas e mídias';
	@override String get restoreFromBackup => 'Restaurar backup';
	@override String get backupRestoreSubtitle => 'Mesclado pela data de modificação';
	@override String get restoreConfirmMessage => 'O backup e os dados locais são mesclados pela última modificação; as entradas mais recentes prevalecem.';
	@override String get restoreConfirmLabel => 'Restaurar';
	@override String get restoring => 'Restaurando…';
	@override String restoreDone({required Object summary}) => 'Restaurado: ${summary}';
	@override String restoreSummary({required Object diary, required Object category, required Object media}) => '${diary} entradas / ${category} categorias / ${media} arquivos de mídia';
	@override String restoreSummarySkipped({required Object base, required Object skipped}) => '${base}, ${skipped} ignorados (este dispositivo tem conteúdo mais recente)';
	@override String restoreSummaryFailed({required Object base, required Object failed}) => '${base}, ${failed} falharam';
	@override String restorePartial({required Object summary}) => 'A restauração não foi concluída: ${summary}. Verifique o espaço e a conexão e tente novamente — não apague os dados do dispositivo antigo ainda';
	@override String restoreStopped({required Object summary}) => 'Restauração interrompida (incompleta): ${summary}';
	@override String restoreFailed({required Object error}) => 'Falha na restauração: ${error}';
	@override String get packingBackup => 'Preparando backup…';
	@override String get backupReady => 'Backup criado';
	@override String failed({required Object error}) => 'Falha na exportação: ${error}';
	@override String get artifactMissing => 'O arquivo exportado não está mais disponível. Tente novamente.';
	@override String get generated => 'Exportado';
	@override String get titleMarkdown => 'Exportar para Markdown';
	@override String get titleDocx => 'Exportar para DOCX';
	@override String get titlePdf => 'Exportar para PDF';
	@override String get sectionScope => 'Escopo';
	@override String get selectDiaries => 'Selecionar entradas';
	@override String get counting => 'Contando…';
	@override String entryCount({required Object count}) => '${count} entradas';
	@override String get mergeIntoOneFile => 'Mesclar em um arquivo';
	@override String get mergeSubtitle => 'Desativado: um arquivo por entrada';
	@override String get fileNameTemplate => 'Modelo de nome do arquivo';
	@override String fileNameTemplateHint({required Object date, required Object title, required Object id}) => 'Marcadores disponíveis: ${date} data, ${title} título, ${id} ID da entrada';
	@override String get templateEmpty => 'O modelo não pode ficar vazio';
	@override String get sectionContent => 'Conteúdo';
	@override String get includeTitle => 'Título';
	@override String get includeMeta => 'Data e clima';
	@override String get mediaEmbed => 'Incorporar imagens';
	@override String get mediaPlaceholder => 'Somente texto de referência';
	@override String get mediaNone => 'Sem mídia';
	@override String get sectionLayout => 'Layout';
	@override String get font => 'Fonte';
	@override String get eastAsiaFont => 'Fonte chinesa';
	@override String get asciiFont => 'Fonte latina';
	@override String get noFontSelected => 'Nenhuma fonte selecionada';
	@override String get fontSize => 'Tamanho da fonte';
	@override String fontSizeValue({required Object size}) => '${size} pt';
	@override String get lineSpacing => 'Espaçamento entre linhas';
	@override String lineSpacingValue({required Object value}) => '${value}×';
	@override String get firstLineIndent => 'Recuar a primeira linha em dois caracteres';
	@override String get paper => 'Tamanho do papel';
	@override String get fontNameHint => 'Informe o nome de uma fonte, ex.: “SimSun” ou “Georgia”.';
	@override String get fontNameEmpty => 'O nome da fonte não pode ficar vazio';
	@override String get scopeEmpty => 'Nenhuma entrada neste escopo';
	@override String get cancelled => 'Exportação cancelada';
	@override String get pickFontFirst => 'Escolha uma fonte primeiro';
	@override String runButton({required Object count}) => 'Exportar ${count} entradas';
	@override String get partialTitle => 'Exportado, mas alguns itens ficaram de fora';
	@override String skippedMedia({required Object count}) => '${count} arquivos de mídia ausentes foram ignorados';
	@override String unsupportedNodes({required Object count, required Object types}) => '${count} tipos de conteúdo ainda não podem ser exportados nesta versão: ${types}';
	@override String get scopeAll => 'Todas as entradas';
	@override String get scopeByCategory => 'Por categoria';
	@override String get scopeByDate => 'Por data';
	@override String get scopePicked => 'Selecionar manualmente';
	@override String scopePickedLabel({required Object count}) => '${count} selecionadas';
	@override String get dateRange => 'Intervalo de datas';
	@override String get tapToPick => 'Toque para escolher';
	@override String dateRangeValue({required Object from, required Object to}) => '${from} – ${to}';
	@override String get selectAll => 'Selecionar tudo';
	@override String get nothingSelected => 'Nada selecionado';
	@override String get confirm => 'Concluir';
	@override String get uncategorized => 'Sem categoria';
	@override String get deletedCategory => 'Categoria excluída';
	@override String get pdfFontPageTitle => 'Fonte do PDF';
	@override String get importedFonts => 'Fontes importadas';
	@override String get importFont => 'Importar fonte';
	@override String get importingFont => 'Importando…';
	@override String importFailed({required Object error}) => 'Falha na importação: ${error}';
	@override String get fontNameUnreadable => 'Não foi possível ler o nome da fonte; o arquivo pode estar danificado';
	@override String get noPdfFontTitle => 'Nenhuma fonte disponível para PDF';
	@override String get noPdfFontMessage => 'Importe uma fonte .ttf para escolhê-la aqui.';
	@override String progressConverting({required Object done, required Object total}) => 'Convertendo ${done}/${total}';
	@override String get progressWriting => 'Diagramando…';
	@override String progressWritingCount({required Object done, required Object total}) => 'Diagramando ${done}/${total}';
	@override String get progressSerializing => 'Gravando arquivo…';
	@override String get mediaVideo => 'Vídeo';
	@override String get mediaAudio => 'Áudio';
	@override String get mediaAttachment => 'Anexo';
	@override String get formatImage => 'Imagem';
	@override String get titleImage => 'Exportar como imagem';
	@override String get sectionImage => 'Imagem';
	@override String get includePosition => 'Incluir localização';
	@override String get includePositionSubtitle => 'Desativado por padrão — arquivos exportados podem ser compartilhados';
	@override String get imageBrightness => 'Aparência';
	@override String get imageBrightnessSystem => 'Seguir o aplicativo';
	@override String get imageBrightnessLight => 'Clara';
	@override String get imageBrightnessDark => 'Escura';
	@override String get imageSize => 'Tamanho e nitidez';
	@override String imageSizeValue({required Object width, required Object scale, required Object pixels}) => '${width} dp · ${scale}× (${pixels} px de largura)';
	@override String get imageWatermark => 'Mostrar marca do Dream Diary';
	@override String get imageMerge => 'Mesclar em uma imagem longa';
	@override String get imageMergeSubtitle => 'Desativado: uma imagem por entrada; mais de 9 são compactadas em ZIP';
	@override String get previewSample => 'Prévia de exemplo';
	@override String get importMarkdown => 'Importar do Markdown';
	@override String get importMarkdownSubtitle => 'Um pacote ZIP ou um único arquivo .md';
	@override String get importTitle => 'Importar do Markdown';
	@override String get importSectionFile => 'Arquivo';
	@override String get importPickFile => 'Escolher arquivo';
	@override String get importNoFile => 'Nada escolhido ainda';
	@override String get importScanning => 'Lendo…';
	@override String importDetected({required Object count}) => '${count} entradas';
	@override String get importSpec => 'Formato';
	@override String get importSpecEntries => 'Cada arquivo .md na raiz do ZIP é uma entrada; um único arquivo .md também funciona.';
	@override String get importSpecAssets => 'Coloque imagens, vídeos e áudios em assets/ (subpastas permitidas) e use caminhos relativos.';
	@override String get importSpecFrontMatter => 'Um cabeçalho opcional pode definir título, data, humor, categoria, tags, clima e localização. Sem ele, o título vem do primeiro cabeçalho de nível 1 ou do nome do arquivo, e a data vem do início do nome.';
	@override String get importSpecRoundTrip => 'Markdown exportado sem mesclar pode ser importado diretamente; exportações mescladas em um arquivo não são aceitas.';
	@override String get importSpecExample => 'diarios.zip';
	@override String importRunButton({required Object count}) => 'Importar ${count} entradas';
	@override String importProgress({required Object done, required Object total}) => 'Importando ${done}/${total}';
	@override String importSummary({required Object diary, required Object category, required Object place}) => '${diary} entradas / ${category} novas categorias / ${place} novos lugares';
	@override String importSummarySkipped({required Object base, required Object skipped}) => '${base}, ${skipped} ignorados (já existem)';
	@override String importSummaryFailed({required Object base, required Object failed}) => '${base}, ${failed} falharam';
	@override String importDone({required Object summary}) => 'Importado: ${summary}';
	@override String importPartial({required Object summary}) => 'A importação não foi concluída: ${summary}';
	@override String importStopped({required Object summary}) => 'Importação interrompida (incompleta): ${summary}';
	@override String importRunFailed({required Object error}) => 'Falha na importação: ${error}';
	@override String get importEmpty => 'Nenhum arquivo .md encontrado no pacote';
	@override String importMissingMedia({required Object count}) => '${count} arquivos de mídia não puderam ser importados (ausentes ou ilegíveis) e foram mantidos como links';
}

// Path: insights
class _Translations$insights$pt_BR extends Translations$insights$zh {
	_Translations$insights$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Análise do humor';
	@override String get week => 'Semana';
	@override String get month => 'Mês';
	@override String get year => 'Ano';
	@override String get selectMonth => 'Escolher mês';
	@override String get selectYear => 'Escolher ano';
	@override String get selectWeek => 'Escolher semana';
	@override String pickerYear({required Object year}) => '${year}';
	@override String yearTitle({required Object year}) => '${year}';
	@override String weekTitle({required Object start, required Object end}) => '${start} – ${end}';
	@override String get recordedDays => 'Dias registrados';
	@override String get entries => 'Entradas';
	@override String get bestDay => 'Melhor dia';
	@override String get empty => 'Nenhum humor registrado';
	@override String get calendar => 'Calendário';
	@override String get trend => 'Tendência';
	@override String get distribution => 'Distribuição';
	@override String get weekdayPattern => 'Por dia da semana';
	@override String get view => 'Exibição';
	@override String get unrecorded => 'Não registrado';
	@override String get today => 'Hoje';
	@override String get weekDiaries => 'Entradas desta semana';
	@override String get yearPixels => 'Ano completo';
	@override String get monthlyTrend => 'Por mês';
	@override String monthMood({required Object level}) => 'Humor deste mês · ${level}';
	@override String get noticeTitle => 'O registro de humor mudou';
	@override String noticeSubtitle({required Object version}) => 'Novidade na versão ${version}';
	@override String get noticeCaption => 'O humor representa como você se sente hoje. Você também pode deixá-lo em branco.';
	@override String get noticeTagsTitle => 'Cenas agora são tags';
	@override String get noticeTagsBody => 'Escolhas anteriores, como Estudo e Viagem, foram adicionadas como tags às entradas.';
	@override String get noticeLevelsTitle => 'Humores anteriores foram convertidos';
	@override String get noticeLevelsBody => 'Humores como Feliz e Realizado agora usam níveis semelhantes. Entradas sem escolha continuam não registradas.';
	@override String get noticeInsightsTitle => 'Conheça a análise do humor';
	@override String get noticeInsightsBody => 'Encontre o calendário e as tendências de humor em Eu.';
	@override String get noticeExplore => 'Conferir';
	@override String get noticeDone => 'Entendi';
	@override String get loadError => 'Não foi possível carregar';
	@override String get retry => 'Tentar novamente';
	@override String get previousPeriod => 'Período anterior';
	@override String get nextPeriod => 'Próximo período';
	@override String countPercent({required Object count, required Object percent}) => '${count} · ${percent}%';
	@override String signedDelta({required Object sign, required Object value}) => '${sign}${value}';
	@override String dayHeader({required Object date, required Object weekday}) => '${date} · ${weekday}';
	@override String recordedWeek({required Object count}) => '${count} / 7';
	@override String get streak => 'Sequência de bom humor';
	@override String streakDays({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '1 dia',
		other: '${count} dias',
	);
	@override String dayDetail({required Object date, required Object level}) => '${date} · ${level}';
	@override String yearRange({required Object start, required Object end}) => '${start} – ${end}';
	@override String weekDays({required Object start, required Object end}) => '${start} – ${end}';
}

// Path: lock
class _Translations$lock$pt_BR extends Translations$lock$zh {
	_Translations$lock$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Senha de acesso';
	@override String get subtitle => 'Verificar ao abrir e em ações sensíveis';
	@override String get changePassword => 'Alterar senha';
	@override String get lockNow => 'Bloquear ao sair';
	@override String get lockNowSubtitle => 'Verificar novamente ao voltar';
	@override String get biometric => 'Biometria';
	@override String get biometricSubtitle => 'Usar em vez da senha';
	@override String get turnedOn => 'Senha ativada';
	@override String get turnedOff => 'Senha desativada';
	@override String get passwordChanged => 'Senha alterada';
	@override String get setPassword => 'Definir senha';
	@override String get confirmPassword => 'Digite novamente';
	@override String get mismatch => 'As senhas não coincidem. Tente novamente';
	@override String get saveFailed => 'Não foi possível salvar. Tente novamente';
	@override String get enterNew => 'Digite a nova senha';
	@override String get confirmNew => 'Digite novamente';
	@override String get prompt => 'Digite a senha';
	@override String attemptsLeft({required Object count}) => 'Senha incorreta, ${count} tentativas restantes';
	@override String cooldown({required Object seconds}) => 'Muitas tentativas. Tente novamente em ${seconds} s';
	@override String get biometricTitle => 'Verifique sua identidade';
	@override String get biometricReason => 'Use a biometria para continuar';
	@override String get biometricUsePasscode => 'Usar senha';
	@override String get authSubtitle => 'Verificação necessária';
	@override String get actionSyncKeyChange => 'Alterar senha de criptografia';
	@override String get actionSyncKeyDisable => 'Desativar criptografia';
	@override String get actionSyncCloudReset => 'Redefinir nuvem';
	@override String get actionPasscodeDisable => 'Desativar senha';
	@override String get actionPasscodeChange => 'Alterar senha';
	@override String get actionDataExport => 'Exportar dados';
	@override String get actionBiometricEnable => 'Ativar biometria';
	@override String get actionLanSend => 'Envio pela rede local';
	@override String get actionSyncConfig => 'Editar configurações de sincronização';
}

// Path: media
class _Translations$media$pt_BR extends Translations$media$zh {
	_Translations$media$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mídia';
	@override String get typeImage => 'Imagem';
	@override String get typeFile => 'Anexo';
	@override String get empty => 'Nenhuma mídia ainda';
	@override String get rename => 'Renomear';
	@override String imageCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '${count} Foto',
		other: '${count} Fotos',
	);
	@override String audioCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '${count} Áudio',
		other: '${count} Áudios',
	);
	@override String videoCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '${count} Vídeo',
		other: '${count} Vídeos',
	);
	@override String fileCount({required num count}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('pt'))(count,
		one: '${count} Anexo',
		other: '${count} Anexos',
	);
}

// Path: picker
class _Translations$picker$pt_BR extends Translations$picker$zh {
	_Translations$picker$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get recentAlbum => 'Recentes';
	@override String get done => 'Concluir';
	@override String doneCount({required Object count, required Object max}) => 'Concluir ${count}/${max}';
	@override String get limitedTip => 'O aplicativo só pode acessar as fotos e os vídeos selecionados';
	@override String get limitedManage => 'Gerenciar';
	@override String get limitedEmptyImages => 'Nenhuma foto acessível. Toque em Gerenciar para permitir o acesso a fotos.';
	@override String get limitedEmptyVideos => 'Nenhum vídeo acessível. Toque em Gerenciar para permitir o acesso a vídeos.';
	@override String get permissionDenied => 'Permita o acesso às fotos nas Configurações';
	@override String get a11ySelect => 'Selecionar';
	@override String get a11yUnselect => 'Desmarcar';
	@override String get capture => 'Câmera';
	@override String get record => 'Gravar';
	@override String get captureFailed => 'Falha na captura';
}

// Path: share
class _Translations$share$pt_BR extends Translations$share$zh {
	_Translations$share$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get sheetTitle => 'Compartilhar esta entrada';
	@override String get sheetSubtitle => 'Exportar como imagem ou documento — somente esta entrada';
	@override String get optionImage => 'Imagem';
	@override String get optionImageSubtitle => 'Imagem longa · pode ser salva em Fotos';
	@override String get optionMarkdownSubtitle => 'Texto simples + recursos';
	@override String get optionDocxSubtitle => 'Continue editando no Word';
	@override String get optionPdfSubtitle => 'Layout fixo';
	@override String get optionPdfNeedFont => 'Layout fixo · escolha uma fonte primeiro';
	@override String get previewTitle => 'Prévia da imagem';
	@override String get previewSampleTitle => 'Exemplo · primeira entrada';
	@override String get rendering => 'Renderizando…';
	@override String renderFailed({required Object error}) => 'Falha na renderização: ${error}';
	@override String get empty => 'Nada para compartilhar';
	@override String get saveToAlbum => 'Salvar em Fotos';
	@override String get share => 'Compartilhar';
	@override String get savedToAlbum => 'Salvo em Fotos';
	@override String savedToAlbumCount({required Object count}) => '${count} imagens salvas em Fotos';
	@override String get saveToAlbumFailed => 'Não foi possível salvar — verifique a permissão de Fotos';
	@override String get subject => 'Compartilhado do Dream Diary';
	@override String generating({required Object format}) => 'Gerando ${format}…';
}

// Path: storage
class _Translations$storage$pt_BR extends Translations$storage$zh {
	_Translations$storage$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Armazenamento';
	@override String get used => 'Usado';
	@override String get reclaimable => 'Pode liberar';
	@override String get model => 'Modelos de IA';
	@override String get media => 'Mídia';
	@override String get cache => 'Cache';
	@override String get database => 'Dados do diário';
	@override String get other => 'Outros';
	@override String get font => 'Fontes';
	@override String get file => 'Anexos';
	@override String get recommended => 'Recomendado';
	@override String get careful => 'Revise primeiro';
	@override String get retiredMood => 'Modelo antigo de sugestão de humor';
	@override String get noLongerUsed => 'Não é mais usado';
	@override String get unusedModel => 'Modelo não utilizado';
	@override String get partial => 'Downloads incompletos';
	@override String get unusedMedia => 'Mídia não utilizada';
	@override String get legacy => 'Backup do banco antigo';
	@override String get irreversible => 'Não pode ser desfeito';
	@override String get counting => 'Contando';
	@override String scanning({required Object area}) => 'Contando · ${area}';
	@override String fileCount({required Object count}) => '${count} arquivos';
	@override String get complete => 'Contagem concluída';
	@override String cleanable({required Object size}) => 'Pode limpar ${size}';
	@override String clean({required Object size}) => 'Liberar ${size}';
	@override String get nothingSelected => 'Nada selecionado';
	@override String get allClean => 'Tudo limpo';
	@override String freed({required Object size}) => '${size} liberados';
	@override String confirmTitle({required Object count}) => 'Limpar ${count} itens?';
	@override String get total => 'Total';
	@override String warning({required Object names}) => '${names} serão excluídos permanentemente';
	@override String get cancel => 'Cancelar';
	@override String get confirm => 'Limpar';
	@override String get syncing => 'Sincronizando';
	@override String get failed => 'Não foi possível calcular o armazenamento';
	@override String get retry => 'Tentar novamente';
	@override String get cleanFailed => 'Não foi possível limpar. Tente novamente.';
	@override String get listSeparator => ',';
}

// Path: sync
class _Translations$sync$pt_BR extends Translations$sync$zh {
	_Translations$sync$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get backupSyncWebdav => 'WebDAV';
	@override String get backupSyncWebdavNoOption => 'Não configurado';
	@override String get backupSyncWebdavOption => 'Configurado';
	@override String get webdavOptionServer => 'Endereço do servidor';
	@override String get webdavOptionUsername => 'Nome de usuário';
	@override String get webdavOptionPassword => 'Senha';
	@override String get backupSyncS3 => 'S3 / MinIO';
	@override String get s3OptionEndpoint => 'Endpoint';
	@override String get s3OptionRegion => 'Região';
	@override String get s3OptionBucket => 'Bucket';
	@override String get s3OptionAccessKey => 'Chave de acesso';
	@override String get s3OptionSecretKey => 'Chave secreta';
	@override String get s3OptionUseSsl => 'Usar HTTPS';
	@override String get sectionConnection => 'Conexão';
	@override String get sectionCredentials => 'Credenciais';
	@override String get sectionOptions => 'Opções';
	@override String get configClear => 'Limpar configurações';
	@override String get configClearConfirmTitle => 'Limpar configurações?';
	@override String get configClearConfirmMessage => 'A sincronização com este serviço será interrompida. As entradas neste dispositivo não serão alteradas.';
	@override String get configCleared => 'Configurações removidas';
	@override String fieldRequired({required String field}) => '${field} é obrigatório';
	@override String get fieldOptional => 'Opcional';
	@override String get fieldInvalidUrl => 'Este endereço não parece válido';
	@override String get pageTitle => 'Backup e sincronização';
	@override String get cloudSection => 'Sincronização na nuvem';
	@override String get method => 'Serviço';
	@override String methodConfig({required Object name}) => 'Configurações do ${name}';
	@override String get notConfiguredTap => 'Não configurado — toque para configurar';
	@override String get testConnection => 'Testar conexão';
	@override String get testing => 'Testando conexão…';
	@override String get connectOk => 'Conectado';
	@override String connectFailed({required Object error}) => 'Não foi possível conectar: ${error}';
	@override String get configureFirst => 'Conclua a configuração primeiro';
	@override String doneToast({required Object message}) => 'Concluído: ${message}';
	@override String failedToast({required Object message}) => 'Falha: ${message}';
	@override String get stopping => 'Interrompendo…';
	@override String get stop => 'Parar sincronização';
	@override String get stoppingSubtitle => 'Concluindo o item atual primeiro';
	@override String get stopSubtitle => 'Sincronizando em segundo plano — toque para parar';
	@override String get willStop => 'Será interrompida ao concluir o item atual';
	@override String get syncNow => 'Sincronizar agora';
	@override String lastSync({required Object time}) => 'Última sincronização: ${time}';
	@override String get neverSynced => 'Nunca sincronizado';
	@override String get logEntry => 'Registro de sincronização';
	@override String get logEntrySubtitle => 'Consultar eventos por data';
	@override String get lanSection => 'Rede local';
	@override String get lanSend => 'Enviar';
	@override String get lanSendSubtitle => 'Enviar entradas para um dispositivo no mesmo Wi-Fi';
	@override String get lanReceive => 'Receber';
	@override String get lanReceiveSubtitle => 'Aguardar o envio de outro dispositivo';
	@override String get encryptionSection => 'Criptografia';
	@override String get autoSection => 'Sincronização automática';
	@override String get autoSync => 'Sincronizar automaticamente';
	@override String get autoSyncSubtitle => 'Enviar após alterar uma entrada e receber alterações de outros dispositivos periodicamente';
	@override String get pollInterval => 'Intervalo de consulta';
	@override String get pollIntervalSubtitle => 'Frequência de consulta das alterações de outros dispositivos em segundo plano';
	@override String get pollIntervalNote => 'Frequência da sincronização completa em segundo plano. Um intervalo menor encontra alterações mais cedo, mas cada consulta bloqueia o serviço remoto, lê o manifesto e faz solicitações de rede. Intervalos muito curtos consomem dados e bateria e podem atingir limites do WebDAV/S3 ou causar bloqueios temporários. Recomenda-se no mínimo 30 segundos.';
	@override String get networkSection => 'Rede';
	@override String get concurrency => 'Solicitações simultâneas';
	@override String get concurrencySubtitle => 'Limite de solicitações de rede em paralelo; reduza em conexões lentas ou servidores com limite de uso';
	@override String get concurrencyNote => 'Padrão: 8. Valores maiores são mais rápidos, mas podem atingir limites do WebDAV/S3 ou causar recusas de conexão.';
	@override String seconds({required Object count}) => '${count} s';
	@override String minutes({required Object count}) => '${count} min';
	@override String minutesSeconds({required Object minutes, required Object seconds}) => '${minutes} min ${seconds} s';
	@override String get logPickDate => 'Escolher data';
	@override String get logFilterByDate => 'Filtrar por data';
	@override String get logToday => 'Hoje';
	@override String get logTodaySuffix => '(hoje)';
	@override String get logClear => 'Limpar registro';
	@override String get logClearMessage => 'Exclui os eventos em memória e todos os arquivos JSONL diários. Esta ação não pode ser desfeita.';
	@override String logEventCount({required Object count}) => '${count} eventos';
	@override String get logEmpty => 'Nenhum evento de sincronização nesta data';
	@override String logGroupCount({required Object kind, required Object count}) => '${kind} · ${count}';
	@override String get logDetail => 'Detalhes do evento';
	@override String get logCopy => 'Copiar';
	@override String get kindSyncStart => 'Sincronização iniciada';
	@override String get kindSyncEnd => 'Sincronização concluída';
	@override String get kindManifestRead => 'Manifesto lido';
	@override String get kindManifestWrite => 'Manifesto gravado';
	@override String get kindDiaryUpload => 'Entrada enviada';
	@override String get kindDiaryDownload => 'Entrada recebida';
	@override String get kindDiarySkip => 'Entrada ignorada';
	@override String get kindDiaryTombstonePush => 'Exclusão de entrada enviada';
	@override String get kindDiaryTombstonePull => 'Exclusão de entrada recebida';
	@override String get kindCategoryUpload => 'Categoria enviada';
	@override String get kindCategoryDownload => 'Categoria recebida';
	@override String get kindCategorySkip => 'Categoria ignorada';
	@override String get kindCategoryTombstonePush => 'Exclusão de categoria enviada';
	@override String get kindCategoryTombstonePull => 'Exclusão de categoria recebida';
	@override String get kindPlaceUpload => 'Envio de lugar';
	@override String get kindPlaceDownload => 'Recebimento de lugar';
	@override String get kindPlaceSkip => 'Lugar ignorado';
	@override String get kindPlaceTombstonePush => 'Exclusão de lugar enviada';
	@override String get kindPlaceTombstonePull => 'Exclusão de lugar aplicada';
	@override String get kindMediaUpload => 'Mídia enviada';
	@override String get kindMediaDownload => 'Mídia recebida';
	@override String get kindMediaSkip => 'Mídia ignorada';
	@override String get kindMediaDelete => 'Mídia excluída';
	@override String get kindLockAcquire => 'Bloqueio adquirido';
	@override String get kindLockRelease => 'Bloqueio liberado';
	@override String get kindKeyfileUpload => 'Envio do arquivo de chaves';
	@override String get kindKeyConflict => 'Conflito de chave na nuvem';
	@override String get kindReCipher => 'Recriptografia';
	@override String get kindError => 'Erro';
	@override String get directionPull => 'Receber';
	@override String get directionPush => 'Enviar';
	@override String get directionRestore => 'Restaurar';
	@override String get directionReCipher => 'Recriptografia';
	@override String get reasonUpToDate => 'Já atualizado';
	@override String get reasonRemoteNewer => 'O servidor tem edições mais recentes';
	@override String get reasonLocalNewer => 'Este dispositivo tem edições mais recentes';
	@override String get reasonOpenDiary => 'Entrada aberta';
	@override String get reasonLocalMissing => 'Arquivo local ausente';
	@override String get reasonProbeFailed => 'Estado remoto desconhecido';
	@override String get reasonRemoteExists => 'Já existe no servidor';
	@override String get reasonLocalExists => 'Já existe neste dispositivo';
	@override String get reasonRemoteMissing => 'Ausente no servidor';
	@override String get reasonTakeover => 'Bloqueio antigo assumido';
	@override String get reasonExpiredLock => 'Bloqueio expirado removido';
	@override String get reasonCasVerified => 'Gravação condicional verificada';
	@override String get reasonCasUnsupported => 'O servidor ignora gravações condicionais';
	@override String get reasonRenewFailed => 'Falha ao renovar a concessão';
	@override String get reasonReleaseFailed => 'Falha ao liberar o bloqueio';
	@override String get reasonDecodeFailed => 'Objeto remoto malformado';
	@override String get reasonUnknownTombstone => 'Registro de exclusão desconhecido';
	@override String get reasonStopped => 'Interrompido';
	@override String get reasonAborted => 'Cancelado';
	@override String get statusTitle => 'Estado da sincronização';
	@override String get encrypted => 'criptografado';
	@override String get notEncrypted => 'sem criptografia';
	@override String get statusFailed => 'Falha na sincronização';
	@override String get statusNoBackend => 'Nenhum serviço de sincronização configurado';
	@override String get statusNoBackendDetail => 'Configure um em Backup e sincronização';
	@override String get statusSynced => 'Sincronizado';
	@override String get statusLastSync => 'Última sincronização';
	@override String get statusNever => 'Nunca sincronizado';
	@override String get rowDiary => 'Entradas';
	@override String get rowCategory => 'Categorias';
	@override String get rowMedia => 'Mídia';
	@override String get statusRunning => 'Sincronizando';
	@override String get lanSendTitle => 'Enviar pela rede local';
	@override String get lanSendIntro => 'Somente o que falta no outro dispositivo é enviado. As alterações são mescladas pela última modificação; enviar duas vezes não duplica nada.';
	@override String get lanNearbyDevices => 'Dispositivos próximos';
	@override String lanPeerIncompatible({required Object version}) => 'Versão incompatível · outro dispositivo ${version}';
	@override String get lanReceiverAddress => 'Endereço do receptor';
	@override String get lanAddressHint => 'Preenchido ao escolher um dispositivo acima';
	@override String get lanPin => 'Código de pareamento';
	@override String get lanPinHint => 'Os 6 dígitos exibidos no dispositivo receptor';
	@override String get lanSendAction => 'Enviar';
	@override String get lanPickDevice => 'Escolha primeiro um dispositivo de destino';
	@override String get lanNeedPin => 'Digite o código de pareamento de 6 dígitos';
	@override String get lanBadAddress => 'Este endereço não é válido';
	@override String get lanSearching => 'Procurando — abra a página Receber no outro dispositivo';
	@override String get lanConnecting => 'Conectando…';
	@override String get lanPacking => 'Preparando os dados…';
	@override String get lanUploading => 'Enviando';
	@override String get lanApplying => 'Aguardando o outro dispositivo salvar…';
	@override String get lanReceiveTitle => 'Receber pela rede local';
	@override String lanStartFailed({required Object error}) => 'Não foi possível iniciar o recebimento: ${error}';
	@override String get lanPinCopied => 'Código de pareamento copiado';
	@override String get lanPinHelp => 'Digite no dispositivo de origem · toque para copiar';
	@override String get lanAddressCopied => 'Endereço copiado';
	@override String get lanUpToDate => 'Já atualizado — nada foi alterado';
	@override String lanReceived({required Object diary, required Object category}) => '${diary} entradas · ${category} categorias';
	@override String lanReceivedFailed({required Object base, required Object failed}) => '${base} (${failed} falharam)';
	@override String get lanWaiting => 'Aguardando a conexão do remetente…';
	@override String get lanReceiving => 'Recebendo';
	@override String get lanSaving => 'Salvando…';
	@override String get lanDone => 'Recebido';
	@override String get lanDonePartialHint => 'Parte do conteúdo não chegou. Verifique o espaço e receba novamente; não apague os dados do remetente antes de confirmar que estão completos';
	@override String get lanDoneHint => 'Você pode continuar recebendo — o código de pareamento permanece o mesmo';
	@override String get lanFailed => 'Falha no recebimento';
	@override String get lanFailedHint => 'O código não mudou; o remetente pode tentar novamente';
	@override String get lanLocalAddress => 'Este dispositivo';
	@override String get lanNoWifi => 'Sem Wi-Fi — este dispositivo não tem um endereço para mostrar';
	@override String get keyGuardMissing => 'O arquivo de chaves da nuvem está ausente. Nenhuma senha pode desbloquear estes dados.';
	@override String get keyGuardTitle => 'Os dados na nuvem estão criptografados';
	@override String get keyGuardMessageMismatch => 'A chave deste dispositivo não corresponde à nuvem. Digite a senha da nuvem.';
	@override String get keyGuardMessage => 'Digite a senha de criptografia para continuar sincronizando.';
	@override String get keyGuardHint => 'Senha de criptografia';
	@override String get keyGuardConfirm => 'Desbloquear';
	@override String get keyNeedPassword => 'Digite uma senha';
	@override String get keyGuardWrong => 'Senha incorreta';
	@override String get keyConfigured => 'Desbloqueado';
	@override String get e2eTitle => 'Criptografia de ponta a ponta';
	@override String get e2eOn => 'Ativada';
	@override String get e2eOff => 'Desativada';
	@override String get e2eManage => 'Gerenciar criptografia';
	@override String get keyMismatch => 'As duas senhas não coincidem';
	@override String get keyNew => 'Nova senha';
	@override String get keyPassword => 'Senha de criptografia';
	@override String get keyConfirm => 'Confirme a senha';
	@override String get keyTurnOff => 'Desativar criptografia';
	@override String get keyChanged => 'Senha alterada';
	@override String get keyEncryptCloudTitle => 'Criptografar dados na nuvem?';
	@override String get keyEncryptCloudMessage => 'Entradas, categorias e mídias existentes na nuvem serão criptografadas, com a chave protegida pela sua senha.';
	@override String get keyContinue => 'Continuar';
	@override String keyWriteFailed({required Object error}) => 'Não foi possível gravar a chave na nuvem: ${error}';
	@override String keyCloudEncrypted({required Object report}) => 'Dados remotos criptografados: ${report}';
	@override String get keyEncryptionOn => 'A criptografia está ativada';
	@override String get keyDecryptTitle => 'Desativar a criptografia?';
	@override String get keyDecryptMessage => 'Os dados na nuvem serão descriptografados e o arquivo de chaves será removido.';
	@override String keyDecryptPartial({required Object failed}) => '${failed} arquivos não puderam ser descriptografados. A criptografia continua ativada; tente mais tarde.';
	@override String keyEncryptPartial({required Object failed}) => '${failed} arquivos não puderam ser criptografados e continuam sem proteção. Desative e reative a criptografia para concluir.';
	@override String get keyEncryptionOff => 'A criptografia está desativada';
	@override String keyReCipherFailed({required Object error}) => 'Falha na recriptografia: ${error}';
	@override String get keyRemoteEmpty => 'A nuvem está vazia; chave salva';
	@override String get keyProcessing => 'Processando dados remotos';
	@override String get keyPreparing => 'Preparando';
	@override String get keyUnlocked => 'Desbloqueado';
	@override String get keyChangedLocalOnly => 'Senha alterada neste dispositivo; será sincronizada quando a nuvem for desbloqueada';
	@override String keyRemoteProbeFailed({required Object error}) => 'Não foi possível ler a nuvem: ${error}';
	@override String get keyRemoteMismatchTitle => 'A senha não corresponde';
	@override String get keyRemoteMismatchMessage => 'Esta senha não desbloqueia os dados na nuvem. Volte e tente novamente ou redefina a nuvem.';
	@override String get keyConflictTitle => 'Sincronização pausada';
	@override String get keyConflictSubtitle => 'A criptografia da nuvem não corresponde a este dispositivo. Toque para resolver';
	@override String get e2eLocked => 'Bloqueado';
	@override String get keyLockedNotice => 'Os dados na nuvem usam outra senha. A sincronização está pausada.';
	@override String get keyUnlockAction => 'Digite a senha para desbloquear';
	@override String get keyForgotReset => 'Esqueci a senha; redefinir nuvem';
	@override String get keyForgot => 'Esqueceu a senha?';
	@override String get keyChangeAction => 'Alterar senha';
	@override String get keyEnableAction => 'Ativar criptografia';
	@override String get keySkipEncryption => 'Agora não';
	@override String get keyMissingTitle => 'Não foi possível descriptografar a nuvem';
	@override String get keyResetAction => 'Redefinir nuvem';
	@override String get keyResetTitle => 'Redefinir a nuvem?';
	@override String get keyResetMessage => 'Limpa a nuvem; os dados locais são mantidos.';
	@override String get keyResetConfirm => 'Limpar e redefinir';
	@override String get keyWiping => 'Limpando a nuvem';
	@override String keyWiped({required Object count}) => '${count} arquivos apagados';
	@override String keyWipePartial({required Object failed}) => '${failed} arquivos não puderam ser excluídos; tente novamente mais tarde';
	@override String keyWipeFailed({required Object error}) => 'Falha na limpeza: ${error}';
	@override String get keyRemoteDecryptedTitle => 'A nuvem não está criptografada';
	@override String get keyRemoteDecryptedMessage => 'A criptografia está ativada aqui, mas a nuvem está sem proteção. Outro dispositivo pode ter desativado a criptografia ou redefinido a nuvem.';
	@override String get keyRemoteDecryptedEncrypt => 'Criptografar a nuvem com esta senha';
	@override String get keyRemoteDecryptedTurnOff => 'Desativar a criptografia aqui';
	@override String get keyNotNow => 'Agora não';
	@override String get errRemoteDecrypted => 'A nuvem está sem criptografia, mas ela está ativada aqui. Sincronização pausada; resolva nas configurações.';
	@override String get errKeyConflict => 'O servidor usa outra chave, que este dispositivo não consegue abrir. A sincronização foi interrompida para não sobrescrever o arquivo de chaves.';
	@override String get lanReceiveHint => 'Normalmente o remetente encontra este dispositivo sozinho; o endereço acima também pode ser digitado manualmente. Mantenha esta página aberta durante o recebimento.';
	@override String get errKeyfileCorrupt => 'O arquivo de chaves remoto está corrompido (não é um objeto JSON)';
	@override String get errKeyfileKdfMissing => 'O arquivo de chaves remoto está corrompido (parâmetros KDF ausentes)';
	@override String get errKeyfileKdfRange => 'Os parâmetros KDF do arquivo de chaves estão fora do intervalo permitido';
	@override String errKeyfileParse({required Object error}) => 'Não foi possível interpretar o arquivo de chaves: ${error}';
	@override String get errKeyfileFields => 'O arquivo de chaves remoto está corrompido (campos ausentes)';
	@override String errKeyfileVersion({required Object version, required Object supported}) => 'O arquivo de chaves é muito recente (v${version}; esta versão aceita até v${supported}). Atualize o aplicativo.';
	@override String errManifestVersion({required Object remote, required Object local}) => 'Versão do backup incompatível: dados v${remote}, este dispositivo aceita v${local}. Abra com uma versão compatível em vez de sobrescrever';
	@override String get errManifestEntriesCorrupt => 'O campo de entradas do manifesto está corrompido (não é um objeto); operação interrompida para evitar perdas';
	@override String get errDecryptFailed => 'Não foi possível descriptografar — a chave pode não corresponder';
	@override String get errManifestCorrupt => 'O manifesto remoto está corrompido (não é um objeto JSON). A sincronização foi interrompida para evitar perdas.';
	@override String get errManifestReCipher => 'O manifesto remoto está malformado e não pode ser recriptografado';
	@override String get errManifestRace => 'Outro dispositivo sobrescreveu o manifesto durante a gravação; recriptografia interrompida';
	@override String get errManifestRacePush => 'Outro dispositivo sobrescreveu o manifesto durante a gravação; envio interrompido. Nada foi danificado local ou remotamente — tente novamente.';
	@override String get errKeyfileOwnerUnknown => 'Não foi possível identificar o proprietário do arquivo de chaves (manifesto ilegível ou corrompido). Sincronização interrompida para não sobrescrevê-lo.';
	@override String get errKeyfileNoLocalCache => 'Este dispositivo não tem um arquivo de chaves em cache (keys.json), portanto não pode inicializar um servidor criptografado. Redefina a senha no gerenciamento de chaves.';
	@override String errMediaNameInvalid({required Object name}) => 'Nome de mídia inválido; entrada ignorada: ${name}';
	@override String get errNotBackup => 'Não é um arquivo de backup do Moodiary/Dream Diary';
	@override String get errLegacyBackup => 'Este backup foi criado antes da versão 2.8.0 e não pode ser importado. Restaure-o na versão antiga primeiro e depois atualize.';
	@override String errBackupParse({required Object error}) => 'Não foi possível interpretar o backup: ${error}';
	@override String get errNotReceiver => 'Esse dispositivo não é um receptor Moodiary/Dream Diary';
	@override String errVersionMismatchDetail({required Object sender, required Object receiver}) => 'Versões incompatíveis: origem ${sender}, destino ${receiver}. Use a mesma versão do Dream Diary/Moodiary nos dois dispositivos';
	@override String get errReceiverOffline => 'O outro dispositivo não está recebendo. Verifique se a página Receber está aberta.';
	@override String get errS3Config => 'Conclua a configuração do S3 primeiro';
	@override String get errWebdavConfig => 'Conclua a configuração do WebDAV primeiro';
	@override String get errWrongKeyPassword => 'Senha incorreta — não foi possível desbloquear o arquivo de chaves';
	@override String errKdf({required Object error}) => 'Falha na derivação da chave: ${error}';
	@override String get errLocked => 'Outro dispositivo está sincronizando — tente novamente em instantes';
	@override String get errMediaUpload => 'Alguns arquivos de mídia não foram enviados; esta entrada foi ignorada';
	@override String get errNoUserKey => 'Os arquivos remotos estão criptografados, mas nenhuma chave do usuário foi configurada';
	@override String errReadRemote({required Object key, required Object error}) => 'Não foi possível ler o objeto remoto (${key}): ${error}';
	@override String errCreateRemote({required Object key, required Object error}) => 'Não foi possível criar o objeto remoto (${key}): ${error}';
	@override String get errNoBackend => 'Nenhum serviço de sincronização configurado';
	@override String get errManifestBroken => 'O manifesto remoto está malformado';
	@override String uploading({required Object backend}) => 'Enviando / exportando: ${backend}';
	@override String downloading({required Object backend}) => 'Baixando / importando: ${backend}';
	@override String syncing({required Object backend}) => 'Sincronizando: ${backend}';
	@override String pendingSummary({required Object parts}) => 'Recebendo da nuvem: ${parts}';
	@override String pendingNew({required Object count}) => '${count} para baixar';
	@override String pendingUpdate({required Object count}) => '${count} para atualizar';
	@override String get warnRemoteEmpty => 'O servidor está vazio — nada foi enviado ainda';
	@override String warnFailedSkipped({required Object count}) => '${count} itens falharam e foram ignorados';
	@override String warnMediaFailed({required Object count}) => '${count} arquivos de mídia não puderam ser baixados; imagens ou áudios podem estar ausentes';
	@override String get warnStopped => 'Interrompido por você — o restante continuará na próxima sincronização';
	@override String warnFailedCount({required Object count}) => '${count} falharam';
	@override String reCipherSummary({required Object diary, required Object category, required Object media, required Object ms}) => '${diary} entradas + ${category} categorias + ${media} arquivos (${ms} ms)';
	@override String reCipherFailedSuffix({required Object base, required Object failed}) => '${base}\n${failed} objetos falharam e foram ignorados';
	@override String get stepPrepare => 'Preparando';
	@override String stepDiary({required Object id}) => 'Entrada ${id}';
	@override String stepCategory({required Object id}) => 'Categoria ${id}';
	@override String stepPlace({required Object id}) => 'Lugar ${id}';
	@override String stepMediaInfo({required Object id}) => 'Registro de mídia ${id}';
	@override String stepMedia({required Object ref}) => 'Mídia ${ref}';
	@override String get stepManifest => 'Gravando o manifesto';
	@override String get statusPartial => 'Sincronização incompleta';
	@override String get summaryUpToDate => 'Nada para sincronizar';
	@override String summaryUploadedDiaries({required Object count}) => '${count} entradas enviadas';
	@override String summaryUploadedCategories({required Object count}) => '${count} categorias enviadas';
	@override String summaryDownloadedDiaries({required Object count}) => '${count} entradas recebidas';
	@override String summaryDownloadedCategories({required Object count}) => '${count} categorias recebidas';
	@override String summaryMedia({required Object count}) => '${count} arquivos de mídia';
	@override String get lanAuthLocked => 'Muitos códigos incorretos. Esta sessão foi bloqueada — inicie o recebimento novamente para obter outro código.';
	@override String errWriteRemote({required Object key, required Object error}) => 'Falha ao gravar o objeto remoto (${key}): ${error}';
	@override String errDeleteRemote({required Object key, required Object error}) => 'Falha ao excluir o objeto remoto (${key}): ${error}';
	@override String errListRemote({required Object error}) => 'Falha ao listar objetos remotos: ${error}';
	@override String errStatRemote({required Object key, required Object error}) => 'Falha ao consultar o objeto remoto (${key}): ${error}';
	@override String errBucketMissing({required Object bucket}) => 'O bucket “${bucket}” não existe';
	@override String syncingAuto({required Object backend}) => 'Sincronização automática: ${backend}';
	@override String get triggerManual => 'manual';
	@override String get triggerChange => 'alteração';
	@override String get triggerClose => 'entrada fechada';
	@override String get triggerPoll => 'consulta periódica';
	@override String get triggerResume => 'retomada';
	@override String get triggerNetwork => 'conexão restaurada';
	@override String elapsedSeconds({required Object seconds}) => '${seconds} s';
	@override String pendingLocal({required Object count}) => '${count} entradas aguardando envio';
	@override String get healthConnected => 'Conectado';
	@override String healthUnreachable({required Object backend}) => 'Não foi possível acessar ${backend}';
	@override String get healthAuthFailed => 'Nome de usuário ou senha não funciona mais';
	@override String get healthKeyConflict => 'A chave remota difere deste dispositivo';
	@override String get healthUnreachableShort => 'inacessível';
	@override String get healthAuthFailedShort => 'credenciais rejeitadas';
	@override String get healthKeyConflictShort => 'conflito de chave';
	@override String healthSince({required Object time}) => 'desde ${time}';
	@override String autoSyncSubtitleDetail({required Object interval}) => 'Envia alguns segundos após fechar uma entrada; consulta outros dispositivos a cada ${interval}';
	@override String get reasonRecovered => 'Servidor acessível novamente';
	@override String get logFilterProblems => 'Somente problemas';
	@override String get logRunStopped => 'Interrompida';
	@override String get logRunFailed => 'Falhou';
	@override String get logRunPartial => 'Incompleta';
	@override String get logRunUpToDate => 'Atualizado';
	@override String get directionSync => 'Sincronizar';
	@override String elapsedMillis({required Object ms}) => '${ms} ms';
	@override String get consoleTitle => 'Sincronização';
	@override String autoSyncEvery({required Object interval}) => 'Sincronização automática · a cada ${interval}';
	@override String get autoSyncOff => 'Sincronização automática desativada';
	@override String nextPollIn({required Object minutes, required Object seconds}) => 'em ${minutes} min ${seconds} s';
	@override String nextPollInSeconds({required Object seconds}) => 'em ${seconds} s';
	@override String remoteCount({required Object count}) => '${count} no servidor';
	@override String get logHealth => 'Conexão';
	@override String lastSuccess({required Object time}) => 'último sucesso ${time}';
}

// Path: ui
class _Translations$ui$pt_BR extends Translations$ui$zh {
	_Translations$ui$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get imageBrowserSave => 'Salvar na galeria';
	@override String get imageBrowserSaved => 'Salvo na galeria';
	@override String get imageBrowserSaveFailed => 'Falha ao salvar';
	@override String get imageBrowserInfo => 'Informações da imagem';
	@override String get imageBrowserInfoUrl => 'URL';
	@override String get imageBrowserInfoResolution => 'Resolução';
	@override String get imageBrowserInfoSize => 'Tamanho';
	@override String get imageBrowserInfoFormat => 'Formato';
	@override String get imageBrowserInfoDecode => 'Decodificação';
	@override String get imageBrowserDecodeTiled => 'Por blocos (região visível sob demanda)';
	@override String get imageBrowserDecodeTiledBaseline => 'Por blocos (via cópia de referência)';
	@override String get imageBrowserDecodeWhole => 'Imagem inteira (lado maior limitado a 4096)';
	@override String get imageBrowserDecodeWholeProgressive => 'Imagem inteira (JPEG progressivo até 4096, sem blocos)';
	@override String get imageBrowserInfoModified => 'Modificado';
	@override String get videoPlayerLoadFailed => 'Não foi possível carregar este vídeo';
	@override String get play => 'Reproduzir';
	@override String get pause => 'Pausar';
	@override String get playbackProgress => 'Progresso da reprodução';
	@override String get videoPlayerReplay => 'Repetir';
	@override String get videoPlayerBrightness => 'Brilho';
	@override String get videoPlayerVolume => 'Volume';
	@override String videoPlayerSpeedBoost({required Object speed}) => 'Reproduzindo a ${speed}×';
}

// Path: editor.toolbar
class _Translations$editor$toolbar$pt_BR extends Translations$editor$toolbar$zh {
	_Translations$editor$toolbar$pt_BR._(TranslationsPtBr root) : this._root = root, super.internal(root);

	final TranslationsPtBr _root; // ignore: unused_field

	// Translations
	@override String get insert => 'Inserir';
	@override String get format => 'Formatar';
	@override String get task => 'Tarefa';
	@override String get image => 'Imagem';
	@override String get link => 'Link';
	@override String get diaryLink => 'Link de entrada';
	@override String get showKeyboard => 'Mostrar teclado';
	@override String get hideKeyboard => 'Ocultar teclado';
	@override String get bold => 'Negrito';
	@override String get italic => 'Itálico';
	@override String get underline => 'Sublinhado';
	@override String get strike => 'Tachado';
	@override String get highlight => 'Realce';
	@override String get inlineCode => 'Código inline';
	@override String get paragraph => 'Texto';
	@override String get bulletList => 'Marcadores';
	@override String get orderedList => 'Numeração';
	@override String get taskList => 'Tarefas';
	@override String get outdent => 'Diminuir recuo';
	@override String get indent => 'Aumentar recuo';
	@override String get quote => 'Citação';
	@override String get codeBlock => 'Bloco de código';
	@override String get clearFormat => 'Limpar formatação';
	@override String get mediaAndFiles => 'Mídia e arquivos';
	@override String get blocks => 'Blocos';
	@override String get gallery => 'Fotos';
	@override String get camera => 'Câmera';
	@override String get video => 'Vídeo';
	@override String get record => 'Gravar';
	@override String get audio => 'Áudio';
	@override String get attachment => 'Arquivo';
	@override String get table => 'Tabela';
	@override String get divider => 'Divisor';
	@override String get view => 'Exibição';
	@override String get width => 'Largura';
	@override String get originalSize => 'Tamanho original';
	@override String get original => 'Original';
	@override String get moveUp => 'Mover para cima';
	@override String get moveDown => 'Mover para baixo';
	@override String get delete => 'Excluir';
	@override String get open => 'Abrir';
	@override String get rename => 'Renomear';
	@override String get style => 'Estilo';
	@override String get dividerSolid => 'Sólido';
	@override String get dividerDashed => 'Tracejado';
	@override String get dividerDotted => 'Pontilhado';
	@override String get dividerDouble => 'Duplo';
	@override String get dividerWavy => 'Ondulado';
	@override String get dividerText => 'Com texto';
	@override String get dividerLabel => 'Texto do divisor';
	@override String get tableAddRow => 'Adicionar linha';
	@override String get tableDeleteRow => 'Excluir linha';
	@override String get tableAddColumn => 'Adicionar coluna';
	@override String get tableDeleteColumn => 'Excluir coluna';
	@override String get tableMenu => 'Tabela';
	@override String get tableHeaderRow => 'Linha de cabeçalho';
	@override String get tableDelete => 'Excluir tabela';
	@override String get copyCode => 'Copiar código';
	@override String get exitCode => 'Sair do bloco de código';
	@override String get openLink => 'Abrir link';
	@override String get copyLink => 'Copiar link';
	@override String get editLink => 'Editar link';
	@override String get removeLink => 'Remover link';
	@override String get addLinkTitle => 'Adicionar link';
	@override String get editLinkTitle => 'Editar link';
	@override String get linkText => 'Texto';
	@override String get linkUrl => 'URL';
	@override String get undo => 'Desfazer';
	@override String get redo => 'Refazer';
	@override String get find => 'Localizar';
	@override String get findHint => 'Localizar';
	@override String get replaceHint => 'Substituir por';
	@override String get replace => 'Substituir';
	@override String get replaceAll => 'Substituir tudo';
	@override String get toggleReplace => 'Substituir';
	@override String get previousMatch => 'Anterior';
	@override String get nextMatch => 'Próxima';
	@override String get closeFind => 'Fechar pesquisa';
	@override String matchCount({required Object current, required Object total}) => '${current}/${total}';
	@override String get settingsTitle => 'Barra de ferramentas do editor';
	@override String get resetDefault => 'Redefinir';
	@override String get preview => 'Prévia';
	@override String get shownSection => 'Barra de ferramentas';
	@override String get availableSection => 'Disponíveis';
	@override String get removeTools => 'Remover ferramentas';
	@override String selectedCount({required Object count}) => '${count} selecionadas';
	@override String get remove => 'Remover';
	@override String get addToToolbar => 'Adicionar à barra';
	@override String get attachmentFailed => 'Não foi possível salvar o arquivo';
	@override String get openFailed => 'Nenhum aplicativo pode abrir este arquivo';
	@override String get insertFailed => 'Não foi possível inserir';
}
