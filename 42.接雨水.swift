/**
 42. 接雨水
 给定 n 个非负整数表示每个宽度为 1 的柱子的高度图，计算按此排列的柱子，下雨之后能接多少雨水。

  

 示例 1：



 输入：height = [0,1,0,2,1,0,1,3,2,1,2,1]
 输出：6
 解释：上面是由数组 [0,1,0,2,1,0,1,3,2,1,2,1] 表示的高度图，在这种情况下，可以接 6 个单位的雨水（蓝色部分表示雨水）。
 示例 2：

 输入：height = [4,2,0,3,2,5]
 输出：9
  

 提示：

 n == height.length
 1 <= n <= 2 * 104
 0 <= height[i] <= 105
 
 
 解题思路:
 动态规划：
    1.假设每个位置i能盛的水用一个数组ans做记录
    2.leftMax数组记录位置i左边最大的值，rightMax数组记录位置i右边的最大值
    3.ans[i] = min(leftMax[i], rightMax[i]) - heigh[i]  如果小于 0则不计入
 */

func trap(_ height: [Int]) -> Int {
    let count = height.count
    var leftMax = [Int](repeating: 0, count: count)
    leftMax[0] = height[0]
    for i in 1..<count {
        leftMax[i] = max(leftMax[i-1], height[i])
    }
    
    var rightMax = [Int](repeating: 0, count: count)
    rightMax[count-1] = height[count-1]
    for i in (0..<count-1).reversed() {
        rightMax[i] = max(rightMax[i+1], height[i])
    }
    
    var ans = 0
    for i in 0..<count {
        ans += min(leftMax[i], rightMax[i]) - height[i]
    }
    return ans
}

/**
双指针法：
    1.维护两个指针left = 0, right = count - 1，以及两个变量leftMax = 0, rightMax = 0记录左右最大值
    2.当 left<right时
            a.当left
 
 */
func trap2(_ height: [Int]) -> Int {
    var ans = 0
    var left = 0, right = height.count - 1
    var leftMax = 0, rightMax = 0
    while left < right {
        leftMax = max(leftMax, height[left])
        rightMax = max(rightMax, height[right])
        if height[left] < height[right] {
            ans += leftMax - height[left]
            left += 1
        } else {
            ans += rightMax - height[right]
            right -= 1
        }
    }
    return ans
}

let height = [0,1,0,2,1,0,1,3,2,1,2,1]
print(trap2(height))

