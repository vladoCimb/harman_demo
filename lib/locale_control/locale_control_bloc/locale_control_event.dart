part of 'locale_control_bloc.dart';

abstract class LocaleControlEvent extends Equatable {
  const LocaleControlEvent();
}

/// The app's [Locale] has been changed
class LocaleChanged extends LocaleControlEvent {
  const LocaleChanged(this.locale);

  final Locale? locale;

  @override
  List<Object?> get props => [locale];
}
