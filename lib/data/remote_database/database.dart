import 'package:supabase_flutter/supabase_flutter.dart';

class RemoteDatabase {
  RemoteDatabase(this._client);

  final SupabaseClient _client;

  Future<bool> create({
    required String tableName,
    required Map<String, dynamic> fieldAndValue,
  }) async {
    await _client.from(tableName).insert(fieldAndValue);

    return true;
  }

  Future<Map<String, dynamic>> createAndSelect({
    required String tableName,
    required Map<String, dynamic> fieldAndValue,
  }) async {
    // TODO(Mujhtech): Exception list<dynamic> is not type of map<String, dynamic>
    final Map<String, dynamic> res = await _client
        .from(tableName)
        .insert(fieldAndValue)
        .select<Map<String, dynamic>>();

    return res;
  }

  Future<bool> upsert({
    required String tableName,
    required Map<String, dynamic> fieldAndValue,
  }) async {
    await _client
        .from(tableName)
        .upsert(fieldAndValue)
        .select<Map<String, dynamic>>();

    return true;
  }

  Future<Map<String, dynamic>> upsertAndSelect({
    required String tableName,
    required Map<String, dynamic> fieldAndValue,
  }) async {
    final Map<String, dynamic> res = await _client
        .from(tableName)
        .upsert(fieldAndValue)
        .select<Map<String, dynamic>>();

    return res;
  }

  Future<Map<String, dynamic>> selectSingle({
    required String tableName,
    required String key,
    required String value,
  }) async {
    final Map<String, dynamic> res = await _client
        .from(tableName)
        .select<Map<String, dynamic>>()
        .eq(key, value);

    return res;
  }

  Future<List<Map<String, dynamic>>> selectAllWith({
    required String tableName,
    required String key,
    required String? value,
    int limit = 10,
    required String? orderBy,
    bool ascending = false,
    bool nullsFirst = false,
  }) async {
    PostgrestTransformBuilder<List<Map<String, dynamic>>> query = _client
        .from(tableName)
        .select<List<Map<String, dynamic>>>()
        .eq(key, value)
        .limit(limit);

    if (orderBy != null) {
      query =
          query.order(orderBy, ascending: ascending, nullsFirst: nullsFirst);
    }

    final List<Map<String, dynamic>> res = await query;

    return res;
  }

  Future<bool> delete({
    required String tableName,
    required Map<String, dynamic> fieldAndValue,
  }) async {
    await _client.from(tableName).delete().match(fieldAndValue);

    return true;
  }
}
