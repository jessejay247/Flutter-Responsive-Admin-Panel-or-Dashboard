import 'package:admin/helpers/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String uid;
  String id;
  String email;
  String profilePic;
  String firstName;
  String lastName;
  String address;
  String country;
  String referree;
  double investmentBalance;
  double lockedBalance;
  double referralBalance;
  double walletBalance;
  int lockedTime;
  int level;
  int dateCreated;
  bool twoFA;
  Map refBy;
  String refCode;
  String secKey;
  Map referredCount;
  bool isEmailVerified;
  bool isAdmin;
  bool blocked;
  bool active;
  User({
    this.uid,
    this.id,
    this.email,
    this.profilePic,
    this.firstName,this.lastName,
    this.address,
    this.country,
    this.referree,
    this.investmentBalance,
    this.lockedBalance,
    this.referralBalance,
    this.walletBalance,
    this.lockedTime,
    this.level,
    this.dateCreated,
    this.twoFA,
    this.refBy,
    this.refCode,
    this.secKey,
    this.referredCount,
    this.isEmailVerified,
    this.isAdmin,
    this.blocked,
    this.active,
  });

  Map toMap(User user) {
    var data = Map<String, dynamic>();
    data[ID] = user.id;
    data[EMAIL] = user.email;
    data[PROFILEPIC] = user.profilePic;
    data[FIRSTNAME] = user.firstName;
    data[LASTNAME] = user.lastName;
    data[ADDRESS] = user.address;
    data[COUNTRY] = user.country;
    data[REFERREE] = user.referree;
    data[INVESTMENTBALANCE] = user.investmentBalance;
    data[LOCKEDBALANCE] = user.lockedBalance;
    data[REFERRALBALANCE] = user.referralBalance;
    data[WALLETBALANCE] = user.walletBalance;
    data[LOCKEDTIME] = user.lockedTime;
    data[LEVEL] = user.level;
    data[DATECREATED] = user.dateCreated;
    data[TWOFA] = user.twoFA;
    data[REFERREDBY] = user.refBy;
    data[REFCODE] = user.refCode;
    data[SECKEY] = user.secKey;
    data[REFERCOUNT] = user.referredCount;
    data[VERIFIED] = user.isEmailVerified;
    data[ISADMIN] = user.isAdmin;
    data[BLOCKED] = user.blocked;
    data[ACTIVE] = user.active;

    return data;
  }

  User.fromMap(List<QueryDocumentSnapshot> mapData) {
    //print('map is $mapData');
    // mapData = mapData ?? {};
    // return User(
    this.id = mapData[0][ID] ?? '';

    this.uid = mapData[0][UID] ?? '';
    this.email = mapData[0][EMAIL] ?? '';
    this.profilePic = mapData[0][PROFILEPIC] ?? '';
    this.firstName = mapData[0][FIRSTNAME] ?? '';
    this.lastName = mapData[0][LASTNAME] ?? '';
    this.address = mapData[0][ADDRESS] ?? '';
    this.country = mapData[0][COUNTRY] ?? '';
    this.referree = mapData[0][REFERREE] ?? '';
    this.investmentBalance = mapData[0][INVESTMENTBALANCE] ?? 0.0;
    this.lockedBalance = mapData[0][LOCKEDBALANCE] ?? 0.0;
    this.referralBalance = mapData[0][REFERRALBALANCE] ?? 0.0;
    this.walletBalance = mapData[0][WALLETBALANCE] ?? 0.0;
    this.lockedTime = mapData[0][LOCKEDTIME] ?? 0;
    this.level = mapData[0][LEVEL] ?? 1;
    this.dateCreated = mapData[0][DATECREATED] ?? 0;
    this.twoFA = mapData[0][TWOFA] ?? false;
    this.refBy = mapData[0][REFERREDBY] ?? {};
    this.refCode = mapData[0][REFCODE] ?? '';
    this.secKey = mapData[0][SECKEY] ?? '';
    this.referredCount = mapData[0][REFERCOUNT] ?? {};
    this.isEmailVerified = mapData[0][VERIFIED] ?? false;
    this.isAdmin = mapData[0][ISADMIN] ?? false;
    this.blocked = mapData[0][BLOCKED] ?? false;
    this.active = mapData[0][ACTIVE] ?? true;
  }
}
