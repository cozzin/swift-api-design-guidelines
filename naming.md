# 네이밍 \(Naming\)

### 명확하게 사용할 수 있도록 해주세요

필요한 단어들을 모두 포함해주세요. 코드를 읽는 사람이 모호하게 느끼지 않아야 합니다. 예를들어, collection 안에서 주어진 position의 element를 제거하는 메소드가 있다고 생각해봅시다.

#### Good

```swift
extension List {
  public mutating func remove(at position: Index) -> Element
}
employees.remove(at: x) // x번째에 위치한 employee 제거
```

만약 우리가 위의 method signature에서 `at` 을 생략하면 `x`가 제거할 element의 position을 암시하는 대신,  `x` 와 동일한 element를 찾고 제거해주는 것을 암시할 수 있습니다.

#### Bad

```swift
employees.remove(x) // 명확하지 않음: x를 제거하는 것일까...?
```



