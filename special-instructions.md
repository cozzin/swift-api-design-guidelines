# 👽 Special Instructions

## tuple members와 closure parameters에 Label을 붙이세요.

이러한 이름들은 설명력이 있고, 문서화된 주석에서 언급될 수 있으며, 튜플 멤버에 대한 expressive access를 제공합니다.

```swift
/// Ensure that we hold uniquely-referenced storage for at least
/// `requestedCapacity` elements.
///
/// If more storage is needed, `allocate` is called with
/// `byteCount` equal to the number of maximally-aligned
/// bytes to allocate.
///
/// - Returns:
///   - reallocated: `true` iff a new block of memory
///     was allocated.
///   - capacityChanged: `true` iff `capacity` was updated.
mutating func ensureUniqueStorage(
  minimumCapacity requestedCapacity: Int, 
  allocate: (_ byteCount: Int) -> UnsafePointer<Void>
) -> (reallocated: Bool, capacityChanged: Bool)
```

클로저 파라미터로 사용된 네이밍은 [📥 Parameters](conventions/parameters.md) 네이밍의 top-level functions와 동일한 방식으로 지어야 합니다. 호출하는 곳에서 볼 수 있는 closure argument label은 지원되지 않습니다.

## overload set에서의 모호함을 피하기 위해, 제약 없는 다형성에 각별히 주의하세요.

eg. `Any`, `AnyObject`, unconstrained generic parameters

예를 들어, 이런 overload set이 있다고 생각해봅시다.

```swift
// Bad
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(_ newElements: S)
    where S.Generator.Element == Element
}
```

위의 메소드와 argument types는 처음에는 뚜렷하게 구분되는 것 처럼 보입니다. 그러나 `Element` 가 `Any` 인 경우 하나의 요소가 시퀀스와 동일한 유형을 가질 수 있습니다. (아래 예시)

```swift
// Bad
var values: [Any] = [1, "a"]
values.append([2, 3, 4]) // [1, "a", [2, 3, 4]] or [1, "a", 2, 3, 4]?
```

모호함을 제거하기 위해, 두번째 overload의 이름을 더 명시적으로 지정합니다.

```swift
// Good
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(contentsOf newElements: S)
    where S.Generator.Element == Element
}
```
