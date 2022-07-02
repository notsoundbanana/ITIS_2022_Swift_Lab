protocol HomeworkService {
    // Функция деления с остатком, должна вернуть в первой части результат деления, во второй части остаток.
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int)
    
    // Функция должна вернуть числа фибоначчи.
    func fibonacci(n: Int) -> [Int]
    
    // Функция должна выполнить сортировку пузырьком.
    func sort(rawArray: [Int]) -> [Int]
    
    // Функция должна преобразовать массив строк в массив первых символов строки.
    func firstLetter(strings: [String]) -> [Character]
    
    // Функция должна отфильтровать массив по условию, которое приходит в параметре `condition`. (Нельзя юзать `filter` у `Array`)
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int]
}


struct Task1: HomeworkService {
    
    func divideWithRemainder(_ x: Int, by y: Int) -> (Int, Int) {
        return (x / y, x % y)
    }
    
    func fibonacci(n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        else if n == 1 {
            return [1]
        }
        var fibNumbers = [0, 1]
        
        for i in 2...n {
            fibNumbers.append(fibNumbers[i - 1] + fibNumbers[i - 2])
        }
        return fibNumbers
    }
    
    func sort(rawArray: [Int]) -> [Int] {
        guard rawArray.count > 1 else {
            return rawArray
        }
        
        var result = rawArray
        
        for _ in 0..<result.count{
            for j in 0..<result.count-1{
                if result[j] > result[j + 1]{
                    result.swapAt(j, j+1)
                }
            }
        }
        return result
    }
    
    func firstLetter(strings: [String]) -> [Character] {
        var result = [Character]()
        
        for i in 0..<strings.count {
            if strings[i].count >= 1 {
                result.append(strings[i].first!)
            }
        }
        return result
    }
    
    
    func filter(array: [Int], condition: ((Int) -> Bool)) -> [Int] {
        var result = [Int]()
        
        for i in 0..<array.count{
            if condition(array[i]){
                result.append(array[i])
            }
        }
        return result
    }
}

let condition: (Int) -> Bool = { number in
    return number >= 0
}

let task1 = Task1()

print(task1.divideWithRemainder(10,by: 3))
print(task1.fibonacci(n: 10))
print(task1.sort(rawArray: [2, 3, 4, 1]))
print(task1.firstLetter(strings: ["abc", "", "dfasdf"]))
print(task1.filter(array: [-1, 1, 2, 3, 0, -2, -3], condition: condition))

