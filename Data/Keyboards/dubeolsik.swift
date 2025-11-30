//
//  dubeolsik.swift
//  IMKitSample
//
//  Created by 강우현 on 11/25/25.
//

import Foundation

let dubeolsik = Keyboard(
    id: "dubeolsik",
    name: "두벌식",
    description: "기본 두벌식 자판입니다.",
    
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
        
        Key(keyCode: .q, shift: false, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .b)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .b, isTwoSet: true))
        ],
        Key(keyCode: .q, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.initial, .b_b))
        ],
        Key(keyCode: .w, shift: false, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .j)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .j, isTwoSet: true))
        ],
        Key(keyCode: .w, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.initial, .j_j))
        ],
        Key(keyCode: .e, shift: false, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .d)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .d, isTwoSet: true))
        ],
        Key(keyCode: .e, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.initial, .d_d))
        ],
        Key(keyCode: .r, shift: false, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .g)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .g, isTwoSet: true))
        ],
        Key(keyCode: .r, shift: true, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .g_g)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .g_g, isTwoSet: true))
        ],
        Key(keyCode: .t, shift: false, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .s)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .s, isTwoSet: true))
        ],
        Key(keyCode: .t, shift: true, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .s_s)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .s_s, isTwoSet: true))
        ],
        
        Key(keyCode: .y, shift: false, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .yo))
        ],
        Key(keyCode: .y, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .yo))
        ],
        Key(keyCode: .u, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .yeo))
        ],
        Key(keyCode: .i, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .ya))
        ],
        Key(keyCode: .o, shift: false, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .ae))
        ],
        Key(keyCode: .o, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .yae))
        ],
        Key(keyCode: .p, shift: false, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .e))
        ],
        Key(keyCode: .p, shift: true, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .ye))
        ],
        
        Key(keyCode: .a, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .m)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .m, isTwoSet: true))
        ],
        Key(keyCode: .s, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .n)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .n, isTwoSet: true))
        ],
        Key(keyCode: .d, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .ie)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .ie, isTwoSet: true))
        ],
        Key(keyCode: .f, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .r)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .r, isTwoSet: true))
        ],
        Key(keyCode: .g, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .h)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .h, isTwoSet: true))
        ],
        
        Key(keyCode: .h, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .o))
        ],
        Key(keyCode: .j, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .eo))
        ],
        Key(keyCode: .k, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .a))
        ],
        Key(keyCode: .l, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .i))
        ],
        
        Key(keyCode: .z, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .k, isTwoSet: true)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .k, isTwoSet: true))
        ],
        Key(keyCode: .x, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .t, isTwoSet: true)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .t, isTwoSet: true))
        ],
        Key(keyCode: .c, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .ch, isTwoSet: true)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .ch, isTwoSet: true))
        ],
        Key(keyCode: .v, option: false): [
            Condition(allowedAutomataStates: [0, 1]): KeyAction.insertHangul(Hangul(.initial, .p, isTwoSet: true)),
            Condition(allowedAutomataStates: [2, 3]): KeyAction.insertHangul(Hangul(.final, .p, isTwoSet: true))
        ],
        
        Key(keyCode: .b, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .yu))
        ],
        Key(keyCode: .n, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .u))
        ],
        Key(keyCode: .m, option: false): [
            Condition(): KeyAction.insertHangul(Hangul(.medial, .eu))
        ],
    ],
    
    compositionRules: [
        [Hangul(.medial, .o), Hangul(.medial, .a)]: Hangul(.medial, .o_a),
        [Hangul(.medial, .o), Hangul(.medial, .ae)]: Hangul(.medial, .o_ae),
        [Hangul(.medial, .o), Hangul(.medial, .i)]: Hangul(.medial, .o_i),
        [Hangul(.medial, .u), Hangul(.medial, .eo)]: Hangul(.medial, .u_eo),
        [Hangul(.medial, .u), Hangul(.medial, .e)]: Hangul(.medial, .u_ae),
        [Hangul(.medial, .u), Hangul(.medial, .i)]: Hangul(.medial, .u_i),
        [Hangul(.medial, .eu), Hangul(.medial, .i)]: Hangul(.medial, .eu_i),
        
        // 결합된 겹받침은 초성으로 올 수 없으므로 isTwoSet에 true를 지정하지 않음
        [Hangul(.final, .g, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .g_s),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .j, isTwoSet: true)]: Hangul(.final, .n_j),
        [Hangul(.final, .n, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .n_h),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .g, isTwoSet: true)]: Hangul(.final, .r_g),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .m, isTwoSet: true)]: Hangul(.final, .r_m),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .b, isTwoSet: true)]: Hangul(.final, .r_b),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .r_s),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .t, isTwoSet: true)]: Hangul(.final, .r_t),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .p, isTwoSet: true)]: Hangul(.final, .r_p),
        [Hangul(.final, .r, isTwoSet: true), Hangul(.final, .h, isTwoSet: true)]: Hangul(.final, .r_h),
        [Hangul(.final, .b, isTwoSet: true), Hangul(.final, .s, isTwoSet: true)]: Hangul(.final, .b_s)
    ],
    
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
    
    hangulRange: .modernFull
)
