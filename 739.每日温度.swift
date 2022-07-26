/*
739. 每日温度
给定一个整数数组 temperatures ，表示每天的温度，返回一个数组 answer ，其中 answer[i] 是指对于第 i 天，下一个更高温度出现在几天后。如果气温在这之后都不会升高，请在该位置用 0 来代替。

 

示例 1:

输入: temperatures = [73,74,75,71,69,72,76,73]
输出: [1,1,4,2,1,1,0,0]
示例 2:

输入: temperatures = [30,40,50,60]
输出: [1,1,1,0]
示例 3:

输入: temperatures = [30,60,90]
输出: [1,1,0]
 

提示：

1 <= temperatures.length <= 105
30 <= temperatures[i] <= 100

*/


/*
    单调栈

    Time complexity : O(N)
    Space complexity : O(N)
*/
func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
    // 记录当前未找到第一个比它大的元素坐标
    var skt = [Int]()
    var ret = [Int](repeating: 0, count: temperatures.count)

    for i in 0..<temperatures.count {
        // 单调栈为空时直接入栈
        if skt.isEmpty {
            skt.insert(i ,at: 0)
        } else {
            // 当前i 与单调中元素对比比它小的都可以直接算出差异值，得出结果
            while !skt.isEmpty, temperatures[i] > temperatures[skt.last!] {
                let l = skt.removeLast()
                ret[l] = i - l
            }
            skt.append(i)
        }
    }
    return ret
}