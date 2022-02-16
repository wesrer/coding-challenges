def reverse_integer(x)
  sign = x < 0 ? -1 : 1

  x = x.abs()

  rev = 0
  while x > 0
    dig = x % 10
    rev = rev * 10 + dig
    x = x / 10
  end

  # Artificially catching 32 bit integer overflow
  rev > ((2 ** 31) - 1) ? 0 : (sign * rev)
end

puts reverse_integer(-931)
