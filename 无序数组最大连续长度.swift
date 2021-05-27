/**

 无序数组，求最大连续长度

 先把每个元素存在集合里，然后用另一个集合去记录是否用过，去重操作

 */

func maxContinuousLength(_ nums: [Int]) -> Int {
    var set = Set<Int>()
    for n in nums {
        set.insert(n)
    }

    var maxLength = 0
    var used = Set<Int>()
    for n in nums {
        if used.contains(n) { continue }

        // 查找右边
        var temp = n
        var lLength = 1
        while set.contains(temp + 1) {
            temp += 1
            lLength += 1
            used.insert(temp)
        }

        // 查找左边
        temp = n
        var rLength = 1
        while set.contains(temp - 1) {
            temp -= 1
            rLength += 1
            used.insert(temp)
        }

        maxLength = max(rLength + lLength - 1, maxLength)
    }

    return maxLength
}

// let nums = [6, 0, 8, 1, 2, 3, 4, 9, 5]
// let result = maxContinuousLength(nums)
// print(result)

func findLatestNumber(_ nums: [Int], _ target: Int) -> Int {
    var l = 0, r = nums.count - 1
    var mid = 0

    while l <= r {
        mid = (l + r) / 2
        print("right", r)
        print("left", l)
        print("mid", mid)
        if nums[mid] == target {
            return mid
        } else if nums[mid] > target {
            if nums[r - 1] < nums[mid] {
                if nums[mid] - target > target - nums[mid - 1] {
                    return nums[mid - 1]
                } else {
                    return nums[mid]
                }

                mid = r - 1
            }
        } else if nums[mid] < target {
            if nums[mid + 1] > target {
                if nums[mid + 1] - target > target - nums[mid] {
                    return nums[mid]
                } else {
                    return nums[mid + 1]
                }
            }
            mid = l + 1
        }
    }

    return Int.min
}

let nums = [1, 3, 5, 9]
let result = findLatestNumber(nums, 6)
print(result)
