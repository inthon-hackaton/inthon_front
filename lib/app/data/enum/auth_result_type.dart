enum AuthResultType {
  success(true),
  serverFail(false, errorMessage: "예기치 않은 오류가 발생했습니다."),
  googleFail(false, errorMessage: "구글 로그인에 실패했습니다.");

  final bool isSucceed;
  final String? errorMessage;

  const AuthResultType(this.isSucceed, {this.errorMessage});
}
