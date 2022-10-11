import 'package:built_collection/built_collection.dart';
import 'package:esenin_family/shared/api/esenin_family_client.dart';
import 'package:esenin_family_client/esenin_family_client.dart';

class PubModel {
  late BuiltList<Pub> pubs;
  final client = createEseninFamilyApi();

  Future<BuiltList<Pub>> getList() async {
    final response = await client.pubList();

    return response.data ?? BuiltList<Pub>([]);
  }
}
