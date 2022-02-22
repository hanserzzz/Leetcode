/*
 7. 整数反转
 给你一个 32 位的有符号整数 x ，返回将 x 中的数字部分反转后的结果。

 如果反转后整数超过 32 位的有符号整数的范围 [−231,  231 − 1] ，就返回 0。

 假设环境不允许存储 64 位整数（有符号或无符号）。

 示例 1：

 输入：x = 123
 输出：321
 示例 2：

 输入：x = -123
 输出：-321
 示例 3：

 输入：x = 120
 输出：21
 示例 4：

 输入：x = 0
 输出：0

 提示：

 -231 <= x <= 231 - 1

 */

func reverse(_ x: Int) -> Int {
    var n = x
    var result = 0
    while n != 0 {
        let cur = n % 10
        n /= 10

        if result > Int32.max / 10 || (result == Int32.max / 10 && cur > 7) { return 0 }
        if result < Int32.min / 10 || (result == Int32.min / 10 && cur < -8) { return 0 }

        result = result * 10 + cur
    }
    return result
}

print(reverse(1_534_236_469))
