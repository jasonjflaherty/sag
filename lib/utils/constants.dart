class Constants {
  static final String SAG_ROOT_URL = "https://www.nwcg.gov";
  static final String SAG_DATA_URL =
      'https://drive.google.com/uc?id=1grwczJuYq5c457lo-rpfg58ZuS8WVRVA&export=download';
  static final String SAG_CHAINSAW_DATA_URL =
      "https://www.nwcg.gov/json/chainsaws.json";
  static final String SAG_OTHER_DATA_URL =
      "https://www.nwcg.gov/json/other.json";
  static final String SAG_GENERAL_DATA_URL =
      "https://www.nwcg.gov/json/general-purpose-spark-arrester.json";
  static final String SAG_PLACEHOLDER_IMAGE_ASSET_URL =
      '/assets/placeholder.jpg';
  static final String SAG_SPARKSANDLOGO_IMAGE_ASSET_URL =
      '/assets/sparksandlogo.png';
  static final String SAG_ASSETS_FILE_JSON = "sagjson.json";
  static final String SAG_DESC_PLACEHOLDER =
      "No Description for this Spark Arrestor";
  static final String SAG_COMMENT_PLACEHOLDER = "No Comments";
  static final String SAG_APP_TITLE = "USFS Spark Arrestor Guide";
  static final String SAG_LEGAL_TITLE = "Legal Page";
  static final String SAG_QA_TITLE = "Q&A Page";

  static const String NAV_CHAINSAW = "Chainsaw Spark Arresters";
  static const String NAV_GENERAL = "General Purpose Spark Arresters";
  static const String NAV_OTHER = "Other Spark Arresters";
  static const String NAV_LEGAL = "Legal";
  static const String NAV_QA = "Q&A";
  static const String NAV_REFRESH = "Refresh Data";

  static const List<String> navchoices = <String>[
    NAV_REFRESH,
    NAV_CHAINSAW,
    NAV_GENERAL,
    NAV_OTHER
  ];
}
