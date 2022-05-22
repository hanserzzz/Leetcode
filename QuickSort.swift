/*
	快速排序
*/


func helper(_ nums: inout [Int], _ left: Int, _ right: Int) {
	if left > right { return }

	let n = nums[left]
	var l = left, r = right
	while l < r {
		while l < r && nums[r] >= n { r -= 1 }
		while l < r && nums[l] <= n { l += 1 }

		if l < r {
			(nums[l], nums[r]) = (nums[r], nums[l])
		}
	}

	nums[left] = nums[l]
	nums[l] = n
	helper(&nums, left, l - 1)
	helper(&nums, l + 1, right)
}

func quickSort(_ nums: [Int]) -> [Int] {
	var _nums = nums
	helper(&_nums, 0, nums.count - 1)
	
	return _nums
}


func thelper(_ nums: inout [Int], _ left: Int, _ right: Int, _ k: Int) -> Int {
	if left > right { return Int.min }
	let n = nums[left]
	var l = left, r = right
	while l < r {
		while nums[r] >= n && l < r { r -= 1 }
		while nums[l] <= n && l < r { l += 1 }

		if l < r {
			(nums[l], nums[r]) = (nums[r], nums[l])
		}
	}

	nums[left] = nums[l]
	nums[l] = n

	if k - 1 == l { return n }
	else if k - 1 > l {
		return thelper(&nums, l + 1, right, k)
	} else {
		return thelper(&nums, left, l - 1, k)
	}

}

func topK(_ nums: [Int], _ k: Int) -> Int {
	var _nums = nums
	return thelper(&_nums, 0, nums.count - 1, k)

}



let nums = [3, 4, 5, 1, 2, 0, 15, 10]
let rrr = quickSort(nums)
let res = topK(nums, 5)
print("nums", rrr)
print(res)

