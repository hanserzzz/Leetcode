/*


581. 最短无序连续子数组
给你一个整数数组 nums ，你需要找出一个 连续子数组 ，如果对这个子数组进行升序排序，那么整个数组都会变为升序排序。

请你找出符合题意的 最短 子数组，并输出它的长度。

 

示例 1：

输入：nums = [2,6,4,8,10,9,15]
输出：5
解释：你只需要对 [6, 4, 8, 10, 9] 进行升序排序，那么整个表都会变为升序排序。
示例 2：

输入：nums = [1,2,3,4]
输出：0
示例 3：

输入：nums = [1]
输出：0
 

提示：

1 <= nums.length <= 104
-105 <= nums[i] <= 105
 

进阶：你可以设计一个时间复杂度为 O(n) 的解决方案吗？


思路1：双指针   ❌ 不符合
	1.如果收拾是升序则为0
	2.左右指针遍历左边记录左侧最大值，右边记录右侧最小值，对比这个区间是否是升序的可能如果是，则继续遍历，不是返回个数


思路2：hashmap记录，空间换时间  ❌不符合
	1.用一个hashmap去记录每个下表数右边最小数的数
	2.再次遍历数组，看hashmap里有没有有无符合的数，如果后边的存在比这个数小的数，第一个可以确定左边界，最后一个可以确定右边界

思路3：从左往右找比左面最大数还小最右下标，从又往左找比右边最小数还大的下标
*/


func findUnsortedSubarray(_ nums: [Int]) -> Int {
	let n = nums.count
	if n <= 1 { return 0 }

	var maxn = Int.min, right = -1
	var minn = Int.max, left = -1

	for i in 0..<n {
		// 从左往右找比左边最大值还小的最右下标
		if maxn > nums[i] {
			right = i 
		} else {
			maxn = nums[i]
		}

		// 从右往左找比右边最小值还小的最左下标
		if minn < nums[n - i - 1] {
			left = n - i - 1
		} else {
			minn = nums[n - i - 1]
		}

	}
	return right == -1 ? 0 : (right - left + 1)
}

let nums = [1,2,5,3,4]
let ans = findUnsortedSubarray(nums)
print(ans)













