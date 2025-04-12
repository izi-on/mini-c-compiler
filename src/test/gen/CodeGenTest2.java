package gen;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import java.io.IOException;

public class CodeGenTest2 extends CodeGenTest {
    @Test
    public void testRegisterAllocationStress() throws InterruptedException, IOException {
        String code = """
// Define complex structs to stress memory layout
struct Node {
    int value;
    struct Node* next;
    int tag;  // Change from char to int to avoid type issues
    int exists;
    int hasNext; // Add flag to indicate if next pointer is valid
};

struct Matrix {
    int data[3][3];
    int determinant;
    struct Node* nodes[3];
};

// Recursive function to create a linked list with nodes containing values n down to 1
struct Node* createLinkedList(int n) {
    struct Node* node;
    int size;
    
    size = sizeof(struct Node);
    node = (struct Node*) mcmalloc(size);
    
    (*node).value = n;
    (*node).tag = 65 + (n % 26);  // Use ASCII value directly instead of char 'A' + offset
    (*node).exists = 1;
    
    if (n > 1) {
        (*node).next = createLinkedList(n - 1);
        (*node).hasNext = 1;  // Set flag to indicate next pointer is valid
    } else {
        (*node).hasNext = 0;  // Set flag to indicate no next pointer
    }
    
    return node;
}

// Function to calculate determinant of a 3x3 matrix
int calculateDeterminant(int matrix[3][3]) {
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int det;
    
    a = matrix[0][0];
    b = matrix[0][1];
    c = matrix[0][2];
    d = matrix[1][0];
    e = matrix[1][1];
    f = matrix[1][2];
    g = matrix[2][0];
    h = matrix[2][1];
    i = matrix[2][2];
    
    det = a * (e * i - f * h) - b * (d * i - f * g) + c * (d * h - e * g);
    
    return det;
}

// Function that uses many local variables and performs complex calculations
int complexComputation(int a, int b, int c, int d, int e, int f, int g, int h, int i, int j) {
    int x1;
    int x2;
    int x3;
    int x4;
    int x5;
    int x6;
    int x7;
    int x8;
    int x9;
    int x10;
    int x11;
    int x12;
    int x13;
    int x14;
    int x15;
    int result;
    
    x1 = a + b;
    x2 = c - d;
    x3 = e * f;
    x4 = g / 2;
    x5 = h % 5;
    x6 = i + j;
    x7 = x1 * x2;
    x8 = x3 + x4;
    x9 = x5 - x6;
    x10 = x7 / x8;
    x11 = x9 * a;
    x12 = x10 + b;
    x13 = x11 - c;
    x14 = x12 * d;
    x15 = x13 + x14;
    
    result = (x1 + x2) * (x3 - x4) + (x5 * x6) - (x7 / (x8 + 1)) + (x9 * x10) - (x11 + x12) * (x13 - x14) + x15;
    
    return result;
}

// Fibonacci with excessive variable use to stress register allocation
int stressFibonacci(int n) {
    int a;
    int b;
    int c;
    int d;
    int e;
    int f;
    int g;
    int h;
    int i;
    int j;
    int temp;
    
    if (n <= 1) {
        return n;
    }
    
    a = 0;
    b = 1;
    c = 2;
    d = a + b;  // d = 1
    e = b + d;  // e = 2
    f = c + e;  // f = 4
    g = d + f;  // g = 5
    h = e + g;  // h = 7
    i = f + h;  // i = 11
    j = g + i;  // j = 16
    
    temp = b;
    
    while (c < n) {
        temp = a + b;
        a = b;
        b = temp;
        
        // Unnecessary operations to stress registers
        d = a * 2;
        e = b * 3;
        f = c * 4;
        g = d * 5;
        h = e / 2;
        i = f / 3;
        j = g / 4;
        
        c = c + 1;
    }
    
    return b;
}

// Binary tree node for recursive tree operations
struct TreeNode {
    int value;
    struct TreeNode* left;
    struct TreeNode* right;
    int hasLeft;  // Add flag to indicate if left pointer is valid
    int hasRight; // Add flag to indicate if right pointer is valid
};

// Create a balanced binary tree of height h
struct TreeNode* createTree(int h, int val) {
    struct TreeNode* node;
    int nodeSize;
    
    nodeSize = sizeof(struct TreeNode);
    node = (struct TreeNode*) mcmalloc(nodeSize);
    
    (*node).value = val;
    
    if (h <= 0) {
        (*node).hasLeft = 0;  // Set flag to indicate no left child
        (*node).hasRight = 0; // Set flag to indicate no right child
    } else {
        (*node).left = createTree(h - 1, val * 2);
        (*node).right = createTree(h - 1, val * 2 + 1);
        (*node).hasLeft = 1;  // Set flag to indicate left child exists
        (*node).hasRight = 1; // Set flag to indicate right child exists
    }
    
    return node;
}

// Sum all values in a binary tree
int sumTree(struct TreeNode* root) {
    int leftSum;
    int rightSum;
    
    leftSum = 0;
    rightSum = 0;
    
    if ((*root).hasLeft) {
        leftSum = sumTree((*root).left);
    }

    if ((*root).hasRight) {
        rightSum = sumTree((*root).right);
    }
    
    return (*root).value + leftSum + rightSum;
}

int main() {
    // Declare all variables at the top
    int sum;
    int i;
    int j;
    int k;
    int l;
    int m;
    int n;
    int a1;
    int a2;
    int a3;
    int a4;
    int a5;
    int a6;
    int a7;
    int a8;
    int a9;
    int a10;
    int a11;
    int a12;
    int a13;
    int a14;
    int a15;
    int chain;
    int result1;
    int result2;
    int result3;
    int result4;
    int matrix1[3][3];
    int matrix2[3][3];
    int det1;
    int det2;
    struct Node* head;
    struct Matrix matrixStruct;
    struct TreeNode* root;
    int treeSum;
    int* dynamicArray;
    int dynamicSum;
    
    sum = 0;
    
    // Initialize matrices
    i = 0;
    while (i < 3) {
        j = 0;
        while (j < 3) {
            matrix1[i][j] = i * 3 + j + 1;
            matrix2[i][j] = (i * 3 + j + 1) * 2;
            j = j + 1;
        }
        i = i + 1;
    }
    
    // Calculate determinants
    det1 = calculateDeterminant(matrix1);
    det2 = calculateDeterminant(matrix2);
    
    sum = sum + det1 + det2;
    
    // Create linked list and sum its values
    head = createLinkedList(7);
    
    i = 0;
    n = 7;
    while (i < n && (*head).exists) {
        sum = sum + (*head).value;
        if ((*head).hasNext) {
            head = (*head).next;
        } else {
            break; // Stop if we've reached the end of the list
        }
        i = i + 1;
    }
    
    // Stress the register allocation with many variables and operations
    a1 = 10;
    a2 = 20;
    a3 = 30;
    a4 = 40;
    a5 = 50;
    a6 = 60;
    a7 = 70;
    a8 = 80;
    a9 = 90;
    a10 = 100;
    a11 = 110;
    a12 = 120;
    a13 = 130;
    a14 = 140;
    a15 = 150;

    result1 = complexComputation(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    result2 = complexComputation(a2, a3, a4, a5, a6, a7, a8, a9, a10, a1);
    result3 = complexComputation(a5, a6, a7, a8, a9, a10, a1, a2, a3, a4);
    result4 = complexComputation(a10, a9, a8, a7, a6, a5, a4, a3, a2, a1);
    
    sum = sum + result1 + result2 + result3 + result4;
    
    // Nested loops with complex functions
    i = 1;
    while (i <= 3) {
        j = 1;
        while (j <= 3) {
            k = 1;
            while (k <= 3) {
                l = stressFibonacci(i + j + k);
                m = stressFibonacci(i * j * k);
                sum = sum + l + m;
                k = k + 1;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    
    // Create a binary tree and sum its values
    root = createTree(3, 1);  // Height 3, starting with value 1
    treeSum = sumTree(root);
    sum = sum + treeSum;
    
    // Allocate and use a dynamic array
    dynamicArray = (int*) mcmalloc(10 * sizeof(int));
    
    i = 0;
    while (i < 10) {
        dynamicArray[i] = i * i;
        i = i + 1;
    }
    
    dynamicSum = 0;
    i = 0;
    while (i < 10) {
        dynamicSum = dynamicSum + dynamicArray[i];
        i = i + 1;
    }
    
    sum = sum + dynamicSum;
    
    // Initialize and use the Matrix struct
    i = 0;
    while (i < 3) {
        j = 0;
        while (j < 3) {
            matrixStruct.data[i][j] = i + j;
            j = j + 1;
        }
        matrixStruct.nodes[i] = createLinkedList(i + 3);
        i = i + 1;
    }
    
    matrixStruct.determinant = calculateDeterminant(matrixStruct.data);
    sum = sum + matrixStruct.determinant;
    
    // Sum values from all nodes in the matrix struct
    i = 0;
    while (i < 3) {
        struct Node* current;
        current = matrixStruct.nodes[i];
        j = 0;
        while (j < i + 3 && (*current).exists) {  // Check exists flag
            sum = sum + (*current).value;
            if ((*current).hasNext) {  // Check hasNext flag
                current = (*current).next;
            } else {
                break;
            }
            j = j + 1;
        }
        i = i + 1;
    }
    
    // Final chain of complex arithmetic
    chain = ((a1 + a2) * (a3 - a4) / (a5 + 1)) + 
            ((a6 - a7) * (a8 + a9) / (a10 + 1)) - 
            ((a11 + a12) * (a13 - a14) / (a15 + 1));
    
    sum = sum + chain;
    
    print_i(sum);
    return 0;
}
""";
        String expectedOutput = "3654";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "Ultra high stress register allocation test");
    }

    @Test
    public void testClassGenVirtualMaps() throws InterruptedException, IOException {
        String code =
                """
                        class Animal {
                            void speak() {
                                print_s((char*)"Animal sound\\n");
                            }
                        }
                        class Bird extends Animal {
                            void speak() {
                                print_s((char*)"Chirp\\n");
                            }
                        }
                        class Dog extends Animal {
                            void speak() {
                                print_s((char*)"Woof\\n");
                            }
                        }
                        class Doberman extends Dog {
                            void speak() {
                                print_s((char*)"Bark\\n");
                            }
                            void fetch() {
                                print_s((char*)"Fetching\\n");
                            }
                        }
                        int main() {
                            class Dog d;
                            d = (class Dog) new class Doberman();
                            d.speak();
                            return 0;
                        }

                                        """;

        String expectedOutput = "Bark";
        String output = runCode(code);
        assertEquals(expectedOutput, output, "");
    }

    @Test
    public void testClass() throws IOException, InterruptedException {
        String code = """
                class A {
                    void speak() {
                        print_s((char*)"A");
                    }
                    
                    void bark() {
                        print_s((char*)"Bark");
                    }
                }
                
                int main() {
                    class A a;
                    a = new class A();
                    a.speak();
                    a.bark();
                }
                """;
        String output = runCode(code);
        String expectedOutput = "ABark";
        assertEquals(expectedOutput, output, "Class A test");
    }

    @Test
    public void testExample() throws IOException, InterruptedException {
        String code = """
                class Course {
                        char name[20];
                        int credit;
                        int courseWorkScore;

                        void whereToAttend(){
                            print_s((char*)"Not determined! The course will be held virtually or in person!\\n");
                        }

                        int hasExam(){
                            if(courseWorkScore == 100)
                                return 0;
                            else
                                return 1;
                        }

                        void setCourseWorkScore(int score){
                            courseWorkScore = score;
                        }
                    }

                int main() {
                   class Course c;
                   c = new class Course();
                   c.setCourseWorkScore(100);
                   if (c.hasExam()){
                       print_s((char*)"exam!");
                   }
                   else{
                       print_s((char*)"No Exam!");
                   }
                }
                """;
        String output = runCode(code);
        String expectedOutput = "No Exam!";
        assertEquals(expectedOutput, output, "Branching logic test");
    }

    @Test
    public void testClassFieldAccessAndAssignment() throws IOException, InterruptedException {
        String code = """
                class A {
                    int x;
                    int y;
                }

                int main() {
                    class A a;
                    a = new class A();
                    a.x = 5;
                    a.y = 10;
                    print_i(a.x);
                    print_i(a.y);
                }
                """;
        String output = runCode(code);
        String expectedOutput = "510";
        assertEquals(expectedOutput, output, "Class field access and assignment test");
    }

    @Test
    public void testClassDynamicDispatch() throws IOException, InterruptedException {
        String code = """
                class Animal {
                    void speak() {
                        print_s((char*)"Animal sound\\n");
                    }
                }

                class Dog extends Animal {
                    void speak() {
                        print_s((char*)"Woof\\n");
                    }
                }

                int main() {
                    class Animal a;
                    a = (class Animal) new class Dog();
                    a.speak();
                }
                """;
        String output = runCode(code);
        String expectedOutput = "Woof";
        assertEquals(expectedOutput, output, "Class dynamic dispatch test");
    }

    @Test
    public void testSizeOfClassShouldBe4() throws IOException, InterruptedException {
        String code = """
                class A {
                    int x;
                    int y;
                }

                int main() {
                    print_i(sizeof(class A));
                }
                """;
        String output = runCode(code);
        String expectedOutput = "4";
        assertEquals(expectedOutput, output, "Size of class test");
    }

    @Test
    public void testClassWithArrayField() throws IOException, InterruptedException {
        String code = """
                class A {
                    int arr[10];
                }

                int main() {
                    class A a;
                    a = new class A();
                    a.arr[0] = 5;
                    print_i(a.arr[0]);
                }
                """;
        String output = runCode(code);
        String expectedOutput = "5";
        assertEquals(expectedOutput, output, "Class with array field test");
    }

    @Test
    public void testClassReferenceComparison() throws IOException, InterruptedException {
        String code = """
                class A {
                    int x;
                }

                int main() {
                    class A a;
                    class A b;
                    a = new class A();
                    b = a;
                    if (a == b) {
                        print_s((char*)"Same reference\\n");
                    } else {
                        print_s((char*)"Different reference\\n");
                    }
                }
                """;
        String output = runCode(code);
        String expectedOutput = "Same reference";
        assertEquals(expectedOutput, output, "Class reference comparison test");
    }

    @Test
    public void testClassInheritedFields() throws IOException, InterruptedException {
        String code = """
                class A {
                    int x;
                }

                class B extends A {
                    int y;
                }

                int main() {
                    class B b;
                    b = new class B();
                    b.x = 5;
                    b.y = 10;
                    print_i(b.x);
                    print_i(b.y);
                }
                """;
        String output = runCode(code);
        String expectedOutput = "510";
        assertEquals(expectedOutput, output, "Class inherited fields test");
    }

    @Test
    public void testMultiLevelInheritanceSafeCasting() throws IOException, InterruptedException {
        String code = """
            class A {
                void f() {
                    print_s((char*)"A");
                }
            }
            
            class B extends A {
                void f() {
                    print_s((char*)"B");
                }
                void g() {
                    print_s((char*)"B-g");
                }
            }
            
            class C extends B {
                void f() {
                    print_s((char*)"C");
                }
                void g() {
                    print_s((char*)"C-g");
                }
                void h() {
                    print_s((char*)"C-h");
                }
            }
            
            int main() {
                // Directly create a variable of type B to hold the instance of C.
                class B b;
                class C c;
                b = (class B) new class C();  // Upcasting from C to B is safe.
                b.f();              // Expected to call C.f() → outputs "C"
                b.g();              // Expected to call C.g() → outputs "C-g"
            }
            """;
        String output = runCode(code);
        String expectedOutput = "CC-g";
        assertEquals(expectedOutput, output, "Multi-level inheritance safe casting test");
    }

    @Test
    public void testCalculatorInheritance() throws IOException, InterruptedException {
        String code = """
            class Calculator {
                int value;
                void add(int x) {
                    value = value + x;
                }
                void printValue() {
                    print_i(value);
                }
            }

            class AdvancedCalculator extends Calculator {
                void multiply(int x) {
                    value = value * x;
                }
            }

            int main() {
                class Calculator calc;
                class AdvancedCalculator adv;
                calc = (class Calculator) new class AdvancedCalculator();
                calc.add(5);  // value becomes 5
                calc.printValue(); // Should print "5"
                return 0;
            }
            """;
        String output = runCode(code);
        String expectedOutput = "5";
        assertEquals(expectedOutput, output, "Calculator inheritance dynamic dispatch test");
    }

    @Test
    public void testExtendedArrayHolderNoDowncast() throws IOException, InterruptedException {
        String code = """
            class ArrayHolder {
                int arr[5];
                void setValue(int index, int value) {
                    arr[index] = value;
                }
                void printValue(int index) {
                    print_i(arr[index]);
                }
            }
            
            class ExtendedArrayHolder extends ArrayHolder {
                void doubleValue(int index) {
                    arr[index] = arr[index] * 2;
                }
            }
            
            int main() {
                // Directly create an instance of ExtendedArrayHolder.
                class ExtendedArrayHolder e;
                class ArrayHolder a;
                e = new class ExtendedArrayHolder();
                e.setValue(2, 7);
                e.doubleValue(2);   // Doubles the value at index 2 from 7 to 14.
                
                // Upcast: store the ExtendedArrayHolder instance in a base type reference.
                a = (class ArrayHolder) e;              // This is an upcast, which reduces the visible interface to ArrayHolder.
                a.printValue(2);    // Expected output: "14"
                return 0;
            }
            """;
        String output = runCode(code);
        String expectedOutput = "14";
        assertEquals(expectedOutput, output, "Class with array field and upcasting test");
    }

    @Test
    public void testComplexCastingChainNoDowncast() throws IOException, InterruptedException {
        String code = """
            class Base {
                void info() {
                    print_s((char*)"Base");
                }
            }
            
            class Derived extends Base {
                void info() {
                    print_s((char*)"Derived");
                }
                void extra() {
                    print_s((char*)"DerivedExtra");
                }
            }
            
            class MoreDerived extends Derived {
                void info() {
                    print_s((char*)"MoreDerived");
                }
                void extra() {
                    print_s((char*)"MoreDerivedExtra");
                }
            }
            
            int main() {
                // Create an instance as MoreDerived.
                class MoreDerived m;
                class Base b;
                class Derived d;
                
                m = new class MoreDerived();
                
                // Upcast to Base. This shrinks the interface but still calls the correct info() method.
                b = (class Base) m;        // Safe upcasting from MoreDerived to Base.
                b.info();     // Dynamic dispatch should invoke MoreDerived.info(), printing "MoreDerived".
                
                // Upcast to Derived. Again, this is safe as MoreDerived is a subtype of Derived.
                d = (class Derived) m;        // Safe upcasting from MoreDerived to Derived.
                d.extra();    // Dynamic dispatch should invoke MoreDerived.extra(), printing "MoreDerivedExtra".
                
                return 0;
            }
            """;
        String output = runCode(code);
        String expectedOutput = "MoreDerivedMoreDerivedExtra";
        assertEquals(expectedOutput, output, "Complex casting chain using only upcasting test");
    }

    @Test
    public void passObjectInFunction() throws IOException, InterruptedException {
        String code = """
            class A {
                int x;
                int y;
            }

            void modify(class A obj) {
                obj.x = 20;
                obj.y = 30;
            }

            int main() {
                class A a;
                a = new class A();
                a.x = 5;
                a.y = 10;
                modify(a);
                print_i(a.x); // Should print 20
                print_i(a.y); // Should print 30
            }
            """;
        String output = runCode(code);
        String expectedOutput = "2030";
        assertEquals(expectedOutput, output, "Pass object in function test");
    }

    @Test
    public void testCallMethodFromOtherMethod() throws IOException, InterruptedException {
        String code = """
            class A {
                void method2() {
                    print_s((char*)"Method 2 called\\n");
                }
                
                void method1() {
                    print_s((char*)"Method 1 called\\n");
                    method2();
                }
            }

            int main() {
                class A a;
                a = new class A();
                a.method1();
            }
            """;
        String output = runCode(code);
        String expectedOutput = "Method 1 called\nMethod 2 called";
        assertEquals(expectedOutput, output, "Call method from other method test");
    }

    @Test
    public void testClassWithPointerField() throws IOException, InterruptedException {
        String code = """
            class A {
                int* ptr;
            }

            int main() {
                class A a;
                a = new class A();
                a.ptr = (int*) mcmalloc(sizeof(int));
                *a.ptr = 42;
                print_i(*a.ptr);
            }
            """;
        String output = runCode(code);
        String expectedOutput = "42";
        assertEquals(expectedOutput, output, "Class with pointer field test");
    }

    @Test
    public void testGlobalFunctionCallFromClass() throws IOException, InterruptedException {
        String code = """
            void globalFunction() {
                print_s((char*)"Global function called\\n");
            }

            class A {
                void callGlobal() {
                    globalFunction();
                }
            }

            int main() {
                class A a;
                a = new class A();
                a.callGlobal();
            }
            """;
        String output = runCode(code);
        String expectedOutput = "Global function called";
        assertEquals(expectedOutput, output, "Global function call from class test");
    }

    // this function will call a method from another method and access a field
    @Test
    public void testMethodCallFromMethodAndFieldAccess() throws IOException, InterruptedException {
        String code = """
            class A {
                int x;
                int y;

                void printValues() {
                    print_i(x);
                    print_i(y);
                }
                
                void setValues(int a, int b) {
                    x = a;
                    y = b;
                    printValues();
                }

            }

            int main() {
                class A a;
                a = new class A();
                a.setValues(5, 10);
            }
            """;
        String output = runCode(code);
        String expectedOutput = "510";
        assertEquals(expectedOutput, output, "Method call from method and field access test");
    }

}