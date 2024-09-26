class FilterModel {
  int page;
  int size;
  String? name;
  String? code;
  DateTime? date;
  String? parameter;
  String? parameter2;
  String? celular;
  String? tradeName;
  int? personTypeId; //juridica, natural, natural con negocio
  int? tipoCliente;
  String? orderBy;
  bool ascending;
  int? category;
  int? ubicacionId;
  int productCategory;
  int almacen;
  FilterModel({
    this.page = 1,
    this.size = 10,
    this.name,
    this.code,
    this.date,
    this.parameter,
    this.parameter2,
    this.orderBy,
    this.ascending = true,
    this.category,
    this.productCategory = 0,
    this.almacen = 0,
    this.celular,
    this.tradeName,
    this.personTypeId,
    this.ubicacionId,
  });
}
