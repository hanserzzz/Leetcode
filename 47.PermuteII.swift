/**
 47. 全排列 II
 给定一个可包含重复数字的序列 nums ，按任意顺序 返回所有不重复的全排列。

 示例 1：

 输入：nums = [1,1,2]
 输出：
 [[1,1,2],
  [1,2,1],
  [2,1,1]]
 示例 2：

 输入：nums = [1,2,3]
 输出：[[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

 提示：

 1 <= nums.length <= 8
 -10 <= nums[i] <= 10
 */

/**
 带重复数字全排列  ....去重操作
 回溯 条件判断

 判断条件解析：

 visited[i] : 去重...
 i > 0 && nums[i] == nums[i - 1] && !visited[i - 1]
 筛选路径:
 比如11,为了区分这里氛围1a 和 1b，但是1a 1b调换顺序是不存在差异的，这里只选一条路径，也就是 1a1b或者1b1a的情况，去除一种

 */

func backtrack(_ nums: [Int], _ visited: inout [Bool], _ track: inout [Int], _ result: inout [[Int]]) {
    if track.count == nums.count {
        result.append(track)
        return
    }

    for i in 0 ..< nums.count {
        // 去重操作
        if visited[i] || (i > 0 && nums[i] == nums[i - 1] && !visited[i - 1]) {
            continue
        }
        visited[i] = true
        track.append(nums[i])
        backtrack(nums, &visited, &track, &result)
        track.removeLast()
        visited[i] = false
    }
}

func permute(_ nums: [Int]) -> [[Int]] {
    var track = [Int]()
    var result = [[Int]]()
    let sortedNums = nums.sorted()
    var visited = Array(repeating: false, count: nums.count)

    backtrack(sortedNums, &visited, &track, &result)
    return result
}

let nums = [1, 1, 3]
let result = permute(nums)
print(result)
