class Images {
  static const _base = 'assets/images/';

  static const parentsSVG = '${_base}parents.svg';
  static const schoolBusSVG = '${_base}school_bus.svg';
  static const notificationsSVG = '${_base}notifications.svg';
  static const settingsSVG = '${_base}settings.svg';
  static const logoutSVG = '${_base}logout.svg';
  static const childrenSVG = '${_base}children.svg';
  static const infoSVG = '${_base}info.svg';
  static const clockSVG = '${_base}clock.svg';
  static const calendarSVG = '${_base}calendar.svg';

  static const _apiImageBase = 'https://egschools.herokuapp.com';

  static String getImage(String imageName) {
    return '$_apiImageBase$imageName';
  }
}
