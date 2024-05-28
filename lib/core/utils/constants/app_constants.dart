import 'package:spotlight/core/utils/app_assets.dart';

class AppConstants {
  List<CountryModel> countries = [
    CountryModel(name: "ae", flag: AppAssets.ae),
    CountryModel(name: "ar", flag: AppAssets.ar),
    CountryModel(name: "at", flag: AppAssets.at),
    CountryModel(name: "au", flag: AppAssets.au),
    CountryModel(name: "be", flag: AppAssets.be),
    CountryModel(name: "bg", flag: AppAssets.bg),
    CountryModel(name: "br", flag: AppAssets.br),
    CountryModel(name: "ca", flag: AppAssets.ca),
    CountryModel(name: "ch", flag: AppAssets.ch),
    CountryModel(name: "cn", flag: AppAssets.cn),
    CountryModel(name: "co", flag: AppAssets.co),
    CountryModel(name: "cu", flag: AppAssets.cu),
    CountryModel(name: "cz", flag: AppAssets.cz),
    CountryModel(name: "de", flag: AppAssets.de),
    CountryModel(name: "eg", flag: AppAssets.eg),
    CountryModel(name: "fr", flag: AppAssets.fr),
    CountryModel(name: "gb", flag: AppAssets.gb),
    CountryModel(name: "gr", flag: AppAssets.gr),
    CountryModel(name: "hk", flag: AppAssets.hk),
    CountryModel(name: "hu", flag: AppAssets.hu),
    CountryModel(name: "id", flag: AppAssets.id),
    CountryModel(name: "ie", flag: AppAssets.ie),
    CountryModel(name: "il", flag: AppAssets.il),
    CountryModel(name: "in", flag: AppAssets.inFlag),
    CountryModel(name: "it", flag: AppAssets.it),
    CountryModel(name: "jp", flag: AppAssets.jp),
    CountryModel(name: "kr", flag: AppAssets.kr),
    CountryModel(name: "lt", flag: AppAssets.lt),
    CountryModel(name: "lv", flag: AppAssets.lv),
    CountryModel(name: "ma", flag: AppAssets.ma),
    CountryModel(name: "mx", flag: AppAssets.mx),
    CountryModel(name: "my", flag: AppAssets.my),
    CountryModel(name: "ng", flag: AppAssets.ng),
    CountryModel(name: "nl", flag: AppAssets.nl),
    CountryModel(name: "no", flag: AppAssets.no),
    CountryModel(name: "nz", flag: AppAssets.nz),
    CountryModel(name: "ph", flag: AppAssets.ph),
    CountryModel(name: "pl", flag: AppAssets.pl),
    CountryModel(name: "pt", flag: AppAssets.pt),
    CountryModel(name: "ro", flag: AppAssets.ro),
    CountryModel(name: "rs", flag: AppAssets.rs),
    CountryModel(name: "ru", flag: AppAssets.ru),
    CountryModel(name: "sa", flag: AppAssets.sa),
    CountryModel(name: "se", flag: AppAssets.se),
    CountryModel(name: "sg", flag: AppAssets.sg),
    CountryModel(name: "si", flag: AppAssets.si),
    CountryModel(name: "sk", flag: AppAssets.sk),
    CountryModel(name: "th", flag: AppAssets.th),
    CountryModel(name: "tr", flag: AppAssets.tr),
    CountryModel(name: "tw", flag: AppAssets.tw),
    CountryModel(name: "ua", flag: AppAssets.ua),
    CountryModel(name: "us", flag: AppAssets.us),
    CountryModel(name: "ve", flag: AppAssets.ve),
    CountryModel(name: "za", flag: AppAssets.za),
    CountryModel(name: "es", flag: AppAssets.es),
  ];
  static const String country = "country";
}

class CountryModel {
  final String name;
  final String flag;
  CountryModel({required this.name, required this.flag});
}
