/*

 53. 最大子序和
 给定一个整数数组 nums ，找到一个具有最大和的连续子数组（子数组最少包含一个元素），返回其最大和。

 示例 1：

 输入：nums = [-2,1,-3,4,-1,2,1,-5,4]
 输出：6
 解释：连续子数组 [4,-1,2,1] 的和最大，为 6 。
 示例 2：

 输入：nums = [1]
 输出：1
 示例 3：

 输入：nums = [0]
 输出：0
 示例 4：

 输入：nums = [-1]
 输出：-1
 示例 5：

 输入：nums = [-100000]
 输出：-100000

 提示：

 1 <= nums.length <= 3 * 104
 -105 <= nums[i] <= 105

 思路:
 	1.动态规划
 	2.dp记录以当前元素为结尾的最大子序列和
 	3.遍历dp数组找到最大的

 优化:
 	1.计算过程其实只依赖前一个值，所以dp空间可以省略
 	2.循环也可以在一次循环完成
 */

func maxSubArray(_ nums: [Int]) -> Int {
    let count = nums.count
    // var dp = Array(repeating: 0, count: count)

    // dp[0] = nums[0]
    // for i in 1 ..< count {
    //     dp[i] = max(nums[i], nums[i] + dp[i - 1])
    // }

    var pre = 0
    var res = nums[0]
    for i in 1 ..< count {
        pre = max(nums[i], nums[i] + pre)
        res = max(res, pre)
    }

    return res
}

let nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
print(maxSubArray(nums))
