/*

给定一个有序数组，和已闭区间[lower, upper],数组在的数都在区间内，求出数组内缺失的区间


examplae:
[0, 1, 2, 4, 10]  [0, 99]

output: ["3", "5->9", "11, 99"]

*/


func add(_ res: inout [String], _ left: Int, _ right: Int) {
	if left >= right || left + 1 == right { return }
	var s: String?
	if left + 1 == right - 1 {
		s = String(left + 1)
	} else {
		s = String(left + 1) + "->" + String(right - 1)
	}
	res.append(s!)
}


func missingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [String] {
	let count = nums.count
	var res = [String]()
	if count == 0 {
		add(&res, lower, upper)
	}
	var index = 1
	
	add(&res, lower - 1, nums[0])
	while index < count {
		add(&res, nums[index - 1], nums[index])
		index += 1
	}
	add(&res, nums[count - 1], upper + 1)
	return res
}

// [0, 99]
let nums = [1, 2, 4, 78]
let result = missingRanges(nums, 0, 99)
print(result)




