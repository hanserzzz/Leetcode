/*
338. 比特位计数
给你一个整数 n ，对于 0 <= i <= n 中的每个 i ，计算其二进制表示中 1 的个数 ，返回一个长度为 n + 1 的数组 ans 作为答案。

 

示例 1：

输入：n = 2
输出：[0,1,1]
解释：
0 --> 0
1 --> 1
2 --> 10
示例 2：

输入：n = 5
输出：[0,1,1,2,1,2]
解释：
0 --> 0
1 --> 1
2 --> 10
3 --> 11
4 --> 100
5 --> 101
 

提示：

0 <= n <= 105
*/

/*

	通过 x &= (x - 1)去计算x中1的个数
*/

func countOnes(_ n: Int) -> Int {
    var res = 0, x = n
    while x > 0 {
        x &= (x - 1)
        res += 1
    }
    return res
}

func countBits(_ n: Int) -> [Int] {
    var result = [Int]()
    for i in 0...n {
        result.append(countOnes(i))
    }
    return result
}







