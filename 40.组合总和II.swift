/*

40. 组合总和 II
给定一个候选人编号的集合 candidates 和一个目标数 target ，找出 candidates 中所有可以使数字和为 target 的组合。

candidates 中的每个数字在每个组合中只能使用 一次 。

注意：解集不能包含重复的组合。 

 

示例 1:

输入: candidates = [10,1,2,7,6,1,5], target = 8,
输出:
[
[1,1,6],
[1,2,5],
[1,7],
[2,6]
]
示例 2:

输入: candidates = [2,5,2,1,2], target = 5,
输出:
[
[1,2,2],
[5]
]
 

提示:

1 <= candidates.length <= 100
1 <= candidates[i] <= 50
1 <= target <= 30

*/


func backtrack(_ candicates: [Int], _ result: inout [[Int]], _ combination: inout [Int], _ index: Int, _ target: Int) {

	// 递归结束条件
	if target <= 0 {
		if target == 0 {
			result.append(combination)
		}
		return
	}


	for i in index..<candicates.count {
		if i > index, candicates[i] == candicates[i - 1] { continue }

		combination.append(candicates[i])
		backtrack(candicates, &result, &combination, i + 1, target - candicates[i])
		combination.removeLast()
	}
}


func combinationSum2(_ candicates: [Int], _ target: Int) -> [[Int]] {
	var result = [[Int]]()
	var combination = [Int]()
	backtrack(candicates.sorted(), &result, &combination, 0, target)
	return result
}


let candicates = [10,1,2,7,6,1,5]
print(combinationSum2(candicates, 8))




