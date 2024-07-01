class ProveedorModel {
  String? nombre;
  String? razonSocial;
  String? direccion;

  ProveedorModel({
    this.nombre,
    this.razonSocial,
    this.direccion,
  });

  ProveedorModel.fromJson(Map<String, dynamic> json) {
    nombre = json["nombre"];
    razonSocial = json["razonSocial"];
    direccion = json["direccion"];
  }

  Map<String, dynamic> toJson() =>
      {"nombre": nombre, "razonSocial": razonSocial, "direccion": direccion};
}
