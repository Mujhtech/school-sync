import '../repositories/preferences.dart';

class FetchAppThemeUseCase {
  const FetchAppThemeUseCase({
    required PreferencesRepository preferences,
  }) : _preferences = preferences;

  final PreferencesRepository _preferences;

  Future<int?> call() async => _preferences.fetchThemeMode();
}
