/*
 22. 括号生成
 数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。

 示例 1：

 输入：n = 3
 输出：["((()))","(()())","(())()","()(())","()()()"]
 示例 2：

 输入：n = 1
 输出：["()"]

 提示：

 1 <= n <= 8

 思路:
 	1.全排列
 	2.回溯

 */

func backTrack(_ result: inout [String], _ path: inout [String], _ pre: Int, _ behind: Int, _ max: Int) {
    if path.count == max * 2 {
        result.append(path.joined())
        return
    }

    if pre < max {
        path.append("(")
        backTrack(&result, &path, pre + 1, behind, max)
        path.removeLast()
    }

    if behind < pre {
        path.append(")")
        backTrack(&result, &path, pre, behind + 1, max)
        path.removeLast()
    }
}

func generateParenthesis(_ n: Int) -> [String] {
    var result = [String]()
    var path = [String]()

    backTrack(&result, &path, 0, 0, n)
    return result
}

print(generateParenthesis(3))
