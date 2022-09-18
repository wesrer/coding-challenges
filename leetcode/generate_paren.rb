# Generate Parenthesis
# Leetcode problem 22

$stack
$result

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    $stack = []
    $result = []
    backtrack(0, 0, n)
    return $result
end

def backtrack(open, close, n)
    return $result << $stack.join if (open == close and open == n)
    
    if (open < n)
        $stack << "("
        backtrack(open + 1, close, n)
        $stack.pop
    end
    
    if (close < open)
        $stack << ")"
        backtrack(open, close + 1, n)
        $stack.pop
    end
end
