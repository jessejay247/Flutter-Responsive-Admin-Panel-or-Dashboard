import 'dart:math';

const USERS = "users";
const EMAILVERIFIED = "email_verified";

const ADMIN_RECORDS = "admin_records";
const ADMINS = 'admins';

//Users
const ID = 'id';
const UID = "uid";
const EMAIL = "email";
const PROFILEPIC = "profilePic";
const FIRSTNAME = "firstName";
const LASTNAME = "lastName";
const SENDER_ALIAS = 'senderAlias';
const RECEIVER_ALIAS = 'receiverAlias';
const CHANNEL_ID = 'channelID';
const INVESTMENTBALANCE = "investmentBalance";
const LOCKEDBALANCE = "lockedBalance";
const WALLETBALANCE = "walletBalance";
const LOCKEDTIME = "lockedTime";
const LEVEL = "level";
const DATECREATED = "dateCreated";
const TWOFA = "twoFA";
const REFCODE = "refCode";
const REFCOMCOUNT = "refComCount";
const REFERCOUNT = "referredCount";
const REFCOMPLETED = "refCompleted";
const PENDINGREFUNDS = "pendingRefunds";
const COMPLETEDREFUNDS = "completedRefunds";
const PENDINGLOCK = "pendingLock";
const COMPLETEDLOCK = "completedLock";
const CLAIMED = "claimed";
const REFERRED = "referred";
const REFERREE = "referree";
const REFERREDBY = "referredBy";
const ISEMAILVERIFIED = "isEmailVerified";
const ISADMIN = "isAdmin";
const ISBLOCKED = "blocked";
const ACTIVE = 'active';
const REFERRALBALANCE = 'referralBalance';
const HISTORY = 'history';
const INVESTMENT_HISTORY = "investment_history";
const SECKEY = 'seckKey';
const PRIVATEKEY = 'publicKey';
const ADDRESS = 'address';
const VERIFIED = 'verified';
const COUNTRY = "country";
const BLOCKED = 'blocked';

const UNVERIFIED = 'unverified';
const TOTALUSERS = 'totalUsers';
const CONFIRM = 'confirm';
const NOT_CONFIRM = 'notConfirm';

const AMOUNT = "amount";
const PROFIT_AMOUNT = "profit_amount";
const STATUS = "status";
const METHOD = "method";
const IP_ADDRESS = "ip_address";
const DEVICE = "device";
const TRXN_DATE = "trxn_date";
const START_DATE = "start_date";
const END_DATE = "end_date";
const REFERENCE = "reference";

const LISTDEVICES = 'listDevices';

const BITCOIN = "bitcoin";
const ETHEREUM = "ethereum";
const BITCOIN_CASH = "bitcoincash";
const DOGECOIN = "dogecoin";
const LITECOIN = "litecoin";
const USDC = "usdc";
const DAI = "dai";

const CHARS = "abcdefghijklmnopqrstuvwxyz0123456789";
const HEXCHARS = "abcdef0123456789";
const EMAIL_REGEX =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

String randomString(int strlen) {
  Random rnd = Random(DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < strlen; i++) {
    result += CHARS[rnd.nextInt(CHARS.length)];
  }
  return result;
}
