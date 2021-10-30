---
description: 유창한 사용을 위해 노력하세요
---

# 🗣 Strive for Fluent Usage

### **method와 function을 영어 문장 처럼 사용**할 수 있도록 하기

#### Good

```swift
x.insert(y, at: z)          “x, insert y at z”
x.subViews(havingColor: y)  “x's subviews having color y”
x.capitalizingNouns()       “x, capitalizing nouns”
```

#### Bad

```swift
x.insert(y, position: z)
x.subViews(color: y)
x.nounCapitalize()
```

예외) 첫번째 또는 두번째 argument 이후에 주요 argument가 아닌 경우에는 유창함이 떨어지는 것이 허용됩니다.

```swift
AudioUnit.instantiate(
  with: description, 
  options: [.inProcess], completionHandler: stopProgressBar)
```



### **factory method의 시작은 `make`로 시작**합니다.&#x20;

eg. `x.makeIterator()`&#x20;



### initializer의 argument와 factory method 호출에는 구절을 구성하지 마세요.

(일단 번역했지만 잘 이해가지 않습니다... 예제를 봅시다)

eg. `x.makeWidget(cogCount: 47)`

예를 들어, 처음 호출하는 argument들은 base name의 구절로 읽혀서는 안됩니다.

#### Good

```swift
let foreground = Color(red: 32, green: 64, blue: 128)
let newPart = factory.makeWidget(gears: 42, spindles: 14)
let ref = Link(target: destination)
```

#### Bad

```swift
let foreground = Color(havingRGBValuesRed: 32, green: 64, andBlue: 128)
let newPart = factory.makeWidget(havingGearCount: 42, andSpindleCount: 14)
let ref = Link(to: destination)
```

실제로, argument labels을 위한 이 가이드를 따르면, 첫번째 argument는  label을 갖게 된다. (값이 보존되는 타입 변환 경우는 제외(아래에 있는 예제))

```swift
let rgbForeground = RGBColor(cmykForeground)
```



### 부수효과(side-effect)를 기반해서 function 과 method의 네이밍을 하세요

* side-effect가 없는 것은 명사로 읽혀야 함. eg. `x.distance(to: y)` , `i.successor()`&#x20;
* side-effect가 있는 것은 동사로 읽혀야 함. eg. `print(x)` , `x.sort()` , `x.append(y)`&#x20;
* mutating/nonmutating method의 이름을 일관성 있게 짓기. 주로 mutating method와 함께 비슷한 맥락의 nonmutating method도 만들어 집니다. nonmutating method는 instance를 변경하지 않고 새로운 value를 return 합니다.
* operation이 동사로 설명되는 경우
  * mutating에는 동사의 명령형을 사용
  * nonmutating에는 "ed" 또는 "ing"를 접미사로 붙여서 사용

| Mutating      | NonMutating          |
| ------------- | -------------------- |
| `x.sort()`    | `z = x.sorted()`     |
| `x.append(y)` | `z = x.appending(y)` |

* operation이 명사로 설명되는 경우
  * nonmutating에는 명사 사용
  * mutating에는 "form" 접두사 붙여서 사용

| Nonmutating          | Mutating              |
| -------------------- | --------------------- |
| `x = y.union(z)`     | `y.formUnion(z)`      |
| `j = c.successor(i)` | `c.formSuccessor(&i)` |



### nonmutating인 Boolean method & properties는 receiver에 대한 주장으로 읽혀야 합니다

eg. `x.isEmpty` , `line1.intersects(line2)`&#x20;



### 능력을 설명하는 프로토콜은 able, ible, ing를 사용한 접미사로 네이밍해야 합니다

eg. `Equatable` , `ProgressReporting`&#x20;



### 나머지 types, properties, variables, constants는 명사로 읽혀야 합니다

