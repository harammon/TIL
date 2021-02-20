# GET vs Post

**공통점 : 클라이언트가 서버에 요청`(request)`을 보내는 메소드** <br/>

### GET

- 필요한 정보를 가져와서 **조회**하기 위함

- 특징

  - URL에 변수(클라이언트의 데이터)를 포함시켜 요청한다.

    -> 데이터를 보내는 양에 한계가 있다.

  - 데이터를 헤더`(Header)`에 포함하여 전송한다.

  - URL에 데이터가 노출되어 보안에 취약하다.

  - 캐싱할 수 있다. 

    -> 이러한 특성으로 POST보다 (일반적으로) 빠르다.

~~~ 
GET https://www.youtube.com/watch?v=msEyXbAtFys HTTP/1.1
~~~

-> URL 부분의 `?` 뒤에 **이름=값** 쌍으로 이어붙며, 여러 쌍을 보낼 때 `&`를 사용한다.<br/>



### POST

- 데이터를 서버로 제출하여 **추가** 또는 **수정**하기 위해 사용하는 방식

- 특징

  - URL에 변수(데이터)를 노출하지 않고 요청한다.

    -> 데이터를 보내는 양에 제한은 없지만, 최대 요청을 받는 시간인 `Time out`이 존재함.

  - 데이터를 바디`(Body)`에 포함시킨다.

  - URL에 데이터가 노출되지 않아 기본 보안은 가능하다.

  - 캐싱할 수 없다.

~~~
POST https://www.youtube.com/watch HTTP/1.1
Content-Type: application/x-www-form-urlencoded

q=?v=msEyXbAtFys
~~~

-> GET에서 URL에 포함시켰던 파라미터들을 요청 메시지의 **바디**에 넣는다.
<br/>


### 추가

- form 태그는 GET, POST 방식을 선택할 수 있다.
  - GET 방식은 URL 뒤에 쿼리 정보가 추가(같이 전달)
  - POST 방식은 
- 그 이외에는 모두 GET 방식!!

- request.GET은 GET으로 받는 인자들을 다 포함하는 딕셔너리 객체이다.
- get() 메서드는 키값이 딕셔너리 안에 있으면 밸류값을 리턴해준다. 키값이 존재하지 않으면 디폴트값 None을 리턴한다.
- request.GET.get()은 위 두 개념을 합친 것으로 GET요청이 접근할 수 있는 키와 밸류값을 이용한다. 이것은 장고 뷰스에서 대부분 쓰여진다.

<br/><br/>

[출처]<br/>

https://mangkyu.tistory.com/17

https://velog.io/@meekukin/TIL-django
