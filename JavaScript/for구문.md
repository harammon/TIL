# for구문

#### 1. forEach

- Array를 순회하는 데 사용되는 Array의 메서드
- 오직 Array 객체에서만 사용 가능한 메서드
- `forEach`구문의 인자로 callback함수를 등록할 수 있고, 배열의 각 요소들이 반복될 때 이 callback함수가 호출된다.

~~~ javascript
var items = ['item1', 'item2', 'item3'];
items.forEach(function(item) {
    console.log(item);
});
// 출력 결과: item, item2, item
~~~



#### 2. for in

- Object의 **key**를 순회하기 위해 사용되는 반복문(*`value`값에 접근하는 방법은 제공하지 x*)

  -> Object에 있는 key에 차레로 접근!!

- **열거형 속성**`Enumerable`값이 **true**인 속성들만 반복할 수 있다.

- 단, 확장 속성까지 함께 순회하므로 주의 필요!

~~~ javascript
var obj = {
    a: 1, 
    b: 2, 
    c: 3
};
for (var prop in obj) {
    console.log(prop, obj[prop]); // a 1, b 2, c 3
}
~~~



#### 3. for of

- 반복할 수 있는 객체(이터러블 - `iterable objects`)를 순회하는 반복문

- 루프마다 객체의 열거할 수 있는 프로퍼티의 값을 지정된 변수에 대입한다.

~~~ javascript
var iterable = [3, 5, 7];
for (var value of iterable) {
  console.log(value); // 3, 5, 7
}
~~~



*반복할 수 있는 객체 : Array, Map, Setm arguments 객체*  

