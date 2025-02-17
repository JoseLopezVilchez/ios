import UIKit

//var ejemplo : [String : String] = [:];
//var ejemplo = [String : String]();
//var ejemplo : Dictionary<String, String> = [:];
//var ejemplo = Dictionary<String, String>();

var ejemplo : [String : String] = ["ejemplo" : "ejemplo", "ejemplo2" : "ejemplo2"];

ejemplo.removeValue(forKey: "ejemplo");
ejemplo.removeAll();

ejemplo.forEach { (key, value) in
    print("\(key) : \(value), ");
}

/*let suma: (Int, Int) -> Int = { (a: Int, b: Int) in
    return a + b
}*/

var test : [[Bool] : () -> Void] = [
    [false, false] : {() in print("0 y 0")},
    [true, false] : {() in print("1 y 0")},
    [false, true] : {() in print("0 y 1")},
    [true, true] : {() in print("1 y 1")}
];

(test[[true, true]]!)();
