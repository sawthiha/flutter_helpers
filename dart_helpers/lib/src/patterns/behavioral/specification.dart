/// Specfication Module
part of patterns;

/// Specification Interface
abstract class Specification<T>  {

  const Specification();
  
  /// Check if object is satisfied
  bool isSatisfiedBy(T obj);

  /// Predicate Specification factory
  factory Specification.base(
    bool Function(T) specification
  ) = SpecificationBase;

  /// Type Specification pattern
  static Specification type<T>() => TypeSpecification<T>();
}

/// Specification Composition Operations
/// 
/// Logical AND, OR, NOT
extension CompositedSpecification<T> on Specification<T>  {
  
  /// Chain two specifications in AND logic
  Specification<T> and(Specification<T> other) => AndSpecification([this, other]);

  /// Chain two specifications in OR logic
  Specification or(Specification other) => OrSpecification([this, other]);

  /// Negate the specification
  Specification not() => NegationSpecification(this);
}

/// Type Specification
class TypeSpecification<T> implements Specification  {
  
  @override
  bool isSatisfiedBy(obj) => obj is T;

}

/// Concrete Predicated Specification
class SpecificationBase<T> extends Specification<T>  {
  /// Predicate
  final bool Function(T) specification;

  SpecificationBase(this.specification);

  @override
  bool isSatisfiedBy(obj) => specification(obj);

}

/// Composited Specification Interface
abstract class CompositeSpecification<T> extends Specification<T> {
  /// Specifications to evaluate
  final List<Specification<T>> expressions;
  
  const CompositeSpecification(this.expressions);
  
}

/// AND logic [CompositeSpecification]
class AndSpecification<T> extends CompositeSpecification<T>  {
  const AndSpecification(List<Specification<T>> expressions): super(expressions);
  
  @override
  bool isSatisfiedBy(T obj)  => expressions.every(
    (expression) => expression.isSatisfiedBy(obj)
  );
  
}

/// OR logic [CompositeSpecification]
class OrSpecification<T> extends CompositeSpecification<T>  {
  const OrSpecification(List<Specification<T>> expressions): super(expressions);
  
  @override
  bool isSatisfiedBy(T obj)  => expressions.any(
    (expression) => expression.isSatisfiedBy(obj)
  );
}

/// Negation [Specification]
class NegationSpecification<T> extends Specification<T>  {
  /// Specification to be negated
  final Specification negatee;
  
  const NegationSpecification(this.negatee);
  
  @override
  bool isSatisfiedBy(T obj) => !negatee.isSatisfiedBy(obj);
}
