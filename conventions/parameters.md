# ๐ฅ Parameters

```swift
func move(from start: Point, to end: Point)
```

## ์ฃผ์์ ์ฝ๊ธฐ ์ฝ๊ฒ ๋ง๋ค์ด์ฃผ๋ ํ๋ผ๋ฏธํฐ ์ด๋ฆ์ ์ ํํ์ธ์.

- ํ๋ผ๋ฏธํฐ ์ด๋ฆ์ function ์ด๋ method๋ฅผ ์ฌ์ฉํ๋ ๊ณณ์์ ๋ณด์ด์ง ์์ง๋ง, function ์ด๋ method๋ฅผ ์ค๋ชํด์ฃผ๋ ์ญํ ์ ๊ฐ์ต๋๋ค.
- ๋ฌธ์(์ฃผ์)๋ฅผ ์ฝ๊ธฐ์ ์ฌ์ด ํ๋ผ๋ฏธํฐ ์ด๋ฆ์ ์ฌ์ฉํ์ธ์.

#### Good

์ด๋ฐ ์ด๋ฆ๋ค์ ์ฃผ์์ ์ฝ๊ธฐ ์ฝ๊ฒ ํด์ค๋๋ค.
(์๋ ์์ ์์ `predicate` ์ `subRange` `newElements` ์ ํด๋นํ๋ ๋ด์ฉ)

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

## ์ผ๋ฐ์ ์ธ ์ฌ์ฉ์ ๋จ์ํ ํ  ์ ์๋ค๋ฉด, defaulted parameters๋ฅผ ์ฌ์ฉํ์ธ์

์ผ๋ฐ์ ์ผ๋ก ์ฌ์ฉ๋๋ ํ๋ผ๋ฏธํฐ๊ฐ default๋ก ์ฌ์ฉ๋  ์ ์์ต๋๋ค.

์๋ฅผ๋ค์ด ์๋์ ๊ฒฝ์ฐ default parameter๋ฅผ ์ฌ์ฉํด์ ๊ฐ๋์ฑ์ ๋์ผ ์ ์์ต๋๋ค.

```swift
let order = lastName.compare(
  royalFamilyName, options: [], range: nil, locale: nil)
```

```
let order = lastName.compare(royalFamilyName)
```

- default parameters๋ ์ผ๋ฐ์ ์ธ method families๋ฅผ ์ฌ์ฉํ๋ ๊ฒ๋ณด๋ค ์ ํธ๋ฉ๋๋ค. (๊ธฐ๋ณธ ํ๋ผ๋ฏธํฐ ์ฌ์ฉ > ๊ธฐ๋ณธ ํ๋ผ๋ฏธํฐ ์์ฐ๊ณ  method ์ฌ๋ฌ๊ฐ ๋์ด ํ๋ ๊ฒ) 
- ์๋ํ๋ฉด API๋ฅผ ์ดํดํ๋ ค๊ณ  ๋ธ๋ ฅํ๋ ์ฌ๋๋ค์ด ์ ๊ฒฝ์จ์ผํ  ๋ถ๋ถ์ ์ค์ฌ์ฃผ๊ธฐ ๋๋ฌธ์๋๋ค. (์๋ ์์ ๋ฅผ ๋ณด๋ฉด ์กฐ๊ธ ๋ ์ดํด๊ฐ ์ฝ์ต๋๋ค.)

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

method family์ ๋ชจ๋  ๋ฉค๋ฒ๋ค์ (์์ ๋ชจ๋  method๋ค) ๊ฐ๋ณ์ ์ผ๋ก ์ฃผ์์ ๋ฌ์์ ๋ฌธ์ํํด์ค์ผ ํฉ๋๋ค. ๊ทธ๋์ผ ์ ์ ๊ฐ ์ดํดํ  ์ ์์ต๋๋ค. ์ฌ์ฉ์๊ฐ method๋ค ์ค์์ ์ ํํด์ผํ  ๋, ์ฌ์ฉ์๋ method๋ค์ ๋ชจ๋ ์ดํดํด์ผ ํฉ๋๋ค. ๊ฐ๋ ์์์น ๋ชปํ ๊ด๊ณ๊ฐ ๋ฐ์ํฉ๋๋ค. (์๋ฅผ๋ค์ด, `foo(bar: nil)` ๊ณผ `foo()` ๊ฐ ๋ค๋ฅธ ๋์์ ํ๋ ๊ฒฝ์ฐ) ์ด๋ฐ ๊ฒฝ์ฐ ๊ฑฐ์ ๋์ผํ ์ฃผ์ ์์์ ์ฌ์ํ ์ฐจ์ด๋ฅผ ์ฐพ์๋ด๋ ์ง๋ฃจํ ๊ณผ์ ์ด ๋ฐ์ํ๊ฒ ๋ฉ๋๋ค. ํ๋์ method๋ฅผ ์ฌ์ฉํ๊ณ  default parameter๋ฅผ ์ ๊ณตํ๋ ๊ฒ์ ๋งค์ฐ ๋ฐ์ด๋ ํ๋ก๊ทธ๋๋ฐ ๊ฒฝํ์ ์ ๊ณตํฉ๋๋ค.

## default parameter๋ฅผ parameter list ๋ ๋ถ๋ถ์ ๋๋ ๊ฒ์ ์ ํธํฉ๋๋ค.

- default๊ฐ์ด ์๋ parameter๋ ๋ณดํต ๋ฉ์๋ ์๋ฏธ์ ๋ ํ์์ ์ด๊ณ , ์ฌ์ฉํ๋ ์ชฝ์์ ์์ ์ ์ธ ์ฌ์ฉ ํจํด์ ์ ๊ณตํฉ๋๋ค.


