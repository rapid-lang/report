#Tutorial

##Variables 

```
int x = 5;
string b = "hello world";
boolean f = false;
float pi = 3.14;
```

##Casting

###Float <-> Int
```
float f = 7.5
int i = 3
float f = float(i) // f == 3.0
int i = int(f)     // i == 7
```

###Boolean Casting

Boolean casting is accomplished using the `?` operator. All primitive types and lists can be cast to boolean.

```
int i = 7;
i? // true

String s = "Rapid Rocks";
s? // true

String e = "";
e? // false
```

##Lists

```
list<int> a = [1,2,3,4];
list<string> b = ["hello", "world"];
```

##Comments 
```
// This is a single line comment

/*
This is a multi-line
comment
/* They may be nested */
*/
```

##Simple function example
```
func gcd(int p, int q) int {
    while (q != 0) {
        int temp = q;
        q = p % q;
        p = temp;
    }
    return p;
}
```

##Simple GCD Server

```
func gcd(int p, int q) int {
    while (q != 0) {
        int temp = q;
        q = p % q;
        p = temp;
    }
    return p;
}

namespace gcd {
  param int a {
    param int b {
      http (int a, int b) int {
        int res = gcd(a, b);
        return res;
        }
      }
    }
}
```

Here, the namespace represents an http route, and the params represent inputs with that route. For example, sending a get request to `http://hostname:8080/gcd/15/20` would return 5.


##Simple Object Oriented Programming
```
class User {
    int age;
    string name = "Stephen";
    optional int height;

    instance my {
        func is_old() boolean {
            return (my.age >= 30);
        }
        func make_older() {
           my.age = my.age + 1;
        }
    }
}

User bob = new User(age=29);
println(bob.age)
```

Instance methods are called by using dot notation (`bob.is_old()`) and from within an object by using the instance name befor the dot (`my.is_old()`).


