/*

剑指 Offer 51. 数组中的逆序对
在数组中的两个数字，如果前面一个数字大于后面的数字，则这两个数字组成一个逆序对。输入一个数组，求出这个数组中的逆序对的总数。

 

示例 1:

输入: [7,5,6,4]
输出: 5
 

限制：

0 <= 数组长度 <= 50000

*/

func merge(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int, _ temp: inout [Int]) -> Int {
	for i in left...right {
		temp[i] = nums[i]
	}

	var i = left
	var j = mid + 1
	var count = 0
	for k in left...right {
		if i == mid + 1 {
			nums[k] = temp[j]
			j += 1
		} else if j == right + 1 {
			nums[k] = temp[i]
			i += 1
		} else if temp[i] <= temp[j] {
			nums[k] = temp[i]
			i += 1
		} else {
			nums[k] = temp[j]
			j += 1
			count += (mid - i + 1)
		}
	}
	return count
}

func helper(_ nums: inout [Int], _ left: Int, _ right: Int, _ temp: inout [Int]) -> Int {
	if left == right { return 0 }

	let mid = left + (right - left)/2
	let lCount = helper(&nums, left, mid, &temp)
	let rCount = helper(&nums, mid + 1, right, &temp)
	let mCount = merge(&nums, left, mid, right, &temp)
	return lCount + rCount + mCount
}

func reversePairs(_ nums: [Int]) -> Int {
	if nums.count < 2 { return 0 }

	var _nums = nums
	var temp = [Int](repeating: 0, count: nums.count)
	return helper(&_nums, 0, nums.count - 1, &temp)
}


let nums = [7,5,6,4]
print(reversePairs(nums))
