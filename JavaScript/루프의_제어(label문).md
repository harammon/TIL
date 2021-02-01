# 루프의 제어(label 문)

- **label** 문을 사용해서 continue문과 break문의 동작의 흐름을 특정 영역으로 이동시킬 수 있다.

- #### label 문

~~~ javascript
// arrIndex 라벨은 그 이후에 나오는 for 문 전체를 가리키는 식별자로 사용된다.
arrIndex:
for (var i in arr) {
    document.write(i);
}
~~~



- #### continue 라벨이름:

  -> 이후 구문을 무시하고, 해당 라벨로 이동(다음 반복 수행)

~~~ javascript
gugudan:
for (var i = 2; i <= 9; i++) {
    dan:
    for (var j = 1; j <= 9; j++) {
        if ((i*j) % 2 == 0)
            continue dan;
        document.write(i + " * " + j + " = " + (i*j) + "<br>");
    }
}
~~~

couninue dan; 구문에 의해, 구구단의 값이 짝수이면 `dan`으로 이동한다.

-> dan에 해당하는 for문을 하나 건너 뜀

즉, 구구단의 값이 홀수인 경우에만 출력한다. 



- #### break 라벨이름:

  -> 이후 구문을 무시하고, 해당 라벨을 탈출(해당 반복문 탈출)

~~~ javascript
outerloop:
for (var i = 0; i < 5; i++){
    document.write("Outerloop : " + i + "<br/>");
    innerloop;
    for (var j = 0; j < 5; j++){
        if (j > 3)
            break;
        if (i == 2)
            break innerloop;
        if (i == 4)
            break outerloop;
        document.write("Innerloop : " + j + "<br/>");       
    }
}
document.write("Exiting the loop!<br/>");
~~~

~~~
Outerloop : 0
Innerloop : 0
Innerloop : 1
Innerloop : 2
Innerloop : 3
Outerloop : 1
Innerloop : 0
Innerloop : 1
Innerloop : 2
Innerloop : 3
Outerloop : 2
Outerloop : 3
Innerloop : 0
Innerloop : 1
Innerloop : 2
Innerloop : 3
Outerloop : 4
Exiting the loop!
~~~

<br/><br/>
[출처]<br/>
TCP School http://www.tcpschool.com/javascript/js_control_etc
