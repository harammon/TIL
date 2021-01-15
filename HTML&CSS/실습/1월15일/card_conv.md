# 기수 변환(n진수 구하기)

- 10진수 정수를 n진수로 변환하려면, 정수를 n으로 나눈 나머지를 구하는 동시에 몫을 반복해서 나눠야 한다.
- 몫이 0이 될 떄까지 이 과정을 반복한다.
- 나머지를 역순으로 늘어 놓는다.

~~~ python
# 10진수 정숫값을 입력받아 2~36진수로 변환하여 출력하기
def card_conv(x: int, r: int) -> str:
    d = ""	# 변환 후의 문자열
    dchar = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"	
    while x > 0:
        d += dchar[x % r]
        x //= r
    return d[::-1]	# 역순으로 반환

if __name__ == '__main__':
    while True:     # 양의 정수 입력 받기
        print('10진수를 n진수로 반환합니다.')
        while True:
            n = input('반환할 값으로 양의 정수를 입력하세요 : ')
            if n.isdigit() and int(n) != 0:
                n = int(n)
                break
            else:
                print('잘 못 입력하셨습니다.')
        while True:     # 2~36 정숫값 입력 받기
            cd = input('어떤 진수로 변환할까요?(2~36진수로 변환 가능합니다.) : ')
            if cd.isdigit():
                cd = int(cd)
                if 2 <= cd <= 36:
                    break
            else:
                print('잘 못 입력하셨습니다.')
        print('%d진수로는 %s입니다.' %(cd, card_conv(n, cd)))

        retry = input('한 번 더 하시겠습니까? (Y / N)  ')
        if retry == 'N':
            break
~~~

