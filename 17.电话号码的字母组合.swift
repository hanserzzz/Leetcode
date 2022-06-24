/*
17. 电话号码的字母组合
给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。

给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。



 

示例 1：

输入：digits = "23"
输出：["ad","ae","af","bd","be","bf","cd","ce","cf"]
示例 2：

输入：digits = ""
输出：[]
示例 3：

输入：digits = "2"
输出：["a","b","c"]
 

提示：

0 <= digits.length <= 4
digits[i] 是范围 ['2', '9'] 的一个数字。
*/

let digitsMap: [Character: [Character]] = [
	"2": ["a", "b", "c"],
	"3": ["d", "e", "f"],
	"4": ["g", "h", "i"],
	"5": ["j", "k", "l"],
	"6": ["m", "n", "o"],
	"7": ["p", "q", "r", "s"],
	"8": ["t", "u", "v"],
	"9": ["w", "x", "y", "z"]
]

func letterCombinations(_ digits: String) -> [String] {
    let chars = Array(digits)
    var digitsChars = [[Character]]()
    for c in chars {
    	digitsChars.append(digitsMap[c]!)
    }

    var samplesCurrent = [[Character]]()
    var samplesNext = [[Character]]()

    for i in 0..<digitsChars.count {
    	let chars = digitsChars[i]
    	for j in 0..<chars.count {
    		if i == 0 {
    			samplesCurrent.append([chars[j]])
     		} else {
      			for cc in samplesCurrent {
      				var tmp = cc
    				tmp.append(chars[j])
    				samplesNext.append(tmp)
    			}
       		}
    	}
    	if i > 0 {
    		samplesCurrent = samplesNext
    		samplesNext.removeAll()
    	}    
    }

    var res = [String]()
    for cc in samplesCurrent {
    	res.append(String(cc))
    }

    return res
}

let res = letterCombinations("22")
print(res)

func helper(_ result: inout [String], _ phoneMap:[Character: [Character]], _ digitsChars: [Character], _ index: Int, _ combination: inout [Character]) {
	if index == digitsChars.count {
		result.append(String(combination))
	} else {
		let c = digitsChars[index]
		let chars = phoneMap[c]!
		for i in 0..<chars.count {
			let c = chars[i]
			combination.append(c)
			helper(&result, phoneMap, digitsChars, index + 1, &combination)
			combination.remove(at: index)
		}
	}
}

func letterCombinations2(_ digits: String) -> [String] {
	var result = [String]()
	// var digitsChars = Array(digits)
	var combination = [Character]()
	helper(&result, digitsMap, Array(digits), 0, &combination)
	return result
}

print(letterCombinations2("22"))






