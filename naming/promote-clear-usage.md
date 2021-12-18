---
description: 명확한 사용을 촉진하세요
---

# 🙆 Promote Clear Usage

### **필요한 단어들을 모두 포함해주세요.**&#x20;

코드를 읽는 사람이 모호하게 느끼지 않아야 합니다. 예를들어, collection 안에서 주어진 position의 element를 제거하는 메소드가 있다고 생각해 봅시다.

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

###

### 불필요한 단어를 생략하세요

네이밍에 들어가는 모든 단어는 사용되는 시점(at the use site)에 핵심적인 정보만 전달해야 합니다.

#### Bad

```swift
public mutating func removeElement(_ member: Element) -> Element?

allViews.removeElement(cancelButton)
```

위의 경우를 보면 `Element` 라는 단어를 썼지만 의미있는 정보가 더해지지 않았습니다. 이 API는 이렇게 디자인 하면 더 좋습니다

#### Good

```swift
public mutating func remove(_ member: Element) -> Element?

allViews.remove(cancelButton) // clearer
```

때로는 애매함을 피하기 위해 타입 정보를 반복해서 네이밍할 수 있어요. 하지만 일반적으로는 파라미터의 역할로 네이밍 하는 것이 타입으로 네이밍하는 것보다 좋습니다. 다음 설명에서 좀 더 자세히 알아봅시다.



### 타입 대신 역할에 따라 변수(variables), 파라미터(parameters), 연관타입(associated types)을 네이밍하세요

#### Bad

```swift
var string = "Hello"
protocol ViewController {
  associatedtype ViewType : View
}
class ProductionLine {
  func restock(from widgetFactory: WidgetFactory)
}
```

이런 방식으로 타입 이름을 정의하면 명확하게 표현하는 것이 어려워집니다. 대신, 엔티티의 역할을 표현하는 이름을 사용해보세요.

#### Good

```swift
var greeting = "Hello"
protocol ViewController {
  associatedtype ContentView : View
}
class ProductionLine {
  func restock(from supplier: WidgetFactory)
}
```

만약 `associated type`이 해당 protocol 제약에 강하게 결합되어 있어서 protocol 이름 자체가 역할(role)을 표현하다면, 충돌을 피하기 위해서 protocol 이름의 마지막에 `Protocol` 을 붙여줄 수 있습니다.

```swift
protocol Sequence {
  associatedtype Iterator : IteratorProtocol
}
protocol IteratorProtocol { ... }
```



### **파라미터의 역할을 명확히 하기 위해 불충분한 type 정보를** 보충하세요&#x20;

(번역이 약간 어색한데, 예제를 보면 더 빨리 이해할 수 있을 것 같아요)

특히 파라미터 타입이 `NSObject`, `Any`, `AnyObject`, 또는 기본 타입(`Int` 또는 `String` 같은 타입) 이라면, 타입 정보와 사용하는 시점의 문맥이 의도를 충분히 드러내지 못할 수 있습니다. 아래의 예시를 보면, 정의는 명확하게 되어 있는데도, 사용하는 곳에서는 메소드의 의도가 애매합니다.

#### Bad

```swift
func add(_ observer: NSObject, for keyPath: String)

grid.add(self, for: graphics) // 애매함
```

명확하게 하려면, type 자체에서 많은 정보 얻을 수 없는 parameter 앞에 그것의 역할을 명시하세요.

#### Good

```swift
func addObserver(_ observer: NSObject, forKeyPath path: String)
grid.addObserver(self, forKeyPath: graphics) // 명확함
```

