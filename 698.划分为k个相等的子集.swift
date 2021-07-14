/*
 698. 划分为k个相等的子集
 给定一个整数数组  nums 和一个正整数 k，找出是否有可能把这个数组分成 k 个非空子集，其总和都相等。

 示例 1：

 输入： nums = [4, 3, 2, 3, 5, 2, 1], k = 4
 输出： True
 说明： 有可能将其分成 4 个子集（5），（1,4），（2,3），（2,3）等于总和。

 思路:
 	1.可打乱顺序
 	2.每个数只能用一次

 */

func backTrack(_ nums: [Int], _ index: Int, _ buckets: inout [Int]) -> Bool {
    if index < 0 {
        return true
    }

    for i in 0 ..< buckets.count {
        // 剪枝
        if buckets[i] == nums[index] || buckets[i] - nums[index] >= nums[0] {
            buckets[i] -= nums[index]
            if backTrack(nums, index - 1, &buckets) {
                return true
            }
            buckets[i] += nums[index]
        }
    }

    return false
}

func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
    let sum = nums.reduce(0, +)
    if sum % k > 0 { return false }
    let sSum = sum / k

    let tmp = nums.sorted()
    var buckets = Array(repeating: sSum, count: k)
    return backTrack(tmp, tmp.count - 1, &buckets)
}

let nums = [605, 454, 322, 218, 8, 19, 651, 2220, 175, 710, 2666, 350, 252, 2264, 327, 1843]
let result = canPartitionKSubsets(nums, 4)
print(result)
