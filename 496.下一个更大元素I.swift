/*

 496. 下一个更大元素 I
 给你两个 没有重复元素 的数组 nums1 和 nums2 ，其中nums1 是 nums2 的子集。

 请你找出 nums1 中每个元素在 nums2 中的下一个比其大的值。

 nums1 中数字 x 的下一个更大元素是指 x 在 nums2 中对应位置的右边的第一个比 x 大的元素。如果不存在，对应位置输出 -1 。

 示例 1:

 输入: nums1 = [4,1,2], nums2 = [1,3,4,2].
 输出: [-1,3,-1]
 解释:
     对于 num1 中的数字 4 ，你无法在第二个数组中找到下一个更大的数字，因此输出 -1 。
     对于 num1 中的数字 1 ，第二个数组中数字1右边的下一个较大数字是 3 。
     对于 num1 中的数字 2 ，第二个数组中没有下一个更大的数字，因此输出 -1 。
 示例 2:

 输入: nums1 = [2,4], nums2 = [1,2,3,4].
 输出: [3,-1]
 解释:
     对于 num1 中的数字 2 ，第二个数组中的下一个较大数字是 3 。
     对于 num1 中的数字 4 ，第二个数组中没有下一个更大的数字，因此输出 -1 。

 思路：
 	1.如果O(N)级别解决的话一定要用空间换时间
 	2.用一个数组记录每个数右边第一个比自己大的数
 	3.用一个栈记录

    Time complexity: O(N + M)
    Space complexity: O(N)
 */

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var stack = [Int]()
    let count2 = nums2.count
    var record = [Int: Int]()

    stack.insert(nums2.last!, at: 0)
    for i in (0 ..< count2 - 1).reversed() {
        let n = nums2[i]
        while stack.count > 0, stack.first! <= n {
            stack.removeFirst()
        }
        if stack.count > 0 {
            record[n] = stack.first!
        }
        stack.insert(n, at: 0)
    }

    var result = [Int]()
    for n in nums1 {
        result.append(record[n] ?? -1)
    }

    return result
}

let nums1 = [4, 1, 2]
let nums2 = [1, 3, 4, 2]
let res = nextGreaterElement(nums1, nums2)
print(res)
