/**
 *
 * 	在一个有序数组中查找一个最接近的数
 *
 */

func latestNumber(_ nums: [Int], _ target: Int) -> Int {
    let count = nums.count
    if target <= nums[0] { return nums[0] }
    if target >= nums[count - 1] { return nums[count - 1] }

    var l = 0, r = nums.count - 1, mid = 0
    while l <= r {
        mid = (r - l) / 2 + l
        let number = nums[mid]
        if number == target {
            return mid
        } else if number > target {
            r = mid - 1
        } else if number < target {
            l = mid + 1
        }
    }

    if nums[mid] > target {
        return nums[mid] - target > target - nums[mid - 1] ? mid - 1 : mid
    } else {
        return target - nums[mid] > nums[mid + 1] - target ? mid : mid + 1
    }
}

let nums = [1, 4, 6, 9, 10]
let result = latestNumber(nums, 11)
print(result)
