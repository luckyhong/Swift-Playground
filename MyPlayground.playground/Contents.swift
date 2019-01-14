//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


// 数组（Arrays）
/*
 数组使用有序列表存储同一类型的多个值。相同的值可以多次出现在一个数组的不同位置中。
 */

/// 数组的简单语法
/// 写 Swift 数组应该遵循像Array<Element>这样的形式，其中Element是这个数组中唯一允许存在的数据类型。我们也可以使用像[Element]这样的简单语法。尽管两种形式在功能上是一样的，但是推荐较短的那种。

/// 创建一个空数组
/// 我们可以使用构造语法来创建一个由特定数据类型构成的空数组：
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
/// 注意，通过构造函数的类型，someInts的值类型被推断为[Int]。

/// 或者，如果代码上下文中已经提供了类型信息，例如一个函数参数或者一个已经定义好类型的常量或者变量，我们可以使用空数组语句创建一个空数组，它的写法很简单：[]（一对空方括号）：
someInts.append(3)
// someInts 现在包含一个 Int 值
someInts = []
// someInts 现在是空数组，但是仍然是 [Int] 类型的。”

// 创建一个带有默认值的数组，Swift中的Array类型还提供一个可以创建特定大小并且所有数据都被默认的构造方法。我们可以把准备加入新数组的数据项数量（count）和适当类型的初始值（repeating）传入数组构造函数：
var threeDoubles = Array(repeating: 0.0, count: 3)
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
/// 通过两个数组相加创建一个数组
var sixDoubles = threeDoubles + anotherThreeDoubles

/// 用数组字面量构造数组
var shoppingList: [String] = ["Eggs", "Milk"]
var shoppingLists = ["Eggs", "Milk"]

print("The shopping list contains \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
print("\(shoppingList)")

shoppingList[4...6] = ["Bananas", "Apples"]
print("\(shoppingList)")

/// 调用数组的insert(_:at:)方法来在某个具体索引值之前添加数据项
shoppingList.insert("Maple Syrup", at: 0)
print("\(shoppingList)")

let mapleSyrup = shoppingList.remove(at: 0)
print("\(shoppingList)")

firstItem = shoppingList[0]

let apples = shoppingList.removeLast()
print("\(shoppingList)")

for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(String(index + 1)): \(value)")
}


// 集合（Sets）
/*
 集合(Set)用来存储相同类型并且没有确定顺序的值。当集合元素顺序不重要时或者希望确保每个元素只出现一次时可以使用集合而不是数组
 注意：
 Swift的Set类型被桥接到Foundation中的NSSet类
 */

/// 集合类型的哈希值
/*
 一个类型为了存储在集合中，该类型必须是可哈希化的--也就是说，该类型必须提供一个方法来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如a==b,因此必须a.hashValue == b.hashValue。
 */

/// 集合类型语法
/*
 Swift中的Set类型被写为Set<Element>，这里的Element表示Set中允许存储的类型，和数组不同的是，集合没有等价的简化形式。
 */

/// 创建和构造一个空的集合
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) itmes.")

/*
 注意：
 通过构造器，这里的letters变量的类型被推断为Set<Character>。
 
 此外，如果上下文提供了类型信息，比如作为函数的参数或者已知类型的变量或常量，我们可以通过一个空的数组字面量创建一个空的Set：
 */
letters.insert("a")
print("\(letters)")
letters = []

/// 用数组字面量创建集合
var favoriteGenres: Set<String> = ["Rock", "Classcal", "Hiphop"]
/*
 这个favoriteGenres变量被声明为“一个String值的集合”，写为Set<String>。由于这个特定的集合含有指定String类型的值，所以它只允许存储String类型值。这里的favoriteGenres变量有三个String类型的初始值("Rock"，"Classical"和"Hip hop")，并以数组字面量的方式出现。
 
 注意：
 favoriteGenres被声明为一个变量(拥有var标示符)而不是一个常量(拥有let标示符),因为它里面的元素将会在下面的例子中被增加或者移除。
 
 一个Set类型不能从数组字面量中被单独推断出来，因此Set类型必须显式声明。然而，由于 Swift 的类型推断功能，如果你想使用一个数组字面量构造一个Set并且该数组字面量中的所有元素类型相同，那么你无须写出Set的具体类型。favoriteGenres的构造形式可以采用简化的方式代替：
 var favoriteGenres: Set = ["Rock", "Rock", "Rock"]
 由于数组字面量中的所有元素类型相同，Swift 可以推断出Set<String>作为favoriteGenres变量的正确类型。
 */

/// 访问和修改一个集合
/// 你可以通过Set的属性和方法来访问和修改一个Set。为了找出一个Set中元素的数量，可以使用其只读属性count：
print("I have \(favoriteGenres.count) favorite music genres.")

/// 使用布尔属性isEmpty作为一个缩写形式去检查count属性是否为0
if favoriteGenres.isEmpty {
    print("As far as music, i'm not picky.")
} else {
    print("I have particular music preferences.")
}

/// 你可以通过调用Set的insert(_:)方法来添加一个新元素：
favoriteGenres.insert("Jazz")
print("\(favoriteGenres)")

/// 你可以通过调用Set的remove(_:)方法去删除一个元素，如果该值是该Set的一个元素则删除该元素并且返回被删除的元素值，否则如果该Set不包含该值，则返回nil。另外，Set中的所有元素可以通过它的removeAll()方法删除
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? i'm over it.")
} else {
    print("I never much cared for that.")
}

/// 使用contains(_:)方法去检查Set中是否包含一个特定的值：
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

/// 遍历一个集合
for genre in favoriteGenres {
    print(genre)
}

/// Swift 的Set类型没有确定的顺序，为了按照特定顺序来遍历一个Set中的值可以使用sorted()方法，它将返回一个有序数组，这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定.
for genre in favoriteGenres.sorted() {
    print(genre)
}


// 集合操作
/*
 你可以高效地完成Set的一些基本操作，比如把两个集合组合到一起，判断两个集合共有元素，或者判断两个集合是否全包含，部分包含或者不相交。
 */

/// 基本集合操作
/*
 使用intersection(_:)方法根据两个集合中都包含的值创建的一个新的集合。
 使用symmetricDifference(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合。
 使用union(_:)方法根据两个集合的值创建一个新的集合。
 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合。
 */
let oldDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oldDigits.union(evenDigits).sorted()
oldDigits.intersection(evenDigits).sorted()
oldDigits.subtracting(singleDigitPrimeNumbers).sorted()
oldDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

/*
 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)


// 字典
/*
 字典是一种存储多个相同类型的值的容器。每个值（value）都关联唯一的键（key），键作为字典中的这个值数据的标识符。和数组中的数据项不同，字典中的数据项并没有具体顺序。我们在需要通过标识符（键）访问数据的时候使用字典，这种方法很大程度上和我们在现实世界中使用字典查字义的方法一样。
 
 注意：
 Swift 的Dictionary类型被桥接到Foundation的NSDictionary类。
 */

/// 字典类型简化语法
/*
 Swift 的字典使用Dictionary<Key, Value>定义，其中Key是字典中键的数据类型，Value是字典中对应于这些键所存储值的数据类型。
 
 注意：
 一个字典的Key类型必须遵循Hashable协议，就像Set的值类型。
 
 我们也可以用[Key: Value]这样简化的形式去创建一个字典类型。虽然这两种形式功能上相同，但是后者是首选。
 */

/// 创建一个空字典
var namesOfIntegers = [Int: String]()

//// 如果上下文已经提供了类型信息，我们可以使用空字典字面量来创建一个空字典，记作[:]（中括号中放一个冒号）：
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

// 用字典字面量创建字典
/*
 我们可以使用字典字面量来构造字典，这和我们刚才介绍过的数组字面量拥有相似语法。字典字面量是一种将一个或多个键值对写作Dictionary集合的快捷途径。
 
 一个键值对是一个key和一个value的结合体。在字典字面量中，每一个键值对的键和值都由冒号分割。这些键值对构成一个列表，其中这些键值对由方括号包含、由逗号分割：
 [key 1: value 1, key 2: value 2, key 3: value 3]
 */

/// 下面的例子创建了一个存储国际机场名称的字典。在这个字典中键是三个字母的国际航空运输相关代码，值是机场名称：
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
/// airports字典被声明为一种[String: String]类型，这意味着这个字典的键和值都是String类型。注意：airports字典被声明为变量（用var关键字）而不是常量（let关键字）因为后来更多的机场信息会被添加到这个示例字典中。
/*
 airports字典使用字典字面量初始化，包含两个键值对。第一对的键是YYZ，值是Toronto Pearson。第二对的键是DUB，值是Dublin。
 
 这个字典语句包含了两个String: String类型的键值对。它们对应airports变量声明的类型（一个只有String键和String值的字典）所以这个字典字面量的任务是构造拥有两个初始数据项的airport字典。
 
 和数组一样，我们在用字典字面量构造字典时，如果它的键和值都有各自一致的类型，那么就不必写出字典的类型。 airports字典也可以用这种简短方式定义：
 
 var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
 因为这个语句中所有的键和值都各自拥有相同的数据类型，Swift 可以推断出Dictionary<String, String>是airports字典的正确类型。
 */
var airports2 = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

/// 访问和修改字典
print("The dictionary of airports contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

/// 我们也可以在字典中使用下标语法来添加新的数据项。可以使用一个恰当类型的键作为下标索引，并且分配恰当类型的新值：
airports["LHR"] = "London"
print(airports)

/// 我们也可以使用下标语法来改变特定键对应的值：
airports["LHR"] = "London Heathrow"
print(airports)

/*
 作为另一种下标方法，字典的updateValue(_:forKey:)方法可以设置或者更新特定键对应的值。就像上面所示的下标示例，updateValue(_:forKey:)方法在这个键不存在对应值的时候会设置新值或者在存在时更新已存在的值。和上面的下标方法不同的，updateValue(_:forKey:)这个方法返回更新值之前的原值。这样使得我们可以检查更新是否成功。
 
 updateValue(_:forKey:)方法会返回对应值的类型的可选值。举例来说：对于存储String值的字典，这个函数会返回一个String?或者“可选 String”类型的值。
 
 如果有值存在于更新前，则这个可选值包含了旧值，否则它将会是nil。
 */
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
    print(airports)
}

/// 我们也可以使用下标语法来在字典中检索特定键对应的值。因为有可能请求的键没有对应的值存在，字典的下标访问会返回对应值的类型的可选值。如果这个字典包含请求键所对应的值，下标会返回一个包含这个存在值的可选值，否则将返回nil：
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}

/// 我们还可以使用下标语法来通过给某个键的对应值赋值为nil来从字典里移除一个键值对：
airports["APL"] = "Apple Internation"
/// "Apple Internation" 不是真的 APL 机场, 删除它
airports["APL"] = nil
/// APL 现在被移除了”

/// 此外，removeValue(forKey:)方法也可以用来在字典中移除键值对。这个方法在键值对存在的情况下会移除该键值对并且返回被移除的值或者在没有值的情况下返回nil：
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

/// 字典遍历
/// 我们可以使用for-in循环来遍历某个字典中的键值对。每一个字典中的数据项都以(key, value)元组形式返回，并且我们可以使用临时常量或者变量来分解这些元组：
for (airportCode, airpoartName) in airports {
    print("\(airportCode): \(airpoartName)")
}

/// 通过访问keys或者values属性，我们也可以遍历字典的键或者值：
for airportCode in airports.keys {
    print("airportCode: \(airportCode)")
}

for airportValue in airports.values {
    print("airportValue: \(airportValue)")
}

/// 以特定的顺序遍历字典的键或值
for airportCode in airports.keys.sorted() {
    print("airportCode: \(airportCode)")
}

for airportValue in airports.values.sorted() {
    print("airportValue: \(airportValue)")
}

/// 如果我们只是需要使用某个字典的键集合或者值集合来作为某个接受Array实例的 API 的参数，可以直接使用keys或者values属性构造一个新数组：
/// Swift 的字典类型是无序集合类型。为了以特定的顺序遍历字典的键或值，可以对字典的keys或values属性使用sorted()方法。
let airportCodes = airports.keys
let airportValues = airports.values
print("airportCodes: \(airportCodes), airportValues: \(airportValues)")


