/*
189. 轮转数组
给你一个数组，将数组中的元素向右轮转 k 个位置，其中 k 是非负数。

 

示例 1:

输入: nums = [1,2,3,4,5,6,7], k = 3
输出: [5,6,7,1,2,3,4]
解释:
向右轮转 1 步: [7,1,2,3,4,5,6]
向右轮转 2 步: [6,7,1,2,3,4,5]
向右轮转 3 步: [5,6,7,1,2,3,4]
示例 2:

输入：nums = [-1,-100,3,99], k = 2
输出：[3,99,-1,-100]
解释: 
向右轮转 1 步: [99,-1,-100,3]
向右轮转 2 步: [3,99,-1,-100]
 

提示：

1 <= nums.length <= 105
-231 <= nums[i] <= 231 - 1
0 <= k <= 105
 

进阶：

尽可能想出更多的解决方案，至少有 三种 不同的方法可以解决这个问题。
你可以使用空间复杂度为 O(1) 的 原地 算法解决这个问题吗？


1 2 3 4 5 6 7

7 6 5 4 3 2 1

5 6 7 1 2 3 4

*/

func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
	if right <= left { return }
	var l = left, r = right
	while r > l {
		(nums[l], nums[r]) = (nums[r], nums[l])
		r -= 1
		l += 1
	}
}

func rotate(_ nums: inout [Int], _ k: Int) {
	let n = nums.count
	var k = k
	if k >= n { 
		k = k % n
	}
	reverse(&nums, 0, n - 1)
	reverse(&nums, 0, k - 1)
	reverse(&nums, k, n - 1)
}


var nums = [1,2]
rotate(&nums, 3)
print(nums)












