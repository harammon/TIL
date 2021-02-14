# \<script\> 태그의 위치

### body 태그 최하단에 위치하는 것이 가장 좋다.

#### * 이유

* 브라우저의 동작 방식

1. HTML을 읽기 시작한다.
2. HTML을 파싱한다.
3. DOM 트리를 생성한다.
4. Render 트리(DOM tree + CSS의 CSSOM 트리 결합)가 생성되고 
5. Display에 표시한다. 

- HTML 태그들을 읽어나가는 도중 <script> 태그를 만나면 파싱을 중단하고 javascript 파일을 로드 후 javascript 코드를 파싱한다. 
- \<script\> 파싱이 완료되면, 그 후에 HTML 파싱이 계속 되다.
- 이로인해 HTML태그들 사이에 script 태그가 위치하면 두가지 문제가 발생!!
  - HTML을 읽는 과정에 스크립트를 만나면 중단 시점이 생기고 그만큼 Display에 표시되는 것이 **지연**된다.
  - DOM 트리가 생성되기전에 자바스크립트가 생성되지도 않은 DOM의 조작을 시도할 수 있다.

- 위와 같은 상황을 막기 위해 script 태그는 body 태그 최하단에 위치하는 게 가장 좋다.

<br/>

<br/>

[출처]<br/>
TCP School http://www.tcpschool.com/javascript/js_datatype_basic