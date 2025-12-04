//
//  Expression.swift
//  IMKitSample
//
//  Created by 강우현 on 11/30/25.
//

import Foundation

enum JamoConstant: Int64, Codable, CaseIterable {
    case G_ =    0x00000000000001
    case GG =    0x00000000000002
    case GN =    0x00000000000003
    case GD =    0x00000000000004
    case GR =    0x00000000000005
    case GB =    0x00000000000006
    case GS =    0x00000000000007
    case GSG =   0x00000000000008
    case GC =    0x00000000000009
    case GK =    0x0000000000000A
    case GH =    0x0000000000000B
    case N_ =    0x0000000000000C
    case NG =    0x0000000000000D
    case NN =    0x0000000000000E
    case ND =    0x0000000000000F
    case NR =    0x00000000000010
    case NB =    0x00000000000011
    case NS =    0x00000000000012
    case NZ =    0x00000000000013
    case NJ =    0x00000000000014
    case NC =    0x00000000000015
    case NT =    0x00000000000016
    case NH =    0x00000000000017
    case D_ =    0x00000000000018
    case DG =    0x00000000000019
    case DD =    0x0000000000001A
    case DDB =   0x0000000000001B
    case DR =    0x0000000000001C
    case DM =    0x0000000000001D
    case DB =    0x0000000000001E
    case DS =    0x0000000000001F
    case DSG =   0x00000000000020
    case DJ =    0x00000000000021
    case DC =    0x00000000000022
    case DT =    0x00000000000023
    case R_ =    0x00000000000024
    case RG =    0x00000000000025
    case RGG =   0x00000000000026
    case RGS =   0x00000000000027
    case RGH =   0x00000000000028
    case RN =    0x00000000000029
    case RD =    0x0000000000002A
    case RDD =   0x0000000000002B
    case RDH =   0x0000000000002C
    case RR =    0x0000000000002D
    case RRK =   0x0000000000002E
    case RM =    0x0000000000002F
    case RMG =   0x00000000000030
    case RMS =   0x00000000000031
    case RMH =   0x00000000000032
    case RB =    0x00000000000033
    case RBD =   0x00000000000034
    case RBB =   0x00000000000035
    case RBS =   0x00000000000036
    case RBP =   0x00000000000037
    case RBH =   0x00000000000038
    case RBQ =   0x00000000000039
    case RS =    0x0000000000003A
    case RSS =   0x0000000000003B
    case RZ =    0x0000000000003C
    case RV =    0x0000000000003D
    case RJ =    0x0000000000003E
    case RK =    0x0000000000003F
    case RT =    0x00000000000040
    case RP =    0x00000000000041
    case RH =    0x00000000000042
    case RX =    0x00000000000043
    case RXH =   0x00000000000044
    case RQ =    0x00000000000045
    case M_ =    0x00000000000046
    case MG =    0x00000000000047
    case MN =    0x00000000000048
    case MNN =   0x00000000000049
    case MD =    0x0000000000004A
    case MR =    0x0000000000004B
    case MM =    0x0000000000004C
    case MB =    0x0000000000004D
    case MBS =   0x0000000000004E
    case MS =    0x0000000000004F
    case MSS =   0x00000000000050
    case MZ =    0x00000000000051
    case MJ =    0x00000000000052
    case MC =    0x00000000000053
    case MH =    0x00000000000054
    case MQ =    0x00000000000055
    case B_ =    0x00000000000056
    case BG =    0x00000000000057
    case BN =    0x00000000000058
    case BD =    0x00000000000059
    case BR =    0x0000000000005A
    case BRP =   0x0000000000005B
    case BM =    0x0000000000005C
    case BB =    0x0000000000005D
    case BS =    0x0000000000005E
    case BSG =   0x0000000000005F
    case BSD =   0x00000000000060
    case BSB =   0x00000000000061
    case BSS =   0x00000000000062
    case BSJ =   0x00000000000063
    case BST =   0x00000000000064
    case BJ =    0x00000000000065
    case BC =    0x00000000000066
    case BK =    0x00000000000067
    case BT =    0x00000000000068
    case BP =    0x00000000000069
    case BH =    0x0000000000006A
    case BQ =    0x0000000000006B
    case BBQ =   0x0000000000006C
    case S_ =    0x0000000000006D
    case SG =    0x0000000000006E
    case SN =    0x0000000000006F
    case SD =    0x00000000000070
    case SR =    0x00000000000071
    case SM =    0x00000000000072
    case SB =    0x00000000000073
    case SBG =   0x00000000000074
    case SBQ =   0x00000000000075
    case SS =    0x00000000000076
    case SSG =   0x00000000000077
    case SSD =   0x00000000000078
    case SSB =   0x00000000000079
    case SSS =   0x0000000000007A
    case SZ =    0x0000000000007B
    case SQ =    0x0000000000007C
    case SJ =    0x0000000000007D
    case SC =    0x0000000000007E
    case SK =    0x0000000000007F
    case ST =    0x00000000000080
    case SP =    0x00000000000081
    case SH =    0x00000000000082
    case wS =    0x00000000000083
    case wSS =   0x00000000000084
    case Sw =    0x00000000000085
    case SSw =   0x00000000000086
    case Z_ =    0x00000000000087
    case ZB =    0x00000000000088
    case ZBQ =   0x00000000000089
    case Q_ =    0x0000000000008A
    case QG =    0x0000000000008B
    case QD =    0x0000000000008C
    case QR =    0x0000000000008D
    case QM =    0x0000000000008E
    case QB =    0x0000000000008F
    case QS =    0x00000000000090
    case QZ =    0x00000000000091
    case QQ =    0x00000000000092
    case QJ =    0x00000000000093
    case QC =    0x00000000000094
    case QT =    0x00000000000095
    case QP =    0x00000000000096
    case QH =    0x00000000000097
    case V_ =    0x00000000000098
    case VG =    0x00000000000099
    case VGG =   0x0000000000009A
    case VM =    0x0000000000009B
    case VS =    0x0000000000009C
    case VZ =    0x0000000000009D
    case VV =    0x0000000000009E
    case VK =    0x0000000000009F
    case VH =    0x000000000000A0
    case J_ =    0x000000000000A1
    case JB =    0x000000000000A2
    case JBB =   0x000000000000A3
    case JQ =    0x000000000000A4
    case JJ =    0x000000000000A5
    case JJH =   0x000000000000A6
    case wJ =    0x000000000000A7
    case wJJ =   0x000000000000A8
    case Jw =    0x000000000000A9
    case JJw =   0x000000000000AA
    case C_ =    0x000000000000AB
    case CK =    0x000000000000AC
    case CH =    0x000000000000AD
    case wC =    0x000000000000AE
    case Cw =    0x000000000000AF
    case K_ =    0x000000000000B0
    case T_ =    0x000000000000B1
    case TT =    0x000000000000B2
    case P_ =    0x000000000000B3
    case PB =    0x000000000000B4
    case PS =    0x000000000000B5
    case PT =    0x000000000000B6
    case PH =    0x000000000000B7
    case PQ =    0x000000000000B8
    case H_ =    0x000000000000B9
    case HN =    0x000000000000BA
    case HR =    0x000000000000BB
    case HM =    0x000000000000BC
    case HB =    0x000000000000BD
    case HS =    0x000000000000BE
    case HH =    0x000000000000BF
    case X_ =    0x000000000000C0
    case XX =    0x000000000000C1
    
    case A_ =    0x00000000010000
    case AO =    0x00000000020000
    case AU =    0x00000000030000
    case AEU =   0x00000000040000
    case AE =    0x00000000050000
    case YA =    0x00000000060000
    case YAO =   0x00000000070000
    case YAYO =  0x00000000080000
    case YAU =   0x00000000090000
    case YAE =   0x000000000A0000
    case EO =    0x000000000B0000
    case EOO =   0x000000000C0000
    case EOU =   0x000000000D0000
    case EOEU =  0x000000000E0000
    case E_ =    0x000000000F0000
    case YEO =   0x00000000100000
    case YEOYA = 0x00000000110000
    case YEOO =  0x00000000120000
    case YEOU =  0x00000000130000
    case YE =    0x00000000140000
    case O_ =    0x00000000150000
    case WA =    0x00000000160000
    case WAE =   0x00000000170000
    case OYA =   0x00000000180000
    case OYAE =  0x00000000190000
    case OEO =   0x000000001A0000
    case OE =    0x000000001B0000
    case OYEO =  0x000000001C0000
    case OYE =   0x000000001D0000
    case OO =    0x000000001E0000
    case OOI =   0x000000001F0000
    case OU =    0x00000000200000
    case OI =    0x00000000210000
    case YO =    0x00000000220000
    case YOA =   0x00000000230000
    case YOAE =  0x00000000240000
    case YOYA =  0x00000000250000
    case YOYAE = 0x00000000260000
    case YOEO =  0x00000000270000
    case YOYEO = 0x00000000280000
    case YOO =   0x00000000290000
    case YOI =   0x000000002A0000
    case U_ =    0x000000002B0000
    case UA =    0x000000002C0000
    case UAE =   0x000000002D0000
    case UEO =   0x000000002E0000
    case UEOEU = 0x000000002F0000
    case WE =    0x00000000300000
    case UYEO =  0x00000000310000
    case UYE =   0x00000000320000
    case UU =    0x00000000330000
    case WI =    0x00000000340000
    case UII =   0x00000000350000
    case YU =    0x00000000360000
    case YUA =   0x00000000370000
    case YUAE =  0x00000000380000
    case YUEO =  0x00000000390000
    case YUE =   0x000000003A0000
    case YUYEO = 0x000000003B0000
    case YUYE =  0x000000003C0000
    case YUO =   0x000000003D0000
    case YUU =   0x000000003E0000
    case YUI =   0x000000003F0000
    case EU =    0x00000000400000
    case EUA =   0x00000000410000
    case EUEO =  0x00000000420000
    case EUE =   0x00000000430000
    case EUO =   0x00000000440000
    case EUU =   0x00000000450000
    case EUEU =  0x00000000460000
    case EUI =   0x00000000470000
    case EUIU =  0x00000000480000
    case I_ =    0x00000000490000
    case IA =    0x000000004A0000
    case IYA =   0x000000004B0000
    case IYAO =  0x000000004C0000
    case IYAE =  0x000000004D0000
    case IYEO =  0x000000004E0000
    case IYE =   0x000000004F0000
    case IO =    0x00000000500000
    case IOI =   0x00000000510000
    case IYO =   0x00000000520000
    case IU =    0x00000000530000
    case IYU =   0x00000000540000
    case IEU =   0x00000000550000
    case II =    0x00000000560000
    case IF =    0x00000000570000
    case F_ =    0x00000000580000
    case FA =    0x00000000590000
    case FEO =   0x000000005A0000
    case FE =    0x000000005B0000
    case FU =    0x000000005C0000
    case FI =    0x000000005D0000
    case FF =    0x000000005E0000
    
    case _G =    0x00000100000000
    case _GG =   0x00000200000000
    case _GN =   0x00000300000000
    case _GD =   0x00000400000000
    case _GR =   0x00000500000000
    case _GB =   0x00000600000000
    case _GS =   0x00000700000000
    case _GSG =  0x00000800000000
    case _GC =   0x00000900000000
    case _GK =   0x00000A00000000
    case _GH =   0x00000B00000000
    case _N =    0x00000C00000000
    case _NG =   0x00000D00000000
    case _NN =   0x00000E00000000
    case _ND =   0x00000F00000000
    case _NR =   0x00001000000000
    case _NB =   0x00001100000000
    case _NS =   0x00001200000000
    case _NZ =   0x00001300000000
    case _NJ =   0x00001400000000
    case _NC =   0x00001500000000
    case _NT =   0x00001600000000
    case _NH =   0x00001700000000
    case _D =    0x00001800000000
    case _DG =   0x00001900000000
    case _DD =   0x00001A00000000
    case _DDB =  0x00001B00000000
    case _DR =   0x00001C00000000
    case _DM =   0x00001D00000000
    case _DB =   0x00001E00000000
    case _DS =   0x00001F00000000
    case _DSG =  0x00002000000000
    case _DJ =   0x00002100000000
    case _DC =   0x00002200000000
    case _DT =   0x00002300000000
    case _R =    0x00002400000000
    case _RG =   0x00002500000000
    case _RGG =  0x00002600000000
    case _RGS =  0x00002700000000
    case _RGH =  0x00002800000000
    case _RN =   0x00002900000000
    case _RD =   0x00002A00000000
    case _RDD =  0x00002B00000000
    case _RDH =  0x00002C00000000
    case _RR =   0x00002D00000000
    case _RRK =  0x00002E00000000
    case _RM =   0x00002F00000000
    case _RMG =  0x00003000000000
    case _RMS =  0x00003100000000
    case _RMH =  0x00003200000000
    case _RB =   0x00003300000000
    case _RBD =  0x00003400000000
    case _RBB =  0x00003500000000
    case _RBS =  0x00003600000000
    case _RBP =  0x00003700000000
    case _RBH =  0x00003800000000
    case _RBQ =  0x00003900000000
    case _RS =   0x00003A00000000
    case _RSS =  0x00003B00000000
    case _RZ =   0x00003C00000000
    case _RV =   0x00003D00000000
    case _RJ =   0x00003E00000000
    case _RK =   0x00003F00000000
    case _RT =   0x00004000000000
    case _RP =   0x00004100000000
    case _RH =   0x00004200000000
    case _RX =   0x00004300000000
    case _RXH =  0x00004400000000
    case _RQ =   0x00004500000000
    case _M =    0x00004600000000
    case _MG =   0x00004700000000
    case _MN =   0x00004800000000
    case _MNN =  0x00004900000000
    case _MD =   0x00004A00000000
    case _MR =   0x00004B00000000
    case _MM =   0x00004C00000000
    case _MB =   0x00004D00000000
    case _MBS =  0x00004E00000000
    case _MS =   0x00004F00000000
    case _MSS =  0x00005000000000
    case _MZ =   0x00005100000000
    case _MJ =   0x00005200000000
    case _MC =   0x00005300000000
    case _MH =   0x00005400000000
    case _MQ =   0x00005500000000
    case _B =    0x00005600000000
    case _BG =   0x00005700000000
    case _BN =   0x00005800000000
    case _BD =   0x00005900000000
    case _BR =   0x00005A00000000
    case _BRP =  0x00005B00000000
    case _BM =   0x00005C00000000
    case _BB =   0x00005D00000000
    case _BS =   0x00005E00000000
    case _BSG =  0x00005F00000000
    case _BSD =  0x00006000000000
    case _BSB =  0x00006100000000
    case _BSS =  0x00006200000000
    case _BSJ =  0x00006300000000
    case _BST =  0x00006400000000
    case _BJ =   0x00006500000000
    case _BC =   0x00006600000000
    case _BK =   0x00006700000000
    case _BT =   0x00006800000000
    case _BP =   0x00006900000000
    case _BH =   0x00006A00000000
    case _BQ =   0x00006B00000000
    case _BBQ =  0x00006C00000000
    case _S =    0x00006D00000000
    case _SG =   0x00006E00000000
    case _SN =   0x00006F00000000
    case _SD =   0x00007000000000
    case _SR =   0x00007100000000
    case _SM =   0x00007200000000
    case _SB =   0x00007300000000
    case _SBG =  0x00007400000000
    case _SBQ =  0x00007500000000
    case _SS =   0x00007600000000
    case _SSG =  0x00007700000000
    case _SSD =  0x00007800000000
    case _SSB =  0x00007900000000
    case _SSS =  0x00007A00000000
    case _SZ =   0x00007B00000000
    case _SQ =   0x00007C00000000
    case _SJ =   0x00007D00000000
    case _SC =   0x00007E00000000
    case _SK =   0x00007F00000000
    case _ST =   0x00008000000000
    case _SP =   0x00008100000000
    case _SH =   0x00008200000000
    case _wS =   0x00008300000000
    case _wSS =  0x00008400000000
    case _Sw =   0x00008500000000
    case _SSw =  0x00008600000000
    case _Z =    0x00008700000000
    case _ZB =   0x00008800000000
    case _ZBQ =  0x00008900000000
    case _Q =    0x00008A00000000
    case _QG =   0x00008B00000000
    case _QD =   0x00008C00000000
    case _QR =   0x00008D00000000
    case _QM =   0x00008E00000000
    case _QB =   0x00008F00000000
    case _QS =   0x00009000000000
    case _QZ =   0x00009100000000
    case _QQ =   0x00009200000000
    case _QJ =   0x00009300000000
    case _QC =   0x00009400000000
    case _QT =   0x00009500000000
    case _QP =   0x00009600000000
    case _QH =   0x00009700000000
    case _V =    0x00009800000000
    case _VG =   0x00009900000000
    case _VGG =  0x00009A00000000
    case _VM =   0x00009B00000000
    case _VS =   0x00009C00000000
    case _VZ =   0x00009D00000000
    case _VV =   0x00009E00000000
    case _VK =   0x00009F00000000
    case _VH =   0x0000A000000000
    case _J =    0x0000A100000000
    case _JB =   0x0000A200000000
    case _JBB =  0x0000A300000000
    case _JQ =   0x0000A400000000
    case _JJ =   0x0000A500000000
    case _JJH =  0x0000A600000000
    case _wJ =   0x0000A700000000
    case _wJJ =  0x0000A800000000
    case _Jw =   0x0000A900000000
    case _JJw =  0x0000AA00000000
    case _C =    0x0000AB00000000
    case _CK =   0x0000AC00000000
    case _CH =   0x0000AD00000000
    case _wC =   0x0000AE00000000
    case _Cw =   0x0000AF00000000
    case _K =    0x0000B000000000
    case _T =    0x0000B100000000
    case _TT =   0x0000B200000000
    case _P =    0x0000B300000000
    case _PB =   0x0000B400000000
    case _PS =   0x0000B500000000
    case _PT =   0x0000B600000000
    case _PH =   0x0000B700000000
    case _PQ =   0x0000B800000000
    case _H =    0x0000B900000000
    case _HN =   0x0000BA00000000
    case _HR =   0x0000BB00000000
    case _HM =   0x0000BC00000000
    case _HB =   0x0000BD00000000
    case _HS =   0x0000BE00000000
    case _HH =   0x0000BF00000000
    case _X =    0x0000C000000000
    case _XX =   0x0000C100000000
    
    case H3 =    0x01000000000000
    case H2 =    0x02000000000000
    case C0 =    0x03000000000000
    case A3 =    0x05000000000000
    case H21 =   0x06000000000000
    case H12 =   0x07000000000000
    case C1 =    0x08000000000000
    case KY =    0x09000000000000
    case H2J =   0x10000000000000
    
    static func fromLabel(_ label: String) -> Self? {
        return self.allCases.first{ "\($0)" == label }
    }
}

typealias Environment = [String: Int64]

indirect enum Expression: Codable {
    case constant(_ value: Int64)
    
    case positive(_ value: Expression)
    case negative(_ value: Expression)
    
    case arithmeticAdd(_ lhs: Expression, _ rhs: Expression)
    case arithmeticSub(_ lhs: Expression, _ rhs: Expression)
    case arithmeticMul(_ lhs: Expression, _ rhs: Expression)
    case arithmeticDiv(_ lhs: Expression, _ rhs: Expression)
    case arithmeticMod(_ lhs: Expression, _ rhs: Expression)
    
    case preIncrement(_ name: String)
    case postIncrement(_ name: String)
    case preDecrement(_ name: String)
    case postDecrement(_ name: String)
    
    case comparisonEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonNotEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonLessThan(_ lhs: Expression, _ rhs: Expression)
    case comparisonLessThanOrEqual(_ lhs: Expression, _ rhs: Expression)
    case comparisonGreaterThan(_ lhs: Expression, _ rhs: Expression)
    case comparisonGreaterThanOrEqual(_ lhs: Expression, _ rhs: Expression)
    
    case bitShiftLeft(_ lhs: Expression, _ rhs: Expression)
    case bitShiftRight(_ lhs: Expression, _ rhs: Expression)
    
    case bitwiseNot(_ value: Expression)
    case bitwiseAnd(_ lhs: Expression, _ rhs: Expression)
    case bitwiseOr(_ lhs: Expression, _ rhs: Expression)
    case bitwiseXor(_ lhs: Expression, _ rhs: Expression)
    
    case logicalNot(_ value: Expression)
    case logicalAnd(_ lhs: Expression, _ rhs: Expression)
    case logicalOr(_ lhs: Expression, _ rhs: Expression)
    
    case value(_ name: String)
    case assign(_ name: String, _ value: Expression)
    
    case sequence(_ lhs: Expression, _ rhs: Expression)
    
    case conditional(condition: Expression, onTrue: Expression, onFalse: Expression)
    
    
    func eval(env: inout Environment) -> Int64 {
        switch self {
        case .constant(let value): return value
            
        case .positive(let value): return value.eval(env: &env)
        case .negative(let value): return -value.eval(env: &env)
            
        case .arithmeticAdd(let lhs, let rhs): return lhs.eval(env: &env) + rhs.eval(env: &env)
        case .arithmeticSub(let lhs, let rhs): return lhs.eval(env: &env) - rhs.eval(env: &env)
        case .arithmeticMul(let lhs, let rhs): return lhs.eval(env: &env) * rhs.eval(env: &env)
        case .arithmeticDiv(let lhs, let rhs): return lhs.eval(env: &env) / rhs.eval(env: &env)
        case .arithmeticMod(let lhs, let rhs): return lhs.eval(env: &env) % rhs.eval(env: &env)
            
        case .preIncrement(let name):
            let value = env[name] ?? 0
            env[name] = value + 1
            return value + 1
        case .postIncrement(let name):
            let value = env[name] ?? 0
            env[name] = value + 1
            return value
        case .preDecrement(let name):
            let value = env[name] ?? 0
            env[name] = value - 1
            return value - 1
        case .postDecrement(let name):
            let value = env[name] ?? 0
            env[name] = value - 1
            return value
            
        case .comparisonEqual(let lhs, let rhs): return lhs.eval(env: &env) == rhs.eval(env: &env) ? 1 : 0
        case .comparisonNotEqual(let lhs, let rhs): return lhs.eval(env: &env) != rhs.eval(env: &env) ? 1 : 0
        case .comparisonLessThan(let lhs, let rhs): return lhs.eval(env: &env) < rhs.eval(env: &env) ? 1 : 0
        case .comparisonLessThanOrEqual(let lhs, let rhs): return lhs.eval(env: &env) <= rhs.eval(env: &env) ? 1 : 0
        case .comparisonGreaterThan(let lhs, let rhs): return lhs.eval(env: &env) > rhs.eval(env: &env) ? 1 : 0
        case .comparisonGreaterThanOrEqual(let lhs, let rhs): return lhs.eval(env: &env) >= rhs.eval(env: &env) ? 1 : 0
            
        case .bitShiftLeft(let lhs, let rhs): return Int64(UInt64(lhs.eval(env: &env)) << UInt64(rhs.eval(env: &env)))
        case .bitShiftRight(let lhs, let rhs): return Int64(UInt64(lhs.eval(env: &env)) >> UInt64(rhs.eval(env: &env)))
            
        case .bitwiseNot(let value): return ~value.eval(env: &env)
        case .bitwiseAnd(let lhs, let rhs): return lhs.eval(env: &env) & rhs.eval(env: &env)
        case .bitwiseOr(let lhs, let rhs): return lhs.eval(env: &env) | rhs.eval(env: &env)
        case .bitwiseXor(let lhs, let rhs): return lhs.eval(env: &env) ^ rhs.eval(env: &env)
            
        case .logicalNot(let value): return value.eval(env: &env) == 0 ? 1 : 0
        case .logicalAnd(let lhs, let rhs): return lhs.eval(env: &env) != 0 && rhs.eval(env: &env) != 0 ? 1 : 0
        case .logicalOr(let lhs, let rhs): return lhs.eval(env: &env) != 0 || rhs.eval(env: &env) != 0 ? 1 : 0
            
        case .value(let name): return env[name] ?? 0
        case .assign(let name, let value):
            let evaluatedValue = value.eval(env: &env)
            env[name] = evaluatedValue
            return evaluatedValue
            
        case .sequence(let lhs, let rhs):
            let _ = lhs.eval(env: &env)
            return rhs.eval(env: &env)
            
        case .conditional(condition: let condition, onTrue: let onTrue, onFalse: let onFalse):
            let evaluatedCondition = condition.eval(env: &env)
            if evaluatedCondition != 0 {
                return onTrue.eval(env: &env)
            } else {
                return onFalse.eval(env: &env)
            }
        }
    }
    
    func stringify() -> String {
        switch self {
        case .constant(let c): return String(c)
            
        case .positive(let value): return "(+\(value.stringify()))"
        case .negative(let value): return "(-\(value.stringify()))"
            
        case .arithmeticAdd(let lhs, let rhs): return "(\(lhs.stringify()) + \(rhs.stringify()))"
        case .arithmeticSub(let lhs, let rhs): return "(\(lhs.stringify()) - \(rhs.stringify()))"
        case .arithmeticMul(let lhs, let rhs): return "(\(lhs.stringify()) * \(rhs.stringify()))"
        case .arithmeticDiv(let lhs, let rhs): return "(\(lhs.stringify()) / \(rhs.stringify()))"
        case .arithmeticMod(let lhs, let rhs): return "(\(lhs.stringify()) % \(rhs.stringify()))"
            
        case .preIncrement(let name): return "(++\(name))"
        case .postIncrement(let name): return "(\(name)++)"
        case .preDecrement(let name): return "(--\(name))"
        case .postDecrement(let name): return "(\(name)--)"
            
        case .comparisonEqual(let lhs, let rhs): return "(\(lhs.stringify()) == \(rhs.stringify()))"
        case .comparisonNotEqual(let lhs, let rhs): return "(\(lhs.stringify()) != \(rhs.stringify()))"
        case .comparisonLessThan(let lhs, let rhs): return "(\(lhs.stringify()) < \(rhs.stringify()))"
        case .comparisonLessThanOrEqual(let lhs, let rhs): return "(\(lhs.stringify()) <= \(rhs.stringify()))"
        case .comparisonGreaterThan(let lhs, let rhs): return "(\(lhs.stringify()) > \(rhs.stringify()))"
        case .comparisonGreaterThanOrEqual(let lhs, let rhs): return "(\(lhs.stringify()) >= \(rhs.stringify()))"
            
        case .bitShiftLeft(let lhs, let rhs): return "(\(lhs.stringify()) << \(rhs.stringify()))"
        case .bitShiftRight(let lhs, let rhs): return "(\(lhs.stringify()) >> \(rhs.stringify()))"
            
        case .bitwiseNot(let value): return "(~\(value.stringify()))"
        case .bitwiseAnd(let lhs, let rhs): return "(\(lhs.stringify()) & \(rhs.stringify()))"
        case .bitwiseOr(let lhs, let rhs): return "(\(lhs.stringify()) | \(rhs.stringify()))"
        case .bitwiseXor(let lhs, let rhs): return "(\(lhs.stringify()) ^ \(rhs.stringify()))"
            
        case .logicalNot(let value): return "(!\(value.stringify()))"
        case .logicalAnd(let lhs, let rhs): return "(\(lhs.stringify()) && \(rhs.stringify()))"
        case .logicalOr(let lhs, let rhs): return "(\(lhs.stringify()) || \(rhs.stringify()))"
            
        case .value(let name): return name
        case .assign(let lhs, let rhs): return "(\(lhs) = \(rhs.stringify()))"
            
        case .sequence(let lhs, let rhs): return "(\(lhs.stringify()), \(rhs.stringify()))"
            
        case .conditional(let condition, let onTrue, let onFalse): return "(\(condition.stringify()) ? \(onTrue.stringify()) : \(onFalse.stringify()))"
            
//        default: fatalError("Not implemented")
        }
    }
    
    private enum Token: Equatable {
        case constant(String)
        case variable(String)
        case assign
        
        case sequence
        
        case lparen
        case rparen
        
        case equal
        case notEqual
        case greater
        case greaterOrEqual
        case less
        case lessOrEqual
        
        case leftShift
        case leftShiftAssign
        case rightShift
        case rightShiftAssign
        
        case increment
        case decrement
        
        case add
        case addAssign
        case sub
        case subAssign
        case multiply
        case multiplyAssign
        case divide
        case divideAssign
        case modular
        case modularAssign
        
        case positive
        case negative
        
        case logicalNot
        case logicalAnd
        case logicalOr
        
        case bitwiseNot
        case bitwiseAnd
        case bitwiseAndAssign
        case bitwiseOr
        case bitwiseOrAssign
        case bitwiseXor
        case bitwiseXorAssign
        
        case conditionalQuestion
        case conditionalColon
        
        var priority: Int {
            switch self {
            case .logicalNot, .bitwiseNot, .positive, .negative:
                return 11
            case .increment, .decrement:
                return 10
            case .multiply, .divide, .modular:
                return 9
            case .add, .sub:
                return 8
            case .leftShift, .rightShift:
                return 7
            case .greater, .greaterOrEqual, .less, .lessOrEqual:
                return 6
            case .equal, .notEqual:
                return 5
            case .bitwiseAnd, .bitwiseOr, .bitwiseXor:
                return 4
            case .logicalAnd, .logicalOr:
                return 3
            case .conditionalColon, .conditionalQuestion:
                return 2
            case .assign, .addAssign, .subAssign, .multiplyAssign, .divideAssign, .modularAssign, .leftShiftAssign, .rightShiftAssign, .bitwiseAndAssign, .bitwiseOrAssign, .bitwiseXorAssign:
                return 1
            case .sequence: return 0
            default: return -1
            }
        }
    }
    private static func tokenize(_ string: String) -> [Token] {
        let chars = Array(string)
        var tokens = [Token]()
        
        var skipTokens = 0
        for (index, char) in chars.enumerated() {
            if skipTokens > 0 {
                skipTokens -= 1
                continue
            }
            
            var currentStringLength = 5
            while currentStringLength > 1 {
                guard index + currentStringLength <= chars.count else {
                    currentStringLength -= 1
                    continue
                }
                let testString = String(chars[index..<(index + currentStringLength)])
                if JamoConstant.fromLabel(testString) != nil {
                    tokens.append(.constant(testString))
                    skipTokens = currentStringLength - 1
                    break
                }
                
                currentStringLength -= 1
            }
            if skipTokens > 0 {
                continue
            }
            
            switch char {
            case Character("("): tokens.append(.lparen)
            case Character(")"): tokens.append(.rparen)
            case Character(","): tokens.append(.sequence)
            case Character(" "): break
                
            case Character("~"): tokens.append(.bitwiseNot)
                
            case Character("?"): tokens.append(.conditionalQuestion)
            case Character(":"): tokens.append(.conditionalColon)
                
            case Character("<"): // <<= << <= <
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.less)
                    continue
                }
                switch chars[index + 1] {
                case Character("<"):
                    guard index + 2 < chars.count else {
                        // Syntax Error
                        tokens.append(.leftShift)
                        skipTokens = 1
                        continue
                    }
                    switch chars[index + 2] {
                    case Character("="):
                        tokens.append(.leftShiftAssign)
                        skipTokens = 2
                    default:
                        tokens.append(.leftShift)
                        skipTokens = 1
                        continue
                    }
                case Character("="):
                    tokens.append(.lessOrEqual)
                    skipTokens = 1
                    continue
                default: tokens.append(.less)
                }
                
            case Character(">"): // >>= >> >= >
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.greater)
                    continue
                }
                switch chars[index + 1] {
                case Character(">"):
                    guard index + 2 < chars.count else {
                        // Syntax Error
                        tokens.append(.rightShift)
                        skipTokens = 1
                        continue
                    }
                    switch chars[index + 2] {
                    case Character("="):
                        tokens.append(.rightShiftAssign)
                        skipTokens = 2
                    default:
                        tokens.append(.rightShift)
                        skipTokens = 1
                        continue
                    }
                case Character("="):
                    tokens.append(.greaterOrEqual)
                    skipTokens = 1
                    continue
                default: tokens.append(.greater)
                }
                
            case Character("+"): // ++ += +
                guard index + 1 < chars.count else {
                    // Syntax Error
                    switch tokens[tokens.count - 1] {
                    case .rparen, .constant(_), .variable(_):
                        tokens.append(.add)
                    default:
                        tokens.append(.positive)
                    }
                    continue
                }
                switch chars[index + 1] {
                case Character("+"):
                    tokens.append(.increment)
                    skipTokens = 1
                    continue
                case Character("="):
                    tokens.append(.addAssign)
                    skipTokens = 1
                default:
                    switch tokens[tokens.count - 1] {
                    case .rparen, .constant(_), .variable(_):
                        tokens.append(.add)
                    default:
                        tokens.append(.positive)
                    }
                }
                
            case Character("-"): // -- -= -
                guard index + 1 < chars.count else {
                    // Syntax Error
                    switch tokens[tokens.count - 1] {
                    case .rparen, .constant(_), .variable(_):
                        tokens.append(.sub)
                    default:
                        tokens.append(.negative)
                    }
                    continue
                }
                switch chars[index + 1] {
                case Character("-"):
                    tokens.append(.decrement)
                    skipTokens = 1
                    continue
                case Character("="):
                    tokens.append(.subAssign)
                    skipTokens = 1
                default:
                    switch tokens[tokens.count - 1] {
                    case .rparen, .constant(_), .variable(_):
                        tokens.append(.sub)
                    default:
                        tokens.append(.negative)
                    }
                }
                
            case Character("&"): // && &= &
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.bitwiseAnd)
                    continue
                }
                switch chars[index + 1] {
                case Character("&"):
                    tokens.append(.logicalAnd)
                    skipTokens = 1
                    continue
                case Character("="):
                    tokens.append(.bitwiseAndAssign)
                    skipTokens = 1
                default: tokens.append(.bitwiseAnd)
                }
                
            case Character("|"): // || |= |
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.bitwiseOr)
                    continue
                }
                switch chars[index + 1] {
                case Character("|"):
                    tokens.append(.logicalOr)
                    skipTokens = 1
                    continue
                case Character("="):
                    tokens.append(.bitwiseOrAssign)
                    skipTokens = 1
                default: tokens.append(.bitwiseOr)
                }
                
            case Character("="): // == =
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.assign)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.equal)
                    skipTokens = 1
                default: tokens.append(.assign)
                }
                
            case Character("*"): // *= *
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.multiply)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.multiplyAssign)
                    skipTokens = 1
                default: tokens.append(.multiply)
                }
                
            case Character("/"): // /= /
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.divide)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.divideAssign)
                    skipTokens = 1
                default: tokens.append(.divide)
                }
                
            case Character("%"): // %= %
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.modular)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.modularAssign)
                    skipTokens = 1
                default: tokens.append(.modular)
                }
                
            case Character("!"): // != !
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.logicalNot)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.notEqual)
                    skipTokens = 1
                default: tokens.append(.logicalNot)
                }
                
            case Character("^"): // ^= ^
                guard index + 1 < chars.count else {
                    // Syntax Error
                    tokens.append(.bitwiseXor)
                    continue
                }
                switch chars[index + 1] {
                case Character("="):
                    tokens.append(.bitwiseXorAssign)
                    skipTokens = 1
                default: tokens.append(.bitwiseXor)
                }
                
            case Character("'"):
                let endIndex = chars[(index + 1)...].firstIndex(where: { $0 == Character("'") })
                guard let endIndex = endIndex else {
                    fatalError("Error: Syntax error at column \(index)")
                }
                tokens.append(.constant("'" + String(chars[(index + 1)..<endIndex] + "'")))
                skipTokens = endIndex
                continue
                
                // Constants & Variables
            case Character("0"):
                guard index + 1 < chars.count else {
                    tokens.append(.constant("0"))
                    continue
                }
                switch chars[index + 1] {
                case Character("x"):
                    guard index + 2 < chars.count else {
                        fatalError("Error: Syntax error at column \(index)")
                    }
                    let endIndex = chars[(index + 2)...].firstIndex(where: { !$0.isHexDigit }) ?? chars.count
                    tokens.append(.constant("0x" + String(chars[(index + 2)..<endIndex])))
                    skipTokens = endIndex + 1
                default:
                    let endIndex = chars[index...].firstIndex(where: { !$0.isNumber }) ?? chars.count
                    tokens.append(.constant(String(chars[index..<endIndex])))
                    skipTokens = endIndex - 1
                }
                
            case Character("1"), Character("2"), Character("3"), Character("4"), Character("5"), Character("6"), Character("7"), Character("8"), Character("9"):
                let endIndex = chars[index...].firstIndex(where: { !$0.isNumber }) ?? chars.count
                tokens.append(.constant(String(chars[index..<endIndex])))
                skipTokens = (endIndex - index - 1)
                
            case Character("A"), Character("B"), Character("C"), Character("D"), Character("E"), Character("F"), Character("G"), Character("H"), Character("I"), Character("J"), Character("K"), Character("L"), Character("M"), Character("N"), Character("O"), Character("P"), Character("Q"), Character("R"), Character("S"), Character("T"), Character("U"), Character("V"), Character("W"), Character("X"), Character("Y"), Character("Z"), Character("a"), Character("b"), Character("c"), Character("d"), Character("e"), Character("f"), Character("g"), Character("h"), Character("i"), Character("j"), Character("k"), Character("l"), Character("m"), Character("n"), Character("o"), Character("p"), Character("q"), Character("r"), Character("s"), Character("t"), Character("u"), Character("v"), Character("w"), Character("x"), Character("y"), Character("z"):
                guard index + 1 < chars.count else {
                    tokens.append(.variable(String(char)))
                    continue
                }
                let nextChar = chars[index + 1]
                if Array("+-*/%|&^<>=()?:,~!' ").contains(nextChar) {
                    tokens.append(.variable(String(char)))
                    continue
                }
                fatalError("Error: Syntax error at column \(index)")
                
            default: fatalError("Error: Invalid character at column \(index)")
            }
        }
        return tokens
    }
    private static func parseTokens(_ tokens: [Token]) -> Expression {
        if tokens.count < 1 {
            fatalError("Error: Invalid empty expression")
        }
        
        // Check parentheses count
        var parentheses: [(Int, Int)] = []
        var ternaryOperators: [(Int, Int)] = []
        var operators: [Int] = []
        var bracketCount = 0
        var ternaryOperatorsCount = 0
        var currentOpenIndex: Int? = nil
        var currentQuestionIndex: Int? = nil
        for (index, token) in tokens.enumerated() {
            switch token {
            case .lparen:
                if bracketCount == 0 { currentOpenIndex = index }
                bracketCount += 1
            case .rparen:
                bracketCount -= 1
                if bracketCount == 0 {
                    parentheses.append((currentOpenIndex!, index))
                }
            case .conditionalQuestion:
                if bracketCount == 0, ternaryOperatorsCount == 0 {
                    currentQuestionIndex = index
                    operators.append(index)
                }
                ternaryOperatorsCount += 1
            case .conditionalColon:
                ternaryOperatorsCount -= 1
                if bracketCount == 0, ternaryOperatorsCount == 0 {
                    ternaryOperators.append((currentQuestionIndex!, index))
                    operators.append(index)
                }
            default:
                if bracketCount == 0 {
                    switch token {
                    case .constant(_), .variable(_): break
                    default: operators.append(index)
                    }
                }
            }
            if bracketCount < 0 {
                fatalError("Error: Extra closing parenthesis.")
            }
            if ternaryOperatorsCount < 0 {
                fatalError("Error: Extra colons.")
            }
        }
        if bracketCount != 0 {
            fatalError("Error: Extra opening parenthesis.")
        }
        if ternaryOperatorsCount != 0 {
            fatalError("Error: Extra question marks.")
        }
        
        // Find the first operator with the lowest priority
        var lowestPriority = 100
        var lowestOperatorIndex = -1
        for index in operators {
            if tokens[index].priority < lowestPriority {
                lowestPriority = tokens[index].priority
                lowestOperatorIndex = index
            }
        }
        
        // If operator is not found, either (i) the entire expression is grouped by parenthesis or (2) the entire expression is a single constant or a single variable
        if lowestOperatorIndex < 0 {
            if tokens[0] == .lparen && tokens[tokens.count - 1] == .rparen {
                return parseTokens(Array(tokens[1..<tokens.count - 1]))
            } else if tokens.count == 1 {
                switch tokens[0] {
                case .constant(let value):
                    if value.count > 2 && value[value.startIndex..<(value.index(value.startIndex, offsetBy: 2))] == "0x" {
                        // 16진수 리터럴
                        let result = Int64(value[value.index(value.startIndex, offsetBy: 2)...], radix: 16)
                        guard let result = result else {
                            fatalError("Error: Syntax error while converting hexadecimal string '\(value)' to Int64.")
                        }
                        return Expression.constant(result)
                    }
                    if let number = Int64(value) {
                        // 10진수 리터럴
                        return Expression.constant(number)
                    } else if let result = JamoConstant.fromLabel(value) {
                        // 상수
                        return Expression.constant(result.rawValue)
                    } else if value == "''" {
                        // 문자 리터럴 -- 작은따옴표
                        return Expression.constant(0x27)
                    } else if value[value.startIndex] == "'", value[value.index(value.endIndex, offsetBy: -1)] == "'", value.count == 3 {
                        let character: Character = value[value.index(value.startIndex, offsetBy: 1)]
                        guard let scalar = character.unicodeScalars.first else {
                            fatalError("Something went wrong with character literal")
                        }
                        return Expression.constant(Int64(scalar.value))
                    }
                    fatalError("Something went wrong with constant literal")
                case .variable(let name):
                    return Expression.value(name)
                default:
                    fatalError("Error: Syntax error.")
                }
            } else {
                fatalError("Error: Syntax error.")
            }
        }
        
        let operatorToken = tokens[lowestOperatorIndex]
        let lhs = parentheses.count > 0 && (0 == parentheses[0].0 && lowestOperatorIndex - 1 == parentheses[0].1)
            ? Array(tokens[1..<lowestOperatorIndex - 1]) : Array(tokens[0..<lowestOperatorIndex])
        let rhs = parentheses.count > 0 && (lowestOperatorIndex + 1 == parentheses[parentheses.count - 1].0 && tokens.count == parentheses[parentheses.count - 1].1)
            ? Array(tokens[(lowestOperatorIndex + 2)..<(tokens.count - 1)])
            : Array(tokens[(lowestOperatorIndex + 1)..<tokens.count])
        
        var variableName, rightVariableName: String?
        switch lhs[0] {
        case .variable(let name): variableName = name
        default: break
        }
        switch rhs[0] {
        case .variable(let name): rightVariableName = name
        default: break
        }
        
        switch operatorToken {
        case .sequence:
            return Expression.sequence(parseTokens(lhs), parseTokens(rhs))
            
        case .assign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, parseTokens(rhs))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .addAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .arithmeticAdd(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .subAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .arithmeticSub(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .multiplyAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .arithmeticMul(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .divideAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .arithmeticDiv(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .modularAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .arithmeticMod(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .leftShiftAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .bitShiftLeft(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .rightShiftAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .bitShiftRight(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .bitwiseAndAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .bitwiseAnd(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .bitwiseOrAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .bitwiseOr(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
        case .bitwiseXorAssign:
            if lhs.count == 1, let variableName = variableName {
                return Expression.assign(variableName, .bitwiseXor(.value(variableName), parseTokens(rhs)))
            }
            fatalError("Error: Left-hand side of assignment operator cannot be a non-variable expression.")
            
        case .conditionalQuestion:
            let colonIndex = ternaryOperators[0].1
            let trueTokens = tokens[lowestOperatorIndex + 1] == .lparen && tokens[colonIndex - 1] == .rparen
                ? Array(tokens[(lowestOperatorIndex + 2)...(colonIndex - 2)])
                : Array(tokens[(lowestOperatorIndex + 1)...(colonIndex - 1)])
            let falseTokens = tokens[colonIndex + 1] == .lparen && tokens[tokens.count - 1] == .rparen
                ? Array(tokens[(colonIndex + 2)...(tokens.count - 2)])
                : Array(tokens[(colonIndex + 1)...(tokens.count - 1)])
            return Expression.conditional(condition: parseTokens(lhs), onTrue: parseTokens(trueTokens), onFalse: parseTokens(falseTokens))
        case .conditionalColon:
            fatalError("Error: Extra colon for ternary operator.")
            
        case .logicalAnd:
            return Expression.logicalAnd(parseTokens(lhs), parseTokens(rhs))
        case .logicalOr:
            return Expression.logicalOr(parseTokens(lhs), parseTokens(rhs))
            
        case .bitwiseAnd:
            return Expression.bitwiseAnd(parseTokens(lhs), parseTokens(rhs))
        case .bitwiseOr:
            return Expression.bitwiseOr(parseTokens(lhs), parseTokens(rhs))
        case .bitwiseXor:
            return Expression.bitwiseXor(parseTokens(lhs), parseTokens(rhs))
            
        case .equal:
            return Expression.comparisonEqual(parseTokens(lhs), parseTokens(rhs))
        case .notEqual:
            return Expression.comparisonNotEqual(parseTokens(lhs), parseTokens(rhs))
        case .less:
            return Expression.comparisonLessThan(parseTokens(lhs), parseTokens(rhs))
        case .lessOrEqual:
            return Expression.comparisonLessThanOrEqual(parseTokens(lhs), parseTokens(rhs))
        case .greater:
            return Expression.comparisonGreaterThan(parseTokens(lhs), parseTokens(rhs))
        case .greaterOrEqual:
            return Expression.comparisonGreaterThanOrEqual(parseTokens(lhs), parseTokens(rhs))
            
        case .leftShift:
            return Expression.bitShiftLeft(parseTokens(lhs), parseTokens(rhs))
        case .rightShift:
            return Expression.bitShiftRight(parseTokens(lhs), parseTokens(rhs))
            
        case .add:
            return Expression.arithmeticAdd(parseTokens(lhs), parseTokens(rhs))
        case .sub:
            return Expression.arithmeticSub(parseTokens(lhs), parseTokens(rhs))
            
        case .multiply:
            return Expression.arithmeticMul(parseTokens(lhs), parseTokens(rhs))
        case .divide:
            return Expression.arithmeticDiv(parseTokens(lhs), parseTokens(rhs))
        case .modular:
            return Expression.arithmeticMod(parseTokens(lhs), parseTokens(rhs))
            
        case .increment:
            if lhs.count == 1, rhs.count == 0, let variableName = variableName {
                return Expression.postIncrement(variableName)
            } else if lhs.count == 0, rhs.count == 1, let rightVariableName = rightVariableName {
                return Expression.preIncrement(rightVariableName)
            }
            fatalError("Error: Increment operator syntax")
        case .decrement:
            if lhs.count == 1, rhs.count == 0, let variableName = variableName {
                return Expression.postDecrement(variableName)
            } else if lhs.count == 0, rhs.count == 1, let rightVariableName = rightVariableName {
                return Expression.preDecrement(rightVariableName)
            }
            fatalError("Error: Increment operator syntax")
            
        case .logicalNot:
            return Expression.logicalNot(parseTokens(rhs))
        case .bitwiseNot:
            return Expression.bitwiseNot(parseTokens(rhs))
        case .positive:
            return Expression.positive(parseTokens(rhs))
        case .negative:
            return Expression.negative(parseTokens(rhs))
            
        case .variable(_), .constant(_), .lparen, .rparen:
            fatalError("Something went wrong")
        }
    }
    static func parse(_ string: String) -> Expression {
        let tokens = self.tokenize(string)
        return parseTokens(tokens)
    }
}
