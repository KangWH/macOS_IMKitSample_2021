//
//  Hangul.swift
//  IMKitSample
//
//  Created by 강우현 on 11/24/25.
//
// 낱자들을 쉽게 입력하기 위한 상수, 조합들의 프리셋 등이 저장되어 있습니다.

import Foundation

class Hangul: Hashable, Equatable, Codable {
    var position: Position
    var name: Name
    var isTwoSet: Bool

    /**
     * `isTwoSet`: 두벌식 자판 종성에만 `true`로 지정하면 됨. 이는 두 가지 역할을 함.
     * 1. 종성 + 종성 상태에서 조합이 실패하면 두 번째 종성은 초성으로 바뀜.
     * 2. 종성 + 중성 상태에서 종성이 초성으로 바뀜.
     * 세벌식 자판에서는 이런 처리가 필요 없으므로 기본값인 `false`로 놔두면 됨.
     */
    init(_ position: Position, _ name: Name, isTwoSet: Bool = false) {
        self.position = position
        
        switch (position) {
        case .compatibility:
            self.name = Array(self.compatibility.keys).contains(name) ? name : .none
        case .initial:
            self.name = Array(self.initial.keys).contains(name) ? name : .none
        case .medial:
            self.name = Array(self.medial.keys).contains(name) ? name : .none
        case .final:
            self.name = Array(self.final.keys).contains(name) ? name : .none
        case .toneMark:
            self.name = Array(self.toneMark.keys).contains(name) ? name : .none
        }
        
        self.isTwoSet = isTwoSet
    }
    init(unicode: unichar, isTwoSet: Bool = false) {
        self.name = .none
        if (Array(self.initial.values).contains(unicode)) {
            self.position = .initial
            for (key, value) in self.initial {
                if value == unicode {
                    self.name = key
                }
            }
        } else if (Array(self.medial.values).contains(unicode)) {
            self.position = .medial
            for (key, value) in self.medial {
                if value == unicode {
                    self.name = key
                }
            }
        } else if (Array(self.final.values).contains(unicode)) {
            self.position = .final
            for (key, value) in self.final {
                if value == unicode {
                    self.name = key
                }
            }
        } else if (Array(self.toneMark.values).contains(unicode)) {
            self.position = .toneMark
            for (key, value) in self.toneMark {
                if value == unicode {
                    self.name = key
                }
            }
        } else {
            self.position = .compatibility
            for (key, value) in self.compatibility {
                if value == unicode {
                    self.name = key
                }
            }
        }
        self.isTwoSet = isTwoSet
    }
    
    enum CodingKeys: String, CodingKey {
        case position, name, isTwoSet
    }
    
    enum Position: Codable {
        case compatibility
        case initial
        case medial
        case final
        case toneMark
    }
    enum Name: Codable {
        case none
        
        // ㄱ g, ㄴ n, ㄷ d, ㄹ r, ㅁ m, ㅂ b, ㅅ s, ㅇ ie, ㅈ j, ㅊ ch, ㅋ k, ㅌ t, ㅍ p, ㅎ h
        // ㅿ z, ㆁ ng, ㆆ x, ᄛ gr, ㅱ gm, ㅸ gb, ㅹ gbb, ㆄ gp
        // ᄼ chs, ᄽ chss, ᄾ js, ᄿ jss, ᅎ chj, ᅏ chjj, ᅐ jj, ᅑ jjj, ᅔ chch, ᅕ jch
        case g, g_g, g_n, g_d, g_r, g_b, g_s, g_s_g, g_ch, g_k, g_h
        case n, n_g, n_n, n_d, n_r, n_b, n_s, n_z, n_j, n_ch, n_t, n_h
        case d, d_g, d_d, d_d_b, d_r, d_m, d_b, d_s, d_s_g, d_j, d_ch, d_t
        case r, r_g, r_g_g, r_g_s, r_g_h, r_n, r_d, r_d_d, r_d_h, r_r, r_r_k, r_m, r_m_g, r_m_s, r_m_h, r_b, r_b_d, r_b_b, r_b_s, r_b_p, r_b_h, r_gb, r_s, r_s_s, r_z, r_ng, r_j, r_k, r_t, r_p, r_h, r_x, r_x_h, gr
        case m, m_g, m_n, m_n_n, m_d, m_r, m_m, m_b, m_b_s, m_s, m_s_s, m_z, m_j, m_ch, m_h, gm
        case b, b_g, b_n, b_d, b_r, b_r_p, b_m, b_b, b_s, b_s_g, b_s_d, b_s_b, b_s_s, b_s_j, b_s_t, b_j, b_ch, b_k, b_t, b_p, b_h, gb, gbb
        case s, s_g, s_n, s_d, s_r, s_m, s_b, s_b_g, s_gb, s_s, s_s_g, s_s_d, s_s_b, s_s_s, s_z, s_ie, s_j, s_ch, s_k, s_t, s_p, s_h, chs, chss, js, jss
        case z, z_b, z_gb
        case ie, ie_g, ie_d, ie_r, ie_m, ie_b, ie_s, ie_z, ie_ie, ie_j, ie_ch, ie_t, ie_p, ie_h
        case ng, ng_g, ng_g_g, ng_m, ng_s, ng_z, ng_ng, ng_k, ng_h
        case j, j_b, j_b_b, j_ie, j_j, j_j_h, chj, chjj, jj, jjj
        case ch, ch_k, ch_h, chch, jch
        case k
        case t, t_t
        case p, p_b, p_s, p_t, p_h, gp
        case h, h_n, h_r, h_m, h_b, h_s, h_h
        case x, x_x
        
        // ㅏ a, ㅑ ya, ㅓ eo, ㅕ yeo, ㅗ o, ㅛ yo, ㅜ u, ㅠ yu, ㅡ eu, ㅣ i, ㆍ aa
        case a, a_o, a_u, a_eu, ae
        case ya, ya_o, ya_yo, ya_u, yae
        case eo, eo_o, eo_u, eo_eu, e
        case yeo, yeo_ya, yeo_o, yeo_u, ye
        case o, o_a, o_ae, o_ya, o_yae, o_eo, o_e, o_yeo, o_ye, o_o, o_o_i, o_u, o_i
        case yo, yo_a, yo_ae, yo_ya, yo_yae, yo_eo, yo_yeo, yo_o, yo_i
        case u, u_a, u_ae, u_eo, u_eo_eu, u_e, u_yeo, u_ye, u_u, u_i, u_i_i
        case yu, yu_a, yu_ae, yu_eo, yu_e, yu_yeo, yu_ye, yu_o, yu_u, yu_i
        case eu, eu_a, eu_eo, eu_e, eu_o, eu_u, eu_eu, eu_i, eu_i_u
        case i, i_a, i_ya, i_ya_o, i_yae, i_yeo, i_ye, i_o, i_o_i, i_yo, i_u, i_yu, i_eu, i_i, i_aa
        case aa, aa_a, aa_eo, aa_e, aa_u, aa_i, aa_aa
        
        case one, two
    }
    
    let toneMark: [Name: unichar] = [.one: 0x302E, .two: 0x302F]
    let compatibility: [Name: unichar] = [
        .none: 0x318F,
        .g: 0x3131, .g_g: 0x3132, .g_s: 0x3133,
        .n: 0x3134, .n_n: 0x3165, .n_d: 0x3166, .n_s: 0x3167, .n_z: 0x3168, .n_j: 0x3135, .n_h: 0x3136,
        .d: 0x3137, .d_d: 0x3138,
        .r: 0x3139, .r_g: 0x313A, .r_g_s: 0x3169, .r_d: 0x316A, .r_m: 0x313B, .r_b: 0x313C, .r_b_s: 0x316B, .r_s: 0x313D, .r_z: 0x316C, .r_t: 0x313E, .r_p: 0x313F, .r_h: 0x314D, .r_x: 0x316D,
        .m: 0x3141, .m_b: 0x316E, .m_s: 0x316F, .m_z: 0x3170, .gm: 0x3171,
        .b: 0x3142, .b_g: 0x3172, .b_d: 0x3173, .b_b: 0x3143, .b_s: 0x3144, .b_s_g: 0x3174, .b_s_d: 0x3175, .b_j: 0x3176, .b_t: 0x3177, .gb: 0x3178, .gbb: 0x3179,
        .s: 0x3145, .s_g: 0x317A, .s_n: 0x317B, .s_d: 0x317C, .s_b: 0x317D, .s_s: 0x3146, .s_j: 0x317E, .z: 0x317F,
        .ie: 0x3147, .ie_ie: 0x3180, .ng: 0x3181, .ng_s: 0x3182, .ng_z: 0x3183,
        .j: 0x3148, .j_j: 0x3149,
        .ch: 0x314A,
        .k: 0x314B,
        .t: 0x314C,
        .p: 0x314D, .gp: 0x3184,
        .h: 0x314E, .h_h: 0x3185, .x: 0x3186,
        .a: 0x314F, .ae: 0x3150,
        .ya: 0x3151, .yae: 0x3152,
        .eo: 0x3153, .e: 0x3154,
        .yeo: 0x3155, .ye: 0x3156,
        .o: 0x3157, .o_a: 0x3158, .o_ae: 0x3159, .o_i: 0x315A,
        .yo: 0x315B, .yo_ya: 0x3187, .yo_yae: 0x3188, .yo_i: 0x3189,
        .u: 0x315C, .u_eo: 0x315D, .u_e: 0x315E, .u_i: 0x315F,
        .yu: 0x3160, .yu_yeo: 0x318A, .yu_ye: 0x318B, .yu_i: 0x318C,
        .eu: 0x3161, .eu_i: 0x3162,
        .i: 0x3163,
        .aa: 0x318D, .aa_i: 0x318E
    ]
    let initial: [Name: unichar] = [
        .none: 0x115F,
        .g: 0x1100, .g_g: 0x1101, .g_d: 0x115A,
        .n: 0x1102, .n_g: 0x1113, .n_n: 0x1114, .n_d: 0x1115, .n_b: 0x1116, .n_s: 0x115B, .n_j: 0x115C, .n_h: 0x115D,
        .d: 0x1103, .d_g: 0x1117, .d_d: 0x1104, .d_r: 0x115E, .d_m: 0xA960, .d_b: 0xA961, .d_s: 0xA962, .d_j: 0xA963,
        .r: 0x1105, .r_g: 0xA964, .r_g_g: 0xA965, .r_n: 0x1118, .r_d: 0xA966, .r_d_d: 0xA967, .r_r: 0x1119, .r_m: 0xA968, .r_b: 0xA969, .r_b_b: 0xA96A, .r_gb: 0xA96B, .r_s: 0xA96C, .r_j: 0xA96D, .r_k: 0xA96E, .r_h: 0x111A, .gr: 0x111A,
        .m: 0x1106, .m_g: 0xA96F, .m_d: 0xA970, .m_b: 0x111C, .m_s: 0xA971, .gm: 0x111D,
        .b: 0x1107, .b_g: 0x111E, .b_n: 0x111F, .b_d: 0x1120, .b_b: 0x1108, .b_s: 0x1121, .b_s_g: 0x1122, .b_s_d: 0x1123, .b_s_b: 0x1124, .b_s_s: 0x1125, .b_s_j: 0x1126, .b_s_t: 0xA972, .b_j: 0x1127, .b_ch: 0x1128, .b_k: 0xA973, .b_t: 0x1129, .b_p: 0x112A, .b_h: 0xA974, .gb: 0x112B, .gbb: 0x112C,
        .s: 0x1109, .s_g: 0x112D, .s_n: 0x112E, .s_d: 0x112F, .s_r: 0x1130, .s_m: 0x1131, .s_b: 0x1132, .s_b_g: 0x1133, .s_s: 0x110A, .s_s_b: 0xA975, .s_s_s: 0x1134, .s_ie: 0x1135, .s_j: 0x1136, .s_ch: 0x1137, .s_k: 0x1138, .s_t: 0x1139, .s_p: 0x113A, .s_h: 0x113B, .chs: 0x113C, .chss: 0x113D, .js: 0x113E, .jss: 0x113F,
        .z: 0x1140,
        .ie: 0x110B, .ie_g: 0x1141, .ie_d: 0x1142, .ie_r: 0xA976, .ie_m: 0x1143, .ie_b: 0x1144, .ie_s: 0x1145, .ie_z: 0x1146, .ie_ie: 0x1147, .ie_j: 0x1148, .ie_ch: 0x1149, .ie_t: 0x114A, .ie_p: 0x114B, .ie_h: 0xA977,
        .ng: 0x114C,
        .j: 0x110C, .j_ie: 0x114D, .j_j: 0x110D, .j_j_h: 0xA978, .chj: 0x114E, .chjj: 0x114F, .jj: 0x1150, .jjj: 0x1151,
        .ch: 0x110E, .ch_k: 0x1152, .ch_h: 0x1153, .chch: 0x1154, .jch: 0x1155,
        .k: 0x110F,
        .t: 0x1110, .t_t: 0xA979,
        .p: 0x1111, .p_b: 0x1156, .p_h: 0xA97A, .gp: 0x1157,
        .h: 0x1112, .h_s: 0xA97B, .h_h: 0x1158,
        .x: 0x1159, .x_x: 0xA97C
    ]
    let medial: [Name: unichar] = [
        .none: 0x1160,
        .a: 0x1161, .a_o: 0x1176, .a_u: 0x1177, .a_eu: 0x11A3, .ae: 0x1162,
        .ya: 0x1163, .ya_o: 0x1178, .ya_yo: 0x1179, .ya_u: 0x11A4, .yae: 0x1164,
        .eo: 0x1165, .eo_o: 0x117A, .eo_u: 0x117B, .eo_eu: 0x117C, .e: 0x1166,
        .yeo: 0x1167, .yeo_ya: 0x11A5, .yeo_o: 0x117D, .yeo_u: 0x117E, .ye: 0x1168,
        .o: 0x1169, .o_a: 0x116A, .o_ae: 0x116B, .o_ya: 0x11A6, .o_yae: 0x11A7, .o_eo: 0x117F, .o_e: 0x1180, .o_yeo: 0xD7B0, .o_ye: 0x1181, .o_o: 0x1182, .o_o_i: 0xD7B1, .o_u: 0x1183, .o_i: 0x116C,
        .yo: 0x116D, .yo_a: 0xD7B2, .yo_ae: 0xD7B3, .yo_ya: 0x1184, .yo_yae: 0x1185, .yo_eo: 0xD7B4, .yo_yeo: 0x1186, .yo_o: 0x1187, .yo_i: 0x1188,
        .u: 0x116E, .u_a: 0x1189, .u_ae: 0x118A, .u_eo: 0x116F, .u_eo_eu: 0x118B, .u_e: 0x1170, .u_yeo: 0xD7B5, .u_ye: 0x118C, .u_u: 0x118D, .u_i: 0x1171, .u_i_i: 0xD7B6,
        .yu: 0x1172, .yu_a: 0x118E, .yu_ae: 0xD7B7, .yu_eo: 0x118F, .yu_e: 0x1190, .yu_yeo: 0x1191, .yu_ye: 0x1192, .yu_o: 0xD7B8, .yu_u: 0x1193, .yu_i: 0x1194,
        .eu: 0x1173, .eu_a: 0xD7B9, .eu_eo: 0xD7BA, .eu_e: 0xD7BB, .eu_o: 0xD7BC, .eu_u: 0x1195, .eu_eu: 0x1196, .eu_i: 0x1174, .eu_i_u: 0x1197,
        .i: 0x1175, .i_a: 0x1198, .i_ya: 0x1199, .i_ya_o: 0xD7BD, .i_yae: 0xD7BE, .i_yeo: 0xD7BF, .i_ye: 0xD7C0, .i_o: 0x119A, .i_o_i: 0xD7C1, .i_yo: 0xD7C2, .i_u: 0x119B, .i_yu: 0xD7C3, .i_eu: 0x119C, .i_i: 0xD7C4, .i_aa: 0x119D,
        .aa: 0x119E, .aa_a: 0xD7C5, .aa_eo: 0x119F, .aa_e: 0xD7C6, .aa_u: 0x11A0, .aa_i: 0x11A1, .aa_aa: 0x11A2
    ]
    let final: [Name: unichar] = [
        .g: 0x11A8, .g_g: 0x11A9, .g_n: 0x11FA, .g_r: 0x11C3, .g_b: 0x11FB, .g_s: 0x11AA, .g_s_g: 0x11C4, .g_ch: 0x11FC, .g_k: 0x11FD, .g_h: 0x11FE,
        .n: 0x11AB, .n_g: 0x11C5, .n_n: 0x11FF, .n_d: 0x11C6, .n_r: 0xD7CB, .n_s: 0x11C7, .n_z: 0x11C8, .n_j: 0x11AC, .n_ch: 0xD7CC, .n_t: 0x11C9, .n_h: 0x11AD,
        .d: 0x11AE, .d_g: 0x11CA, .d_d: 0xD7CD, .d_d_b: 0xD7CE, .d_r: 0x11CB, .d_b: 0xD7CF, .d_s: 0xD7D0, .d_s_g: 0xD7D1, .d_j: 0xD7D2, .d_ch: 0xD7D3, .d_t: 0xD7D4,
        .r: 0x11AF, .r_g: 0x11B0, .r_g_g: 0xD7D5, .r_g_s: 0x11CC, .r_g_h: 0xD7D6, .r_n: 0x11CD, .r_d: 0x11CE, .r_d_h: 0x11CF, .r_r: 0x11D0, .r_r_k: 0xD7D7, .r_m: 0x11B1, .r_m_g: 0x11D1, .r_m_s: 0x11D2, .r_m_h: 0xD7D8, .r_b: 0x11B2, .r_b_d: 0xD7D9, .r_b_s: 0x11D3, .r_b_p: 0xD7DA, .r_b_h: 0x11D4, .r_gb: 0x11D5, .r_s: 0x11B3, .r_s_s: 0x11D6, .r_z: 0x11D7, .r_ng: 0xD7DB, .r_k: 0x11D8, .r_t: 0x11B4, .r_p: 0x11B6, .r_h: 0x11B6, .r_x: 0x11D9, .r_x_h: 0xD7DC, .gr: 0xD7DD,
        .m: 0x11B7, .m_g: 0x11DA, .m_n: 0xD7DE, .m_n_n: 0xD7DF, .m_r: 0x11DB, .m_m: 0xD7E0, .m_b: 0x11DC, .m_b_s: 0xD7E1, .m_s: 0x11DD, .m_s_s: 0x11DE, .m_z: 0x11DF, .m_j: 0xD7E2, .m_ch: 0x11E0, .m_h: 0x11E1, .gm: 0x11E2,
        .b: 0x11B8, .b_d: 0xD7E3, .b_r: 0x11E3, .b_r_p: 0xD7E4, .b_m: 0xD7E5, .b_b: 0xD7E6, .b_s: 0x11B9, .b_s_d: 0xD7E7, .b_j: 0xD7E8, .b_ch: 0xD7E9, .b_p: 0x11E4, .b_h: 0x11E5, .gb: 0x11E6,
        .s: 0x11BA, .s_g: 0x11E7, .s_d: 0x11E8, .s_r: 0x11E9, .s_m: 0xD7EA, .s_b: 0x11EA, .s_gb: 0xD7EB, .s_s: 0x11BB, .s_s_g: 0xD7EC, .s_s_d: 0xD7ED, .s_z: 0xD7EE, .s_j: 0xD7EF, .s_ch: 0xD7F0, .s_t: 0xD7F1, .s_h: 0xD7F2,
        .z: 0x11EB, .z_b: 0xD7F3, .z_gb: 0xD7F4,
        .ie: 0x11BC,
        .ng: 0x11F0, .ng_g: 0x11EC, .ng_g_g: 0x11ED, .ng_m: 0xD7F5, .ng_s: 0x11F1, .ng_z: 0x11F2, .ng_ng: 0x11EE, .ng_k: 0x11EF, .ng_h: 0xD7F6,
        .j: 0x11BD, .j_b: 0xD7F7, .j_b_b: 0xD7F8, .j_j: 0xD7F9,
        .ch: 0x11BE,
        .k: 0x11BF,
        .t: 0x11C0,
        .p: 0x11C1, .p_b: 0x11F3, .p_s: 0xD7FA, .p_t: 0xD7FB, .gp: 0x11F4,
        .h: 0x11C2, .h_n: 0x11F5, .h_r: 0x11F6, .h_m: 0x11F7, .h_b: 0x11F8,
        .x: 0x11F9
    ]
    
    static func == (lhs: Hangul, rhs: Hangul) -> Bool {
        return lhs.position == rhs.position && lhs.name == rhs.name && lhs.isTwoSet == rhs.isTwoSet
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.position)
        hasher.combine(self.name)
        hasher.combine(self.isTwoSet)
    }
    
    func getUnicode() -> unichar {
        switch self.position {
        case .compatibility:
            return self.compatibility[self.name] ?? 0x0000
        case .initial:
            return self.initial[self.name] ?? 0x0000
        case .medial:
            return self.medial[self.name] ?? 0x0000
        case .final:
            return self.final[self.name] ?? 0x0000
        case .toneMark:
            return self.toneMark[self.name] ?? 0x0000
        }
    }
    func getCharacter() -> Character {
        let unicodeScalar = UnicodeScalar(self.getUnicode())!
        return Character(unicodeScalar)
    }
    func getCharacterString() -> String {
        return String(self.getCharacter())
    }
    
    func copy() -> Hangul {
        Hangul(self.position, self.name, isTwoSet: self.isTwoSet)
    }
}


let LeadingJamoCode: [Int16: Int] = [
    0x0001: 0x1100, // G_
    0x0002: 0x1101, // GG
    0x0004: 0x115A, // GD
    0x000C: 0x1102, // N_
    0x000D: 0x1113, // NG
    0x000E: 0x1114, // NN
    0x000F: 0x1115, // ND
    0x0011: 0x1116, // NB
    0x0012: 0x115B, // NS
    0x0014: 0x115C, // NJ
    0x0017: 0x115D, // NH
    0x0018: 0x1103, // D_
    0x0019: 0x1117, // DG
    0x001A: 0x1104, // DD
    0x001C: 0x115E, // DR
    0x001D: 0xA960, // DM
    0x001E: 0xA961, // DB
    0x001F: 0xA962, // DS
    0x0021: 0xA963, // DJ
    0x0024: 0x1105, // R_
    0x0025: 0xA964, // RG
    0x0026: 0xA965, // RGG
    0x0029: 0x1118, // RN
    0x002A: 0xA966, // RD
    0x002B: 0xA967, // RDD
    0x002D: 0x1119, // RR
    0x002F: 0xA968, // RM
    0x0033: 0xA969, // RB
    0x0035: 0xA96A, // RBB
    0x0039: 0xA96B, // RBQ
    0x003A: 0xA96C, // RS
    0x003E: 0xA96D, // RJ
    0x003F: 0xA96E, // RK
    0x0042: 0x111A, // RH
    0x0045: 0x111B, // RQ
    0x0046: 0x1106, // M_
    0x0047: 0xA96F, // MG
    0x004A: 0xA970, // MD
    0x004D: 0x111C, // MB
    0x004F: 0xA971, // MS
    0x0055: 0x111D, // MQ
    0x0056: 0x1107, // B_
    0x0057: 0x111E, // BG
    0x0058: 0x111F, // BN
    0x0059: 0x1120, // BD
    0x005D: 0x1108, // BB
    0x005E: 0x1121, // BS
    0x005F: 0x1122, // BSG
    0x0060: 0x1123, // BSD
    0x0061: 0x1124, // BSB
    0x0062: 0x1125, // BSS
    0x0063: 0x1126, // BSJ
    0x0064: 0xA972, // BST
    0x0065: 0x1127, // BJ
    0x0066: 0x1128, // BC
    0x0067: 0xA973, // BK
    0x0068: 0x1129, // BT
    0x0069: 0x112A, // BP
    0x006A: 0xA974, // BH
    0x006B: 0x112B, // BQ
    0x006C: 0x112C, // BBQ
    0x006D: 0x1109, // S_
    0x006E: 0x112D, // SG
    0x006F: 0x112E, // SN
    0x0070: 0x112F, // SD
    0x0071: 0x1130, // SR
    0x0072: 0x1131, // SM
    0x0073: 0x1132, // SB
    0x0074: 0x1133, // SBG
    0x0076: 0x110A, // SS
    0x0079: 0xA975, // SSB
    0x007A: 0x1134, // SSS
    0x007C: 0x1135, // SQ
    0x007D: 0x1136, // SJ
    0x007E: 0x1137, // SC
    0x007F: 0x1138, // SK
    0x0080: 0x1139, // ST
    0x0081: 0x113A, // SP
    0x0082: 0x113B, // SH
    0x0083: 0x113C, // wS
    0x0084: 0x113D, // wSS
    0x0085: 0x113E, // Sw
    0x0086: 0x113F, // SSw
    0x0087: 0x1140, // Z_
    0x008A: 0x110B, // Q_
    0x008B: 0x1141, // QG
    0x008C: 0x1142, // QD
    0x008D: 0xA976, // QR
    0x008E: 0x1143, // QM
    0x008F: 0x1144, // QB
    0x0090: 0x1145, // QS
    0x0091: 0x1146, // QZ
    0x0092: 0x1147, // QQ
    0x0093: 0x1148, // QJ
    0x0094: 0x1149, // QC
    0x0095: 0x114A, // QT
    0x0096: 0x114B, // QP
    0x0097: 0xA977, // QH
    0x0098: 0x114C, // V_
    0x00A1: 0x110C, // J_
    0x00A4: 0x114D, // JQ
    0x00A5: 0x110D, // JJ
    0x00A6: 0xA978, // JJH
    0x00A7: 0x114E, // wJ
    0x00A8: 0x114F, // wJJ
    0x00A9: 0x1150, // Jw
    0x00AA: 0x1151, // JJw
    0x00AB: 0x110E, // C_
    0x00AC: 0x1152, // CK
    0x00AD: 0x1153, // CH
    0x00AE: 0x1154, // wC
    0x00AF: 0x1155, // Cw
    0x00B0: 0x110F, // K_
    0x00B1: 0x1110, // T_
    0x00B2: 0xA979, // TT
    0x00B3: 0x1111, // P_
    0x00B4: 0x1156, // PB
    0x00B7: 0xA97A, // PH
    0x00B8: 0x1157, // PQ
    0x00B9: 0x1112, // H_
    0x00BE: 0xA97B, // HS
    0x00BF: 0x1158, // HH
    0x00C0: 0x1159, // X_
    0x00C1: 0xA97C, // XX
]
let LeadingToCompatibility: [Int: Int] = [
    0x1100: 0x3131, // G_
    0x1101: 0x3132, // GG
    0x1102: 0x3134, // N_
    0x1103: 0x3137, // D_
    0x1104: 0x3138, // DD
    0x1105: 0x3139, // R_
    0x1106: 0x3141, // M_
    0x1107: 0x3142, // B_
    0x1108: 0x3143, // BB
    0x1109: 0x3145, // S_
    0x110A: 0x3146, // SS
    0x110B: 0x3147, // Q_
    0x110C: 0x3148, // J_
    0x110D: 0x3149, // JJ
    0x110E: 0x314A, // C_
    0x110F: 0x314B, // K_
    0x1110: 0x314C, // T_
    0x1111: 0x314D, // P_
    0x1112: 0x314E, // H_
    
    0x1114: 0x3165, // NN
    0x1115: 0x3166, // ND
    0x115B: 0x3167, // NS
    0x115C: 0x3135, // NJ
    0x115D: 0x3136, // NH
    0xA964: 0x313A, // RG
    0xA966: 0x316A, // RD
    0xA968: 0x313B, // RM
    0xA969: 0x313C, // RB
    0xA96C: 0x313D, // RS
    0x111A: 0x3140, // RH
    0x111C: 0x316E, // MB
    0xA971: 0x316F, // MS
    0x111D: 0x3171, // MQ
    0x111E: 0x3172, // BG
    0x1120: 0x3173, // BD
    0x1121: 0x3144, // BS
    0x1122: 0x3174, // BSG
    0x1123: 0x3175, // BSD
    0x1127: 0x3176, // BJ
    0x1129: 0x3177, // BT
    0x112B: 0x3178, // BQ
    0x112C: 0x3179, // BBQ
    0x112D: 0x317A, // SG
    0x112E: 0x317B, // SN
    0x112F: 0x317C, // SD
    0x1132: 0x317D, // SB
    0x1136: 0x317E, // SJ
    0x1140: 0x317F, // Z_
    0x1147: 0x3180, // QQ
    0x114C: 0x3181, // V_
    0x1157: 0x3184, // PQ
    0x1158: 0x3185, // HH
    0x1159: 0x3186, // X_
]
let MedialJamoCode: [Int16: Int] = [
    0x0001: 0x1161, // A_
    0x0002: 0x1176, // AO
    0x0003: 0x1177, // AU
    0x0004: 0x11A3, // AEU
    0x0005: 0x1162, // AE
    0x0006: 0x1163, // YA
    0x0007: 0x1178, // YAO
    0x0008: 0x1179, // YAYO
    0x0009: 0x11A4, // YAU
    0x000A: 0x1164, // YAE
    0x000B: 0x1165, // EO
    0x000C: 0x117A, // EOO
    0x000D: 0x117B, // EOU
    0x000E: 0x117C, // EOEU
    0x000F: 0x1166, // E_
    0x0010: 0x1167, // YEO
    0x0011: 0x11A5, // YEOYA
    0x0012: 0x117D, // YEOO
    0x0013: 0x117E, // YEOU
    0x0014: 0x1168, // YE
    0x0015: 0x1169, // O_
    0x0016: 0x116A, // WA
    0x0017: 0x116B, // WAE
    0x0018: 0x11A6, // OYA
    0x0019: 0x11A7, // OYAE
    0x001A: 0x117F, // OEO
    0x001B: 0x1180, // OE
    0x001C: 0xD7B0, // OYEO
    0x001D: 0x1181, // OYE
    0x001E: 0x1182,  // OO
    0x001F: 0xD7B1, // OOI
    0x0020: 0x1183, // OU
    0x0021: 0x116C, // OI
    0x0022: 0x116D, // YO
    0x0023: 0xD7B2, // YOA
    0x0024: 0xD7B3, // YOAE
    0x0025: 0x1184, // YOYA
    0x0026: 0x1185, // YOYAE
    0x0027: 0xD7B4, // YOEO
    0x0028: 0x1186, // YOYEO
    0x0029: 0x1187, // YOO
    0x002A: 0x1188, // YOI
    0x002B: 0x116E, // U_
    0x002C: 0x1189, // UA
    0x002D: 0x118A, // UAE
    0x002E: 0x116F, // UEO
    0x002F: 0x118B, // UEOEU
    0x0030: 0x1170, // WE
    0x0031: 0xD7B5, // UYEO
    0x0032: 0x118C, // UYE
    0x0033: 0x118D, // UU
    0x0034: 0x1171, // WI
    0x0035: 0xD7B6, // UII
    0x0036: 0x1172, // YU
    0x0037: 0x118E, // YUA
    0x0038: 0xD7B7, // YUAE
    0x0039: 0x118F, // YUEO
    0x003A: 0x1190, // YUE
    0x003B: 0x1191, // YUYEO
    0x003C: 0x1192, // YUYE
    0x003D: 0xD7B8, // YUO
    0x003E: 0x1193, // YUU
    0x003F: 0x1194, // YUI
    0x0040: 0x1173, // EU
    0x0041: 0xD7B9, // EUA
    0x0042: 0xD7BA, // EUEO
    0x0043: 0xD7BB, // EUE
    0x0044: 0xD7BC, // EUO
    0x0045: 0x1195, // EUU
    0x0046: 0x1196, // EUEU
    0x0047: 0x1174, // EUI
    0x0048: 0x1197, // EUIU
    0x0049: 0x1175, // I_
    0x004A: 0x1198, // IA
    0x004B: 0x1199, // IYA
    0x004C: 0xD7BD, // IYAO
    0x004D: 0xD7BE, // IYAE
    0x004E: 0xD7BF, // IYEO
    0x004F: 0xD7C0, // IYE
    0x0050: 0x119A, // IO
    0x0051: 0xD7C1, // IOI
    0x0052: 0xD7C2, // IYO
    0x0053: 0x119B, // IU
    0x0054: 0xD7C3, // IYU
    0x0055: 0x119C, // IEU
    0x0056: 0xD7C4, // II
    0x0057: 0x119D, // IF
    0x0058: 0x119E, // F_
    0x0059: 0xD7C5, // FA
    0x005A: 0x119F, // FEO
    0x005B: 0xD7C6, // FE
    0x005C: 0x11A0, // FU
    0x005D: 0x11A1, // FI
    0x005E: 0x11A2, // FF
]
let MedialToCompatibility: [Int: Int] = [
    0x1161: 0x314F, // A_
    0x1162: 0x3150, // AE
    0x1163: 0x3151, // YA
    0x1164: 0x3152, // YAE
    0x1165: 0x3153, // EO
    0x1166: 0x3154, // E_
    0x1167: 0x3155, // YEO
    0x1168: 0x3156, // YE
    0x1169: 0x3157, // O_
    0x116A: 0x3158, // WA
    0x116B: 0x3159, // WAE
    0x116C: 0x315A, // OI
    0x116D: 0x315B, // YO
    0x116E: 0x315C, // U_
    0x116F: 0x315D, // WO
    0x1170: 0x315E, // UEO
    0x1171: 0x315F, // WI
    0x1172: 0x3160, // YU
    0x1173: 0x3161, // EU
    0x1174: 0x3162, // EUI
    0x1175: 0x3163, // I_
    
    0x1184: 0x3187, // YOYA
    0x1185: 0x3188, // YOYAE
    0x1188: 0x3189, // YOI
    0x1191: 0x318A, // YUYEO
    0x1192: 0x318B, // YUYE
    0x1194: 0x318C, // YUI
    0x119E: 0x318D, // F_
    0x11A1: 0x318E, // FI
]
let TrailingJamoCode: [Int16: Int] = [
    0x0001: 0x11A8, // G_
    0x0002: 0x11A9, // GG
    0x0003: 0x11FA, // GN
    0x0005: 0x11C3, // GR
    0x0006: 0x11FB, // GB
    0x0007: 0x11AA, // GS
    0x0008: 0x11C4, // GSG
    0x0009: 0x11FC, // GC
    0x000A: 0x11FD, // GK
    0x000B: 0x11FE, // GH
    0x000C: 0x11AB, // N_
    0x000D: 0x11C5, // NG
    0x000E: 0x11FF, // NN
    0x000F: 0x11C6, // ND
    0x0010: 0xD7CB, // NR
    0x0012: 0x11C7, // NS
    0x0013: 0x11C8, // NZ
    0x0014: 0x11AC, // NJ
    0x0015: 0xD7CC, // NC
    0x0016: 0x11C9, // NT
    0x0017: 0x11AD, // NH
    0x0018: 0x11AE, // D_
    0x0019: 0x11CA, // DG
    0x001A: 0xD7CD, // DD
    0x001B: 0xD7CE, // DDB
    0x001C: 0x11CB, // DR
    0x001E: 0xD7CF, // DB
    0x001F: 0xD7D0, // DS
    0x0020: 0xD7D1, // DSG
    0x0021: 0xD7D2, // DJ
    0x0022: 0xD7D3, // DC
    0x0023: 0xD7D4, // DT
    0x0024: 0x11AF, // R_
    0x0025: 0x11B0, // RG
    0x0026: 0xD7D5, // RGG
    0x0027: 0x11CC, // RGS
    0x0028: 0xD7D6, // RGH
    0x0029: 0x11CD, // RN
    0x002A: 0x11CE, // RD
    0x002C: 0x11CF, // RDH
    0x002D: 0x11D0, // RR
    0x002E: 0xD7D7, // RRK
    0x002F: 0x11B1, // RM
    0x0030: 0x11D1, // RMG
    0x0031: 0x11D2, // RMS
    0x0032: 0xD7D9, // RMH
    0x0033: 0x11B2, // RB
    0x0034: 0xD7D9, // RBD
    0x0036: 0x11D3, // RBS
    0x0037: 0xD7DA, // RBP
    0x0038: 0x11D4, // RBH
    0x0039: 0x11D5, // RBQ
    0x003A: 0x11B3, // RS
    0x003B: 0x11D6, // RSS
    0x003C: 0x11D7, // RZ
    0x003D: 0xD7DB, // RV
    0x003F: 0x11D8, // RK
    0x0040: 0x11B4, // RT
    0x0041: 0x11B5, // RP
    0x0042: 0x11B6, // RH
    0x0043: 0x11D9, // RX
    0x0044: 0xD7DC, // RXH
    0x0045: 0xD7DD, // RQ
    0x0046: 0x11B7, // M_
    0x0047: 0x11DA, // MG
    0x0048: 0xD7DE, // MN
    0x0049: 0xD7DF, // MNN
    0x004B: 0x11DB, // MR
    0x004C: 0xD7E0, // MM
    0x004D: 0x11DC, // MB
    0x004E: 0xD7E1, // MBS
    0x004F: 0x11DD, // MS
    0x0050: 0x11DE, // MSS
    0x0051: 0x11DF, // MZ
    0x0052: 0xD7E2, // MJ
    0x0053: 0x11E0, // MC
    0x0054: 0x11E1, // MH
    0x0055: 0x11E2, // MQ
    0x0056: 0x11B8, // B_
    0x0059: 0xD7E3, // BD
    0x005A: 0x11E3, // BR
    0x005B: 0xD7E4, // BRP
    0x005C: 0xD7E5, // BM
    0x005D: 0xD7E6, // BB
    0x005E: 0x11B9, // BS
    0x0060: 0xD7E7, // BSD
    0x0065: 0xD7E8, // BJ
    0x0066: 0xD7E9, // BC
    0x0069: 0x11E4, // BP
    0x006A: 0x11E5, // BH
    0x006B: 0x11E6, // BQ
    0x006D: 0x11BA, // S_
    0x006E: 0x11E7, // SG
    0x0070: 0x11E8, // SD
    0x0071: 0x11E9, // SR
    0x0072: 0xD7EA, // SM
    0x0073: 0x11EA, // SB
    0x0075: 0xD7EB, // SBQ
    0x0076: 0x11BB, // SS
    0x0077: 0xD7EC, // SSG
    0x0078: 0xD7ED, // SSD
    0x007B: 0xD7EE, // SZ
    0x007D: 0xD7EF, // SJ
    0x007E: 0xD7F0, // SC
    0x0080: 0xD7F1, // ST
    0x0082: 0xD7F2, // SH
    0x0087: 0x11EB, // Z_
    0x0088: 0xD7F3, // ZB
    0x0089: 0xD7F4, // ZBQ
    0x008A: 0x11BC, // Q_
    0x0098: 0x11F0, // V_
    0x0099: 0x11EC, // VG
    0x009A: 0x11ED, // VGG
    0x009B: 0xD7F5, // VM
    0x009C: 0x11F1, // VS
    0x009D: 0x11F2, // VZ
    0x009E: 0x11EE, // VV
    0x009F: 0x11EF, // VK
    0x00A0: 0xD7F6, // VH
    0x00A1: 0x11BD, // J_
    0x00A2: 0xD7F7, // JB
    0x00A3: 0xD7F8, // JBB
    0x00A5: 0xD7F9, // JJ
    0x00AB: 0x11BE, // C_
    0x00B0: 0x11BF, // K_
    0x00B1: 0x11C0, // T_
    0x00B3: 0x11C1, // P_
    0x00B4: 0x11F3, // PB
    0x00B5: 0xD7FA, // PS
    0x00B6: 0xD7FB, // PT
    0x00B8: 0x11F4, // PQ
    0x00B9: 0x11C2, // H_
    0x00BA: 0x11F5, // HN
    0x00BB: 0x11F6, // HR
    0x00BC: 0x11F7, // HM
    0x00BD: 0x11F8, // HB
    0x00C0: 0x11F9, // X_
]
let TrailingToCompatibility: [Int: Int] = [
    0x11A8: 0x3131, // _G
    0x11A9: 0x3132, // _GG
    0x11AA: 0x3133, // _GS
    0x11AB: 0x3134, // _N
    0x11AC: 0x3135, // _NJ
    0x11AD: 0x3136, // _NH
    0x11AE: 0x3137, // _D
    0x11AF: 0x3139, // _R
    0x11B0: 0x313A, // _RG
    0x11B1: 0x313B, // _RM
    0x11B2: 0x313C, // _RB
    0x11B3: 0x313D, // _RS
    0x11B4: 0x313E, // _RT
    0x11B5: 0x313F, // _RP
    0x11B6: 0x3140, // _RH
    0x11B7: 0x3141, // _M
    0x11B8: 0x3142, // _B
    0x11B9: 0x3144, // _BS
    0x11BA: 0x3145, // _S
    0x11BB: 0x3146, // _SS
    0x11BC: 0x3147, // _Q
    0x11BD: 0x3148, // _J
    0x11BE: 0x314A, // _C
    0x11BF: 0x314B, // _K
    0x11C0: 0x314C, // _T
    0x11C1: 0x314D, // _P
    0x11C2: 0x314E, // _H
    
    0x11FF: 0x3165, // _NN
    0x11C6: 0x3166, // _ND
    0x11C7: 0x3167, // _NS
    0x11C8: 0x3168, // _NZ
    0xD7CD: 0x3138, // _DD
    0x11CC: 0x3169, // _RGS
    0x11CE: 0x316A, // _RD
    0x11D3: 0x316B, // _RBS
    0x11D7: 0x316C, // _RZ
    0x11D9: 0x316D, // _RX
    0x11DC: 0x316E, // _MB
    0x11DD: 0x316F, // _MS
    0x11DF: 0x3170, // _MZ
    0x11E2: 0x3171, // _MQ
    0xD7E3: 0x3173, // _BD
    0xD7E6: 0x3143, // _BB
    0xD7E7: 0x3175, // _BSD
    0xD7E8: 0x3176, // _BJ
    0x11E6: 0x3178, // _BQ
    0x11E7: 0x317A, // _SG
    0x11E8: 0x317C, // _SD
    0x11EA: 0x317D, // _SB
    0xD7EF: 0x317E, // _SJ
    0x11EB: 0x317F, // _Z
    0x11F0: 0x3181, // _V
    0x11F1: 0x3182, // _VS
    0x11F2: 0x3183, // _VZ
    0xD7F9: 0x3149, // _JJ
    0x11F4: 0x3184, // _PV
    0x11F9: 0x3186, // _X
]

class Jamo: Hashable, Codable {
    var code: Int16
    var position: Position
    var keySet: KeySet
    
    enum Position: Codable {
        case leading
        case medial
        case trailing
    }
    enum KeySet: Codable {
        case dubeolsik
        case sebeolsik
        case dubeolsikTrailingOnly
    }
    
    init(_ name: JamoConstant, key: KeySet) {
        let rawValue = name.rawValue
        if rawValue < 0x10000 {
            self.code = Int16(name.rawValue)
            self.position = .leading
        } else if rawValue < 0x100000000 {
            self.code = Int16(name.rawValue >> 16)
            self.position = .medial
        } else {
            self.code = Int16(name.rawValue >> 32)
            self.position = .trailing
        }
        self.keySet = key
    }
    init(code: Int16, pos: Position, key: KeySet) {
        self.code = code
        self.position = pos
        self.keySet = key
    }
    
    static func == (lhs: Jamo, rhs: Jamo) -> Bool {
        return lhs.code == rhs.code && lhs.position == rhs.position
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
        hasher.combine(position)
        hasher.combine(keySet)
    }
    
    func copy() -> Jamo {
        return Jamo(code: self.code, pos: self.position, key: self.keySet)
    }
}


class PreSyllable {
    var leading: Jamo
    var medial: Jamo
    var trailing: Jamo
    
    init(leading: Jamo? = nil, medial: Jamo? = nil, trailing: Jamo? = nil, key: Jamo.KeySet = .sebeolsik) {
        if let leading = leading {
            self.leading = leading
        } else {
            self.leading = Jamo(code: 0, pos: .leading, key: key)
        }
        
        if let medial = medial {
            self.medial = medial
        } else {
            self.medial = Jamo(code: 0, pos: .medial, key: key)
        }
        
        if let trailing = trailing {
            self.trailing = trailing
        } else {
            self.trailing = Jamo(code: 0, pos: .trailing, key: key)
        }
    }
    
    func copy() -> PreSyllable {
        return PreSyllable(leading: self.leading.copy(), medial: self.medial.copy(), trailing: self.trailing.copy())
    }
}
