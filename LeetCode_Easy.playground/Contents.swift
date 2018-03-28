//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


//TARGET SUM - 396
func targetSum(_ nums : [Int], _ target : Int) -> [Int] {
    var dict = [Int : Int]()
    for (i, num) in nums.enumerated() {
        if let lastIndex = dict[target - num] {
            return [lastIndex, i]
        }
        dict[num] = i
    }
    fatalError("No valid output")
}

targetSum([2,7,9,5,4], 11)


//REVERSE NUMBER - 7
func reverseInteger(number : Int) -> Int {
    if number == 0 { return 0 }
    var result = 0
    var number = number
    while number != 0 {
        result = result * 10 + number % 10
        number = number / 10
        if result > Int(Int32.max) || result < Int(Int32.min) {
            return 0
        }
    }
    return result
}

reverseInteger(number: 325)


//ROMAN TO INTEGER - 204
func romanToInt(s: String) -> Int {
    let dict = initDict()
    let chars = [Character](s.reversed())
    var res = 0
    for i in 0..<chars.count {
        guard let current = dict[String(chars[i])] else {
            return res
        }
        if i > 0 && current < dict[String(chars[i - 1])]! {
            res -= current
        } else {
            res += current
        }
    }
    return res
}

private func initDict() -> [String: Int] {
    var dict = [String: Int]()
    dict["I"] = 1
    dict["V"] = 5
    dict["X"] = 10
    dict["L"] = 50
    dict["C"] = 100
    dict["D"] = 500
    dict["M"] = 1000
    return dict
}

romanToInt(s: "XVII")

//VALID PARENTHESIS - 20
func isValidParenthesis(s: String) -> Bool {
    var stack = [Character]()
    for char in s {
        if char == "(" || char == "[" || char == "{" {
            stack.append(char)
        }
        else if char == ")" {
            guard stack.count != 0 && stack.removeLast() == "(" else {
                return false
            }
        }
        else if char == "]" {
            guard stack.count != 0 && stack.removeLast() == "[" else {
                return false
            }
        }
        else if char == "}" {
            guard stack.count != 0 && stack.removeLast() == "{" else {
                return false
            }
        }
    }
    return stack.count == 0
}



//REMOVE DUPLICATE FROM SORTED LIST - 189
func removeDup( nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count  }
    let nums = Set(nums)
    
    return nums.count
}

var list = [1,1,1,1,2,2,3,6]
removeDup(nums: &list)

//Swap index concept
func removeDup2( nums: inout [Int]) -> Int {
    var swapIndex = 1
    for index in 1..<nums.count {
        if nums[index-1] != nums[index] {
            //Swap at index position and swap index
            let temp = nums[index]
            nums[index] = nums[swapIndex]
            nums[swapIndex] = temp
            swapIndex = swapIndex + 1
        }
    }
    
    return swapIndex-1
}

removeDup2(nums: &list)

// Implement strStr() - 28
func strStr(_ haystack: String, _ needle: String) -> Int {
    guard haystack.count >= needle.count else {
        return -1
    }
    
    guard needle.count != 0 else {
        return 0
    }
    
    var haystack = [Character](haystack)
    var needle = [Character](needle)
    for i in 0...haystack.count - needle.count {
        for  j in 0..<needle.count {
            if haystack[i + j] != needle[j] {
                break
            }
            if j + 1 == needle.count {
                return i
            }
        }
    }
    
    return -1
}

strStr("hello", "ll")


//SQUARE ROOT OF X - 69

func mySqrt(_ x: Int) -> Int {
    guard x >= 0 else { return 0 }
    
    if x == 1 { return 1 }
    
    var result = 0
    for index in 0...x {
        result = index * index
        if result == x { return index }
        if result > x { return index - 1 }
    }
    return 0
}

mySqrt(40)


//RETURN NUMBER OF 1'S BITS - 191

func countBits(num : Int)-> Int{
    if num > Int(Int32.max) || num < Int(Int32.min) || num == 0 { return 0 }
    var counter = 0
    var num = num
    var temp = 0
    while num != 0 {
        temp = num % 10
        if temp == 1 {
            counter = counter + 1
        }
        num = num / 10
    }
    
    return counter
}

countBits(num: 00000000000000000000000000000010)


//151. Reverse Bits - 151
func pad(string : String, toSize: Int) -> String {
    var padded = string
    for _ in 0..<(toSize - string.count) {
        padded = "0" + padded
    }
    return padded
}

func reversebits(num: Int) -> Int {
    if num > Int(Int32.max) || num < Int(Int32.min) || num == 0 { return 0 }
    var finalnumber = 0
    let finalStr = pad(string: String(num, radix: 2), toSize: 32)
    let reversed = String(finalStr.reversed())
    if let number = Int(reversed, radix: 2) {
        finalnumber = number
    }
    if finalnumber > Int(Int32.max) || finalnumber < Int(Int32.min) || finalnumber == 0 { return 0 }
    return finalnumber
}

reversebits(num: 43261596)

//COUNT PRIMES - 204

func countPrimes(_ n: Int) -> Int {
    if n <= 2 { return 0 }
    var count = 0
    if n % 2 == 0 {
        for index in stride(from: 3, through: n-1, by: 2) {
            if isPrime(num: index) == true {
                print (index)
                count = count + 1
            }
        }
        return count + 1
    }
    else{
        for index in stride(from: 2, through: n-1, by: 1) {
            if isPrime(num: index) == true {
                count = count + 1
            }
        }
        return count
    }
}

func isPrime(num : Int) -> Bool {
    if num == 1 { return false }
    if num == 2 { return true }
    if num % 2 == 0 { return false }
    let sqrtNum = Int(sqrt(Double(num)))
    for var index in stride(from: 3, through: sqrtNum, by: 2) {
        if num % index == 0 {
            return false
        }
        index = index + 2
    }
    return true
}


countPrimes(3)

//REVERSE STRING
func reverseString(_ s: String) -> String {
    guard s.count != 0 else { return "" }
    
    var s = [Character](s)
    var i = 0
    var j = s.count-1
    
    while i < j {
        let temp = s[i]
        s[i] = s[j]
        s[j] = temp
        i = i + 1
        j = j - 1
    }
    
    return String(s)
}

reverseString("hello")


//VALID PALINDROME STRING - IGNORE CASES - 125

func isPalindrome(_ s: String) -> Bool {
    
    guard s.count != 0 else { return false }
    
    // Make String into an array of lowercase Characters
    let characters = s.lowercased()
    let unsafeChars = CharacterSet.alphanumerics.inverted
    let myStrippedString = characters.components(separatedBy: unsafeChars).joined(separator: "")
   
    var s = [Character](myStrippedString)
    var i = 0
    var j = s.count-1
    
    while i < j {
        let temp = s[i]
        s[i] = s[j]
        s[j] = temp
        i = i + 1
        j = j - 1
    }
    
    
    if myStrippedString == String(s) {
        return true
    }

    return false
}

isPalindrome("A man, a plan, a canal: Panama")


//MISSING NUMBER - 268

func missingNumber(_ nums: [Int]) -> Int {
    if nums.count == 1 && nums[0] == 0 { return 1 }
    if nums.count == 1 && nums[0] == 1 { return 0 }
    var total = ((nums.count) * (nums.count + 1)) / 2
    for index in 0..<nums.count {
        total = total - nums[index]
    }
    return total
}

missingNumber([3,2,1])


//FIZZBUZZ - 412
func fizzBuzz(_ n: Int) -> [String] {
    if n <= 0 { return [] }
    var finalArray  = Array<String>()
    for index in 1...n {
        if index % 15 == 0 { finalArray.append("FizzBuzz") }
        else if index % 5 == 0 { finalArray.append("Buzz") }
        else if index % 3 == 0 { finalArray.append("Fizz") }
        else { finalArray.append(String(index)) }
    }
    return finalArray
}


let a = fizzBuzz(15)
print (a)


//SUM OT TWO INTEGERS - 371
func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    let b = b
    for _ in 1...b {
        a += 1
    }
    
    return a
}
getSum(1, 2) //using for loop


//SINGLE NUMBER - 136

func singleNumber(nums: [Int]) -> Int {
  
    guard nums.count != 0 else { return 0 }
    if nums.count == 1 { return nums[0] }
    
    var dict = [Int : Int]()
    
    for (_,num) in nums.enumerated() {
        if dict[(num)] != nil {
            let value = dict[num]
            dict[(num)] = value! + 1
        }
        else{
            dict[num] = 1
        }
    }
 
    for (key,value) in dict {
        if value == 1 {
            return key
        }
    }
  
    return 0
}

singleNumber(nums: [1,1,2,3,3])

//CONTAINS DUPLICATE - ARRAY - 217

func containsDuplicate(nums: [Int]) -> Bool {
    return nums.count > Set(nums).count
}

containsDuplicate(nums: [1,2,3,4,5,6,7,6])


//DETERMINE IF NUMBER IS POWER OF THREE OR NOT

func isPowerOfThree(n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    
    return 1162261467 % n == 0
}


//POWER OF TWO OR NOT
func isPowerOfTwo(n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    
    return n & (n - 1) == 0
}

isPowerOfTwo(n: 16)


//MERGE SORTED ARRAYS - 88

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
  //Concept - compare last two
    var i = m - 1
    var j = n - 1
   
    nums1.reserveCapacity(m + n)
    
    var k = nums1.capacity - 1
    
    while i >= 0 && j >= 0 {
        if nums1[i] > nums2[j] {
            print("gaya")
            nums1[k] = nums1[i]
            print("hd")
            k = k - 1
            i = i - 1
        }
        else{
            nums1[k] = nums2[j]
            k = k - 1
            j = j - 1
        }
    }
    
    while i > 0 {
        nums1[k] = nums1[i]
        i = i - 1
        k = k - 1
    }
    while j > 0 {
        nums1[k] = nums2[j]
        j = j - 1
        k = k - 1
    }
}

var lista = [1,2,4,65]
let list2 = [0,9,14,19]
//merge(&lista, 4, list2, 4)



// VALID ANAGRAM OR NOT - 242

func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else {
        return false
    }
    let sortedString1 = s.sorted(by: <)
    let sortedString2 = t.sorted(by: <)
    if sortedString1 == sortedString2 {
        return true
    }
    return false
}

isAnagram("CAT", "AEC")


// MOVE ZEROES - 283

func moveZeroes(_ nums: inout [Int]) {
    var idx = 0
    for index in 0..<nums.count {
        if nums[index] != 0 {
            nums[idx] = nums[index]
            idx = idx + 1
        }
    }
    while idx < nums.count {
        nums[idx] = 0
        idx = idx + 1
    }
}

var zeroeslist = [1,2,0,5,7,2,0,9,8]
moveZeroes(&zeroeslist) //vinod's approach of swap index


//LONGEST COMMON PREFIX - 14

func longestCommonPrefix(_ strs: [String]) -> String {
    guard strs.count != 0 else { return ""  }
    if strs.count == 1 { return strs[0] }
    
    var resultString = ""
    for index in 0..<strs[0].count {
        for j in stride(from: 1, through: strs.count-1, by: 1) {
            
            if index >= strs[j].count { return resultString }
            
            if strs[0] == "" || strs[j] == "" { return "" }
            
            let indexString = strs[0].index(strs[0].startIndex, offsetBy: index)
            let startChar = strs[0][indexString]
            
            let indexStringForJ = strs[j].index(strs[j].startIndex, offsetBy: index)
            let startCharForJ = strs[j][indexStringForJ]
            
            if startChar == startCharForJ {
                if j == strs.count-1 {
                    resultString = resultString + String(startChar)
                }
            }
            else{
                return resultString
            }
        }
    }
    return resultString
    
}

longestCommonPrefix(["abb","ab"])


//MERGE TWO SORTED LIST - 21

//
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.next = nil
//    }
//}
//
//class Solution {
//    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//
//    }
//}


//PLUS ONE - 66

 func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    var index = digits.count - 1
    
    while index >= 0 {
        if digits[index] < 9 {
            digits[index] += 1
            return digits
        }
        digits[index] = 0
        index -= 1
    }
    return digits
}

plusOne([7,2,9,9])


//MAJORITY ELEMENT - 169

func majorityElement(_ nums: [Int]) -> Int {
    
    guard nums.count != 0 else  { return 0 }
    
    if nums.count == 1 { return nums[0] }
    
    var nums = nums.sorted()
    
    var counter = 0
    for index in 1..<nums.count {
        if nums[index - 1] == nums[index] {
            counter = counter + 1
            if nums.count % 2 == 0 {
                if counter >= nums.count/2 - 1 {
                    return nums[index]
                }
            }
            else{
                if counter >= nums.count/2 {
                    return nums[index]
                }
            }
        }
        else{
            counter = 0
        }
    }

    return 0
}

majorityElement([3,3,4,4,4])


//FACTORIAL TRAILING ZEROES - 172
func trailingZeroes(_ n: Int) -> Int {
    
   var count = 0
    var n = n
    while n > 0 {
        count = count + n/5
        n = n / 5
    }
    
    return count
}

trailingZeroes(100)


//ROTATE ARRAY - 189

//func rotate(_ nums: inout [Int], _ k: Int) {
//
//    guard nums.count != 0 { return 0 }
//    if nums.count == 1 { return nums[0] }
//
//}


//MAXIMUM SUBARRAY - 53
func maxSubArray(_ nums: [Int]) -> Int {
    
    guard nums.count != 0 else { return 0 }
    if nums.count == 1 { return nums[0] }
    
    var maxSoFar = nums[0]
    var currentMax = nums[0]
    
    for index in 1..<nums.count {
        currentMax = max(nums[index], currentMax + nums[index])
        maxSoFar = max(maxSoFar, currentMax)
    }
    
    return maxSoFar
}

maxSubArray([-2, -3, 4, -1, -2, 1, 5, -3])
