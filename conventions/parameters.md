# 📥 Parameters

```swift
func move(from start: Point, to end: Point)
```

## 주석을 읽기 쉽게 만들어주는 파라미터 이름을 선택하세요.

- 파라미터 이름은 function 이나 method를 사용하는 곳에서 보이지 않지만, function 이나 method를 설명해주는 역할을 갖습니다.
- 문서(주석)를 읽기에 쉬운 파라미터 이름을 사용하세요.

#### Good

이런 이름들은 주석을 읽기 쉽게 해줍니다.
(아래 예제에서 `predicate` 와 `subRange` `newElements` 에 해당하는 내용)

```swift
/// Return an `Array` containing the elements of `self`
/// that satisfy `predicate`.
func filter(_ predicate: (Element) -> Bool) -> [Generator.Element]

/// Replace the given `subRange` of elements with `newElements`.
mutating func replaceRange(_ subRange: Range, with newElements: [E])
```

#### Bad

```swift
/// Return an `Array` containing the elements of `self`
/// that satisfy `includedInResult`.
func filter(_ includedInResult: (Element) -> Bool) -> [Generator.Element]

/// Replace the range of elements indicated by `r` with
/// the contents of `with`.
mutating func replaceRange(_ r: Range, with: [E])
```

## 일반적인 사용을 단순화 할 수 있다면, defaulted parameters를 사용하세요

일반적으로 사용되는 파라미터가 default로 사용될 수 있습니다.

예를들어 아래의 경우 default parameter를 사용해서 가독성을 높일 수 있습니다.

```swift
let order = lastName.compare(
  royalFamilyName, options: [], range: nil, locale: nil)
```

```
let order = lastName.compare(royalFamilyName)
```

- default parameters는 일반적인 method families를 사용하는 것보다 선호됩니다. (기본 파라미터 사용 > 기본 파라미터 안쓰고 method 여러개 나열 하는 것) 
- 왜냐하면 API를 이해하려고 노력하는 사람들이 신경써야할 부분을 줄여주기 때문입니다. (아래 예제를 보면 조금 더 이해가 쉽습니다.)

#### Good

```swift
extension String {
  /// ...description...
  public func compare(
     _ other: String, options: CompareOptions = [],
     range: Range? = nil, locale: Locale? = nil
  ) -> Ordering
}
```

#### Bad

```swift
extension String {
  /// ...description 1...
  public func compare(_ other: String) -> Ordering
  /// ...description 2...
  public func compare(_ other: String, options: CompareOptions) -> Ordering
  /// ...description 3...
  public func compare(
     _ other: String, options: CompareOptions, range: Range) -> Ordering
  /// ...description 4...
  public func compare(
     _ other: String, options: StringCompareOptions,
     range: Range, locale: Locale) -> Ordering
}
```

method family의 모든 멤버들은 (위의 모든 method들) 개별적으로 주석을 달아서 문서화해줘야 합니다. 그래야 유저가 이해할 수 있습니다. 사용자가 method들 중에서 선택해야할 때, 사용자는 method들을 모두 이해해야 합니다. 가끔 예상치 못한 관계가 발생합니다. (예를들어, `foo(bar: nil)` 과 `foo()` 가 다른 동작을 하는 경우) 이런 경우 거의 동일한 주석 안에서 사소한 차이를 찾아내는 지루한 과정이 발생하게 됩니다. 하나의 method를 사용하고 default parameter를 제공하는 것은 매우 뛰어난 프로그래밍 경험을 제공합니다.

## default parameter를 parameter list 끝 부분에 두는 것을 선호합니다.

- default값이 없는 parameter는 보통 메소드 의미에 더 필수적이고, 사용하는 쪽에서 안정적인 사용 패턴을 제공합니다.


