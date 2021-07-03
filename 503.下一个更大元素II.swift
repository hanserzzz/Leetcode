/*
 503. 下一个更大元素 II
 给定一个循环数组（最后一个元素的下一个元素是数组的第一个元素），输出每个元素的下一个更大元素。数字 x 的下一个更大的元素是按数组遍历顺序，
 这个数字之后的第一个比它更大的数，这意味着你应该循环地搜索它的下一个更大的数。如果不存在，则输出 -1。

 示例 1:

 输入: [1,2,1]
 输出: [2,-1,2]
 解释: 第一个 1 的下一个更大的数是 2；
 数字 2 找不到下一个更大的数；
 第二个 1 的下一个最大的数需要循环搜索，结果也是 2。
 注意: 输入数组的长度不会超过 10000。

 思路：
 	1.环形的原数组可以写成 1,2,1,1,2,1

 */

func nextGreaterElements(_ nums: [Int]) -> [Int] {
    let count = nums.count
    var stack = [Int]()
    var result = Array(repeating: -1, count: count)

    for i in (0 ..< (2 * count - 1)).reversed() {
        while stack.count > 0, stack.first! <= nums[i % count] {
            stack.removeFirst()
        }

        result[i % count] = stack.count > 0 ? stack.first! : -1
        stack.insert(nums[i % count], at: 0)
    }
    return result
}

let nums = [1, 2, 1]
let result = nextGreaterElements(nums)
print(result)
