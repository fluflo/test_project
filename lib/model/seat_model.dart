class SeatModel {
  SeatModel({
    String? section,
    int? row,
    int? seat,
  }) {
    _section = section;
    _row = row;
    _seat = seat;
  }

  SeatModel.fromJson(dynamic json) {
    _section = json['section'];
    _row = json['row'];
    _seat = json['seat'];
  }
  String? _section;
  int? _row;
  int? _seat;
  SeatModel copyWith({
    String? section,
    int? row,
    int? seat,
  }) =>
      SeatModel(
        section: section ?? _section,
        row: row ?? _row,
        seat: seat ?? _seat,
      );
  String? get section => _section;
  int? get row => _row;
  int? get seat => _seat;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['section'] = _section;
    map['row'] = _row;
    map['seat'] = _seat;
    return map;
  }
}