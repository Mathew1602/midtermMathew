//
//  ContentView.swift
//  midtermMathew
//
//  Created by Mathew Boyd on 2024-10-17.
//

import SwiftUI
struct Coffee: Hashable {
    var id: UUID
    var size : String
    var type : String
    var addTip : Bool
    var numberOfCups : Int
    var basePrice : Float {
        if type == "Dark roast"
        {
            if(type == "medium ")
            {
                return 3.00 * Float(numberOfCups)
            }
            else if(type == "large ")
            {
                return 3.50 * Float(numberOfCups)
            }
            else{
                return 2.50 * Float(numberOfCups)
            }
        }
        else if type == "Original blend"
        {
            if(type == "medium ")
            {
                return 3.50 * Float(numberOfCups)
            }
            else if(type == "large ")
            {
                return 4.00 * Float(numberOfCups)
            }
            else{
                return 3.00 * Float(numberOfCups)
            }
        }
        else
        {
            if(type == "medium ")
            {
                return 4.00 * Float(numberOfCups)
            }
            else if(type == "large ")
            {
                return 4.50 * Float(numberOfCups)
            }
            else{
                return 3.50 * Float(numberOfCups)
            }
        }
    }
    var HSTCalculation : Float {
        return basePrice * 1.13
    }
    var tipCalculation : Float {
        if addTip == true {
            return 2
        }
        else{
            return 0
        }
    }
    var totalPrice : Float {
        return tipCalculation + HSTCalculation + basePrice
    }
    
    init(id: UUID, size: String, type: String, addTip: Bool, numberOfCups: Int) {
        self.id = id
        self.size = size
        self.type = type
        self.addTip = addTip
        self.numberOfCups = numberOfCups
    }
    
    
}


struct ContentView: View {
    @State var id = UUID()
    @State var customerName = ""
    @State var coffeeType = ""
    @State var numberOfCups = ""
    @State var coffeeSize = ""
    @State var addTip = false
    @State var coffeeStruct : Coffee?
    var coffeeTypes = ["Dark roast", "Original blend", "Vanilla"]
    var coffeeSizes = ["Small", "Medium", "Large"]
    @State var showAlert: Bool = false
    @State private var action: Int? = 0
    
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Enter your Name", text: $customerName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Text("Select Coffee Type")
                    .bold()
                Picker("Coffee Size", selection: $coffeeType) {
                    ForEach(coffeeTypes, id: \.self) { size in
                        Text(size)
                    }
                }.pickerStyle(.segmented).padding()
                Text("Select Coffee Size")
                    .bold()
                Picker("Coffee Size", selection: $coffeeSize) {
                    ForEach(coffeeSizes, id: \.self) { size in
                        Text(size)
                    }
                }.pickerStyle(.segmented).padding()
                Text("Would you like to add a 2$ tip")
                    .bold()
                Toggle("Add Tip", isOn: $addTip)
                    .padding()
                    .bold()
                TextField("Enter ammount of cups", text: $numberOfCups)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
        
                
                NavigationLink(destination: OrderView(coffee: coffeeStruct ?? Coffee(id: UUID(), size: "a", type: "a", addTip: true, numberOfCups: 1), customerName: $customerName), tag: 1, selection: $action)
                {
                    EmptyView()
                }
                
                Text("Place Order").onTapGesture {
                    if(customerName == "" && numberOfCups == "" && coffeeSize == "" && coffeeType == "")
                    {
                        showAlert = true
                    }
                    else if(Int(numberOfCups) ?? 0 < 0)
                    {
                        showAlert = true
                    }
                    else{
                        coffeeStruct = Coffee(id: id, size: coffeeSize, type:coffeeType, addTip: addTip, numberOfCups: Int(numberOfCups) ?? 0)
                        
                        self.action = 1
                    }
                }.padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.navigationTitle("Order View")
                .alert("Please enter valid data", isPresented: $showAlert){
                }
        }
    }
}

#Preview {
    ContentView()
}
