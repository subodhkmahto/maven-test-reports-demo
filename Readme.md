# JUnit Assertions Cheat Sheet

## Equality Assertions

### assertEquals()
Checks whether two values are equal.

```java
assertEquals(expected, actual);
```

Example:

```java
assertEquals(10, result);
```

---

### assertNotEquals()
Checks whether two values are different.

```java
assertNotEquals(expected, actual);
```

Example:

```java
assertNotEquals(10, result);
```

---

## Boolean Assertions

### assertTrue()
Checks whether a condition is true.

```java
assertTrue(condition);
```

Example:

```java
assertTrue(age >= 18);
```

---

### assertFalse()
Checks whether a condition is false.

```java
assertFalse(condition);
```

Example:

```java
assertFalse(list.isEmpty());
```

---

## Null Assertions

### assertNull()
Checks whether an object is null.

```java
assertNull(object);
```

Example:

```java
assertNull(user.getMiddleName());
```

---

### assertNotNull()
Checks whether an object is not null.

```java
assertNotNull(object);
```

Example:

```java
assertNotNull(user);
```

---

## Exception Assertions

### assertThrows()
Checks whether a specific exception is thrown.

```java
assertThrows(Exception.class, () -> {
    // code that should throw exception
});
```

Example:

```java
assertThrows(ArithmeticException.class, () -> {
    int result = 10 / 0;
});
```

---

## Complete Example

```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class CalculatorTest {

    @Test
    void testAssertions() {

        assertEquals(4, 2 + 2);

        assertNotEquals(5, 2 + 2);

        assertTrue(10 > 5);

        assertFalse(5 > 10);

        assertNull(null);

        assertNotNull(new Object());

        assertThrows(ArithmeticException.class, () -> {
            int result = 10 / 0;
        });
    }
}
```

## Quick Reference

| Assertion | Purpose |
|------------|----------|
| `assertEquals()` | Expected value equals actual value |
| `assertNotEquals()` | Values are different |
| `assertTrue()` | Condition is true |
| `assertFalse()` | Condition is false |
| `assertNull()` | Object is null |
| `assertNotNull()` | Object is not null |
| `assertThrows()` | Expected exception is thrown |"# maven-test-reports-demo" 
