/*
16. 最接近的三数之和
给你一个长度为 n 的整数数组 nums 和 一个目标值 target。请你从 nums 中选出三个整数，使它们的和与 target 最接近。

返回这三个数的和。

假定每组输入只存在恰好一个解。

 

示例 1：

输入：nums = [-1,2,1,-4], target = 1
输出：2
解释：与 target 最接近的和是 2 (-1 + 2 + 1 = 2) 。
示例 2：

输入：nums = [0,0,0], target = 1
输出：0
 

提示：

3 <= nums.length <= 1000
-1000 <= nums[i] <= 1000
-104 <= target <= 104
通过次数345,772提交次数757,172
*/



// 全排列做会超时
// func helper(_ nums: [Int], _ used: inout [Bool], _ idx: inout Int, _ sum: inout Int, _ range: Int, _ sums: inout [Int], _ path: inout [Int]) {
// 	if idx == range {
// 		print(path, sum)
// 		sums.append(sum)
// 		return
// 	}

// 	for i in 0..<nums.count {

// 		if used[i] { continue }
// 		let n = nums[i]
// 		sum += n
// 		idx += 1
// 		path.append(n)
// 		used[i] = true
// 		helper(nums, &used, &idx, &sum, range, &sums, &path)
// 		sum -= n
// 		idx -= 1
// 		path.removeLast()
// 		used[i] = false
// 	}
// }

// func permute(_ nums: [Int]) -> [Int] {
// 	var sums = [Int]()
// 	var idx = 0
// 	var sum = 0
// 	var path = [Int]()
// 	var used = [Bool](repeating: false, count: nums.count)
// 	helper(nums, &used, &idx, &sum, 3, &sums, &path)
// 	return sums
// }



// func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
	
// 	let sums = permute(nums)
// 	for n in sums {
// 		if abs(res - target) > abs(n - target) {
// 			res = n
// 		}
// 	}
// 	return res
// }


func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
	var result = nums[0] + nums[1] + nums[2]
	let _nums = nums.sorted()
	let count = nums.count
	for i in 0..<count - 2 {
		var l = i + 1, r = count - 1
		while l < r {
			let sum = _nums[i] + _nums[l] + _nums[r]
			if abs(result - target) > abs(sum - target) {
				result = sum
			}

			if sum > target {
				r -= 1
			} else {
				l += 1
			}
		}
	}
	return result
}


let nums = [0,1,2]
let res = threeSumClosest(nums, 0)
print(res)





