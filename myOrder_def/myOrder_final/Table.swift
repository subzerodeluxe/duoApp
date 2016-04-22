import Foundation

struct Table {
    
    let key: String!
    let name: String!
    let price: String!
    let quantity: String!
    let ref: Firebase?
    
    // Init properties van tafel
    init(name: String, price: String, quantity: String, key: String = "") {
        self.key = key
        self.name = name
        self.price = price
        self.quantity = quantity
        self.ref = nil
    }
    
    // prepareer voor Firebase
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        name = snapshot.value["name"] as! String
        price = snapshot.value["price"] as! String
        quantity = snapshot.value["quantity"] as! String
        ref = snapshot.ref

    }
    
    func toAnyObject() -> AnyObject {
        return [
            "name": name,
            "price": price,
            "quantity": quantity
                   ]
    }
    
}
