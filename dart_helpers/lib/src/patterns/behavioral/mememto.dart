part of patterns;

/// Empty Mememto Interface
abstract class Mememto  { }

/// Mememto Originator Interface
abstract class MememtoOriginator<T extends Mememto>  {
  /// Export current mememto
  Mememto save();
  /// Import state by mememto
  void load(T mememto);
}