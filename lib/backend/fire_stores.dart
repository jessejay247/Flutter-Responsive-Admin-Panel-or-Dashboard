import 'package:admin/helpers/strings.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ntp/ntp.dart';

abstract class BaseStores {
  Future<void> storeInvestmentsHistories(
      String status, double amount, double profitAmount, String type);
  Future<void> storeWithdrawalHistories(
    status,
    amount,
    method,
  );
  Future<void> storeDepositsHistories(
      String status, double amount, String reference);
  Future<void> storeActivities(device, ipAddress);
  Future<void> storeReferrals(status, amount, profitAmount);
}

class StoredDocs implements BaseStores {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference _historyRef = _firestore.collection(HISTORY);
  @override
  Future<void> storeActivities(device, ipAddress) async {
    try {
      DateTime date = await NTP.now();

      String dateMill = date.millisecondsSinceEpoch.toString();
      await _historyRef
          .doc(INVESTMENT_HISTORY)
          .collection(INVESTMENT_HISTORY)
          .doc(dateMill)
          .set({
        DEVICE: device,
        IP_ADDRESS: ipAddress,
        TRXN_DATE: dateMill,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> storeDepositsHistories(
      String status, double amount, String reference) async {
    try {
      DateTime date = await NTP.now();

      String dateMill = date.millisecondsSinceEpoch.toString();
      await _historyRef
          .doc(INVESTMENT_HISTORY)
          .collection(INVESTMENT_HISTORY)
          .doc(dateMill)
          .set({
        STATUS: status,
        AMOUNT: amount,
        REFERENCE: reference,
        TRXN_DATE: dateMill,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> storeInvestmentsHistories(
      String status, double amount, double profitAmount, String type) async {
    try {
      DateTime date = await NTP.now();
      DateTime endDate = date.add(
        Duration(days: 7),
      );
      String refCode = randomString(8).toString().toUpperCase();

      String dateMill = date.millisecondsSinceEpoch.toString();
      String endDateMill = endDate.millisecondsSinceEpoch.toString();
      await _historyRef
          .doc(INVESTMENT_HISTORY)
          .collection(INVESTMENT_HISTORY)
          .doc(dateMill)
          .set({
        STATUS: status,
        AMOUNT: amount,
        PROFIT_AMOUNT: profitAmount,
        REFERENCE: refCode,
        START_DATE: dateMill,
        END_DATE: endDateMill,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> storeReferrals(status, amount, profitAmount) async {
    try {
      DateTime date = await NTP.now();
      DateTime endDate = date.add(
        Duration(days: 7),
      );
      String refCode = randomString(8).toString().toUpperCase();

      String dateMill = date.millisecondsSinceEpoch.toString();
      String endDateMill = endDate.millisecondsSinceEpoch.toString();
      await _historyRef
          .doc(INVESTMENT_HISTORY)
          .collection(INVESTMENT_HISTORY)
          .doc(dateMill)
          .set({
        STATUS: status,
        AMOUNT: amount,
        PROFIT_AMOUNT: profitAmount,
        REFERENCE: refCode,
        START_DATE: dateMill,
        END_DATE: endDateMill,
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> storeWithdrawalHistories(
    status,
    amount,
    method,
  ) async {
    try {
      DateTime date = await NTP.now();
      DateTime endDate = date.add(
        Duration(days: 7),
      );
      String refCode = randomString(8).toString().toUpperCase();

      String dateMill = date.millisecondsSinceEpoch.toString();
      String endDateMill = endDate.millisecondsSinceEpoch.toString();
      await _historyRef
          .doc(INVESTMENT_HISTORY)
          .collection(INVESTMENT_HISTORY)
          .doc(dateMill)
          .set({
        STATUS: status,
        AMOUNT: amount,
        REFERENCE: refCode,
        TRXN_DATE: dateMill,
        METHOD: method,
      });
    } catch (e) {
      print(e);
    }
  }
}
