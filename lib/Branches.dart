class Branches {
  String _shop_name;
  int _id;
  int _tel;
  double _lat;
  double _lng;
  String _manager;

  Branches(this._shop_name, this._id, this._tel, this._lat, this._lng,
      this._manager);

  String get manager => _manager;

  double get lng => _lng;

  double get lat => _lat;

  int get tel => _tel;

  int get id => _id;

  String get shop_name => _shop_name;
}