/*
29. 两数相除
给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

返回被除数 dividend 除以除数 divisor 得到的商。

整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2

 

示例 1:

输入: dividend = 10, divisor = 3
输出: 3
解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
示例 2:

输入: dividend = 7, divisor = -3
输出: -2
解释: 7/-3 = truncate(-2.33333..) = -2
 

提示：

被除数和除数均为 32 位有符号整数。
除数不为 0。
假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。

*/



/*
    二分法:
    60/8 通过因式分解可拆分为:32/8 + 16/8  + 8/8 + 4/8 = 4 + 2 + 1 + 0 = 7
*/
func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 { return 0 }
    if divisor == 1 { return dividend }
    if divisor == -1 {
        // 不会越界
        if dividend > Int32.min {
            return -dividend
        }
        return Int(Int32.max)
    }

    // 正负值判定
    let sign = dividend > 0 && divisor > 0 || dividend < 0 && divisor < 0
    let res = div(abs(dividend), abs(divisor))
    return sign ? res : -res
}

func div(_ a: Int, _ b: Int) -> Int {
    if a < b { return 0 }

    var count = 1
    var unit = b
    // ×2倍数的增长，count也按指数增加
    while unit + unit <= a {
        count += count
        unit += unit
    }
    // 剩余部分重新按照该规则继续计算
    return count + div(a - unit, b)
}






