# ๐ท Argument Labels

```swift
func move(from start: Point, to end: Point)
x.move(from: x, to: y) 
```

## label์ ์จ๋ ์ ์ฉํ๊ฒ ๊ตฌ๋ถ์ด ๋์ง ์๋๋ค๋ฉด ๋ชจ๋  label์ ์๋ตํ์ธ์.

e.g. `min(number1, number2)`, `zip(sequence1, sequence2)`

## ๊ฐ์ ์ ์งํ๋ฉด์ ํ์ ๋ณํ์ ํด์ฃผ๋ initializer์์, ์ฒซ๋ฒ์งธ argument label์ ์๋ตํ์ธ์.

e.g. `Int64(someUInt32)`

### ์ฒซ๋ฒ์งธ argument๋ ํญ์ source of convesion ์ด์ด์ผ ํ๋ค.

```swift
extension String {
  // Convert `x` into its textual representation in the given radix
  init(_ x: BigInt, radix: Int = 10)   โ Note the initial underscore
}

text = "The value is: "
text += String(veryLargeNumber)
text += " and in hexadecimal, it's"
text += String(veryLargeNumber, radix: 16)
```

### ๊ฐ์ ๋ฒ์๊ฐ ์ขํ์ง๋ ํ์ ๋ณํ์ ๊ฒฝ์ฐ, label์ ๋ถ์ฌ์ ์ค๋ชํ๋ ๊ฒ์ ์ถ์ฒํฉ๋๋ค.

```swift
extension UInt32 {
  /// Creates an instance having the specified `value`.
  init(_ value: Int16)            โ Widening, so no label
  /// Creates an instance having the lowest 32 bits of `source`.
  init(truncating source: UInt64)
  /// Creates an instance having the nearest representable
  /// approximation of `valueToApproximate`.
  init(saturating valueToApproximate: UInt64)
}
```

## ์ฒซ ๋ฒ์งธ argument๊ฐ ์ ์น์ฌ๊ตฌ์ ์ผ๋ถ์ผ ๋, argument label๋ก ์ง์ ํฉ๋๋ค.

argument label์ ๋ณดํต ์ ์น์ฌ๋ก ์์ํฉ๋๋ค. eg. `x.removeBoxes(havingLength: 12)`

์ฒ์์ ๋์ค๋ 2๊ฐ์ argument๋ค์ด ๋จ์ผ ์ถ์ํ๋ฅผ ํํํ๋ ๊ฒฝ์ฐ๋ ์์ธ์๋๋ค.

```swift
// Bad
a.move(toX: b, y: c)
a.fade(fromRed: b, green: c, blue: d)
```

์ด๋ฐ ๊ฒฝ์ฐ, ์ถ์ํ๋ฅผ ๋ชํํ ํ๊ธฐ ์ํด ์ ์น์ฌ ๋ค์ argument label์ ์์ํฉ๋๋ค.

```swift
// Good
a.moveTo(x: b, y: c)
a.fadeFrom(red: b, green: c, blue: d)
```

## ๋ง์ฝ ์ฒซ๋ฒ์งธ argument๊ฐ ๋ฌธ๋ฒ์  ๊ตฌ์ ์ ๋ง๋ ๋ค๋ฉด label์ ์ ๊ฑฐํ๊ณ , ํจ์ ์ด๋ฆ์ base name์ ์ถ๊ฐํฉ๋๋ค.

eg. `x.addSubview(y)`

์ด ๊ฐ์ด๋๋ผ์ธ์ ์ฒซ๋ฒ์งธ argument๊ฐ ๋ฌธ๋ฒ์ ์ผ๋ก ๊ตฌ์ ์ ๋ง๋ค์ง ์๋๋ค๋ฉด, label์ ๋ฌ์ผํ๋ค๋ ๊ฒ์ ์์ํฉ๋๋ค.

```swift
// Good
view.dismiss(animated: false)
let text = words.split(maxSplits: 12)
let studentsByName = students.sorted(isOrderedBefore: Student.namePrecedes)
```

๊ตฌ์ ์ด ์ ํํ ์๋ฏธ๋ฅผ ์ ๋ฌํ๋ ๊ฒ์ด ์ค์ํฉ๋๋ค. ๋ค์ ์์๋ ๋ฌธ๋ฒ์ ์ด์ง๋ง ๋ชจํธํ ํํ์ ํ๊ณ  ์์ต๋๋ค.

```swift
// Bad
view.dismiss(false)   Don't dismiss? Dismiss a Bool?
words.split(12)       Split the number 12?
```

default value๋ฅผ ๊ฐ์ง argument๋ ์๋ต๋  ์ ์์ผ๋ฉฐ, ์ด ๊ฒฝ์ฐ ๋ฌธ๋ฒ ๊ตฌ๋ฌธ์ ์ผ๋ถ๋ฅผ ํ์ฑํ์ง ์์ผ๋ฏ๋ก ํญ์ ๋ ์ด๋ธ์ด ์์ด์ผ ํฉ๋๋ค.

## ๋๋จธ์ง ๋ชจ๋  ๊ฒฝ์ฐ, argument๋ค์ Label์ ๋ถ์ฌ์ผ ํฉ๋๋ค.
