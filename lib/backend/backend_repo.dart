import 'package:admin/backend/apis.dart';

class Repos {
  AllApis _allApis = AllApis();

  getCoinbase(String name, String desc, String amount) =>
      _allApis.getCoinbase(name, desc, amount);
  getNews() => _allApis.getFinNews();
  getIp() => _allApis.getIp();
}
