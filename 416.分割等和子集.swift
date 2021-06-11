/*

 416. 分割等和子集
 给你一个 只包含正整数 的 非空 数组 nums 。请你判断是否可以将这个数组分割成两个子集，使得两个子集的元素和相等。

 示例 1：

 输入：nums = [1,5,11,5]
 输出：true
 解释：数组可以分割成 [1, 5, 5] 和 [11] 。
 示例 2：

 输入：nums = [1,2,3,5]
 输出：false
 解释：数组不能分割成两个元素和相等的子集。

 提示：

 1 <= nums.length <= 200
 1 <= nums[i] <= 100

 思路:
    1.检测能否被两等分   ---->  总和肯定是2的倍数
    2.所以就成了 能否找到一个子集（该自己不包含子集），总和等于sum/2
    3.当前位置i所在坐标组成的集合包含子集 能否组成 sum/2 的总和，依赖j - nums[i]的数据，
        动态规划方程：
            dp[i][j]:
                i: 当前在nums的第几个元素组成子集
                j: 需要组成的sum
            dp[i][j]的几种情况:
                a.如果nums[i] == sum   ture
                b.如果dp[i - 1][j - nums[i]] == true  说明也可以实现
                c.如果dp[i - 1][j] == true   也可以实现 i - 1位置是i 位子的子集
                d.dp[0][0] = true , dp[i][0] = false,

 */

func canPatition(_ nums: [Int]) -> Bool {
    let count = nums.count
    var sum = 0
    var maxV = 0
    for n in nums {
        sum += n
        maxV = max(n, maxV)
    }
    if sum & 1 == 1 { return false }
    sum /= 2
    if maxV > sum { return false }

    var dp = Array(repeating: Array(repeating: false, count: sum + 1), count: count)
    dp[0][0] = true
    dp[0][nums[0]] = true
    for i in 1 ..< count {
        for j in 1 ..< sum + 1 {
            let num = nums[i]
            if num == sum { return true }
            if num <= j {
                if num == j {
                    dp[i][j] = true
                } else {
                    dp[i][j] = dp[i - 1][j - num] || dp[i - 1][j]
                }
            } else {
                dp[i][j] = dp[i - 1][j]
            }
        }
    }

    return dp[count - 1][sum]
}

let res = canPatition([2, 2, 3, 5])
print(res)
