import 'package:inthon_front/app/data/enum/auth_result_type.dart';

class AuthResult {
  final AuthResultType type;
  final String? oidToken;

  AuthResult(this.type, {this.oidToken});

  factory AuthResult.success() => AuthResult(AuthResultType.success);
  factory AuthResult.serverFail() => AuthResult(AuthResultType.serverFail);
  factory AuthResult.googleFail() => AuthResult(AuthResultType.googleFail);

  @override
  String toString() {
    return '결과: ${type.toString().split('.').last},  OID 토큰: ${oidToken ?? "없음"}';
  }
}
