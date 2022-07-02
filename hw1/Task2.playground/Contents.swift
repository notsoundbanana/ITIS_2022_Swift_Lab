class Person: Talk, Dance {
    fileprivate var name: String
    fileprivate var surname: String
    fileprivate var subname: String
    fileprivate var age: Int
    
    init(name: String, surname: String, subname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.subname = subname
        self.age = age
    }
    
    func greeting() {
        print("Здрасте")
    }
    
    func dance() {
        print("ТАНЦУЮ")
    }
}


class Visitor: Person {
    var books: [Book] = []
    
    override func greeting() {
        print("Здравствуйте")
    }
    
    override func dance() {
        print("Я не могу танцевать, я посетитель бибиотеки")
    }
    
    func addBook(book: Book) {
        books.append(book)
    }
}


class Staff: Person {
    private var tables: [Table] = []
    private var chairs: [Chair] = []
    
    override func greeting() {
        print("Приветствую Вас в Национальной Библиотеке")
    }
    
    override func dance() {
        print("Я не могу танцевать, я работник бибиотеки")
    }
    
    func addTable(table: Table) {
        tables.append(table)
    }
    
    func addChair(chair: Chair) {
        chairs.append(chair)
    }
    
}

class Administrator: Person {
    public let post: Post = .administrator
    public var cabinetNumber: Int
    
    init(name: String, surname: String, subname: String, age:Int, cabinetNumber: Int) {
        self.cabinetNumber = cabinetNumber
        super.init(name: name, surname: surname, subname: subname, age: age)
    }
    
    override func greeting() {
        print("Здравствуйте, я администратор. Чем могу быть полезным?")
    }
    
    override func dance() {
        print("Я могу танцевать, но только у себя в кабинете")
    }
}

class PreAdministrator: Person {
    public let post: Post = .preDirector
    public var cabinetNumber: Int
    
    init(name: String, surname: String, subname: String, age:Int, cabinetNumber: Int) {
        self.cabinetNumber = cabinetNumber
        super.init(name: name, surname: surname, subname: subname, age: age)
    }
    
    override func greeting() {
        print("Здравствуйте, я заместитель администратор. Чем могу быть полезным?")
    }
    
    override func dance() {
        print("Я могу танцевать, но только у себя в кабинете")
    }
}


enum Post {
    case administrator
    case preDirector
}

enum Weight {
    case heavy
    case light
}

protocol Talk {
    func greeting()
}

protocol Dance {
    func dance()
}


struct Table {
    var numberOfLegs: Int
    var weight: Weight = .heavy
    
    init(numberOfLegs: Int) {
        self.numberOfLegs = numberOfLegs
    }
    
}

struct Book {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Chair {
    var material: String
    var weight: Weight = .light
    
    init(material: String) {
        self.material = material
    }
}

var staff = Staff(name: "name", surname: "surname", subname: "subname", age: 90)
print(staff.age)
staff.greeting()
