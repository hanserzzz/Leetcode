/*
 670. 最大交换
 给定一个非负整数，你至多可以交换一次数字中的任意两位。返回你能得到的最大值。

 示例 1 :

 输入: 2736
 输出: 7236
 解释: 交换数字2和数字7。
 示例 2 :

 输入: 9973
 输出: 9973
 解释: 不需要交换。
 注意:

 给定数字的范围是 [0, 108]
 通过次数14,880提交次数33,813

 思路:

    暴力解:
        1.冒泡排序思想

        时间复杂度  ---> 两次循环 N²打底，比较N,所以是O(N³)
        空间复杂度  ---> 要初始化成String比较，O(N)
 贪心算法：
 1.分析整道题，如何才能让数最大，就是让最大数从大到小一次排列在高位到低位
 2.找出第一个不在它应该在的位置数，把它交换到它本应该在的位置 上就行了

 2564
 */

func maximumSwap(_ num: Int) -> Int {
    var nums = String(num).compactMap { Int(String($0)) }
    let count = nums.count
    var records = [Int: Int]()
    for i in 0 ..< count {
        records[nums[i]] = i
    }

    for i in 0 ..< count {
        for j in (0 ... 9).reversed() {
            if let index = records[j], index > i, j > nums[i] {
                (nums[i], nums[j]) = (nums[j], nums[i])
                return Int(nums.compactMap { String($0) }.joined())!
            }
        }
    }

    return num
}

print(maximumSwap(1993))
