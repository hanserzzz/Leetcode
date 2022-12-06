/*
    1.中位数：
        [1, 2, 3] = 2
        [1, 2, 3, 4] = 2.3
    2.total = count1 + count2
        奇数：index = total/2
        偶数：index1 = total/2, index2 = total/2 - 1
    3.topK nums1 -> i, nums2 -> j,
    // 下标生成原则
    i + j = (count1 + count2 + 1)/2,

    // 符合答案原则
    leftMax = nums1[i]
    leftMin = nums1[i - 1]
    rightMax = nums2[j]
    rightMin = nums2[j - 1]

    leftMin < rightMax, rightMin < leftMax

    // leftMin > rightMax i 要想左侧搜索
    // right = i - 1
    // else left = i


*/
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    // 保证nums1是较短的那一个
    if nums1.count > nums2.count {
        return findMedianSortedArrays(nums2, nums1)
    }

    let m = nums1.count
    let n = nums2.count

    // 中位数的总和数,考虑到奇偶性对其+1
    let totalLeft = (m + n + 1)/2
    // 在Num1中做二分查找，因为num1较短，时间复杂度优化
    var left = 0
    var right = m

    while left < right {
        // i 为nums1中找到二分数的较大的那个数,j为nums2重找到二分数切割点的较大数
        let i = left + (right - left + 1)/2
        let j = totalLeft - i

        // 左边的最小数nums1[i - 1] 大于右边的最大数nums2[j]
        if nums1[i - 1] > nums2[j] {
            right = i - 1
        } else {
            left = i
        }
    }

    let i = left
    let j = totalLeft - i
    let nums1LeftMax = i == 0 ? Int.min : nums1[i - 1]
    let nums1RightMin = i == m ? Int.max : nums1[i]
    let nums2LeftMax = j == 0 ? Int.min : nums2[j - 1]
    let nums2RightMin = j == n ? Int.max : nums2[j]

    return (m + n) % 2 == 1 ? Double(max(nums1LeftMax, nums2LeftMax)) : Double((Double(max(nums1LeftMax, nums2LeftMax)) + Double(min(nums2RightMin, nums1RightMin)))/2)
}
