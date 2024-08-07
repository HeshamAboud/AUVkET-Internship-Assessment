// class LoginResponse {
//   String? token;
//   Player? player;
//
//   LoginResponse({this.token, this.player});
//
//   LoginResponse.fromJson(Map<String, dynamic> json) {
//     token = json['Token'];
//     player =
//     json['Player'] != null ? new Player.fromJson(json['Player']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Token'] = this.token;
//     if (this.player != null) {
//       data['Player'] = this.player!.toJson();
//     }
//     return data;
//   }
// }
//
// class Player {
//   int? iDPlayer;
//   String? playerName;
//   String? playerUserName;
//   String? playerEmail;
//   String? playerPhone;
//   String? playerImage;
//
//   Player(
//       {this.iDPlayer,
//         this.playerName,
//         this.playerUserName,
//         this.playerEmail,
//         this.playerPhone,
//         this.playerImage});
//
//   Player.fromJson(Map<String, dynamic> json) {
//     iDPlayer = json['IDPlayer'];
//     playerName = json['PlayerName'];
//     playerUserName = json['PlayerUserName'];
//     playerEmail = json['PlayerEmail'];
//     playerPhone = json['PlayerPhone'];
//     playerImage = json['PlayerImage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['IDPlayer'] = this.iDPlayer;
//     data['PlayerName'] = this.playerName;
//     data['PlayerUserName'] = this.playerUserName;
//     data['PlayerEmail'] = this.playerEmail;
//     data['PlayerPhone'] = this.playerPhone;
//     data['PlayerImage'] = this.playerImage;
//     return data;
//   }
// }
