//
//  dubeolsik.swift
//  IMKitSample
//
//  Created by 강우현 on 11/25/25.
//

import Foundation
let dubeolsikOld = Keyboard(
    id: "dubeolsikOld",
    name: "두벌식 옛한글",
    description: "기본 두벌식 옛한글 자판입니다.",
    
    layout: [
        Key(keyCode: .grave, shift: false, option: false): [
            Condition(): KeyAction.insert("₩")
        ],
        Key(keyCode: .grave, shift: true, option: false): [
            Condition(): KeyAction.insert("~")
        ],
        Key(keyCode: .grave, shift: false, option: true): [
            Condition(): KeyAction.insert("`")
        ],
        Key(keyCode: .grave, shift: true, option: true): [
            Condition(): KeyAction.insert("~")
        ],
        
//        Key(keyCode: .q, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .b, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .b, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .q, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .b_b, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .b_b, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .q, shift: false, option: true): [
//            Condition(): [KeyAction.insert("q")]
//        ],
//        Key(keyCode: .q, shift: true, option: true): [
//            Condition(): [KeyAction.insert("Q")]
//        ],
//        Key(keyCode: .w, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .j, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .j, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .w, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .j_j, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .j_j, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .w, shift: false, option: true): [
//            Condition(): [KeyAction.insert("w")]
//        ],
//        Key(keyCode: .w, shift: true, option: true): [
//            Condition(): [KeyAction.insert("W")]
//        ],
//        Key(keyCode: .e, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .d, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .d, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .e, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .d_d, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .d_d, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .e, shift: false, option: true): [
//            Condition(): [KeyAction.insert("e")]
//        ],
//        Key(keyCode: .e, shift: true, option: true): [
//            Condition(): [KeyAction.insert("E")]
//        ],
//        Key(keyCode: .r, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .g, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .g, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .r, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .g_g, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .g_g, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .r, shift: false, option: true): [
//            Condition(): [KeyAction.insert("r")]
//        ],
//        Key(keyCode: .r, shift: true, option: true): [
//            Condition(): [KeyAction.insert("R")]
//        ],
//        Key(keyCode: .t, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .s, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .s, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .t, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .s_s, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .s_s, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .t, shift: false, option: true): [
//            Condition(): [KeyAction.insert("t")]
//        ],
//        Key(keyCode: .t, shift: true, option: true): [
//            Condition(): [KeyAction.insert("T")]
//        ],
//        
//        Key(keyCode: .y, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .yo))
//            ]
//        ],
//        Key(keyCode: .y, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.toneMark, .two))
//            ]
//        ],
//        Key(keyCode: .y, shift: false, option: true): [
//            Condition(): [KeyAction.insert("y")]
//        ],
//        Key(keyCode: .y, shift: true, option: true): [
//            Condition(): [KeyAction.insert("Y")]
//        ],
//        Key(keyCode: .u, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .yeo))
//            ]
//        ],
//        Key(keyCode: .u, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.toneMark, .one))
//            ]
//        ],
//        Key(keyCode: .u, shift: false, option: true): [
//            Condition(): [KeyAction.insert("u")]
//        ],
//        Key(keyCode: .u, shift: true, option: true): [
//            Condition(): [KeyAction.insert("U")]
//        ],
//        Key(keyCode: .i, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .ya))
//            ]
//        ],
//        Key(keyCode: .i, shift: false, option: true): [
//            Condition(): [KeyAction.insert("i")]
//        ],
//        Key(keyCode: .i, shift: true, option: true): [
//            Condition(): [KeyAction.insert("I")]
//        ],
//        Key(keyCode: .o, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .ae))
//            ]
//        ],
//        Key(keyCode: .o, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .yae))
//            ]
//        ],
//        Key(keyCode: .o, shift: false, option: true): [
//            Condition(): [KeyAction.insert("o")]
//        ],
//        Key(keyCode: .o, shift: true, option: true): [
//            Condition(): [KeyAction.insert("O")]
//        ],
//        Key(keyCode: .p, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .e))
//            ]
//        ],
//        Key(keyCode: .p, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .ye))
//            ]
//        ],
//        Key(keyCode: .p, shift: false, option: true): [
//            Condition(): [KeyAction.insert("p")]
//        ],
//        Key(keyCode: .p, shift: true, option: true): [
//            Condition(): [KeyAction.insert("P")]
//        ],
//        
//        Key(keyCode: .a, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .m, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .m, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .a, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .z, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .z, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .a, shift: false, option: true): [
//            Condition(): [KeyAction.insert("a")]
//        ],
//        Key(keyCode: .a, shift: true, option: true): [
//            Condition(): [KeyAction.insert("A")]
//        ],
//        Key(keyCode: .s, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .n, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .n, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .s, shift: false, option: true): [
//            Condition(): [KeyAction.insert("s")]
//        ],
//        Key(keyCode: .s, shift: true, option: true): [
//            Condition(): [KeyAction.insert("S")]
//        ],
//        Key(keyCode: .d, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .ie, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .ie, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .d, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .ng, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .ng, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .d, shift: false, option: true): [
//            Condition(): [KeyAction.insert("d")]
//        ],
//        Key(keyCode: .d, shift: true, option: true): [
//            Condition(): [KeyAction.insert("D")]
//        ],
//        Key(keyCode: .f, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .r, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .r, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .f, shift: false, option: true): [
//            Condition(): [KeyAction.insert("f")]
//        ],
//        Key(keyCode: .f, shift: true, option: true): [
//            Condition(): [KeyAction.insert("F")]
//        ],
//        Key(keyCode: .g, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .h, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .h, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .g, shift: true, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .x, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .x, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .g, shift: false, option: true): [
//            Condition(): [KeyAction.insert("g")]
//        ],
//        Key(keyCode: .g, shift: true, option: true): [
//            Condition(): [KeyAction.insert("G")]
//        ],
//        
//        Key(keyCode: .h, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .o))
//            ]
//        ],
//        Key(keyCode: .h, shift: false, option: true): [
//            Condition(): [KeyAction.insert("h")]
//        ],
//        Key(keyCode: .h, shift: true, option: true): [
//            Condition(): [KeyAction.insert("H")]
//        ],
//        Key(keyCode: .j, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .eo))
//            ]
//        ],
//        Key(keyCode: .j, shift: true, option: false): [
//            Condition(): [
//                KeyAction.noop(stopComposition: true)
//            ]
//        ],
//        Key(keyCode: .j, shift: false, option: true): [
//            Condition(): [KeyAction.insert("j")]
//        ],
//        Key(keyCode: .j, shift: true, option: true): [
//            Condition(): [KeyAction.insert("J")]
//        ],
//        Key(keyCode: .k, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .a))
//            ]
//        ],
//        Key(keyCode: .k, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .aa))
//            ]
//        ],
//        Key(keyCode: .k, shift: false, option: true): [
//            Condition(): [KeyAction.insert("k")]
//        ],
//        Key(keyCode: .k, shift: true, option: true): [
//            Condition(): [KeyAction.insert("K")]
//        ],
//        Key(keyCode: .l, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .i))
//            ]
//        ],
//        Key(keyCode: .l, shift: false, option: true): [
//            Condition(): [KeyAction.insert("l")]
//        ],
//        Key(keyCode: .l, shift: true, option: true): [
//            Condition(): [KeyAction.insert("L")]
//        ],
//        
//        Key(keyCode: .z, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .k, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .k, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .z, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.initial, .chs, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .z, shift: false, option: true): [
//            Condition(): [KeyAction.insert("z")]
//        ],
//        Key(keyCode: .z, shift: true, option: true): [
//            Condition(): [KeyAction.insert("Z")]
//        ],
//        Key(keyCode: .x, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .t, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .t, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .x, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.initial, .js, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .x, shift: false, option: true): [
//            Condition(): [KeyAction.insert("x")]
//        ],
//        Key(keyCode: .x, shift: true, option: true): [
//            Condition(): [KeyAction.insert("X")]
//        ],
//        Key(keyCode: .c, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .ch, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .ch, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .c, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.initial, .chj, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .c, shift: false, option: true): [
//            Condition(): [KeyAction.insert("c")]
//        ],
//        Key(keyCode: .c, shift: true, option: true): [
//            Condition(): [KeyAction.insert("C")]
//        ],
//        Key(keyCode: .v, shift: false, option: false): [
//            Condition(allowedAutomataStates: [0, 1]): [
//                KeyAction.insertHangul(Hangul(.initial, .p, isTwoSet: true))
//            ],
//            Condition(allowedAutomataStates: [2, 3]): [
//                KeyAction.insertHangul(Hangul(.final, .p, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .v, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.initial, .jj, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .v, shift: false, option: true): [
//            Condition(): [KeyAction.insert("v")]
//        ],
//        Key(keyCode: .v, shift: true, option: true): [
//            Condition(): [KeyAction.insert("V")]
//        ],
//        
//        Key(keyCode: .b, shift: false, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .yu))
//            ]
//        ],
//        Key(keyCode: .b, shift: true, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.initial, .chch, isTwoSet: true))
//            ]
//        ],
//        Key(keyCode: .b, shift: false, option: true): [
//            Condition(): [KeyAction.insert("b")]
//        ],
//        Key(keyCode: .b, shift: true, option: true): [
//            Condition(): [KeyAction.insert("B")]
//        ],
        Key(keyCode: .n, shift: false, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .u))
        ],
        Key(keyCode: .n, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.initial, .jch, isTwoSet: true))
        ],
        Key(keyCode: .n, shift: false, option: true): [
            Condition(): KeyAction.insert("n")
        ],
        Key(keyCode: .n, shift: true, option: true): [
            Condition(): KeyAction.insert("N")
        ],
//        Key(keyCode: .m, option: false): [
//            Condition(): [
//                KeyAction.insertHangul(Hangul(.medial, .eu))
//            ]
//        ],
        Key(keyCode: .m, shift: false, option: true): [
            Condition(): KeyAction.insert("m")
        ],
        Key(keyCode: .m, shift: true, option: true): [
            Condition(): KeyAction.insert("M")
        ],
    ],
    
    compositionRules: [
        [Hangul(.initial, .g, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .g_d),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .n_g),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .n, isTwoSet: true)]: Hangul(.initial, .n_n),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .n_d),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .n_b),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .n_s),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .n_j),
        [Hangul(.initial, .n, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .n_h),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .d_g),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .r, isTwoSet: true)]: Hangul(.initial, .d_r),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .m, isTwoSet: true)]: Hangul(.initial, .d_m),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .d_b),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .d_s),
        [Hangul(.initial, .d, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .d_j),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .r_g),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .g_g, isTwoSet: true)]: Hangul(.initial, .r_g_g),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .n, isTwoSet: true)]: Hangul(.initial, .r_n),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .r_d),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .d_d, isTwoSet: true)]: Hangul(.initial, .r_d_d),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .r, isTwoSet: true)]: Hangul(.initial, .r_r),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .m, isTwoSet: true)]: Hangul(.initial, .r_m),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .r_b),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .b_b, isTwoSet: true)]: Hangul(.initial, .r_b_b),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .r_s),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .r_j),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .k, isTwoSet: true)]: Hangul(.initial, .r_k),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .r_h),
        [Hangul(.initial, .r, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .gr),
        [Hangul(.initial, .r_b), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .r_gb),
        [Hangul(.initial, .m, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .m_g),
        [Hangul(.initial, .m, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .m_d),
        [Hangul(.initial, .m, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .m_b),
        [Hangul(.initial, .m, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .m_s),
        [Hangul(.initial, .m, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .gm),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .b_g),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .n, isTwoSet: true)]: Hangul(.initial, .b_n),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .b_d),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .b_s),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .s_s, isTwoSet: true)]: Hangul(.initial, .b_s_s),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .b_j),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .ch, isTwoSet: true)]: Hangul(.initial, .b_ch),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .k, isTwoSet: true)]: Hangul(.initial, .b_k),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .t, isTwoSet: true)]: Hangul(.initial, .b_t),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .p, isTwoSet: true)]: Hangul(.initial, .b_p),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .b_h),
        [Hangul(.initial, .b, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .gb),
        [Hangul(.initial, .b_b), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .gbb),
        [Hangul(.initial, .b_s), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .b_s_g),
        [Hangul(.initial, .b_s), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .b_s_d),
        [Hangul(.initial, .b_s), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .b_s_b),
        [Hangul(.initial, .b_s), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .b_s_j),
        [Hangul(.initial, .b_s), Hangul(.initial, .t, isTwoSet: true)]: Hangul(.initial, .b_s_t),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .s_g),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .n, isTwoSet: true)]: Hangul(.initial, .s_n),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .s_d),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .r, isTwoSet: true)]: Hangul(.initial, .s_r),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .m, isTwoSet: true)]: Hangul(.initial, .s_m),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .s_b),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .s_s, isTwoSet: true)]: Hangul(.initial, .s_s_s),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .s_ie),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .s_j),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .ch, isTwoSet: true)]: Hangul(.initial, .s_ch),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .k, isTwoSet: true)]: Hangul(.initial, .s_k),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .t, isTwoSet: true)]: Hangul(.initial, .s_t),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .p, isTwoSet: true)]: Hangul(.initial, .s_p),
        [Hangul(.initial, .s, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .s_h),
        [Hangul(.initial, .s_b), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .s_b_g),
        [Hangul(.initial, .s_s, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .s_s_b),
        [Hangul(.initial, .s_s, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .s_s_s),
        [Hangul(.initial, .chs, isTwoSet: true), Hangul(.initial, .chs, isTwoSet: true)]: Hangul(.initial, .chss),
        [Hangul(.initial, .js, isTwoSet: true), Hangul(.initial, .js, isTwoSet: true)]: Hangul(.initial, .jss),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .g, isTwoSet: true)]: Hangul(.initial, .ie_g),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .d, isTwoSet: true)]: Hangul(.initial, .ie_d),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .r, isTwoSet: true)]: Hangul(.initial, .ie_r),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .m, isTwoSet: true)]: Hangul(.initial, .ie_m),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .ie_b),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .ie_s),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .z, isTwoSet: true)]: Hangul(.initial, .ie_z),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .ie_ie),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .j, isTwoSet: true)]: Hangul(.initial, .ie_j),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .ch, isTwoSet: true)]: Hangul(.initial, .ie_ch),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .t, isTwoSet: true)]: Hangul(.initial, .ie_t),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .p, isTwoSet: true)]: Hangul(.initial, .ie_p),
        [Hangul(.initial, .ie, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .ie_h),
        [Hangul(.initial, .j, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .j_ie),
        [Hangul(.initial, .j_j, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .j_j_h),
        [Hangul(.initial, .chj, isTwoSet: true), Hangul(.initial, .chj, isTwoSet: true)]: Hangul(.initial, .chjj),
        [Hangul(.initial, .jj, isTwoSet: true), Hangul(.initial, .jj, isTwoSet: true)]: Hangul(.initial, .jjj),
        [Hangul(.initial, .ch, isTwoSet: true), Hangul(.initial, .k, isTwoSet: true)]: Hangul(.initial, .ch_k),
        [Hangul(.initial, .ch, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .ch_h),
        [Hangul(.initial, .t, isTwoSet: true), Hangul(.initial, .t, isTwoSet: true)]: Hangul(.initial, .t_t),
        [Hangul(.initial, .p, isTwoSet: true), Hangul(.initial, .b, isTwoSet: true)]: Hangul(.initial, .p_b),
        [Hangul(.initial, .p, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .p_h),
        [Hangul(.initial, .p, isTwoSet: true), Hangul(.initial, .ie, isTwoSet: true)]: Hangul(.initial, .gp),
        [Hangul(.initial, .h, isTwoSet: true), Hangul(.initial, .s, isTwoSet: true)]: Hangul(.initial, .h_s),
        [Hangul(.initial, .h, isTwoSet: true), Hangul(.initial, .h, isTwoSet: true)]: Hangul(.initial, .h_h),
        [Hangul(.initial, .x, isTwoSet: true), Hangul(.initial, .x, isTwoSet: true)]: Hangul(.initial, .x_x),
        
        [Hangul(.medial, .a), Hangul(.medial, .o)]: Hangul(.medial, .a_o),
        [Hangul(.medial, .a), Hangul(.medial, .u)]: Hangul(.medial, .a_u),
        [Hangul(.medial, .a), Hangul(.medial, .eu)]: Hangul(.medial, .a_eu),
        [Hangul(.medial, .ya), Hangul(.medial, .o)]: Hangul(.medial, .ya_o),
        [Hangul(.medial, .ya), Hangul(.medial, .yo)]: Hangul(.medial, .ya_yo),
        [Hangul(.medial, .ya), Hangul(.medial, .u)]: Hangul(.medial, .ya_u),
        [Hangul(.medial, .eo), Hangul(.medial, .o)]: Hangul(.medial, .eo_o),
        [Hangul(.medial, .eo), Hangul(.medial, .u)]: Hangul(.medial, .eo_u),
        [Hangul(.medial, .eo), Hangul(.medial, .eu)]: Hangul(.medial, .eo_eu),
        [Hangul(.medial, .yeo), Hangul(.medial, .ya)]: Hangul(.medial, .yeo_ya),
        [Hangul(.medial, .yeo), Hangul(.medial, .o)]: Hangul(.medial, .yeo_o),
        [Hangul(.medial, .yeo), Hangul(.medial, .u)]: Hangul(.medial, .yeo_u),
        [Hangul(.medial, .o), Hangul(.medial, .a)]: Hangul(.medial, .o_a),
        [Hangul(.medial, .o), Hangul(.medial, .ae)]: Hangul(.medial, .o_ae),
        [Hangul(.medial, .o), Hangul(.medial, .ya)]: Hangul(.medial, .o_ya),
        [Hangul(.medial, .o), Hangul(.medial, .yae)]: Hangul(.medial, .o_yae),
        [Hangul(.medial, .o), Hangul(.medial, .eo)]: Hangul(.medial, .o_eo),
        [Hangul(.medial, .o), Hangul(.medial, .e)]: Hangul(.medial, .o_e),
        [Hangul(.medial, .o), Hangul(.medial, .yeo)]: Hangul(.medial, .o_yeo),
        [Hangul(.medial, .o), Hangul(.medial, .ye)]: Hangul(.medial, .o_ye),
        [Hangul(.medial, .o), Hangul(.medial, .o)]: Hangul(.medial, .o_o),
        [Hangul(.medial, .o), Hangul(.medial, .u)]: Hangul(.medial, .o_u),
        [Hangul(.medial, .o), Hangul(.medial, .i)]: Hangul(.medial, .o_i),
        [Hangul(.medial, .o_o), Hangul(.medial, .i)]: Hangul(.medial, .o_o_i),
        [Hangul(.medial, .yo), Hangul(.medial, .a)]: Hangul(.medial, .yo_a),
        [Hangul(.medial, .yo), Hangul(.medial, .ae)]: Hangul(.medial, .yo_ae),
        [Hangul(.medial, .yo), Hangul(.medial, .ya)]: Hangul(.medial, .yo_ya),
        [Hangul(.medial, .yo), Hangul(.medial, .yae)]: Hangul(.medial, .yo_yae),
        [Hangul(.medial, .yo), Hangul(.medial, .eo)]: Hangul(.medial, .yo_eo),
        [Hangul(.medial, .yo), Hangul(.medial, .yeo)]: Hangul(.medial, .yo_yeo),
        [Hangul(.medial, .yo), Hangul(.medial, .o)]: Hangul(.medial, .yo_o),
        [Hangul(.medial, .yo), Hangul(.medial, .i)]: Hangul(.medial, .yo_i),
        [Hangul(.medial, .u), Hangul(.medial, .a)]: Hangul(.medial, .u_a),
        [Hangul(.medial, .u), Hangul(.medial, .ae)]: Hangul(.medial, .u_ae),
        [Hangul(.medial, .u), Hangul(.medial, .eo)]: Hangul(.medial, .u_eo),
        [Hangul(.medial, .u), Hangul(.medial, .e)]: Hangul(.medial, .u_e),
        [Hangul(.medial, .u), Hangul(.medial, .yeo)]: Hangul(.medial, .u_yeo),
        [Hangul(.medial, .u), Hangul(.medial, .ye)]: Hangul(.medial, .u_ye),
        [Hangul(.medial, .u), Hangul(.medial, .u)]: Hangul(.medial, .u_u),
        [Hangul(.medial, .u), Hangul(.medial, .i)]: Hangul(.medial, .u_i),
        [Hangul(.medial, .u_eo), Hangul(.medial, .eu)]: Hangul(.medial, .u_eo_eu),
        [Hangul(.medial, .u_i), Hangul(.medial, .i)]: Hangul(.medial, .u_i_i),
        [Hangul(.medial, .yu), Hangul(.medial, .a)]: Hangul(.medial, .yu_a),
        [Hangul(.medial, .yu), Hangul(.medial, .ae)]: Hangul(.medial, .yu_ae),
        [Hangul(.medial, .yu), Hangul(.medial, .eo)]: Hangul(.medial, .yu_eo),
        [Hangul(.medial, .yu), Hangul(.medial, .e)]: Hangul(.medial, .yu_e),
        [Hangul(.medial, .yu), Hangul(.medial, .yeo)]: Hangul(.medial, .yu_yeo),
        [Hangul(.medial, .yu), Hangul(.medial, .ye)]: Hangul(.medial, .yu_ye),
        [Hangul(.medial, .yu), Hangul(.medial, .o)]: Hangul(.medial, .yu_o),
        [Hangul(.medial, .yu), Hangul(.medial, .u)]: Hangul(.medial, .yu_u),
        [Hangul(.medial, .yu), Hangul(.medial, .i)]: Hangul(.medial, .yu_i),
        [Hangul(.medial, .eu), Hangul(.medial, .a)]: Hangul(.medial, .eu_a),
        [Hangul(.medial, .eu), Hangul(.medial, .eo)]: Hangul(.medial, .eu_eo),
        [Hangul(.medial, .eu), Hangul(.medial, .e)]: Hangul(.medial, .eu_e),
        [Hangul(.medial, .eu), Hangul(.medial, .o)]: Hangul(.medial, .eu_o),
        [Hangul(.medial, .eu), Hangul(.medial, .u)]: Hangul(.medial, .eu_u),
        [Hangul(.medial, .eu), Hangul(.medial, .eu)]: Hangul(.medial, .eu_eu),
        [Hangul(.medial, .eu), Hangul(.medial, .i)]: Hangul(.medial, .eu_i),
        [Hangul(.medial, .eu_i), Hangul(.medial, .u)]: Hangul(.medial, .eu_i_u),
        [Hangul(.medial, .i), Hangul(.medial, .a)]: Hangul(.medial, .i_a),
        [Hangul(.medial, .i), Hangul(.medial, .ya)]: Hangul(.medial, .i_ya),
        [Hangul(.medial, .i), Hangul(.medial, .yae)]: Hangul(.medial, .i_yae),
        [Hangul(.medial, .i), Hangul(.medial, .yeo)]: Hangul(.medial, .i_yeo),
        [Hangul(.medial, .i), Hangul(.medial, .ye)]: Hangul(.medial, .i_ye),
        [Hangul(.medial, .i), Hangul(.medial, .o)]: Hangul(.medial, .i_o),
        [Hangul(.medial, .i), Hangul(.medial, .yo)]: Hangul(.medial, .i_yo),
        [Hangul(.medial, .i), Hangul(.medial, .u)]: Hangul(.medial, .i_u),
        [Hangul(.medial, .i), Hangul(.medial, .yu)]: Hangul(.medial, .i_yu),
        [Hangul(.medial, .i), Hangul(.medial, .eu)]: Hangul(.medial, .i_eu),
        [Hangul(.medial, .i), Hangul(.medial, .i)]: Hangul(.medial, .i_i),
        [Hangul(.medial, .i), Hangul(.medial, .aa)]: Hangul(.medial, .i_aa),
        [Hangul(.medial, .i_ya), Hangul(.medial, .o)]: Hangul(.medial, .i_ya_o),
        [Hangul(.medial, .i_o), Hangul(.medial, .i)]: Hangul(.medial, .i_o_i),
        [Hangul(.medial, .aa), Hangul(.medial, .a)]: Hangul(.medial, .aa_a),
        [Hangul(.medial, .aa), Hangul(.medial, .eo)]: Hangul(.medial, .aa_eo),
        [Hangul(.medial, .aa), Hangul(.medial, .e)]: Hangul(.medial, .aa_e),
        [Hangul(.medial, .aa), Hangul(.medial, .u)]: Hangul(.medial, .aa_u),
        [Hangul(.medial, .aa), Hangul(.medial, .i)]: Hangul(.medial, .aa_i),
        [Hangul(.medial, .aa), Hangul(.medial, .aa)]: Hangul(.medial, .aa_aa),
        
        // 결합된 겹받침은 초성으로 올 수 없으므로 isTwoSet에 true를 지정하지 않음
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .g_n),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .g_r),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .g_b),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .g_s),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .g_ch),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .k, isTwoSet: true)]: Hangul(.final, .g_k),
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .g_h),
        [Hangul(.final, .g_s), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .g_s_g),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .n_g),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .n_n),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .n_d),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .n_r),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .n_s),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .z, isTwoSet: true)]: Hangul(.final, .n_z),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .n_j),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .n_ch),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .n_t),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .n_h),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .d_g),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .d_r),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .d_b),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .d_s),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .d_j),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .d_ch),
        [Hangul(.final, .d, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .d_t),
        [Hangul(.final, .d_d, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .d_d_b),
        [Hangul(.final, .d_s), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .d_s_g),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .r_g),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .g_g, isTwoSet: true)]: Hangul(.final, .r_g_g),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .r_n),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .r_d),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .r_r),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .r_m),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .r_b),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .r_s),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .s_s, isTwoSet: true)]: Hangul(.final, .r_s_s),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .z, isTwoSet: true)]: Hangul(.final, .r_z),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .ng, isTwoSet: true)]: Hangul(.final, .r_ng),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .k, isTwoSet: true)]: Hangul(.final, .r_k),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .r_t),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .p, isTwoSet: true)]: Hangul(.final, .r_p),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_h),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .x, isTwoSet: true)]: Hangul(.final, .r_x),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .gr),
        [Hangul(.final, .r_g), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .r_g_s),
        [Hangul(.final, .r_g), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_g_h),
        [Hangul(.final, .r_d), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_d_h),
        [Hangul(.final, .r_r), Hangul(.final, .k, isTwoSet: true)]: Hangul(.final, .r_r_k),
        [Hangul(.final, .r_m), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .r_m_g),
        [Hangul(.final, .r_m), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .r_m_s),
        [Hangul(.final, .r_m), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_m_h),
        [Hangul(.final, .r_b), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .r_b_d),
        [Hangul(.final, .r_b), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .r_b_s),
        [Hangul(.final, .r_b), Hangul(.final, .p, isTwoSet: true)]: Hangul(.final, .r_b_p),
        [Hangul(.final, .r_b), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_b_h),
        [Hangul(.final, .r_b), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .r_gb),
        [Hangul(.final, .r_x), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_x_h),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .m_g),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .m_n),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .m_r),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .m_m),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .m_b),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .m_s),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .s_s, isTwoSet: true)]: Hangul(.final, .m_s_s),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .z, isTwoSet: true)]: Hangul(.final, .m_z),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .m_j),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .m_ch),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .m_h),
        [Hangul(.final, .m, isTwoSet: true), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .gm),
        [Hangul(.final, .m_n), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .m_n_n),
        [Hangul(.final, .m_b), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .m_b_s),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .b_d),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .b_r),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .b_m),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .b_s),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .b_j),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .b_ch),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .p, isTwoSet: true)]: Hangul(.final, .b_p),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .b_h),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .gb),
        [Hangul(.final, .b_r), Hangul(.final, .p, isTwoSet: true)]: Hangul(.final, .b_r_p),
        [Hangul(.final, .b_s), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .b_s_d),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .s_g),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .s_d),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .s_r),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .s_m),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .s_b),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .z, isTwoSet: true)]: Hangul(.final, .s_z),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .s_j),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .ch, isTwoSet: true)]: Hangul(.final, .s_ch),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .s_t),
        [Hangul(.final, .s, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .s_h),
        [Hangul(.final, .s_b), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .s_gb),
        [Hangul(.final, .s_s, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .s_s_g),
        [Hangul(.final, .s_s, isTwoSet: true), Hangul(.final, .d, isTwoSet: true)]: Hangul(.final, .s_s_d),
        [Hangul(.final, .z, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .z_b),
        [Hangul(.final, .z_b), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .z_gb),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .ng_g),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .g_g, isTwoSet: true)]: Hangul(.final, .ng_g_g),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .ng_m),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .ng_s),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .z, isTwoSet: true)]: Hangul(.final, .ng_z),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .ng, isTwoSet: true)]: Hangul(.final, .ng_ng),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .k, isTwoSet: true)]: Hangul(.final, .ng_k),
        [Hangul(.final, .ng, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .ng_h),
        [Hangul(.final, .j, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .j_b),
        [Hangul(.final, .j_b), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .j_b_b),
        [Hangul(.final, .p, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .p_b),
        [Hangul(.final, .p, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .p_s),
        [Hangul(.final, .p, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .p_t),
        [Hangul(.final, .p, isTwoSet: true), Hangul(.final, .ie, isTwoSet: true)]: Hangul(.final, .gp),
        [Hangul(.final, .h, isTwoSet: true), Hangul(.final, .n, isTwoSet: true)]: Hangul(.final, .h_n),
        [Hangul(.final, .h, isTwoSet: true), Hangul(.final, .r, isTwoSet: true)]: Hangul(.final, .h_r),
        [Hangul(.final, .h, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .h_m),
        [Hangul(.final, .h, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .h_b),
    ],
    
    // 방점 조합 후에는 무조건 조합 완료 상태로 이동
    automata: [
        // 조합 중이 아니거나 한글 조합 완료
        0: [
            Condition(lastHangulPosition: .initial): 1,
            Condition(lastHangulPosition: .medial): 2
        ],
        // 초성 조합 중임
        1: [
            Condition(lastHangulPosition: .initial): 1,
            Condition(lastHangulPosition: .medial): 2
        ],
        // 중성 조합 중임
        2: [
            Condition(lastHangulPosition: .medial): 2,
            Condition(lastHangulPosition: .final): 3
        ],
        // 종성 조합 중임
        3: [
            Condition(lastHangulPosition: .final): 3
        ]
    ],
    
    hangulRange: .oldFull
)
