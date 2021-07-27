import 'package:admin/backend/backend_repo.dart';
import 'package:admin/helpers/strings.dart';
import 'package:admin/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:ntp/ntp.dart';
import 'package:firebase_storage/firebase_storage.dart' as fbs;
import 'package:path/path.dart';

abstract class BaseAuths {
  Future<void> signUp(email, password, alias, referree, country, image);
  Future<void> signIn(String email, String password);
  Future<void> updateProfile();
  Future<void> activate2FA();
  Future<void> forgetPassword(String email);
  Future<void> signOut();
  Future changePassword(String password);
}

class UserAuths implements BaseAuths {
  auth.FirebaseAuth authenticate = auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  String authError = '';
  User user;

  Repos _repos = Repos();

  @override
  Future<void> signUp(email, password, alias, referree, country, image) async {
    WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    print('Running on ${webBrowserInfo.userAgent}');

    String refCode = randomString(8).toUpperCase();
    String _deviceName;
    // IpModel _ipModel;
    try {
      // await allRepos.getIp().then((val) {
      //   _ipModel = IpModel.fromMap(val);
      // });

      // await allRepos.getDevice().then((val) {
      //   _deviceName = val;
      // });

      //Time

      DateTime _myTime = await NTP.now().timeout(Duration(seconds: 30));
      int _time = _myTime.millisecondsSinceEpoch;

      //
      auth.User newuser = (await authenticate
              .createUserWithEmailAndPassword(email: email, password: password)
              .timeout(Duration(seconds: 20)))
          .user;
      //Verification mail
      await newuser.sendEmailVerification().then((value) {
        // accBox.put('verifyMail', true);
        // accBox.put('exception', '');
        authError = 'Verification mail sent';

        // authSucc = true;
      }).catchError((e) {
        print(e);
      }).timeout(Duration(seconds: 20));

      fbs.FirebaseStorage _firebaseStorage = fbs.FirebaseStorage.instance;

      String profileUrl;

      if (image != null) {
        String fileName = basename(image.path);
        fbs.Reference firebaseStorageRef = _firebaseStorage
            .ref()
            .child(PROFILEPIC)
            .child(newuser.uid)
            .child(fileName);
        fbs.UploadTask uploadTask = firebaseStorageRef.putFile(image);
        fbs.TaskSnapshot taskSnapshot = await uploadTask;
        try {
          await uploadTask;
          final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
          profileUrl = downloadUrl;
        } catch (e) {
          print(e);
        }
        //print(downloadUrl);
        // return downloadUrl;

      }

      //print('break 5');
      user = User(
        id: newuser.uid,
        email: email,
        isAdmin: false,
        firstName: alias,
        investmentBalance: 0.0,
        level: 1,
        lockedBalance: 0.0,
        referralBalance: 0.0,
        walletBalance: 0.0,
        lockedTime: 0,
        country: country,
        twoFA: false,
        referree: referree,
        referredCount: {CONFIRM: 0, NOT_CONFIRM: 0},
        refCode: refCode.toUpperCase(),
        refBy: null,
        isEmailVerified: false,
        blocked: false,
        active: true,
        profilePic: profileUrl,
        dateCreated: _time,
        secKey: null,
      );

      // await allRepos.addReferral(
      //     newuser.uid, referree != null ? referree.toUpperCase() : null, alias);
      //print('break 3');

      //Admin docs
      await _firestore.collection(ADMINS).doc(USERS).get().then((value) {
        Map<String, dynamic> data = value.data();

        _firestore.collection(ADMINS).doc(USERS).update(
          {
            UNVERIFIED: data[UNVERIFIED] + 1,
          },
        );
      }).timeout(Duration(seconds: 20));

      //print('break 4');

      //Add user docs

      await _firestore
          .collection(USERS)
          .doc(newuser.uid)
          .set(
            user.toMap(user),
          )
          .timeout(Duration(seconds: 20));
      //print('break 1');
      //User devices
      String ip = await _repos.getIp();
      await _firestore
          .collection(USERS)
          .doc(newuser.uid)
          .collection(LISTDEVICES)
          .doc(_time.toString())
          .set({
        'name': _deviceName,
        'date': _time,
        "ip": ip,
      }).timeout(Duration(seconds: 20));

      //Referral
      //print('break 2');

      // existFxn(context);
      // _firestore.collection(ADMIN_RECORDS).doc(USERS).get().then(
      //     (value) =>
      //         _firestore.collection(ADMIN_RECORDS).doc(USERS).update(
      //           {'unverified': value.data()['unverified'] + 1},
      //         ));
      // newuser.emailVerified
      //     ? await _firestore
      //         .collection(ADMIN_RECORDS)
      //         .doc(USERS)
      //         .get()
      //         .then((value) => _firestore
      //                 .collection(ADMIN_RECORDS)
      //                 .doc(USERS)
      //                 .update(
      //               {
      //                 'verified': value.data()['verified'] + 1,
      //                 'unverified': value.data()['unverified'] - 1,
      //               },
      //             ))
      //     : await _firestore
      //         .collection(ADMIN_RECORDS)
      //         .doc(USERS)
      //         .get()
      //         .then((value) => _firestore
      //                 .collection(ADMIN_RECORDS)
      //                 .doc(USERS)
      //                 .update(
      //               {'unverified': value.data()['unverified'] + 1},
      //             ));
      // if (referree != null) {
      //print('reflink is $refLink ');
      // await apiMethods.addReferrees(email, refLink);
      // } else {
      //print('its empty');
      // }
      return newuser.uid;
    } catch (e) {
      //print('exception $e');
      authError = getExceptionText(e.message);
      //print("Error in sign up: ${e.message}");
      // String exception = getExceptionText(e.message);
      // accBox.put('verifyMail', false);
      // accBox.put('exception', exception);
      // //print('exception $exception');
    }
    //print('break 6');

    return null;
  }
//Sign up Exception

  String getExceptionText(String e) {
    switch (e) {
      case 'There is no user record corresponding to this identifier. The user may have been deleted.':
        return 'User with this e-mail not found.';
        break;
      case 'The password is invalid or the user does not have a password.':
        return 'Invalid password.';
        break;
      case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
        return 'No internet connection.';
        break;
      case 'The email address is already in use by another account.':
        return 'Email address is already taken.';
        break;
      default:
        return 'Unknown error occured.';
    }
  }

  @override
  Future<void> signIn(String email, String password) async {
    try {
      auth.User newuser = (await authenticate
              .signInWithEmailAndPassword(email: email, password: password)
              .catchError((e) {
        print(e);
      }).timeout(Duration(seconds: 30)))
          .user;
      if (newuser.emailVerified) {
        await _firestore.collection(USERS).doc(email).get().then((value) async {
          Map<String, dynamic> data = value.data();
          await _firestore.collection(USERS).doc(email).update(
            {EMAILVERIFIED: true},
          );
          if (data[EMAILVERIFIED] == false) {
            await _firestore
                .collection(ADMIN_RECORDS)
                .doc(USERS)
                .get()
                .then((newvalue) {
              Map<String, dynamic> data = newvalue.data();
              _firestore.collection(ADMIN_RECORDS).doc(USERS).update(
                {
                  'verified': data['verified'] + 1,
                  'unverified': data['unverified'] - 1,
                },
              );
            });
          }
        }).timeout(Duration(seconds: 30));

        return true;
      } else {
        print('error');
      }
      return false;
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> signOut() async {
    await authenticate.signOut().timeout(Duration(seconds: 30));
    // throw UnimplementedError();
  }

  @override
  Future<void> updateProfile() {
    // TODO: implement updateProfile
    throw UnimplementedError();
  }
  //! Change Password

  @override
  Future changePassword(String password) async {
    auth.User user = authenticate.currentUser;
    String email = user.email;

    //Create field for user to input old password

    //pass the password here
    String password = "password";
    String newPassword = "password";

    try {
      // UserCredential userCredential =
      await authenticate.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      user.updatePassword(newPassword).then((_) {
        print("Successfully changed password");
      }).catchError((error) {
        print("Password can't be changed" + error.toString());
        //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
      });
    } on auth.FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Future<void> forgetPassword(String email) async {
    try {
      await authenticate
          .sendPasswordResetEmail(email: email)
          .timeout(Duration(seconds: 30));
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> activate2FA() {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> twoFA(email, secKey, bool has2FA) async {
    // try {
    //   await _userRef
    //       .doc(email)
    //       .update({HAS2FA: has2FA, SECKEY: secKey}).then((value) async {
    //     await fireDocs.getUserDocs(email);
    //   }).timeout(Duration(seconds: 30));
    // } catch (e) {
    //   print(e);
    // }
    // return null;
  }

  @override
  Future<void> twoFAAuth(String email, bool has2FA) async {
    // try {
    //   await _userRef.doc(email).update({HAS2FA: has2FA}).then((value) async {
    //     await fireDocs.getUserDocs(email);
    //   }).timeout(Duration(seconds: 30));
    // } catch (e) {
    //   print(e);
    // }
    // return null;
  }
}
