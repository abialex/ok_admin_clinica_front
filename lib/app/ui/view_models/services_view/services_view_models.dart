class SunatPersonaViewModel {
  final String nombres;
  final String apellidoPaterno;
  final String apellidoMaterno;
  final String tipoDocumento;
  final String numeroDocumento;
  final String digitoVerificador;

  const SunatPersonaViewModel({
    required this.tipoDocumento,
    required this.nombres,
    required this.apellidoPaterno,
    required this.apellidoMaterno,
    required this.numeroDocumento,
    required this.digitoVerificador,
  });

  @override
  String toString() {
    return "$nombres $apellidoPaterno $apellidoMaterno";
  }
}
