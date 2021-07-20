/*

 300. 最长递增子序列
 给你一个整数数组 nums ，找到其中最长严格递增子序列的长度。

 子序列是由数组派生而来的序列，删除（或不删除）数组中的元素而不改变其余元素的顺序。例如，[3,6,2,7] 是数组 [0,3,1,6,2,2,7] 的子序列。

 示例 1：

 输入：nums = [10,9,2,5,3,7,101,18]
 输出：4
 解释：最长递增子序列是 [2,3,7,101]，因此长度为 4 。
 示例 2：

 输入：nums = [0,1,0,3,2,3]
 输出：4
 示例 3：

 输入：nums = [7,7,7,7,7,7,7]
 输出：1

 提示：

 1 <= nums.length <= 2500
 -104 <= nums[i] <= 104

 进阶：

 你可以设计时间复杂度为 O(n²) 的解决方案吗？
 你能将算法的时间复杂度降低到 O(n log(n)) 吗?
 */

// 回溯法超时了
// func isAscending(_ nums: [Int]) -> Bool {
//     for i in 1 ..< nums.count {
//         if nums[i] <= nums[i - 1] { return false }
//     }
//     return true
// }

// func backTrack(_ nums: [Int], _ path: inout [Int], _ index: Int, _ result: inout [Int]) {
//     // 剪枝
//     if path.count > 1, isAscending(path) {
//         // result.append(path)
//         result.append(path.count)
//     }
//     if index == nums.count {
//         return
//     }

//     let count = nums.count
//     for i in index ..< count {
//         let n = nums[i]
//         path.append(n)
//         backTrack(nums, &path, i + 1, &result)
//         path.removeLast()
//     }
// }

// func lengthOfLIS(_ nums: [Int]) -> Int {
//     var path = [Int]()
//     var result = [Int]()
//     result.append(1)
//     backTrack(nums, &path, 0, &result)
//     return result.max()!
// }

func lengthOfLIS(_ nums: [Int]) -> Int {
    let count = nums.count
    var dp = Array(repeating: 0, count: count)
    dp[0] = 1
    var maxans = 1
    for i in 0 ..< count {
        // 至少是1
        dp[i] = 1
        for j in 0 ..< i {
            // 当前的数大于之前dp记录的的终点值时，才可以形成升序序列，不然只能是1
            if nums[i] > nums[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
        maxans = max(dp[i], maxans)
    }
    print(dp)
    return maxans
}

let nums = [4, 10, 4, 3, 8, 9]
print(lengthOfLIS(nums))
