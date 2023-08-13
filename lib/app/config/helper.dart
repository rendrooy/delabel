class Messages {
  Messages._();

  static const String SUCCESS = 'SUCCESS';
  static const String FAILED = 'FAILED';
  static const String LOGIN_FAILED = 'LOGIN_FAILED';
  static const String ACCOUNT_NOT_FOUND = 'ACCOUNT_NOT_FOUND';

  static String? helper(String value) {
    if (value == SUCCESS) {
      return 'Berhasil';
    }
    if (value == FAILED) {
      return 'Gagal';
    }
    if (value == LOGIN_FAILED) {
      return 'Login Gagal';
    }
    if (value == ACCOUNT_NOT_FOUND) {
      return 'Akun Tidak Terdaftar';
    }
    return null;
  }
}

class AdminSetting {
  AdminSetting._();

  static const String SUCCESS = 'SUCCESS';
  static const String FAILED = 'FAILED';
  static const String LOGIN_FAILED = 'LOGIN_FAILED';
  static const String ACCOUNT_NOT_FOUND = 'ACCOUNT_NOT_FOUND';

  static String? helper(String value) {
    if (value == SUCCESS) {
      return 'Berhasil';
    }
    if (value == FAILED) {
      return 'Gagal';
    }
    if (value == LOGIN_FAILED) {
      return 'Login Gagal';
    }
    if (value == ACCOUNT_NOT_FOUND) {
      return 'Akun Tidak Terdaftar';
    }
    return null;
  }
}
