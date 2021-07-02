/*

 1011. 在 D 天内送达包裹的能力
 传送带上的包裹必须在 D 天内从一个港口运送到另一个港口。

 传送带上的第 i 个包裹的重量为 weights[i]。每一天，我们都会按给出重量的顺序往传送带上装载包裹。我们装载的重量不会超过船的最大运载重量。

 返回能在 D 天内将传送带上的所有包裹送达的船的最低运载能力。

 示例 1：

 输入：weights = [1,2,3,4,5,6,7,8,9,10], D = 5
 输出：15
 解释：
 船舶最低载重 15 就能够在 5 天内送达所有包裹，如下所示：
 第 1 天：1, 2, 3, 4, 5
 第 2 天：6, 7
 第 3 天：8
 第 4 天：9
 第 5 天：10

 请注意，货物必须按照给定的顺序装运，因此使用载重能力为 14 的船舶并将包装分成 (2, 3, 4, 5), (1, 6, 7), (8), (9), (10) 是不允许的。
 示例 2：

 输入：weights = [3,2,2,4,1,4], D = 3
 输出：6
 解释：
 船舶最低载重 6 就能够在 3 天内送达所有包裹，如下所示：
 第 1 天：3, 2
 第 2 天：2, 4
 第 3 天：1, 4
 示例 3：

 输入：weights = [1,2,3,1,1], D = 4
 输出：3
 解释：
 第 1 天：1
 第 2 天：2
 第 3 天：3
 第 4 天：1, 1
 */

/*
 方法一：二分查找转化为判定问题
 思路与算法

 假设当船的运载能力为 xx 时，我们可以在 \textit{days}days 天内运送完所有包裹，那么只要运载能力大于 xx，我们同样可以在 \textit{days}days 天内运送完所有包裹：我们只需要使用运载能力为 xx 时的运送方法即可。

 这样一来，我们就得到了一个非常重要的结论：

 存在一个运载能力的「下限」x_\textit{ans}x
 ans
 ​
  ，使得当 x \geq x_\textit{ans}x≥x
 ans
 ​
   时，我们可以在 \textit{days}days 天内运送完所有包裹；当 x < x_\textit{ans}x<x
 ans
 ​
   时，我们无法在 \textit{days}days 天内运送完所有包裹。

 同时，x_\textit{ans}x
 ans
 ​
   即为我们需要求出的答案。因此，我们就可以使用二分查找的方法找出 x_\textit{ans}x
 ans
 ​
   的值。

 在二分查找的每一步中，我们实际上需要解决一个判定问题：给定船的运载能力 xx，我们是否可以在 \textit{days}days 天内运送完所有包裹呢？这个判定问题可以通过贪心的方法来解决：

 由于我们必须按照数组 \textit{weights}weights 中包裹的顺序进行运送，因此我们从数组 \textit{weights}weights 的首元素开始遍历，将连续的包裹都安排在同一天进行运送。当这批包裹的重量大于运载能力 xx 时，我们就需要将最后一个包裹拿出来，安排在新的一天，并继续往下遍历。当我们遍历完整个数组后，就得到了最少需要运送的天数。

 我们将「最少需要运送的天数」与 \textit{days}days 进行比较，就可以解决这个判定问题。当其小于等于 \textit{days}days 时，我们就忽略二分的右半部分区间；当其大于 \textit{days}days 时，我们就忽略二分的左半部分区间。

 细节

 二分查找的初始左右边界应当如何计算呢？

 对于左边界而言，由于我们不能「拆分」一个包裹，因此船的运载能力不能小于所有包裹中最重的那个的重量，即左边界为数组 \textit{weights}weights 中元素的最大值。

 对于右边界而言，船的运载能力也不会大于所有包裹的重量之和，即右边界为数组 \textit{weights}weights 中元素的和。

 我们从上述左右边界开始进行二分查找，就可以保证找到最终的答案。

  */

func canFinish(_ weights: [Int], _ days: Int, _ speed: Int) -> Bool {
    var day = 1
    var cur = 0
    for w in weights {
        if cur + w >= speed {
            cur = 0
            day += 1
        }
        cur += w
    }
    return day <= days
}

func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    var minSpeed = weights.max()!
    var maxSpeed = weights.reduce(0, +) + 1
    var curSpeed = 0

    while minSpeed < maxSpeed {
        curSpeed = minSpeed + (maxSpeed - minSpeed) / 2
        if canFinish(weights, days, curSpeed) {
            maxSpeed = curSpeed
        } else {
            minSpeed = curSpeed + 1
        }
    }
    return minSpeed
}

let weights = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let result = shipWithinDays(weights, 1)
print(result)
