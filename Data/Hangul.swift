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
