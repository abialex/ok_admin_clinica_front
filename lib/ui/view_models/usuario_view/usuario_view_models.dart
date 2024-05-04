class UsuarioAuthenticatedViewModel {
  final String mensaje;
  final bool isValido;

  UsuarioAuthenticatedViewModel({
    required this.mensaje,
    required this.isValido,
  });
}

class UsuarioLoginResponseViewModel {
  final int userId;
  final bool isNewToken;
  final int diasToken;
  final String nombres;
  final String token;
  final String rol;
  final String username;
  final String? tipo;

  UsuarioLoginResponseViewModel({
    required this.userId,
    required this.isNewToken,
    required this.diasToken,
    required this.nombres,
    required this.token,
    required this.rol,
    required this.username,
    this.tipo,
  });
}

class UsuarioLoginRequestViewModel {
  final String username;
  final String password;

  UsuarioLoginRequestViewModel({
    required this.username,
    required this.password,
  });
}
