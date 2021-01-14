# List Comprehension

- 기존 리스트형을 사용하여 간단하게 새로운 리스트를 만드는 기법

- Haskel 문법에서 차용한 것
- 리스트 내포 혹은 지능형 리스트라고 한다.
- 리스트와 for문을 한 줄에 사용할 수 있는 장점
<br>



## 1. 작성법

~~~ python
[수식 for 변수 in 리스트 if 조건]
~~~



### - 일반적인 반복문 + 리스트

~~~ python
result = []
for i in range(10):
    result.append(i)
~~~

### - list comprehension

~~~python
result = [i for i in range(10)]
~~~

*위와 같이 간편하게 리스트를 만들 수 있다.*
<br>


## 2. 예문

~~~python
result = [i for i in range(10) if i%2 == 0]
print(result)
~~~

`[0, 2, 4, 6, 8]`



~~~python
result = [i if i%2 == 0 else 10 for i in range(10)]
print(result)
~~~

`[0, 10, 2, 10, 4, 10, 6, 10, 8, 10]`

*if문을 앞으로 옮겨 else절과 함께 사용하면, 조건을 만족할 때는 if 앞의 i 변수의 값을, 만족하지 않을 때는 else 뒤에 값을 할당하는 코드를 작성할 수 있다.*
<br>


## 3. 중첩 반복문

~~~python
word_1 = "ABC"
word_2 = "DEF"
result = [i+j for i in word_1 for j in word_2]
print(result)
~~~

`['AD', 'AE', 'AF', 'BD', 'BE', 'BF', 'CD', 'CE', 'CF']`

*word_1에서 나오는 값을 먼저 고정한 후, word_2의 값을 하나씩 가져와 결과를 생성한다.*



#### 중첩 반복문에도 필터링을 적용할 수 있다. 반복문 끝에 if문을 추가하면 된다.

~~~python
case_1 = ["A", "B", "C"]
case_2 = ["D", "E", "A"]
result = [i+j for i in case_1 for j in case_2 if not (i==j)]
print(result)
~~~

`[AD', 'AE', 'BD', 'BE', 'BA', 'CD', 'CE', 'CA']`

<br>

## 4. 이차원 리스트

#### 대괄호 2개를 사용하여 간단하게 만들 수 있다.

~~~ PYTHON
words = 'The quick brown fox jumps'.split()
stuff = [[w.upper(), w.lower(), len(w)] for w in words]  #리스트의 각 요소를 대문자, 소문자, 길이로 반환하여 이차원 리스트로 변환
~~~



~~~ python
case_1 = ["A", "B", "C"]
case_2 = ["D", "E", "A"]
result = [[i+j for i in case_1] for j in case_2]
print(result)
~~~

`[AD', 'BD', 'CD'], ['AE', 'BE', 'CE'], ['AA', 'BA', 'CA']]`

*먼저 작동하는 for문의 순서가 달라진다. -> **뒤의 for문이 고정된다**.*
<br>


## 5. 딕셔너리, 셋(집합) Comprehension

~~~ python
{값표현식 for 요소 in 입력Sequence}
{값표현식 for 요소 in 입력Sequence if 조건식}
{값표현식1 if 조건식 else 값표현식2 for 요소 in 입력Sequence}
~~~



~~~python
{키표현식:값표현식 for 요소 in 입력Sequence}
{키표현식:값표현식 for 요소 in 입력Sequence if 조건식}
{키표현식:값표현식1 if 조건식 else 키표현식:값표현식2 for 요소 in 입력Sequence}
~~~



