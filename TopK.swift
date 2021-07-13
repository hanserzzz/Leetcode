/*

 无序数组找出第k大个数

 思路:
 	本题可以利用二分查找
 	快排每次递归可以把一个数放在他在的位置上，同时我们也知道要查找的数的位置，这样可以判断是继续对该数的右侧进行递归排序还是对该数的左侧进行递归排序
 	当递归排序的数的位置和要找的数的位置相等时，停止递归

 	快排:
 		Time complexity: O(nlogn)
 	此题:
 		犹豫是第k个数，所以应该是O(nlogk),k是一个常数所以为O(n)

 example:
 	[1, 2, 3, 4, 5, 6]   k = 2

 	[4, 5, 2, 1, 6]
 */

func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
    if right < left { return -1 }
    var r = right, l = left
    let n = nums[left]
    while r > l {
        // 右边找到一个比标准数小的
        while r > l, nums[r] > n { r -= 1 }
        nums[l] = nums[r]
        // 左边找到一个比标准数大的
        while r > l, nums[l] < n { l += 1 }
        nums[r] = nums[l]
    }

    if l == target {
        return nums[l]
    } else if l > target {
        return quickSort(&nums, left, l - 1, target)
    } else {
        return quickSort(&nums, l + 1, right, target)
    }
}

func topK(_ nums: inout [Int], _ k: Int) -> Int {
    let target = nums.count - k
    let result = quickSort(&nums, 0, nums.count - 1, target)
    return result
}

var nums = [1, 2, 6, 9, 3, 7]
let result = topK(&nums, 2)
print(result)
