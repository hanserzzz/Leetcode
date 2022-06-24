/*
20. 有效的括号
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

有效字符串需满足：

左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。
 

示例 1：

输入：s = "()"
输出：true
示例 2：

输入：s = "()[]{}"
输出：true
示例 3：

输入：s = "(]"
输出：false
示例 4：

输入：s = "([)]"
输出：false
示例 5：

输入：s = "{[]}"
输出：true
 

提示：

1 <= s.length <= 104
s 仅由括号 '()[]{}' 组成
*/

/*
    符合的只有两种情况
    1.(){}[]立即匹配
    2.{[()]}未立即匹配
*/
let braketsMap: [Character: Character] = [
    ")": "(",
    "]": "[",
    "}": "{"
]
// let leftSet: Set<Character> = ["(", "[", "{"]
let rightSet: Set<Character> = [")", "]", "}"]

func isValid(_ s: String) -> Bool {
    let chars = Array(s)
    var stack = [Character]()
    for c in chars {
        if stack.isEmpty {
            if rightSet.contains(c) {
                print(stack, c)
                return false
            }
            stack.insert(c, at: 0)
        } else {
            if rightSet.contains(c) {
                if stack.first! == braketsMap[c] {
                    stack.removeFirst()
                } else {
                    print(stack, c)
                    return false
                }
            } else {
                stack.insert(c, at: 0)
            }
        }
    }
    return stack.isEmpty
}

print(isValid("[{}]"))

