# ๐ฝ Special Instructions

## tuple members์ closure parameters์ Label์ ๋ถ์ด์ธ์.

์ด๋ฌํ ์ด๋ฆ๋ค์ ์ค๋ช๋ ฅ์ด ์๊ณ , ๋ฌธ์ํ๋ ์ฃผ์์์ ์ธ๊ธ๋  ์ ์์ผ๋ฉฐ, ํํ ๋ฉค๋ฒ์ ๋ํ expressive access๋ฅผ ์ ๊ณตํฉ๋๋ค.

```swift
/// Ensure that we hold uniquely-referenced storage for at least
/// `requestedCapacity` elements.
///
/// If more storage is needed, `allocate` is called with
/// `byteCount` equal to the number of maximally-aligned
/// bytes to allocate.
///
/// - Returns:
///   - reallocated: `true` iff a new block of memory
///     was allocated.
///   - capacityChanged: `true` iff `capacity` was updated.
mutating func ensureUniqueStorage(
  minimumCapacity requestedCapacity: Int, 
  allocate: (_ byteCount: Int) -> UnsafePointer<Void>
) -> (reallocated: Bool, capacityChanged: Bool)
```

ํด๋ก์  ํ๋ผ๋ฏธํฐ๋ก ์ฌ์ฉ๋ ๋ค์ด๋ฐ์ [๐ฅ Parameters](conventions/parameters.md) ๋ค์ด๋ฐ์ top-level functions์ ๋์ผํ ๋ฐฉ์์ผ๋ก ์ง์ด์ผ ํฉ๋๋ค. ํธ์ถํ๋ ๊ณณ์์ ๋ณผ ์ ์๋ closure argument label์ ์ง์๋์ง ์์ต๋๋ค.

## overload set์์์ ๋ชจํธํจ์ ํผํ๊ธฐ ์ํด, ์ ์ฝ ์๋ ๋คํ์ฑ์ ๊ฐ๋ณํ ์ฃผ์ํ์ธ์.

eg. `Any`, `AnyObject`, unconstrained generic parameters

์๋ฅผ ๋ค์ด, ์ด๋ฐ overload set์ด ์๋ค๊ณ  ์๊ฐํด๋ด์๋ค.

```swift
// Bad
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(_ newElements: S)
    where S.Generator.Element == Element
}
```

์์ ๋ฉ์๋์ argument types๋ ์ฒ์์๋ ๋๋ ทํ๊ฒ ๊ตฌ๋ถ๋๋ ๊ฒ ์ฒ๋ผ ๋ณด์๋๋ค. ๊ทธ๋ฌ๋ `Element` ๊ฐ `Any` ์ธ ๊ฒฝ์ฐ ํ๋์ ์์๊ฐ ์ํ์ค์ ๋์ผํ ์ ํ์ ๊ฐ์ง ์ ์์ต๋๋ค. (์๋ ์์)

```swift
// Bad
var values: [Any] = [1, "a"]
values.append([2, 3, 4]) // [1, "a", [2, 3, 4]] or [1, "a", 2, 3, 4]?
```

๋ชจํธํจ์ ์ ๊ฑฐํ๊ธฐ ์ํด, ๋๋ฒ์งธ overload์ ์ด๋ฆ์ ๋ ๋ช์์ ์ผ๋ก ์ง์ ํฉ๋๋ค.

```swift
// Good
struct Array {
  /// Inserts `newElement` at `self.endIndex`.
  public mutating func append(_ newElement: Element)

  /// Inserts the contents of `newElements`, in order, at
  /// `self.endIndex`.
  public mutating func append(contentsOf newElements: S)
    where S.Generator.Element == Element
}
```
