/*

有序旋转数组找最小数

eg1:
nums = [2,3,4,1] 
1

eg2:
nums = [5,7,10,1,2,3]
1


eg3:
nums = [5,5,6,6,6,7,1,2,3,5,5]
1

*/


func search(_ nums: [Int]) -> Int {
	if nums.count > 1 && nums.last! > nums.first! { return nums.first! }
	var l = 0, r = nums.count - 1
	while l < r {
		let mid = l + (r - l)/2
		if nums[mid] < nums[mid - 1] {
			return nums[mid]
		} else if nums[mid] >= nums[0] {
			l = mid + 1
		} else {
			r = mid - 1
		}
	}

	return -1
}

let nums = [1,2,3,4]
let result = search(nums)
print(result)



