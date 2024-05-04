class LocalUsuarioViewModel {
  final int userId;
  final bool isNewToken;
  final int diasToken;
  final String nombres;
  final String token;
  final String rol;
  final String username;
  final String? tipo;

  const LocalUsuarioViewModel({
    required this.userId,
    required this.username,
    required this.nombres,
    required this.token,
    required this.isNewToken,
    required this.rol,
    required this.diasToken,
    this.tipo,
  });
}
