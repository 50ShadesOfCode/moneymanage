part of core_ui;

class AppImages {
  static const String _basePngUrl = 'assets/images/png/';
  static const String _baseSvgUrl = 'assets/images/svg/';

  static const String logoPngKey = '${_basePngUrl}logo.png';

  static const String logoSvgKey = '${_baseSvgUrl}logo.svg';

  static const String circleCheckKey = '${_baseSvgUrl}circle_check.svg';

  static List<String> genreImageList =
      List<String>.generate(12, (int index) => '${_basePngUrl}genre$index.png');

  static const String chevronLeft = '${_baseSvgUrl}chevron-left.svg';

  static const String chevronDown = '${_baseSvgUrl}chevron-down.svg';

  static const String moreVertical = '${_baseSvgUrl}more-vertical.svg';

  static const String search = '${_baseSvgUrl}search.svg';
  static const String navigationIconDiscover = '${_baseSvgUrl}search.svg';
  static const String navigationIconAlbums = '${_baseSvgUrl}albums.svg';
  static const String navigationIconArtists = '${_baseSvgUrl}artists.svg';
  static const String navigationIconFavourite = '${_baseSvgUrl}favourite.svg';
  static const String navigationIconProfile = '${_baseSvgUrl}profile.svg';
}
