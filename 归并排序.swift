

/*
	归并排序

*/



// func helper(_ nums: [Int], _ left: Int, _ right: Int, _ temp: inout [Int]) {

// }

func merge(_ nums: inout [Int], _ left: Int, _ mid: Int, _ right: Int, _ temp: inout [Int]) {
	var t = 0
	var l = left, r = mid + 1
	while l <= mid && r <= right {
		if nums[l] <= nums[r] {
			temp[t] = nums[l]
			l += 1
		} else {
			temp[t] = nums[r]
			r += 1
		}
		t += 1
	}

	// 把剩余拼接
	while l <= mid {
		temp[t] = nums[l]
		l += 1
		t += 1
	}

	while r <= right {
		temp[t] = nums[r]
		r += 1
		t += 1
	}

	t = 0
	var tmpL = left
	while tmpL <= right {
		nums[tmpL] = temp[t]
		t += 1
		tmpL += 1
	}

}

func mergeSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ temp: inout [Int]) {
	if left < right {
		let mid = (left + right)/2
		mergeSort(&nums, left, mid, &temp)
		mergeSort(&nums, mid + 1, right, &temp)
		merge(&nums, left, mid, right, &temp)
	}
}

// var res = [Int]()
var nums = [5 ,4, 1, 3, 7, 9]
var res = [Int](repeating: 0, count: nums.count)
mergeSort(&nums,0, nums.count - 1, &res)
print(nums)

