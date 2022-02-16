def is_palindrome(num)
  copy = num
  reverse = 0;

  while num > 0
    digit = x % 10;
    reverse = reverse * 10 + digit
    num = num / 10;
  end

  return copy == reverse
end
