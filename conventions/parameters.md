# 📥 Parameters

```swift
func move(from start: Point, to end: Point)
```

## 주석을 읽기 쉽게 만들어주는 파라미터 이름을 선택하세요.

- 파라미터 이름은 function 이나 method를 사용하는 곳에서 보이지 않지만, function 이나 method를 설명해주는 역할을 갖습니다.
- 문서(주석)를 읽기에 쉬운 파라미터 이름을 사용하세요.

### Good

이런 이름들은 주석을 읽기 쉽게 해줍니다.
(아래 예제에서 `predicate` 와 `subRange` `newElements` 에 해당하는 내용)

```swift
/// Return an `Array` containing the elements of `self`
/// that satisfy `predicate`.
func filter(_ predicate: (Element) -> Bool) -> [Generator.Element]

/// Replace the given `subRange` of elements with `newElements`.
mutating func replaceRange(_ subRange: Range, with newElements: [E])
```

### Bad

```swift
/// Return an `Array` containing the elements of `self`
/// that satisfy `includedInResult`.
func filter(_ includedInResult: (Element) -> Bool) -> [Generator.Element]

/// Replace the range of elements indicated by `r` with
/// the contents of `with`.
mutating func replaceRange(_ r: Range, with: [E])
```

## 많은 경우에 간편하게 쓸 수 있다면, defaulted paramters를 사용하세요
