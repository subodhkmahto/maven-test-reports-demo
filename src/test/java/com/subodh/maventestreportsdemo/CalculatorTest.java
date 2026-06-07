package com.subodh.maventestreportsdemo;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.BeforeEach;
import static org.junit.jupiter.api.Assertions.*;

public class CalculatorTest {

    private Calculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new Calculator();
    }

    @Test
    void testAddition() {
        assertEquals(5, calculator.add(2, 3));
    }

    @Test
    void testSubtraction() {
        assertEquals(2, calculator.subtract(5, 3));
    }

    @Test
    void testMultiplication() {
        assertEquals(6, calculator.multiply(2, 3));
    }

    @Test
    void testDivision() {
        assertEquals(2.5, calculator.divide(5, 2));
    }
    
    @Test
    void testModulus() {
        assertEquals(1, calculator.modulus(10, 3));
    }

    @Test
    void testDivideByZero() {
        // Exception test
        assertThrows(ArithmeticException.class, () -> {
            calculator.divide(5, 0);
        });
    }

    @Test
    void testNegativeNumbers() {
        assertEquals(-1, calculator.add(-3, 2));
    }
}