class TeamModel {
  TeamModel({
    String? name,
    String? logoAssetName,
  }) {
    _name = name;
    _logoAssetName = logoAssetName;
  }

  TeamModel.fromJson(dynamic json) {
    _name = json['name'];
    _logoAssetName = json['logoAssetName'];
  }
  String? _name;
  String? _logoAssetName;
  TeamModel copyWith({
    String? name,
    String? logoAssetName,
  }) =>
      TeamModel(
        name: name ?? _name,
        logoAssetName: logoAssetName ?? _logoAssetName,
      );
  String? get name => _name;
  String? get logoAssetName => _logoAssetName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['logoAssetName'] = _logoAssetName;
    return map;
  }
}