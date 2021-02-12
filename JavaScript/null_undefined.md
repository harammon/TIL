# null vs undefined

### null과 undefined는 모두 '값'이자, '데이터 타입이다.'

### null

- 변수에 저장된 값이 null인 경우를 가리킨다. -> 값은 값인데, **비어 있는 값**
- `null`은 변수에 저장된 데이터를 비우고자 할 때 사용하는 값이다.



### undefined

- 정의되지 않은 것, 초기화되어 있지 않거나 존재하지 않는 객체의 프로퍼티 및 존재하지 않는 배열의 원소값에 접근하려고 할 때 얻어지는 변수의 값이다.

-> 초기화되지 않은 변수나, 존재하지 않는 값에 접근할 때 반환되는 값이다.

~~~ javascript
var num;          // 초기화하지 않았으므로 undefined 값을 반환함.
var str = null;   // object 타입의 null 값
typeof secondNum; // 정의되지 않은 변수에 접근하면 undefined 값을 반환함.
~~~



- null과 undefined는 동등 연산자`(==)` 와, 일치 연산자`(===)`로 비교할 때 그 결괏값이 다르므로 주의해야 한다.

- null과 undefined는 같은 값을 나타내지만, **타입이 다르므로** 일치하지는 않는다.
- `==` 연산자 : 왼쪽 피연산자와 오른쪽 피연산자의 **값**이 같으면 참을 반환함.
- `===`연산자 : 왼쪽 피연산자와 오른쪽 피연산자의 **값**이 같고, **같은 타입**이면 참을 반환함.

~~~ javascript
null ==  undefined; // true
null === undefined; // false
~~~

