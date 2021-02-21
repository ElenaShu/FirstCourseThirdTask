// Этот файл пуст не по ошибке. В этот раз вам необходимо самостоятельно импортировать необходимые модули и запустить проверку
import Foundation
import FirstCourseThirdTaskChecker

let checker = Checker()
public class InheritanceStack: ArrayInitializableStorage {
    var array = [Int]()
    
    public override var count: Int{
        get{
            self.array.count
        }
    }
    required public init(array: [Int]) {
        super.init(array: array)
        self.array = array
    }
    
    required public init() {
        super.init()
        array = [Int]()
       // fatalError("init() has not been implemented")
    }
    
    override public func push(_ element: Int){
        array.append(element)
    }
    
    override public func pop() -> Int {
        return array.removeLast()
    }
}

public class InheritanceQueue: ArrayInitializableStorage {
    var array = [Int]()
    
    public override var count: Int{
        get{
            self.array.count
        }
    }
    required public init(array: [Int]) {
        super.init(array: array)
        self.array = array
    }
    
    required public init() {
        super.init()
        array = [Int]()
       // fatalError("init() has not been implemented")
    }
    
    override public func push(_ element: Int){
        array.append(element)
    }
    
    override public func pop() -> Int {
        return array.removeFirst()
    }
}

let stack = InheritanceStack()
let queue = InheritanceQueue()
checker.checkInheritance(stack: stack, queue: queue)

struct Lifo: StorageProtocol, ArrayInitializable {
    
    var array = [Int]()

    var count: Int {
        get{
            array.count
        }
    }
    
    init() {
        self.array = [Int]()
    }
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int {
        return array.removeLast()
    }
    
    init (array: [Int]){
        self.array = array
    }
}

struct Fifo: StorageProtocol, ArrayInitializable {
    
    var array = [Int]()
    
    init(array: [Int]) {
        self.array = array
    }
    
    init() {
        self.array = [Int]()
    }
    
    var count: Int{
        get{
            array.count
        }
    }
    
    mutating func push(_ element: Int) {
        array.append(element)
    }
    
    mutating func pop() -> Int {
        return array.removeFirst()
    }
}

var stackStruct = Lifo()
var queueStruct = Fifo()

checker.checkProtocols(stack: stackStruct, queue: queueStruct)

extension User: JSONSerializable, JSONInitializable{
    public func toJSON() -> String {
        return "{\"fullName\": \""+self.fullName+"\", \"email\": \""+self.email+"\"}"
    }
    
    public convenience init(JSON: String) {
        self.init()
        let cleanData = JSON.filter {
            char in let myFilter: [Character]=["\"",":","{","}",","]
        
            return !myFilter.contains(char)
        }
        var dataArray = cleanData.components(separatedBy: " ")
        self.email = dataArray.last!
        self.fullName = dataArray.remove(at: 0)
        self.fullName = dataArray.remove(at: dataArray.count-1)

        self.fullName=dataArray.remove(at: dataArray.count-1)

        self.fullName=dataArray.joined(separator: " ")
    }
    

}

checker.checkExtensions(userType: User.self)
