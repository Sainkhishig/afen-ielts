import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_database/firebase_database.dart';

final studentCommentPageController =
    StateNotifierProvider<StudentCommentPageController, String>(
        (ref) => StudentCommentPageController(ref: ref));
final _database = FirebaseDatabase.instance.reference();

class StudentCommentPageController extends StateNotifier<String> {
  //#region ==================== local variable ====================
  final StateNotifierProviderRef ref;
  //#endregion ==================== local variable ====================
  void setModelListenable(WidgetRef ref) {}

  //#region ==================== constructor ====================
  StudentCommentPageController({required this.ref}) : super("");
  //#endregion ==================== constructor ====================

  //#region ==================== accessor ====================
  String? get facility => state;

  //#endregion ==================== accessor ====================

  //#region ==================== method ====================
  // clearState() => state = const KanjiTestState();

  Future<String?> getCancellationPolicyDetail(String uniqueId) async {
    // final response = await ref
    //     .read(facilityApiProvider)
    //     .gqlGetCancellationPolicyDetail(uniqueId);

    // if (response == null) return null;
    // state = response;

    return state;
  }

  //#endregion ---------- facility ----------
  //#region ---------- save ----------
  Future<bool> save() async {
    try {
      String query = r'''
         mutation saveFacilityPlan($facilityId:ID!,$input: FacilityPlanInput) {
          saveFacilityPlan: saveFacilityPlan(facilityId:$facilityId,
          input: $input
          ) {
            id
        facilityId
        checkInStartTime
        lastModifiedDate
          }
        }
      ''';

      // final response = await GraphqlClient().executeMutationByOption(options);

      return true;
    } catch (e) {
      // TODO: INTERNAL_ERROR, NOT_FOUND
      print(e);
      return false;
    }
  }

  void update() {
    var _todoQuery = _database.child("/category");
    _todoQuery.child("/-MqqasF6kB1Bszz3TtvU").set({
      'age': '29',
      'email': 'updari.ariuka67@gmail.com',
      'mobile': '07083539202',
      'name': 'Sainkhishig Ariunaa',
      'time': DateTime.now().microsecondsSinceEpoch
    });
  }

  //#endregion ---------- save ----------
  //#endregion ==================== method ====================
}
