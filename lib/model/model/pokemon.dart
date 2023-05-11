class Pokemon {
  int? id;
  String? name = '';
  //final String subtitle;
  String? sprite = '';
  String? type1 = '';
  String? type2 = '';
  //final List<int> stats;

  String getName() {
    return '' == name ? '' : upperCase(name!);
  }

  String getSprite() {
    return upperCase(sprite ?? '');
  }

  String getType1() {
    //return upperCase(type1 ?? '');
    return '' == type1 ? '' : upperCase(type1!);
  }

  String getType2() {
    //return upperCase(type2 ?? '');
    return '' == type2 ? '' : upperCase(type2!);
  }

  String upperCase(String text) =>
      "${text[0].toUpperCase()}${text.substring(1).toLowerCase()}";
}
