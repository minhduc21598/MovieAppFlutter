class $AssetsIconsGen {
  const $AssetsIconsGen();

  String get icBack => 'assets/icons/ic_back.svg';
  String get icRatingStar => 'assets/icons/ic_rating_star.svg';
  String get icClock => 'assets/icons/ic_clock.svg';
  String get icLanguage => 'assets/icons/ic_language.svg';
  String get icCheck => 'assets/icons/ic_check.svg';
  String get icVi => 'assets/icons/ic_vi.svg';
  String get icEn => 'assets/icons/ic_en.svg';
  String get icPlayVideo => 'assets/icons/ic_play_video.svg';
  String get icDoubleArrow => 'assets/icons/ic_double_arrow.svg';
  String get icSearch => 'assets/icons/ic_search.svg';
  String get icClose => 'assets/icons/ic_close.svg';
  String get icThemeMode => 'assets/icons/ic_theme_mode.svg';
  String get icRadioChecked => 'assets/icons/ic_radio_checked.svg';
  String get icRadioUnchecked => 'assets/icons/ic_radio_unchecked.svg';
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  String get defaultAvatar => 'assets/images/default_avatar.png';
  String get imagePlaceholder => 'assets/images/image_placeholder.png';
  String get noSearchResult => 'assets/images/no_search_result.png';
}

class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}
