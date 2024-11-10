import 'package:inthon_front/app/data/service/storage/base_storage.dart';

const accessTokenKey = "\$@__Acce55_T0ken__\$";

class TokenStorage extends BaseStorage {
  TokenStorage(super.storage);

  Future<({String accessToken})?> getTokens() async {
    final accessToken = await read(accessTokenKey);
    if (accessToken == null) return null;
    return (accessToken: accessToken);
  }

  Future<void> saveTokens({
    required String accessToken,
  }) async {
    await write(accessTokenKey, accessToken);
  }

  Future<void> deleteTokens() async {
    await delete(accessTokenKey);
  }
}
