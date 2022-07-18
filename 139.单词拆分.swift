/*

139. 单词拆分
给你一个字符串 s 和一个字符串列表 wordDict 作为字典。请你判断是否可以利用字典中出现的单词拼接出 s 。

注意：不要求字典中出现的单词全部都使用，并且字典中的单词可以重复使用。

 

示例 1：

输入: s = "leetcode", wordDict = ["leet", "code"]
输出: true
解释: 返回 true 因为 "leetcode" 可以由 "leet" 和 "code" 拼接成。
示例 2：

输入: s = "applepenapple", wordDict = ["apple", "pen"]
输出: true
解释: 返回 true 因为 "applepenapple" 可以由 "apple" "pen" "apple" 拼接成。
     注意，你可以重复使用字典中的单词。
示例 3：

输入: s = "catsandog", wordDict = ["cats", "dog", "sand", "and", "cat"]
输出: false

*/

func check(_ options: [Character], _ word: [Character]) -> Bool {
	let oCount = options.count, wCount = word.count
	var l = 0, r = l 
	while l < oCount - wCount {
		// 找到第一个相等的字符为起点
		while options[l] != word[0], l < oCount - wCount { l += 1 }
		r = l 

		if l > oCount - wCount { return false }

		// 以l为起点对比字符
		var idx = 0
		while r < oCount, idx < wCount, word[idx] == options[r]{
			idx += 1
			r += 1
		}

		// 说明对比到最后了，成功匹配
		if idx == wCount {
			return true
		} else {	// 对比未成功，需要向后移一位继续对比
			l += 1
		}
	}

	return false
}

func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
	let sChars = Array(s)
	for word in wordDict {
		if !check(sChars, Array(word)) { return false }
	}
	return true
}

let s = "leetcode", wordDict = ["leet", "code"]
let result = wordBreak(s, wordDict)
print(result)

