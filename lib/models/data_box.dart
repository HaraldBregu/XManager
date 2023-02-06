
enum DataBoxType {
  none,
  actions,
  weather,
  players,
  programs,
}

class DataBox {
  DataBoxType type;
  bool active;

  DataBox(this.type, this.active);
}
