/*
282. 给表达式添加运算符
给定一个仅包含数字 0-9 的字符串 num 和一个目标值整数 target ，在 num 的数字之间添加 二元 运算符（不是一元）+、- 或 * ，返回所有能够得到目标值的表达式。

 

示例 1:

输入: num = "123", target = 6
输出: ["1+2+3", "1*2*3"] 
示例 2:

输入: num = "232", target = 8
输出: ["2*3+2", "2+3*2"]
示例 3:

输入: num = "105", target = 5
输出: ["1*0+5","10-5"]
示例 4:

输入: num = "00", target = 0
输出: ["0+0", "0-0", "0*0"]
示例 5:

输入: num = "3456237490", target = 9191
输出: []
 

提示：

1 <= num.length <= 10
num 仅含数字
-231 <= target <= 231 - 1

*/

let operators = ["+", "-", "*"]

/*
	@params nums 字符数组
	@params index 当前要操作的位数
	@params target 目标时
	@params path 当前组合
	@params prev 前一个值
	@params result 结果
	
*/
func backTrack(_ nums: [String], _ index: Int, _ total: Int, _ target: Int, _ path: inout [String], _ prev: Int, _ result: inout [String]) {

	if index >= nums.count {
		if total == target {
			result.append(path.joined())
		}
		return
	}

	for i in index..<nums.count {

		if nums[index] == "0" && i > index { break;}

		let n = Int(nums[index...i].joined())!
		if index == 0 {
			path.append(nums[i])
			backTrack(nums, i + 1, n, target, &path, n, &result)
		} else {
			path.append("+" + String(n))
			backTrack(nums, i + 1, total + n, target, &path, n, &result)
			path.removeLast()

			path.append("-" + String(n))
			backTrack(nums, i + 1, total - n, target, &path, -n, &result)
			path.removeLast()

			path.append("*" + String(n))
			backTrack(nums, i + 1, total - prev + prev * n, target, &path, prev * n, &result)
			path.removeLast()
		}
	}
}


func addOperators(_ num: String, _ target: Int) -> [String] {

	let strs = num.map { String($0) }	
	var path = [String]()
	var result = [String]()
	backTrack(strs, 0, 0, target, &path, 0, &result)

	return result
}


let result =  addOperators("105"
, 5)
print(result)







