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
