//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)



// quick sort
class Solution {
    func quickSort(nums: Array<Int>) -> Array<Int> {
        if nums.isEmpty {
            return nums
        }
        var nums = nums
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            let pivot = nums[mid]
            // if left value < pivot, just skip
            while left < right, nums[left] < pivot {
                left += 1
            }
            // if right value > pivot, just skip
            while right > left, nums[right] > pivot {
                right -= 1
            }
            if left < right {
                swap(&nums[left], &nums[right])
                left += 1
                right -= 1
            }
        }
        return nums
    }
}

let nums = [2, 1]
let res = Solution().quickSort(nums: nums)
res


extension Solution {
    func sortArray(nums: inout [Int]) {
        if nums.isEmpty {
            return
        }
        var temp = Array<Int>(repeating: 0, count: nums.count)
        mergeSort(nums: &nums,
                  start: 0,
                  end: nums.count-1,
                  temp: &temp
        )
    }
    
    private func mergeSort(nums: inout [Int],
                           start: Int,
                           end: Int,
                           temp: inout [Int]) {
        if start >= end {
            return
        }
        
        let left = start
        let right = end
        let mid = left + (right - left) / 2
        mergeSort(nums: &nums, start: left, end: mid, temp: &temp)
        mergeSort(nums: &nums, start: mid+1, end: right, temp: &temp)
        mergeTwo(nums: &nums, start: start, mid: mid, end: end, temp: &temp)
    }
    
    private func mergeTwo(nums: inout [Int],
                          start: Int,
                          mid: Int,
                          end: Int,
                          temp: inout [Int]) {
        
        var left = start
        var right = mid + 1
        var index = start
        
        while left <= mid, right <= end {
            if nums[left] < nums[right] {
                temp[index] = nums[left]
                index += 1
                left += 1
            } else {
                temp[index] = nums[right]
                index += 1
                right += 1
            }
        }
        while left <= mid {
            temp[index] = nums[left]
            index += 1
            left += 1
        }
        while right <= end {
            temp[index] = nums[right]
            index += 1
            right += 1
        }
        index = start
        while index <= end {
            nums[index] = temp[index]
            index += 1
        }
    }
}
var nums2 = [2, 5, 1, 8, 2]
//Solution().sortArray(nums: &nums2)
nums2


