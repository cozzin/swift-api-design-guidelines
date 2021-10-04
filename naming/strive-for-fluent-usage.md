# 유창함 \(Strive for Fluent Usage\)

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

예외\) 첫번째 또는 두번째 argument 이후에 주요 argument가 아닌 경우에는 유창함이 떨어지는 것이 허용됩니다.

```swift
AudioUnit.instantiate(
  with: description, 
  options: [.inProcess], completionHandler: stopProgressBar)
```



### **factory method의 시작은 `make`로 시작**합니다. 

eg. `x.makeIterator()` 



### initializer의 argument와 factory method 호출에는 base name으로 시작하는 pharse를 구성하지 마세요. 

eg. `x.makeWidget(cogCount: 47)`

예를 들어, 



