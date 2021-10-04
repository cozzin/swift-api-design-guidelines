# 네이밍 \(Naming\)

### 명확하게 사용할 수 있도록해주세요

필요한 단어들을 모두 포함해주세요. 코드를 읽는 사람이 모호하게 느끼지 않아야 합니다. 예를들어, collection 안에서 주어진 position의 element를 제거하는 메소드가 있다고 생각해봅시다.

#### Good

```swift
extension List {
  public mutating func remove(at position: Index) -> Element
}
employees.remove(at: x)
```

만약 우리가 method signature에서 `at` 을 생략했다면, 

