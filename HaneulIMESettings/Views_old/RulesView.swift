//
//  RulesView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/27/25.
//

import SwiftUI

struct RulesView: View {
    private let data = [
        [Hangul(.medial, .o), Hangul(.medial, .a), Hangul(.medial, .o_a)],
        [Hangul(.medial, .o), Hangul(.medial, .ae), Hangul(.medial, .o_ae)],
        [Hangul(.medial, .o), Hangul(.medial, .i), Hangul(.medial, .o_i)],
        [Hangul(.medial, .u), Hangul(.medial, .eo), Hangul(.medial, .u_eo)],
        [Hangul(.medial, .u), Hangul(.medial, .e), Hangul(.medial, .u_e)],
        [Hangul(.medial, .u), Hangul(.medial, .i), Hangul(.medial, .u_i)],
        [Hangul(.medial, .eu), Hangul(.medial, .i), Hangul(.medial, .eu_i)],
        
        [Hangul(.final, .g), Hangul(.final, .s), Hangul(.final, .g_s)],
        [Hangul(.final, .n), Hangul(.final, .j), Hangul(.final, .n_j)],
        [Hangul(.final, .n), Hangul(.final, .h), Hangul(.final, .n_h)],
        [Hangul(.final, .r), Hangul(.final, .g), Hangul(.final, .r_g)],
        [Hangul(.final, .r), Hangul(.final, .m), Hangul(.final, .r_m)],
        [Hangul(.final, .r), Hangul(.final, .b), Hangul(.final, .r_b)],
        [Hangul(.final, .r), Hangul(.final, .s), Hangul(.final, .r_s)],
        [Hangul(.final, .r), Hangul(.final, .t), Hangul(.final, .r_t)],
        [Hangul(.final, .r), Hangul(.final, .p), Hangul(.final, .r_p)],
        [Hangul(.final, .r), Hangul(.final, .h), Hangul(.final, .r_h)],
        [Hangul(.final, .b), Hangul(.final, .s), Hangul(.final, .b_s)],
    ]
    @State private var itemIndex: [Hangul]? = nil
    
    @Binding var isPresented: Bool
    
    var body: some View {
        HSplitView {
//            ScrollView {
                List(data, id: \.self, selection: $itemIndex) { rule in
                    NavigationLink(value: rule) {
                        Text("\(rule[0].getCharacterString()) + \(rule[1].getCharacterString()) = \(rule[2].getCharacterString())")
                    }
                }
//                Divider()
//                HStack {
//                    Button(action: addItem) {
//                        Image(systemName: "plus")
//                    }
//                    .buttonStyle(BorderlessButtonStyle())
//                    
//                    Button(action: removeSelectedItem) {
//                        Image(systemName: "minus")
//                    }
//                    .buttonStyle(BorderlessButtonStyle())
//                    .disabled(itemIndex == nil)
//                    
//                    Spacer()
//                }
//                .padding(EdgeInsets(top: 0, leading: 6, bottom: 6, trailing: 0))
//            }
            .frame(maxHeight: .infinity)
            ScrollView {
                Form {
                    Section {
                        TextField("First letter", text: .constant(""))
                        TextField("Placeholder", text: .constant(""))
                    } header: {
                        Text("First letter")
                            .foregroundStyle(Color.secondary)
                    }
                    Section {
                        TextField("Second letter", text: .constant(""))
                        TextField("Placeholder", text: .constant(""))
                    } header: {
                        Text("Second letter")
                            .foregroundStyle(Color.secondary)
                    }
                    Section {
                        TextField("Composition result", text: .constant(""))
                    } header: {
                        Text("Composition result")
                            .foregroundStyle(Color.secondary)
                    }
                    HStack {
                        Spacer()
                        if let a = itemIndex {
                            Text(a[0].getCharacterString())
                        } else {
                            Text("?")
                        }
                        Text("+")
                        if let a = itemIndex {
                            Text(a[1].getCharacterString())
                        } else {
                            Text("?")
                        }
                        Text("=")
                        if let a = itemIndex {
                            Text(a[2].getCharacterString())
                        } else {
                            Text("?")
                        }
                        Spacer()
                    }
                    .padding()
                }
                .formStyle(.grouped)
                .frame(minWidth: 180, idealWidth: 240, maxHeight: .infinity)
            }
        }
//        .ignoresSafeArea()
        .navigationTitle("Edit rules")
    }
    
    func addItem() {
        
    }
    
    func removeSelectedItem() {
        
    }
}

#Preview {
    RulesView(isPresented: .constant(true))
}
