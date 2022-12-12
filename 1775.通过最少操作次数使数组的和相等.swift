/*
 1775. 通过最少操作次数使数组的和相等
 给你两个长度可能不等的整数数组 nums1 和 nums2 。两个数组中的所有值都在 1 到 6 之间（包含 1 和 6）。

 每次操作中，你可以选择 任意 数组中的任意一个整数，将它变成 1 到 6 之间 任意 的值（包含 1 和 6）。

 请你返回使 nums1 中所有数的和与 nums2 中所有数的和相等的最少操作次数。如果无法使两个数组的和相等，请返回 -1 。

  

 示例 1：

 输入：nums1 = [1,2,3,4,5,6], nums2 = [1,1,2,2,2,2]
 输出：3
 解释：你可以通过 3 次操作使 nums1 中所有数的和与 nums2 中所有数的和相等。以下数组下标都从 0 开始。
 - 将 nums2[0] 变为 6 。 nums1 = [1,2,3,4,5,6], nums2 = [6,1,2,2,2,2] 。
 - 将 nums1[5] 变为 1 。 nums1 = [1,2,3,4,5,1], nums2 = [6,1,2,2,2,2] 。
 - 将 nums1[2] 变为 2 。 nums1 = [1,2,2,4,5,1], nums2 = [6,1,2,2,2,2] 。
 示例 2：

 输入：nums1 = [1,1,1,1,1,1,1], nums2 = [6]
 输出：-1
 解释：没有办法减少 nums1 的和或者增加 nums2 的和使二者相等。
 示例 3：

 输入：nums1 = [6,6], nums2 = [1]
 输出：3
 解释：你可以通过 3 次操作使 nums1 中所有数的和与 nums2 中所有数的和相等。以下数组下标都从 0 开始。
 - 将 nums1[0] 变为 2 。 nums1 = [2,6], nums2 = [1] 。
 - 将 nums1[1] 变为 2 。 nums1 = [2,2], nums2 = [1] 。
 - 将 nums2[0] 变为 4 。 nums1 = [2,2], nums2 = [4] 。
  

 提示：

 1 <= nums1.length, nums2.length <= 105
 1 <= nums1[i], nums2[i] <= 6
 
 
 思路：
    1.计算两个数组之差
    2.对于和交大的那个数组优先减小最大的数，对于和较小的那个数组优先增大较小的数
        a.排序法：分别对nums1、nums2排序，然后一次操作，大和数组从高位操作，小和数组从地位操作
        b.hash记录：通过hash记录nums1、nums2里每一个数对于减少diff的贡献值
    3.每次操作后更新diff
 
 
 
 */

func help(_ nums1: [Int], _ nums2: [Int], _ diff: Int) -> Int {
    // 遍历记录每个元素对于减少diff的贡献
    // 综合h1 h2能够减少diff的贡献
//    var h = [Int](repeating: 0, count: 7)
    var res = 0
    for i in 1...6 {
//        // h1是大和数组，所以贡献值是6 - i
        h[6 - i] = h1[i]
//        // h2是小和数组，所以贡献值是i - 1
        h[i - 1] = h2[i]
        
    }
    
    // 优先操作大的数组]
    var res = 0
    for i in (1...5).reversed() {
//        if diff <= 0 { return res }
        if diff - i * h[i] > 0 {
            diff -= (i * h[i])
            res += h[i]
        } else {
            res += (diff/i + (diff%i > 0 ? 1 : 0))
        }
//        let t = min(h[i], (diff + i - 1)/2)     // 计算次数，
//        res += t
//        diff -= (t * i)
    }
    
    return -1
}

func minOperation(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var diff = 0
    var h1 = [Int](repeating: 0, count: 7)
    for n in nums1 {
        h1[n] += 1
        diff += n
    }
    
    var h2 = [Int](repeating: 0, count: 7)
    for n in nums2 {
        h2[i] += n
        diff -= n
    }
    
    if diff == 0 { return 0 }
    // 保证cnt1是和交大的那个数组
    if diff > 0 {
        return help(nums1, nums2, diff)
    }
    return help(nums2, nums1, -diff)
}


let temp1 =  [1,2,3,4,5,6]
let temp2 = [1,1,2,2,2,2]
print(minOperation(temp1, temp2))
