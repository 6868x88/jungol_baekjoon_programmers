# 마지막 입력 숫자에 1 더하기 
def another_one(digits):
  number = int("".join(map(str,digits))) + 1
  return [int(digit) for digit in str(number)]

"""
확인용
user_input = input()
digits = list(map(int, user_input.split()))
print (another_one(digits))
"""