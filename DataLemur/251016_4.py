# 두 목록의 교집합 찾기
def intersection(a, b):
    x = set (a)
    y = set (b)
    return list(x.intersection(y))

"""
# 확인용
a_input = input().split()
b_input = input().split()

print(intersection(a_input, b_input))
"""