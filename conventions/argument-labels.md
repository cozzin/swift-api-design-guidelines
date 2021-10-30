# 🏷 Argument Labels

```swift
func move(from start: Point, to end: Point)
x.move(from: x, to: y) 
```

## label을 써도 유용하게 구분이 되지 않는다면 모든 label을 생략하세요.

e.g. `min(number1, number2)`, `zip(sequence1, sequence2)`

## 값을 유지하면서 타입 변환을 해주는 initializer에서, 첫번째 argument label을 생략하세요.

e.g. `Int64(someUInt32)`

### 첫번째 argument는 항상 source of convesion 이어야 한다.

```swift
extension String {
  // Convert `x` into its textual representation in the given radix
  init(_ x: BigInt, radix: Int = 10)   ← Note the initial underscore
}

text = "The value is: "
text += String(veryLargeNumber)
text += " and in hexadecimal, it's"
text += String(veryLargeNumber, radix: 16)
```

### 값의 범위가 좁혀지는 타입 변환의 경우, label을 붙여서 설명하는 것을 추천합니다.

```swift
extension UInt32 {
  /// Creates an instance having the specified `value`.
  init(_ value: Int16)            ← Widening, so no label
  /// Creates an instance having the lowest 32 bits of `source`.
  init(truncating source: UInt64)
  /// Creates an instance having the nearest representable
  /// approximation of `valueToApproximate`.
  init(saturating valueToApproximate: UInt64)
}
```

## 첫 번째 argument가 전치사구의 일부일 때, argument label로 지정합니다.

argument label은 보통 전치사로 시작합니다. eg. `x.removeBoxes(havingLength: 12)`

처음에 나오는 2개의 argument들이 단일 추상화를 표현하는 경우는 예외입니다.

```swift
// Bad
a.move(toX: b, y: c)
a.fade(fromRed: b, green: c, blue: d)
```

이런 경우, 추상화를 명확히 하기 위해 전치사 뒤에 argument label을 시작합니다.

```swift
// Good
a.moveTo(x: b, y: c)
a.fadeFrom(red: b, green: c, blue: d)
```

## 만약 첫번째 argument가 문법적 구절을 만든다면 label은 제거하고, 함수 이름에 base name을 추가합니다.

eg. `x.addSubview(y)`

이 가이드라인은 첫번째 argument가 문법적으로 구절을 만들지 않는다면, label을 둬야한다는 것을 암시합니다.

```swift
// Good
view.dismiss(animated: false)
let text = words.split(maxSplits: 12)
let studentsByName = students.sorted(isOrderedBefore: Student.namePrecedes)
```

구절이 정확한 의미를 전달하는 것이 중요합니다. 다음 예시는 문법적이지만 모호한 표현을 하고 있습니다.

```swift
// Bad
view.dismiss(false)   Don't dismiss? Dismiss a Bool?
words.split(12)       Split the number 12?
```

default value를 가진 argument는 생략될 수 있으며, 이 경우 문법 구문의 일부를 형성하지 않으므로 항상 레이블이 있어야 합니다.

## 나머지 모든 경우, argument들은 Label을 붙여야 합니다.
