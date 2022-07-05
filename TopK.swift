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


func randomPatition(_ nums: inout [Int], _ left: Int, _ right: Int) -> Int {
    let randomIdx = Int.random(in: left...right)
    // 先把标准值至于最左侧方便对比
    (nums[left], nums[randomIdx]) = (nums[randomIdx], nums[left])

    var start = left
    for i in left+1...right {
        if nums[i] < nums[left] {

            // 发现比标准数小的，至于左侧
            start += 1
            (nums[start], nums[i]) = (nums[i], nums[start])
        }
    }
    // 把标准书恢复应该在的位置
    (nums[start], nums[left]) = (nums[left], nums[start])
    return start
}

func quickSort(_ nums: inout [Int], _ left: Int, _ right: Int, _ target: Int) -> Int {
    if left == right {
        return nums[left]
    }
    let idx = randomPatition(&nums, left, right)
    if idx == target {
        return nums[idx]
    } else if idx < target {
        return quickSort(&nums, idx + 1, right, target)
    } else {
        return quickSort(&nums, left, idx - 1, target)
    }
}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    if nums.count == 0 || k == 0 {
        return 0
    }

    var _nums = nums
    return quickSort(&_nums, 0, nums.count - 1, nums.count - k)
}


var nums = [1, 2, 6, 9, 3, 7]
let result = topK(&nums, 2)
print(result)
