# Dream Diary

Dream Diary é um fork independente do [Moodiary](https://github.com/ZhuJHua/moodiary), mantido em
[Yutinha-is-cute/Dream-Diary](https://github.com/Yutinha-is-cute/Dream-Diary).
O aplicativo continua sendo o Moodiary real: diário, editor rich text, mídia, bloqueio,
exportação/importação/backup, WebDAV/S3/LAN, IA/embeddings, mapas, clima, estatísticas e grafo.
Não é uma demonstração nem uma reescrita. Créditos e licença AGPL-3.0 do projeto original permanecem.

## Identidade e compatibilidade

- Nome visível, logo, splash e ícones: **Dream Diary**.
- Idiomas: português do Brasil, English e 简体中文. As fontes ficam em `i18n/flutter/`,
  `packages/foundation/mui/lib/src/i18n/` e no editor; os Dart locais são gerados pelo slang oficial.
- Identificadores internos `moodiary_*`, applicationId `cn.yooss.moodiary`, banco Drift/migrações,
  chaves MMKV, protocolos/portas/caminhos remotos e formatos de backup não foram renomeados.
- A atividade Android `.MainActivity` continua exportada para deep links, compartilhamento e intents antigos.
  Os aliases de launcher não alteram esses contratos.

## Ícone na tela inicial

Em **Configurações → Exibição → Ícone na tela inicial**:

1. Escolha **Dream**, **Monocromático** ou **Ameixa**. A troca habilita exatamente um
   `activity-alias` real via `PackageManager`; no Android 13+ a troca é atômica.
2. A preferência só é salva depois do sucesso nativo. Na abertura da tela, o estado real do
   PackageManager é reconciliado com a preferência.
3. **Restaurar ícone Dream** volta ao preset padrão.
4. Para uma foto própria, use **Criar atalho personalizado**. A imagem é decodificada com limite
   de 20 MB/1024 px, ajustada por arraste/zoom, recortada em 512 px e salva como PNG privado.
   O original nunca é alterado nem excluído. O Android pede confirmação ao launcher para fixar.

**Limite da plataforma:** uma imagem arbitrária da galeria não pode substituir o ícone principal
em todos os launchers. Por isso, foto própria é um **atalho adicional**, não a entrada principal.
Alguns launchers não aceitam fixação, aplicam sua própria máscara/estilo ou mantêm atalhos antigos.
A prévia circular/monocromática é aproximada; os presets têm camadas adaptive/monochrome reais.
Atalhos antigos do Moodiary podem precisar ser adicionados novamente após a atualização do fork.
Remover o atalho pelo app desativa o shortcut e apaga somente a cópia privada; o launcher também
pode remover o atalho manualmente. Desinstalar/limpar dados remove as cópias privadas.

Arquivos principais: `MainActivity.kt`, `AndroidManifest.xml`, recursos `mipmap/drawable`,
`mobile/lib/app/settings/presentation/personalization/`, `tools/dream_diary_brand.py`.

## Tema musical

Em **Configurações → Tema musical** (Android):

1. Adicione um ou vários arquivos pelo seletor de documentos (MP3, M4A, AAC, OGG, Opus, FLAC,
   WAV, WebM; até 200 MB por arquivo). Cancelar o seletor não altera a playlist.
2. O app faz **cópias privadas duráveis** em `applicationSupport/dream_diary/music/`, com manifesto
   JSON versionado e gravação atômica. Não depende de URI SAF/cache nem altera os originais.
3. Use reproduzir/pausar/parar, anterior/próxima, posição, volume, aleatório e repetição
   (desativada/todas/uma). Título/artista/álbum/duração vêm do parser de metadados existente quando disponíveis.
4. Faixas ausentes/corrompidas são sinalizadas; podem ser removidas ou adicionadas novamente.
   Remover exclui apenas a cópia privada. Arquivos corrompidos não são “consertados” silenciosamente.

Persistem: ativação, segundo plano, aleatório, repetição, volume, faixa, posição e playlist.
**Não há autoplay ao restaurar.** Um único `just_audio`/`audio_service` owns a reprodução.
O foco de áudio do Android e uma coordenação explícita pausam a música ao iniciar gravação ou áudio do diário.

- **Segundo plano desativado (padrão):** pausa quando o app vai para segundo plano.
- **Ativado:** serviço foreground `mediaPlayback` com notificação/controles de mídia e wake lock.
  Permissões adicionadas: `WAKE_LOCK`, `FOREGROUND_SERVICE`, `FOREGROUND_SERVICE_MEDIA_PLAYBACK`.
  Não adiciona acesso amplo a armazenamento nem pedido de notificação supérfluo.
- Pausar retira o foreground; remover o app dos recentes ou dispensar a notificação para a reprodução.
  O sistema pode encerrar processos em segundo plano; não prometemos reprodução após force-stop.
- Cópias musicais ficam fora dos diretórios de mídia do diário e **não entram em export/backup/sync**.
  Limpar dados do app/remove o app as apaga; “resetar dados” do diário não foi ampliado para apagar música.

Arquivos principais: `packages/feature/moodiary_music/`, `mobile/lib/app/settings/presentation/music/`,
`mobile/lib/app/picker/mobile_file_picker.dart`, `MediaPlaybackCoordinator`, bootstrap/lifecycle e manifesto Android.

## Preferências persistidas

Novas chaves MMKV aditivas (sem migração destrutiva): `launcherIcon`, `musicEnabled`,
`musicBackground`, `musicShuffle`, `musicRepeat`, `musicVolume`, `musicIndex`, `musicPositionMs`.
O idioma pt-BR usa a preferência `language` existente. Playlist: `dream_diary/music/playlist.json`.
Cópia do atalho: `dream_diary/launcher/shortcut.png`.

## Validação e build

A branch de trabalho possui `.github/workflows/dream-diary-validation.yml` (push/manual, sem release):
bootstrap Pub, geradores slang, commit dos fontes gerados na própria branch, checks de camadas/gerados,
analyze/testes Flutter, Clippy/testes dos seis crates Rust, type-check/test/build do editor e APK ARM64.
O APK de CI usa assinatura local de debug quando não há credenciais de release; **não é uma release
publicada** e não pode atualizar por cima de uma instalação assinada com outra chave.

Toolchain oficial: Flutter 3.47.8, Rust 1.99.1, JDK 21, Android SDK 36/NDK r28c, Node 24/pnpm 11.6.0.
Comando documentado: `dart tool/task.dart gen`, `dart tool/task.dart analyze`,
`dart tool/task.dart test --all`, e em `mobile/`:
`flutter build apk --flavor production --release --target-platform android-arm64 --obfuscate --split-debug-info=splitMap`.

Resultados reais e artefatos devem ser consultados na execução da branch; não há promessa de teste
em dispositivo físico aqui. iOS foi atualizado nos recursos/plist, mas a validação Xcode/assinatura
permanece pendente em macOS. Consulte o relatório final da entrega para o estado exato do CI/APK.
