//
//  DatePickerView.swift
//  Demo1
//
//  Created by Piyush Sinroja on 20/10/22.
//

import SwiftUI

struct DatePickerView: View {
    
    @State var selectedDate = Date()
    
    let startDate = Date()
    let endDate = Calendar.current.date(from: DateComponents(year: 2023, month: 12, day: 31)) ?? Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter
    }
    
    var body: some View {
        
        VStack {
            Text("Selected Date is:")
            Text(dateFormatter.string(from: selectedDate))
            
            DatePicker("Select a Date", selection: $selectedDate, in: startDate...endDate, displayedComponents: [.date, .hourAndMinute])
                .accentColor(.red)
                .datePickerStyle(.wheel)
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
