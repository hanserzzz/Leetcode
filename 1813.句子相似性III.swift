/**
    1.sentence1 == 1 || sentence2 == 1 判断为1的那个是不是另一个的头尾 如果不是 false
    2.sentence1 > 1 && sentence2 > 1 校验两边是否相同 是否是在中间或者头尾有部分缺失

    时间复杂度：O(m+n)
    空间复杂度：O(m+n)
*/

// str1.count >= strs2.count
func check(_ strs1: [String], _ strs2: [String]) -> Bool {
    // 找到strs1 strs2左边部分相似部分
    var l_length = 0
    while l_length < strs1.count, l_length < strs2.count, strs1[l_length] == strs2[l_length] {
        l_length += 1
    }
    // 找到strs1 strs2右边部分相同部分
    var r_length = 0
    var r1 = strs1.count - 1, r2 = strs2.count - 1
    while r1 >= 0, r2 >= 0, strs1[r1] == strs2[r2] {
        r1 -= 1
        r2 -= 1
        r_length += 1
    }

    if l_length > 0, r_length > 0,l_length + r_length == strs2.count {   // 两个字符串相同
        return true 
    } else if l_length + r_length >= strs2.count { 
        return true
    }
    return false
}

func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
    let strs1 = sentence1.components(separatedBy: " ")
    let strs2 = sentence2.components(separatedBy: " ")
    if strs1.count > strs2.count {
        return check(strs1, strs2)
    } else {
        return check(strs2, strs1)
    }
}




