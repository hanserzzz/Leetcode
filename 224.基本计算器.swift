/**
 224. 基本计算器
 给你一个字符串表达式 s ，请你实现一个基本计算器来计算并返回它的值。

 示例 1：

 输入：s = "1 + 1"
 输出：2
 示例 2：

 输入：s = " 2-1 + 2 "
 输出：3
 示例 3：

 输入：s = "(1+(4+5+2)-3)+(6+8)"
 输出：23

 提示：

 1 <= s.length <= 3 * 105
 s 由数字、'+'、'-'、'('、')'、和 ' ' 组成
 s 表示一个有效的表达式

 */

func calculate(_ s: String) -> Int {
    var stack = [Int]()
    stack.insert(1, at: 0)
    var sign = stack.first!
    var sum = 0
    var index = 0
    let charecters = Array(s)

    while index < charecters.count {
        let c = charecters[index]
        switch c {
        case " ":
            fallthrough
        case "+":
            break
        case "-":
            sign = -sign
        case "(":
            stack.insert(sign, at: 0)
        case ")":
            stack.removeFirst()
            sign = stack.first!
        default:
            var idx = index + 1
            var tmp = c.wholeNumberValue!
            while idx < charecters.count, charecters[idx].isWholeNumber {
                tmp = tmp * 10 + charecters[idx].wholeNumberValue!
                idx += 1
            }
            sum += tmp * sign
            sign = stack.first!
            index = idx - 1
        }
        index += 1
    }

    return sum
}

let s = "(1+(4+5+2)-3)+(6+8)"
print(calculate(s))
