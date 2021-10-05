# General Conventions

### **computed property의 복잡도가 O\(1\)이 아니라면 복잡도를 주석으로 남겨주세요.**

사람들은 보통 property에 접근할 때 엄청난 계산을 할거라고 생각하지 않습니다. 왜냐하면 멘탈 모델에 stored property가 있기 때문입니다. 그런 가정이 위배될 때 경고를 해주세요.

### **전역 함수 대신에 method와 property를 사용**하세요.

전역 함수는 특수한 경우에만 사용됩니다.  
1. 명확한 `self` 가 없는경우  
`min(x, y, z)`  
2. function이 generic으로 제약조건이 걸려있지 않을 때  
`print(x)`  
3. function 구문이 해당 도메인의 표기법인 경우  
`sin(x)` 

### **대소문자 컨벤션을 따르세요.** 

type, protocol의 이름은 UpperCamelCase, 나머지는 lowerCamelCase를 따릅니다.

미국 영어에서 보통 all upper case로 사용되는 [Acronyms and initialisms](https://en.wikipedia.org/wiki/Acronym)\(단어의 첫글자들로 말을 형성하는 것\)은 대소문자 컨벤션에 따라 통일성있게 사용되어야 합니다. \(예시 보는게 더 이해 쉬움\)

```swift
var utf8Bytes: [UTF8.CodeUnit]
var isRepresentableAsASCII = true
var userSMTPServer: SecureSMTPServer
```

나머지 두문자어는 다른 일반 단어와 동일하게 사용하면 됩니다:

```swift
var radarDetector: RadarScanner
var enjoysScubaDiving = true
```

### 기본 뜻이 같거나 구별되는 서로 구별되는 도메인에서 작동하는 Method는 base name을 동일하게 사용할 수 있습니다.

#### Good

예를들어, 아래 예시에서 기본적으로 같은 동작을 하기 때문에 같은 이름을 사용하는 것이 권장됩니다.

```swift
extension Shape {
  /// Returns `true` iff `other` is within the area of `self`.
  func contains(_ other: Point) -> Bool { ... }

  /// Returns `true` iff `other` is entirely within the area of `self`.
  func contains(_ other: Shape) -> Bool { ... }

  /// Returns `true` iff `other` is within the area of `self`.
  func contains(_ other: LineSegment) -> Bool { ... }
}
```

geometric type과 collection type은 구별된 도메인이기 때문에, 같은 프로그램 안에서 다음과 같이 사용할 수 있습니다.

```swift
extension Collection where Element : Equatable {
  /// Returns `true` iff `self` contains an element equal to
  /// `sought`.
  func contains(_ sought: Element) -> Bool { ... }
}
```

#### Bad

아래의 `index` method는 다른 의미를 갖고 있기 때문에, 다르게 네이밍 되어야 합니다.

```swift
extension Database {
  /// Rebuilds the database's search index
  func index() { ... }

  /// Returns the `n`th row in the given table.
  func index(_ n: Int, inTable: TableID) -> TableRow { ... }
}
```

"overloading on return type"은 타입 추론의 유무에 따라 모호한 경우가 있어서 권장되지 않습니다.

```swift
extension Box {
  /// Returns the `Int` stored in `self`, if any, and
  /// `nil` otherwise.
  func value() -> Int? { ... }

  /// Returns the `String` stored in `self`, if any, and
  /// `nil` otherwise.
  func value() -> String? { ... }
}
```

