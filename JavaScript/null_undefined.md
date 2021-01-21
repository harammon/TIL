# null vs undefined

### null

자바스크립트에서 null이란, **object 타입**이며, 아직 **'값'**이 정해지지 않은 것을 의미한다.



### undefined

**'타입'**이 정해지지 않은 것을 의미한다.

-> 초기화되지 않은 변수나, 존재하지 않는 값에 접근할 때 반환되는 값이다.

~~~ javascript
var num;          // 초기화하지 않았으므로 undefined 값을 반환함.
var str = null;   // object 타입의 null 값
typeof secondNum; // 정의되지 않은 변수에 접근하면 undefined 값을 반환함.
~~~



- null과 undefined는 동등 연산자`(==)` 와, 일치 연산자`(===)`로 비교할 때 그 결괏값이 다르므로 주의해야 한다.
- null과 undefined는 타입을 제외하면 같은 의미지만, 타입이 다르므로 일치하지는 않는다.

~~~ javascript
null ==  undefined; // true
null === undefined; // false
~~~

