# ZigZag Conversion
# Leetcode problem 6

def convert(s, num_rows)
    row = 0
    step = 1
    
    last_index = num_rows - 1
    
    return s if num_rows == 1
    
    char_rows = Array.new(num_rows){Array.new}

    s.each_char do |c|
        char_rows[row].push(c)
        row += step
        step *= -1 if (row == last_index or row == 0)
    end
    
    char_rows.reduce([], :concat).join
end
