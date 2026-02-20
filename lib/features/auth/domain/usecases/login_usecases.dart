class LoginUseCase {
  bool execute({
    required String username,
    required String password,
  }) {
    if (username == "veena@tcs.com" && password == "tcs123") {
      return true;
    }
    return false;
  }
}