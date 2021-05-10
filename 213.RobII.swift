/**
 213. 打家劫舍 II
 你是一个专业的小偷，计划偷窃沿街的房屋，每间房内都藏有一定的现金。这个地方所有的房屋都 围成一圈 ，这意味着第一个房屋和最后一个房屋是紧挨着的。同时，相邻的房屋装有相互连通的防盗系统，如果两间相邻的房屋在同一晚上被小偷闯入，系统会自动报警 。

 给定一个代表每个房屋存放金额的非负整数数组，计算你 在不触动警报装置的情况下 ，今晚能够偷窃到的最高金额。

 示例 1：

 输入：nums = [2,3,2]
 输出：3
 解释：你不能先偷窃 1 号房屋（金额 = 2），然后偷窃 3 号房屋（金额 = 2）, 因为他们是相邻的。
 示例 2：

 输入：nums = [1,2,3,1]
 输出：4
 解释：你可以先偷窃 1 号房屋（金额 = 1），然后偷窃 3 号房屋（金额 = 3）。
      偷窃到的最高金额 = 1 + 3 = 4 。
 示例 3：

 输入：nums = [0]
 输出：0

 提示：

 1 <= nums.length <= 100
 0 <= nums[i] <= 1000
 */

/**

 动态规划
 dp[i] = max(dp[i + 1], dp[i] + dp[i + 2])

 */

func dp(_ nums: [Int]) -> Int {
    let count = nums.count
    var dp = Array(repeating: 0, count: count + 2)
    for i in (0 ... (count - 1)).reversed() {
        dp[i] = max(dp[i + 1], nums[i] + dp[i + 2])
    }
    return dp[0]
}

func rob(_ nums: [Int]) -> Int {
    let sub = Array(nums.suffix(from: 1))
    let sub2 = Array(nums.prefix(nums.count - 2))
    return max(dp(sub2), dp(sub))
}

let nums = [1, 2, 3, 1]
print(rob(nums))
