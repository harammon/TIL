# collections.deque로 스택 구현하기

- 구현

~~~python
from typing import Any
from collections import deque

class Stack:
    def __init__(self, maxlen: int = 256) -> None:
        self.capacity = maxlen
        self.__stk = deque([], maxlen)

    def __len__(self) -> int:
        return len(self.__stk)

    def is_empty(self) -> bool:
        return not self.__stk

    def is_full(self) -> bool:
        return len(self.__stk) == self.__stk.maxlen

    def push(self, value: Any) -> None:
        self.__stk.append(value)

    def pop(self) -> Any:
        return self.__stk.pop()

    def peek(self) -> Any:
        return self.__stk[-1]

    def clear(self) -> None:
        self.__stk.clear()

    def find(self, value: Any) -> Any:
        try:
            return self.__stk.index(value)
        except ValueError:
            return -1

    def count(self, value: Any) -> int:
        return self.__stk.count(value)

    def __contains__(self, value: Any) -> bool:
        """스택에 value가 포함되어 있는지 판단"""
        return self.conut(value)

    def dump(self) -> int:
        """바닥부터 꼭대기 순으로 출력"""
        print(list(self.__stk)) 
~~~

<br/><br/>
[출처]<br/>
Bohyoh Shibata, 『자료구조와 함께 배우는 알고리즘 입문 파이썬 편』, 강민 옮김, 이지스퍼블리싱(2020), p165-167.
