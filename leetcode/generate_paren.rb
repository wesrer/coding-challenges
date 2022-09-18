# Generate Parenthesis
# Leetcode problem 22

# Solution 1 - Global variables - less time consuming but ugly

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


# Solution 2 - all params - more time consuming but cleaner

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
    backtrack(0, 0, n, "", [])
end

def backtrack(open, close, n, stack, result)
    if (open < n)
        backtrack(open + 1, close, n, stack + "(", result)
    end
    
    if (close < open)
        backtrack(open, close + 1, n, stack + ")", result)
    end
    
    result << stack if (open == close and open == n)
    
    result
end
