/*

 1024. 视频拼接
 你将会获得一系列视频片段，这些片段来自于一项持续时长为 T 秒的体育赛事。这些片段可能有所重叠，也可能长度不一。

 视频片段 clips[i] 都用区间进行表示：开始于 clips[i][0] 并于 clips[i][1] 结束。我们甚至可以对这些片段自由地再剪辑，例如片段 [0, 7] 可以剪切成 [0, 1] + [1, 3] + [3, 7] 三部分。

 我们需要将这些片段进行再剪辑，并将剪辑后的内容拼接成覆盖整个运动过程的片段（[0, T]）。返回所需片段的最小数目，如果无法完成该任务，则返回 -1 。

 示例 1：

 输入：clips = [[0,2],[4,6],[8,10],[1,9],[1,5],[5,9]], T = 10
 输出：3
 解释：
 我们选中 [0,2], [8,10], [1,9] 这三个片段。
 然后，按下面的方案重制比赛片段：
 将 [1,9] 再剪辑为 [1,2] + [2,8] + [8,9] 。
 现在我们手上有 [0,2] + [2,8] + [8,10]，而这些涵盖了整场比赛 [0, 10]。
 示例 2：

 输入：clips = [[0,1],[1,2]], T = 5
 输出：-1
 解释：
 我们无法只用 [0,1] 和 [1,2] 覆盖 [0,5] 的整个过程。
 示例 3：

 输入：clips = [[0,1],[6,8],[0,2],[5,6],[0,4],[0,3],[6,7],[1,3],[4,7],[1,4],[2,5],[2,6],[3,4],[4,5],[5,7],[6,9]], T = 9
 输出：3
 解释：
 我们选取片段 [0,4], [4,7] 和 [6,9] 。
 示例 4：

 输入：clips = [[0,4],[2,8]], T = 5
 输出：2
 解释：
 注意，你可能录制超过比赛结束时间的视频。

 提示：

 1 <= clips.length <= 100
 0 <= clips[i][0] <= clips[i][1] <= 100
 0 <= T <= 100

 思路:

 	贪心算法:
 		1.map记录相同起始时间最长终点
 		2.从0开始遍历时间线,通过记录的map取当前开始的cur
 		3.更新 cur 和 ans的时机，当当前cur 足以满足时间线时更新ans cur
 		4.最远距离 == 当前时间线i时，说明有断层
 		1.记录从0~time开始 maxLenth值
 */

func videoStitching(_ clips: [[Int]], _ time: Int) -> Int {
    var ans = 0, cur = 0, maxLenth = 0
    var map = [Int: Int]()

    // 记录同一个起始位置的最大长度
    for range in clips {
        map[range[0]] = max(range[1], map[range[0]] ?? 0)
    }

    for i in 0 ..< time {
        maxLenth = max(maxLenth, map[i] ?? 0)

        if i == maxLenth { return -1 }
        if i == cur {
            ans += 1
            cur = maxLenth
        }
    }

    return ans
}

let clips = [[0, 1], [6, 8], [0, 2], [5, 6], [0, 4], [0, 3], [6, 7], [1, 3], [4, 7], [1, 4], [2, 5], [2, 6], [3, 4], [4, 5], [5, 7], [6, 9]]
let result = videoStitching(clips, 9)
print(result)

/*
 动态规划:
 	1.对于time为i的闭区间[0, i),如果 i 满足 aj<i <= bj,则说明覆盖[0, i)的后半段，而前半段可以用dp[aj]去计算
 */
func videoStitchingOfDp(_ clips: [[Int]], _ time: Int) -> Int {
    var dp = Array(repeating: Int.max - 1, count: time + 1)
    dp[0] = 0
    for i in 1 ... time {
        for range in clips {
            if i > range[0], i <= range[1] {
                dp[i] = min(dp[i], dp[range[0]] + 1)
            }
        }
    }
    return dp[time] == Int.max - 1 ? -1 : dp[time]
}
