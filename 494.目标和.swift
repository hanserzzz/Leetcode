/*

 494. 目标和
 给你一个整数数组 nums 和一个整数 target 。

 向数组中的每个整数前添加 '+' 或 '-' ，然后串联起所有整数，可以构造一个 表达式 ：

 例如，nums = [2, 1] ，可以在 2 之前添加 '+' ，在 1 之前添加 '-' ，然后串联起来得到表达式 "+2-1" 。
 返回可以通过上述方法构造的、运算结果等于 target 的不同 表达式 的数目。

 示例 1：

 输入：nums = [1,1,1,1,1], target = 3
 输出：5
 解释：一共有 5 种方法让最终目标和为 3 。
 -1 + 1 + 1 + 1 + 1 = 3
 +1 - 1 + 1 + 1 + 1 = 3
 +1 + 1 - 1 + 1 + 1 = 3
 +1 + 1 + 1 - 1 + 1 = 3
 +1 + 1 + 1 + 1 - 1 = 3
 示例 2：

 输入：nums = [1], target = 1
 输出：1

 提示：

 1 <= nums.length <= 20
 0 <= nums[i] <= 1000
 0 <= sum(nums[i]) <= 1000
 -1000 <= target <= 1000

 思路:
 dp[i][j]
 i: 当前index值
 j: 到当前index值组成的数

 i 0~nums.length
 j 0~sum * 2 + 1

 j - nums[i] >= 0 ?: 0
 j + nums[i] < sum * 2 + 1 ?: 0
 dp[i][j] = dp[i - 1][j - nums[i]] + dp[i - 1][j + nums[i]]

 */

func dfs(_ nums: [Int], _ index: Int, _ sum: Int, _ target: Int, _ result: inout Int) {
    if index == nums.count {
        if sum == target {
            result += 1
        }
        return
    }

    dfs(nums, index + 1, sum + nums[index], target, &result)
    dfs(nums, index + 1, sum - nums[index], target, &result)
}

func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    var result = 0
    dfs(nums, 0, 0, target, &result)

    return result
}

let nums = [1000]
let result = findTargetSumWays(nums, -1000)
print(result)
