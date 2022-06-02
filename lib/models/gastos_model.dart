class GastosModel {
  const GastosModel({
    this.combustible = '',
    this.combustiblecosto = 0,
    this.combustiblecantidad = 0,
    this.peaje = '',
    this.peajecosto = 0,
    this.noveda = '',
    this.hospedaje = '',
    this.date = '',
    this.hospedajecosto = 0,
  });
  final String hospedaje;
  final String date;
  final int hospedajecosto;
  final String combustible;
  final int combustiblecosto;
  final int combustiblecantidad;
  final String peaje;
  final int peajecosto;
  final String noveda;
}
