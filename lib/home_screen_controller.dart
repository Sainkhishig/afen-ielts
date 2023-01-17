// import 'package:afen_ielts/common/function/read_xl_logic.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeScreenController =
    StateNotifierProvider<HomeScreenController, String>(
        (ref) => HomeScreenController(ref: ref));

class HomeScreenController extends StateNotifier<String> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================

  //#region ==================== constructor ====================
  HomeScreenController({required this.ref}) : super("ss");
  //#endregion ==================== constructor ====================

  //#endregion ---------- get ----------

  //#region ---------- save ----------
  // Future<void> loadKanji() async => await readKanji(ref);
  // Future<void> loadGrammar() async => await readGrammar(ref);
  // Future<void> loadVocabulary() async => await readVocabulary(ref);

  //#endregion ---------- save ----------

  //#endregion ==================== method ====================
}
