class MbChar {
  String cyr;
  String lat;
  String mbChar;
  String mbUni;
  String tunChar;
  String tunUni;
  String huis;
  String type;

  MbChar(
      {this.cyr,
        this.lat,
        this.mbChar,
        this.mbUni,
        this.tunChar,
        this.tunUni,
        this.huis,
        this.type});

  MbChar.fromJson(Map<String, dynamic> json) {
    cyr = json['cyr'];
    lat = json['lat'];
    mbChar = json['mb_char'];
    mbUni = json['mb_uni'];
    tunChar = json['tun_char'];
    tunUni = json['tun_uni'];
    huis = json['huis'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cyr'] = this.cyr;
    data['lat'] = this.lat;
    data['mb_char'] = this.mbChar;
    data['mb_uni'] = this.mbUni;
    data['tun_char'] = this.tunChar;
    data['tun_uni'] = this.tunUni;
    data['huis'] = this.huis;
    data['type'] = this.type;
    return data;
  }
}