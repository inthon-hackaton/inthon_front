import 'package:inthon_front/app/data/service/storage/base_storage.dart';

const accessTokenKey = "\$@__Acce55_T0ken__\$";
const refreshTokenKey = "\$@__ReFr35h_T0ken__\$";

class TokenStorage extends BaseStorage {
  TokenStorage(super.storage);

  Future<({String accessToken, String refreshToken})?> getTokens() async {
    final accessToken = await read(accessTokenKey);
    final refreshToken = await read(refreshTokenKey);
    if (accessToken == null || refreshToken == null) return null;
    return (
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await write(accessTokenKey, accessToken);
    await write(refreshTokenKey, refreshToken);
  }

  Future<void> deleteTokens() async {
    await delete(accessTokenKey);
    await delete(refreshTokenKey);
  }
}
