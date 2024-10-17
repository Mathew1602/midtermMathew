//
//  OrderView.swift
//  midtermMathew
//
//  Created by Mathew Boyd on 2024-10-17.
//

import SwiftUI

struct OrderView: View {
    var coffee : Coffee
    @Binding var customerName : String
    
    var body: some View {
        VStack
        {
            Text("Hello! \(customerName)")
                .font(.title)
            Text("Your order detials are below")
                .font(.title)
            Text(coffee.type)
                .font(.headline)
            Text("Quanitity \(coffee.numberOfCups)")
                .font(.headline)
            Text(coffee.size)
                .font(.headline)
            Text("Base price \(coffee.basePrice)")
                .font(.headline)
            Text("HST \(coffee.HSTCalculation)")
                .font(.headline)
            if(coffee.addTip == true)
            {
                Text("Tip $2.00")
                    .font(.headline)
            }
            Text("Total price \(coffee.totalPrice)")
                .font(.headline)
            
        }.navigationTitle("Summary")
    }
}

