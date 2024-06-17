# Algorithm
#
# Use a Hashmap `non_paired` to count words not in pairs yet
# Use `pairs` to count the number of mirror words we found
# Use `sym` to count the number of symmetric words not in `pairs`
#
# Traverse input; For each word, first check if its mirror is already in `non_paired`
# If yes, you found a pair - deduct its mirror count in non_paired
# Otherwise, increase the count of the word in paired
#
# Adjust the sym accordingly
#
# If at least 1 symmetric word is not in pairs, we can attach them in the middle
# of the palindrome, and put those counted on pairs on the sides
#
# Each word has a size of 2 and thus a pair has a size of 4

def longest_palindrome(words)
  non_paired = Hash.new

  pairs = 0
  sym = 0

  words.each do |w|
    rev = w.reverse()

    same_letter_flag = w[0] == w[1] ? 1 : 0

    if non_paired.fetch(rev, 0) > 0
      pairs += 1
      non_paired[rev] = non_paired.fetch(rev, 0) - 1
      sym -= same_letter_flag
    else
      non_paired[w] = non_paired.fetch(w, 0) + 1
      sym += same_letter_flag
    end
  end

  # if at least one symmetric non-paired word exists, stick it in the middle
  middle_word_len = (sym > 0) ? 2 * sym : 0

  (4 * pairs) + middle_word_len
end

test_words = ["qo","fo","fq","qf","fo","ff","qq","qf","of","of","oo","of","of","qf","qf","of"]

puts (longest_palindrome(test_words) == 14)

