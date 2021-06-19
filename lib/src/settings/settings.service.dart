/// An abstract class used for storing and retrieving user settings.
abstract class SettingsService {
  /// Loads the user's preferred language.
  Future<String> language();

  /// Persists the user's preferred language to local storage.
  Future<void> updateLanguage(String language);
}
