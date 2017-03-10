/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Target Register Enum Values                                                *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/


#ifdef GET_REGINFO_ENUM
#undef GET_REGINFO_ENUM

namespace llvm {

class MCRegisterClass;
extern const MCRegisterClass SystemZMCRegisterClasses[];

namespace SystemZ {
enum {
  NoRegister,
  CC = 1,
  V0 = 2,
  V1 = 3,
  V2 = 4,
  V3 = 5,
  V4 = 6,
  V5 = 7,
  V6 = 8,
  V7 = 9,
  V8 = 10,
  V9 = 11,
  V10 = 12,
  V11 = 13,
  V12 = 14,
  V13 = 15,
  V14 = 16,
  V15 = 17,
  V16 = 18,
  V17 = 19,
  V18 = 20,
  V19 = 21,
  V20 = 22,
  V21 = 23,
  V22 = 24,
  V23 = 25,
  V24 = 26,
  V25 = 27,
  V26 = 28,
  V27 = 29,
  V28 = 30,
  V29 = 31,
  V30 = 32,
  V31 = 33,
  F0D = 34,
  F1D = 35,
  F2D = 36,
  F3D = 37,
  F4D = 38,
  F5D = 39,
  F6D = 40,
  F7D = 41,
  F8D = 42,
  F9D = 43,
  F10D = 44,
  F11D = 45,
  F12D = 46,
  F13D = 47,
  F14D = 48,
  F15D = 49,
  F16D = 50,
  F17D = 51,
  F18D = 52,
  F19D = 53,
  F20D = 54,
  F21D = 55,
  F22D = 56,
  F23D = 57,
  F24D = 58,
  F25D = 59,
  F26D = 60,
  F27D = 61,
  F28D = 62,
  F29D = 63,
  F30D = 64,
  F31D = 65,
  F0Q = 66,
  F1Q = 67,
  F4Q = 68,
  F5Q = 69,
  F8Q = 70,
  F9Q = 71,
  F12Q = 72,
  F13Q = 73,
  F0S = 74,
  F1S = 75,
  F2S = 76,
  F3S = 77,
  F4S = 78,
  F5S = 79,
  F6S = 80,
  F7S = 81,
  F8S = 82,
  F9S = 83,
  F10S = 84,
  F11S = 85,
  F12S = 86,
  F13S = 87,
  F14S = 88,
  F15S = 89,
  F16S = 90,
  F17S = 91,
  F18S = 92,
  F19S = 93,
  F20S = 94,
  F21S = 95,
  F22S = 96,
  F23S = 97,
  F24S = 98,
  F25S = 99,
  F26S = 100,
  F27S = 101,
  F28S = 102,
  F29S = 103,
  F30S = 104,
  F31S = 105,
  R0D = 106,
  R1D = 107,
  R2D = 108,
  R3D = 109,
  R4D = 110,
  R5D = 111,
  R6D = 112,
  R7D = 113,
  R8D = 114,
  R9D = 115,
  R10D = 116,
  R11D = 117,
  R12D = 118,
  R13D = 119,
  R14D = 120,
  R15D = 121,
  R0H = 122,
  R1H = 123,
  R2H = 124,
  R3H = 125,
  R4H = 126,
  R5H = 127,
  R6H = 128,
  R7H = 129,
  R8H = 130,
  R9H = 131,
  R10H = 132,
  R11H = 133,
  R12H = 134,
  R13H = 135,
  R14H = 136,
  R15H = 137,
  R0L = 138,
  R1L = 139,
  R2L = 140,
  R3L = 141,
  R4L = 142,
  R5L = 143,
  R6L = 144,
  R7L = 145,
  R8L = 146,
  R9L = 147,
  R10L = 148,
  R11L = 149,
  R12L = 150,
  R13L = 151,
  R14L = 152,
  R15L = 153,
  R0Q = 154,
  R2Q = 155,
  R4Q = 156,
  R6Q = 157,
  R8Q = 158,
  R10Q = 159,
  R12Q = 160,
  R14Q = 161,
  NUM_TARGET_REGS 	// 162
};
} // end namespace SystemZ

// Register classes

namespace SystemZ {
enum {
  GRX32BitRegClassID = 0,
  VR32BitRegClassID = 1,
  FP32BitRegClassID = 2,
  GR32BitRegClassID = 3,
  GRH32BitRegClassID = 4,
  ADDR32BitRegClassID = 5,
  CCRegsRegClassID = 6,
  AnyRegBitRegClassID = 7,
  AnyRegBit_with_subreg_r32RegClassID = 8,
  VR64BitRegClassID = 9,
  AnyRegBit_with_subreg_r64RegClassID = 10,
  FP64BitRegClassID = 11,
  GR64BitRegClassID = 12,
  ADDR64BitRegClassID = 13,
  VR128BitRegClassID = 14,
  VF128BitRegClassID = 15,
  FP128BitRegClassID = 16,
  GR128BitRegClassID = 17,
  ADDR128BitRegClassID = 18,

  };
} // end namespace SystemZ


// Subregister indices

namespace SystemZ {
enum {
  NoSubRegister,
  subreg_h32,	// 1
  subreg_h64,	// 2
  subreg_hh32,	// 3
  subreg_hl32,	// 4
  subreg_hr32,	// 5
  subreg_l32,	// 6
  subreg_l64,	// 7
  subreg_r32,	// 8
  subreg_r64,	// 9
  NUM_TARGET_SUBREGS
};
} // end namespace SystemZ

} // end namespace llvm

#endif // GET_REGINFO_ENUM

/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* MC Register Information                                                    *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/


#ifdef GET_REGINFO_MC_DESC
#undef GET_REGINFO_MC_DESC

namespace llvm {

extern const MCPhysReg SystemZRegDiffLists[] = {
  /* 0 */ 64953, 1, 1, 1, 0,
  /* 5 */ 65357, 1, 0,
  /* 8 */ 65471, 2, 0,
  /* 11 */ 65473, 2, 0,
  /* 14 */ 65475, 2, 0,
  /* 17 */ 65477, 2, 0,
  /* 20 */ 32, 40, 0,
  /* 23 */ 65506, 40, 65494, 40, 0,
  /* 28 */ 65508, 40, 65494, 40, 0,
  /* 33 */ 65510, 40, 65494, 40, 0,
  /* 38 */ 65512, 40, 65494, 40, 0,
  /* 43 */ 65504, 40, 0,
  /* 46 */ 65520, 40, 0,
  /* 49 */ 65504, 41, 0,
  /* 52 */ 65520, 41, 0,
  /* 55 */ 65504, 42, 0,
  /* 58 */ 65520, 42, 0,
  /* 61 */ 65504, 43, 0,
  /* 64 */ 65520, 43, 0,
  /* 67 */ 65504, 44, 0,
  /* 70 */ 65520, 44, 0,
  /* 73 */ 65504, 45, 0,
  /* 76 */ 65520, 45, 0,
  /* 79 */ 65504, 46, 0,
  /* 82 */ 65520, 46, 0,
  /* 85 */ 65504, 47, 0,
  /* 88 */ 65520, 47, 0,
  /* 91 */ 65504, 48, 0,
  /* 94 */ 65520, 48, 0,
  /* 97 */ 65496, 65504, 56, 0,
  /* 101 */ 65496, 65504, 58, 0,
  /* 105 */ 65496, 65504, 60, 0,
  /* 109 */ 65496, 65504, 62, 0,
  /* 113 */ 65496, 65504, 64, 0,
  /* 117 */ 65293, 0,
  /* 119 */ 65326, 0,
  /* 121 */ 65463, 0,
  /* 123 */ 65503, 0,
  /* 125 */ 65496, 65504, 0,
  /* 128 */ 65489, 32, 65520, 65519, 32, 65520, 0,
  /* 135 */ 65490, 32, 65520, 65519, 32, 65520, 0,
  /* 142 */ 65491, 32, 65520, 65519, 32, 65520, 0,
  /* 149 */ 65492, 32, 65520, 65519, 32, 65520, 0,
  /* 156 */ 65493, 32, 65520, 65519, 32, 65520, 0,
  /* 163 */ 65494, 32, 65520, 65519, 32, 65520, 0,
  /* 170 */ 65495, 32, 65520, 65519, 32, 65520, 0,
  /* 177 */ 65496, 32, 65520, 65519, 32, 65520, 0,
  /* 184 */ 65535, 0,
};

extern const unsigned SystemZLaneMaskLists[] = {
  /* 0 */ 0x00000000, ~0u,
  /* 2 */ 0x00000004, 0x00000002, 0x00000010, 0x00000001, ~0u,
  /* 7 */ 0x00000008, 0x00000020, ~0u,
};

extern const uint16_t SystemZSubRegIdxLists[] = {
  /* 0 */ 6, 1, 0,
  /* 3 */ 7, 6, 1, 2, 4, 3, 0,
  /* 10 */ 7, 8, 2, 5, 0,
  /* 15 */ 9, 8, 0,
};

extern const MCRegisterInfo::SubRegCoveredBits SystemZSubRegIdxRanges[] = {
  { 65535, 65535 },
  { 32, 32 },	// subreg_h32
  { 64, 64 },	// subreg_h64
  { 96, 32 },	// subreg_hh32
  { 64, 32 },	// subreg_hl32
  { 96, 32 },	// subreg_hr32
  { 0, 32 },	// subreg_l32
  { 0, 64 },	// subreg_l64
  { 32, 32 },	// subreg_r32
  { 64, 64 },	// subreg_r64
};

extern const char SystemZRegStrings[] = {
  /* 0 */ 'V', '1', '0', 0,
  /* 4 */ 'V', '2', '0', 0,
  /* 8 */ 'V', '3', '0', 0,
  /* 12 */ 'V', '0', 0,
  /* 15 */ 'V', '1', '1', 0,
  /* 19 */ 'V', '2', '1', 0,
  /* 23 */ 'V', '3', '1', 0,
  /* 27 */ 'V', '1', 0,
  /* 30 */ 'V', '1', '2', 0,
  /* 34 */ 'V', '2', '2', 0,
  /* 38 */ 'V', '2', 0,
  /* 41 */ 'V', '1', '3', 0,
  /* 45 */ 'V', '2', '3', 0,
  /* 49 */ 'V', '3', 0,
  /* 52 */ 'V', '1', '4', 0,
  /* 56 */ 'V', '2', '4', 0,
  /* 60 */ 'V', '4', 0,
  /* 63 */ 'V', '1', '5', 0,
  /* 67 */ 'V', '2', '5', 0,
  /* 71 */ 'V', '5', 0,
  /* 74 */ 'V', '1', '6', 0,
  /* 78 */ 'V', '2', '6', 0,
  /* 82 */ 'V', '6', 0,
  /* 85 */ 'V', '1', '7', 0,
  /* 89 */ 'V', '2', '7', 0,
  /* 93 */ 'V', '7', 0,
  /* 96 */ 'V', '1', '8', 0,
  /* 100 */ 'V', '2', '8', 0,
  /* 104 */ 'V', '8', 0,
  /* 107 */ 'V', '1', '9', 0,
  /* 111 */ 'V', '2', '9', 0,
  /* 115 */ 'V', '9', 0,
  /* 118 */ 'C', 'C', 0,
  /* 121 */ 'F', '1', '0', 'D', 0,
  /* 126 */ 'R', '1', '0', 'D', 0,
  /* 131 */ 'F', '2', '0', 'D', 0,
  /* 136 */ 'F', '3', '0', 'D', 0,
  /* 141 */ 'F', '0', 'D', 0,
  /* 145 */ 'R', '0', 'D', 0,
  /* 149 */ 'F', '1', '1', 'D', 0,
  /* 154 */ 'R', '1', '1', 'D', 0,
  /* 159 */ 'F', '2', '1', 'D', 0,
  /* 164 */ 'F', '3', '1', 'D', 0,
  /* 169 */ 'F', '1', 'D', 0,
  /* 173 */ 'R', '1', 'D', 0,
  /* 177 */ 'F', '1', '2', 'D', 0,
  /* 182 */ 'R', '1', '2', 'D', 0,
  /* 187 */ 'F', '2', '2', 'D', 0,
  /* 192 */ 'F', '2', 'D', 0,
  /* 196 */ 'R', '2', 'D', 0,
  /* 200 */ 'F', '1', '3', 'D', 0,
  /* 205 */ 'R', '1', '3', 'D', 0,
  /* 210 */ 'F', '2', '3', 'D', 0,
  /* 215 */ 'F', '3', 'D', 0,
  /* 219 */ 'R', '3', 'D', 0,
  /* 223 */ 'F', '1', '4', 'D', 0,
  /* 228 */ 'R', '1', '4', 'D', 0,
  /* 233 */ 'F', '2', '4', 'D', 0,
  /* 238 */ 'F', '4', 'D', 0,
  /* 242 */ 'R', '4', 'D', 0,
  /* 246 */ 'F', '1', '5', 'D', 0,
  /* 251 */ 'R', '1', '5', 'D', 0,
  /* 256 */ 'F', '2', '5', 'D', 0,
  /* 261 */ 'F', '5', 'D', 0,
  /* 265 */ 'R', '5', 'D', 0,
  /* 269 */ 'F', '1', '6', 'D', 0,
  /* 274 */ 'F', '2', '6', 'D', 0,
  /* 279 */ 'F', '6', 'D', 0,
  /* 283 */ 'R', '6', 'D', 0,
  /* 287 */ 'F', '1', '7', 'D', 0,
  /* 292 */ 'F', '2', '7', 'D', 0,
  /* 297 */ 'F', '7', 'D', 0,
  /* 301 */ 'R', '7', 'D', 0,
  /* 305 */ 'F', '1', '8', 'D', 0,
  /* 310 */ 'F', '2', '8', 'D', 0,
  /* 315 */ 'F', '8', 'D', 0,
  /* 319 */ 'R', '8', 'D', 0,
  /* 323 */ 'F', '1', '9', 'D', 0,
  /* 328 */ 'F', '2', '9', 'D', 0,
  /* 333 */ 'F', '9', 'D', 0,
  /* 337 */ 'R', '9', 'D', 0,
  /* 341 */ 'R', '1', '0', 'H', 0,
  /* 346 */ 'R', '0', 'H', 0,
  /* 350 */ 'R', '1', '1', 'H', 0,
  /* 355 */ 'R', '1', 'H', 0,
  /* 359 */ 'R', '1', '2', 'H', 0,
  /* 364 */ 'R', '2', 'H', 0,
  /* 368 */ 'R', '1', '3', 'H', 0,
  /* 373 */ 'R', '3', 'H', 0,
  /* 377 */ 'R', '1', '4', 'H', 0,
  /* 382 */ 'R', '4', 'H', 0,
  /* 386 */ 'R', '1', '5', 'H', 0,
  /* 391 */ 'R', '5', 'H', 0,
  /* 395 */ 'R', '6', 'H', 0,
  /* 399 */ 'R', '7', 'H', 0,
  /* 403 */ 'R', '8', 'H', 0,
  /* 407 */ 'R', '9', 'H', 0,
  /* 411 */ 'R', '1', '0', 'L', 0,
  /* 416 */ 'R', '0', 'L', 0,
  /* 420 */ 'R', '1', '1', 'L', 0,
  /* 425 */ 'R', '1', 'L', 0,
  /* 429 */ 'R', '1', '2', 'L', 0,
  /* 434 */ 'R', '2', 'L', 0,
  /* 438 */ 'R', '1', '3', 'L', 0,
  /* 443 */ 'R', '3', 'L', 0,
  /* 447 */ 'R', '1', '4', 'L', 0,
  /* 452 */ 'R', '4', 'L', 0,
  /* 456 */ 'R', '1', '5', 'L', 0,
  /* 461 */ 'R', '5', 'L', 0,
  /* 465 */ 'R', '6', 'L', 0,
  /* 469 */ 'R', '7', 'L', 0,
  /* 473 */ 'R', '8', 'L', 0,
  /* 477 */ 'R', '9', 'L', 0,
  /* 481 */ 'R', '1', '0', 'Q', 0,
  /* 486 */ 'F', '0', 'Q', 0,
  /* 490 */ 'R', '0', 'Q', 0,
  /* 494 */ 'F', '1', 'Q', 0,
  /* 498 */ 'F', '1', '2', 'Q', 0,
  /* 503 */ 'R', '1', '2', 'Q', 0,
  /* 508 */ 'R', '2', 'Q', 0,
  /* 512 */ 'F', '1', '3', 'Q', 0,
  /* 517 */ 'R', '1', '4', 'Q', 0,
  /* 522 */ 'F', '4', 'Q', 0,
  /* 526 */ 'R', '4', 'Q', 0,
  /* 530 */ 'F', '5', 'Q', 0,
  /* 534 */ 'R', '6', 'Q', 0,
  /* 538 */ 'F', '8', 'Q', 0,
  /* 542 */ 'R', '8', 'Q', 0,
  /* 546 */ 'F', '9', 'Q', 0,
  /* 550 */ 'F', '1', '0', 'S', 0,
  /* 555 */ 'F', '2', '0', 'S', 0,
  /* 560 */ 'F', '3', '0', 'S', 0,
  /* 565 */ 'F', '0', 'S', 0,
  /* 569 */ 'F', '1', '1', 'S', 0,
  /* 574 */ 'F', '2', '1', 'S', 0,
  /* 579 */ 'F', '3', '1', 'S', 0,
  /* 584 */ 'F', '1', 'S', 0,
  /* 588 */ 'F', '1', '2', 'S', 0,
  /* 593 */ 'F', '2', '2', 'S', 0,
  /* 598 */ 'F', '2', 'S', 0,
  /* 602 */ 'F', '1', '3', 'S', 0,
  /* 607 */ 'F', '2', '3', 'S', 0,
  /* 612 */ 'F', '3', 'S', 0,
  /* 616 */ 'F', '1', '4', 'S', 0,
  /* 621 */ 'F', '2', '4', 'S', 0,
  /* 626 */ 'F', '4', 'S', 0,
  /* 630 */ 'F', '1', '5', 'S', 0,
  /* 635 */ 'F', '2', '5', 'S', 0,
  /* 640 */ 'F', '5', 'S', 0,
  /* 644 */ 'F', '1', '6', 'S', 0,
  /* 649 */ 'F', '2', '6', 'S', 0,
  /* 654 */ 'F', '6', 'S', 0,
  /* 658 */ 'F', '1', '7', 'S', 0,
  /* 663 */ 'F', '2', '7', 'S', 0,
  /* 668 */ 'F', '7', 'S', 0,
  /* 672 */ 'F', '1', '8', 'S', 0,
  /* 677 */ 'F', '2', '8', 'S', 0,
  /* 682 */ 'F', '8', 'S', 0,
  /* 686 */ 'F', '1', '9', 'S', 0,
  /* 691 */ 'F', '2', '9', 'S', 0,
  /* 696 */ 'F', '9', 'S', 0,
};

extern const MCRegisterDesc SystemZRegDesc[] = { // Descriptors
  { 3, 0, 0, 0, 0, 0 },
  { 118, 4, 4, 2, 2945, 0 },
  { 12, 20, 4, 15, 2945, 8 },
  { 27, 20, 4, 15, 2945, 8 },
  { 38, 20, 4, 15, 2945, 8 },
  { 49, 20, 4, 15, 2945, 8 },
  { 60, 20, 4, 15, 2945, 8 },
  { 71, 20, 4, 15, 2945, 8 },
  { 82, 20, 4, 15, 2945, 8 },
  { 93, 20, 4, 15, 2945, 8 },
  { 104, 20, 4, 15, 2945, 8 },
  { 115, 20, 4, 15, 2945, 8 },
  { 0, 20, 4, 15, 2945, 8 },
  { 15, 20, 4, 15, 2945, 8 },
  { 30, 20, 4, 15, 2945, 8 },
  { 41, 20, 4, 15, 2945, 8 },
  { 52, 20, 4, 15, 2945, 8 },
  { 63, 20, 4, 15, 2945, 8 },
  { 74, 20, 4, 15, 2945, 8 },
  { 85, 20, 4, 15, 2945, 8 },
  { 96, 20, 4, 15, 2945, 8 },
  { 107, 20, 4, 15, 2945, 8 },
  { 4, 20, 4, 15, 2945, 8 },
  { 19, 20, 4, 15, 2945, 8 },
  { 34, 20, 4, 15, 2945, 8 },
  { 45, 20, 4, 15, 2945, 8 },
  { 56, 20, 4, 15, 2945, 8 },
  { 67, 20, 4, 15, 2945, 8 },
  { 78, 20, 4, 15, 2945, 8 },
  { 89, 20, 4, 15, 2945, 8 },
  { 100, 20, 4, 15, 2945, 8 },
  { 111, 20, 4, 15, 2945, 8 },
  { 8, 20, 4, 15, 2945, 8 },
  { 23, 20, 4, 15, 2945, 8 },
  { 141, 21, 114, 16, 1969, 8 },
  { 169, 21, 114, 16, 1969, 8 },
  { 192, 21, 110, 16, 1969, 8 },
  { 215, 21, 110, 16, 1969, 8 },
  { 238, 21, 110, 16, 1969, 8 },
  { 261, 21, 110, 16, 1969, 8 },
  { 279, 21, 106, 16, 1969, 8 },
  { 297, 21, 106, 16, 1969, 8 },
  { 315, 21, 106, 16, 1969, 8 },
  { 333, 21, 106, 16, 1969, 8 },
  { 121, 21, 102, 16, 1969, 8 },
  { 149, 21, 102, 16, 1969, 8 },
  { 177, 21, 102, 16, 1969, 8 },
  { 200, 21, 102, 16, 1969, 8 },
  { 223, 21, 98, 16, 1969, 8 },
  { 246, 21, 98, 16, 1969, 8 },
  { 269, 21, 126, 16, 1969, 8 },
  { 287, 21, 126, 16, 1969, 8 },
  { 305, 21, 126, 16, 1969, 8 },
  { 323, 21, 126, 16, 1969, 8 },
  { 131, 21, 126, 16, 1969, 8 },
  { 159, 21, 126, 16, 1969, 8 },
  { 187, 21, 126, 16, 1969, 8 },
  { 210, 21, 126, 16, 1969, 8 },
  { 233, 21, 126, 16, 1969, 8 },
  { 256, 21, 126, 16, 1969, 8 },
  { 274, 21, 126, 16, 1969, 8 },
  { 292, 21, 126, 16, 1969, 8 },
  { 310, 21, 126, 16, 1969, 8 },
  { 328, 21, 126, 16, 1969, 8 },
  { 136, 21, 126, 16, 1969, 8 },
  { 164, 21, 126, 16, 1969, 8 },
  { 486, 23, 4, 10, 129, 7 },
  { 494, 23, 4, 10, 129, 7 },
  { 522, 28, 4, 10, 177, 7 },
  { 530, 28, 4, 10, 177, 7 },
  { 538, 33, 4, 10, 225, 7 },
  { 546, 33, 4, 10, 225, 7 },
  { 498, 38, 4, 10, 273, 7 },
  { 512, 38, 4, 10, 273, 7 },
  { 565, 4, 113, 2, 1937, 0 },
  { 584, 4, 113, 2, 1937, 0 },
  { 598, 4, 109, 2, 1937, 0 },
  { 612, 4, 109, 2, 1937, 0 },
  { 626, 4, 109, 2, 1937, 0 },
  { 640, 4, 109, 2, 1937, 0 },
  { 654, 4, 105, 2, 1937, 0 },
  { 668, 4, 105, 2, 1937, 0 },
  { 682, 4, 105, 2, 1937, 0 },
  { 696, 4, 105, 2, 1937, 0 },
  { 550, 4, 101, 2, 1937, 0 },
  { 569, 4, 101, 2, 1937, 0 },
  { 588, 4, 101, 2, 1937, 0 },
  { 602, 4, 101, 2, 1937, 0 },
  { 616, 4, 97, 2, 1937, 0 },
  { 630, 4, 97, 2, 1937, 0 },
  { 644, 4, 125, 2, 1937, 0 },
  { 658, 4, 125, 2, 1937, 0 },
  { 672, 4, 125, 2, 1937, 0 },
  { 686, 4, 125, 2, 1937, 0 },
  { 555, 4, 125, 2, 1937, 0 },
  { 574, 4, 125, 2, 1937, 0 },
  { 593, 4, 125, 2, 1937, 0 },
  { 607, 4, 125, 2, 1937, 0 },
  { 621, 4, 125, 2, 1937, 0 },
  { 635, 4, 125, 2, 1937, 0 },
  { 649, 4, 125, 2, 1937, 0 },
  { 663, 4, 125, 2, 1937, 0 },
  { 677, 4, 125, 2, 1937, 0 },
  { 691, 4, 125, 2, 1937, 0 },
  { 560, 4, 125, 2, 1937, 0 },
  { 579, 4, 125, 2, 1937, 0 },
  { 145, 132, 92, 0, 82, 4 },
  { 173, 132, 86, 0, 82, 4 },
  { 196, 132, 86, 0, 82, 4 },
  { 219, 132, 80, 0, 82, 4 },
  { 242, 132, 80, 0, 82, 4 },
  { 265, 132, 74, 0, 82, 4 },
  { 283, 132, 74, 0, 82, 4 },
  { 301, 132, 68, 0, 82, 4 },
  { 319, 132, 68, 0, 82, 4 },
  { 337, 132, 62, 0, 82, 4 },
  { 126, 132, 62, 0, 82, 4 },
  { 154, 132, 56, 0, 82, 4 },
  { 182, 132, 56, 0, 82, 4 },
  { 205, 132, 50, 0, 82, 4 },
  { 228, 132, 50, 0, 82, 4 },
  { 251, 132, 21, 0, 82, 4 },
  { 346, 4, 94, 2, 1906, 0 },
  { 355, 4, 88, 2, 1906, 0 },
  { 364, 4, 88, 2, 1906, 0 },
  { 373, 4, 82, 2, 1906, 0 },
  { 382, 4, 82, 2, 1906, 0 },
  { 391, 4, 76, 2, 1906, 0 },
  { 395, 4, 76, 2, 1906, 0 },
  { 399, 4, 70, 2, 1906, 0 },
  { 403, 4, 70, 2, 1906, 0 },
  { 407, 4, 64, 2, 1906, 0 },
  { 341, 4, 64, 2, 1906, 0 },
  { 350, 4, 58, 2, 1906, 0 },
  { 359, 4, 58, 2, 1906, 0 },
  { 368, 4, 52, 2, 1906, 0 },
  { 377, 4, 52, 2, 1906, 0 },
  { 386, 4, 46, 2, 1906, 0 },
  { 416, 4, 91, 2, 1874, 0 },
  { 425, 4, 85, 2, 1874, 0 },
  { 434, 4, 85, 2, 1874, 0 },
  { 443, 4, 79, 2, 1874, 0 },
  { 452, 4, 79, 2, 1874, 0 },
  { 461, 4, 73, 2, 1874, 0 },
  { 465, 4, 73, 2, 1874, 0 },
  { 469, 4, 67, 2, 1874, 0 },
  { 473, 4, 67, 2, 1874, 0 },
  { 477, 4, 61, 2, 1874, 0 },
  { 411, 4, 61, 2, 1874, 0 },
  { 420, 4, 55, 2, 1874, 0 },
  { 429, 4, 55, 2, 1874, 0 },
  { 438, 4, 49, 2, 1874, 0 },
  { 447, 4, 49, 2, 1874, 0 },
  { 456, 4, 43, 2, 1874, 0 },
  { 490, 128, 4, 3, 4, 2 },
  { 508, 135, 4, 3, 4, 2 },
  { 526, 142, 4, 3, 4, 2 },
  { 534, 149, 4, 3, 4, 2 },
  { 542, 156, 4, 3, 4, 2 },
  { 481, 163, 4, 3, 4, 2 },
  { 503, 170, 4, 3, 4, 2 },
  { 517, 177, 4, 3, 4, 2 },
};

extern const MCPhysReg SystemZRegUnitRoots[][2] = {
  { SystemZ::CC },
  { SystemZ::F0S },
  { SystemZ::F1S },
  { SystemZ::F2S },
  { SystemZ::F3S },
  { SystemZ::F4S },
  { SystemZ::F5S },
  { SystemZ::F6S },
  { SystemZ::F7S },
  { SystemZ::F8S },
  { SystemZ::F9S },
  { SystemZ::F10S },
  { SystemZ::F11S },
  { SystemZ::F12S },
  { SystemZ::F13S },
  { SystemZ::F14S },
  { SystemZ::F15S },
  { SystemZ::F16S },
  { SystemZ::F17S },
  { SystemZ::F18S },
  { SystemZ::F19S },
  { SystemZ::F20S },
  { SystemZ::F21S },
  { SystemZ::F22S },
  { SystemZ::F23S },
  { SystemZ::F24S },
  { SystemZ::F25S },
  { SystemZ::F26S },
  { SystemZ::F27S },
  { SystemZ::F28S },
  { SystemZ::F29S },
  { SystemZ::F30S },
  { SystemZ::F31S },
  { SystemZ::R0L },
  { SystemZ::R0H },
  { SystemZ::R1L },
  { SystemZ::R1H },
  { SystemZ::R2L },
  { SystemZ::R2H },
  { SystemZ::R3L },
  { SystemZ::R3H },
  { SystemZ::R4L },
  { SystemZ::R4H },
  { SystemZ::R5L },
  { SystemZ::R5H },
  { SystemZ::R6L },
  { SystemZ::R6H },
  { SystemZ::R7L },
  { SystemZ::R7H },
  { SystemZ::R8L },
  { SystemZ::R8H },
  { SystemZ::R9L },
  { SystemZ::R9H },
  { SystemZ::R10L },
  { SystemZ::R10H },
  { SystemZ::R11L },
  { SystemZ::R11H },
  { SystemZ::R12L },
  { SystemZ::R12H },
  { SystemZ::R13L },
  { SystemZ::R13H },
  { SystemZ::R14L },
  { SystemZ::R14H },
  { SystemZ::R15L },
  { SystemZ::R15H },
};

namespace {     // Register classes...
  // GRX32Bit Register Class...
  const MCPhysReg GRX32Bit[] = {
    SystemZ::R0L, SystemZ::R1L, SystemZ::R2L, SystemZ::R3L, SystemZ::R4L, SystemZ::R5L, SystemZ::R0H, SystemZ::R1H, SystemZ::R2H, SystemZ::R3H, SystemZ::R4H, SystemZ::R5H, SystemZ::R15L, SystemZ::R15H, SystemZ::R14L, SystemZ::R14H, SystemZ::R13L, SystemZ::R13H, SystemZ::R12L, SystemZ::R12H, SystemZ::R11L, SystemZ::R11H, SystemZ::R10L, SystemZ::R10H, SystemZ::R9L, SystemZ::R9H, SystemZ::R8L, SystemZ::R8H, SystemZ::R7L, SystemZ::R7H, SystemZ::R6L, SystemZ::R6H, 
  };

  // GRX32Bit Bit set.
  const uint8_t GRX32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0xff, 0xff, 0x03, 
  };

  // VR32Bit Register Class...
  const MCPhysReg VR32Bit[] = {
    SystemZ::F0S, SystemZ::F1S, SystemZ::F2S, SystemZ::F3S, SystemZ::F4S, SystemZ::F5S, SystemZ::F6S, SystemZ::F7S, SystemZ::F16S, SystemZ::F17S, SystemZ::F18S, SystemZ::F19S, SystemZ::F20S, SystemZ::F21S, SystemZ::F22S, SystemZ::F23S, SystemZ::F24S, SystemZ::F25S, SystemZ::F26S, SystemZ::F27S, SystemZ::F28S, SystemZ::F29S, SystemZ::F30S, SystemZ::F31S, SystemZ::F8S, SystemZ::F9S, SystemZ::F10S, SystemZ::F11S, SystemZ::F12S, SystemZ::F13S, SystemZ::F14S, SystemZ::F15S, 
  };

  // VR32Bit Bit set.
  const uint8_t VR32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0xff, 0xff, 0x03, 
  };

  // FP32Bit Register Class...
  const MCPhysReg FP32Bit[] = {
    SystemZ::F0S, SystemZ::F1S, SystemZ::F2S, SystemZ::F3S, SystemZ::F4S, SystemZ::F5S, SystemZ::F6S, SystemZ::F7S, SystemZ::F8S, SystemZ::F9S, SystemZ::F10S, SystemZ::F11S, SystemZ::F12S, SystemZ::F13S, SystemZ::F14S, SystemZ::F15S, 
  };

  // FP32Bit Bit set.
  const uint8_t FP32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // GR32Bit Register Class...
  const MCPhysReg GR32Bit[] = {
    SystemZ::R0L, SystemZ::R1L, SystemZ::R2L, SystemZ::R3L, SystemZ::R4L, SystemZ::R5L, SystemZ::R15L, SystemZ::R14L, SystemZ::R13L, SystemZ::R12L, SystemZ::R11L, SystemZ::R10L, SystemZ::R9L, SystemZ::R8L, SystemZ::R7L, SystemZ::R6L, 
  };

  // GR32Bit Bit set.
  const uint8_t GR32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // GRH32Bit Register Class...
  const MCPhysReg GRH32Bit[] = {
    SystemZ::R0H, SystemZ::R1H, SystemZ::R2H, SystemZ::R3H, SystemZ::R4H, SystemZ::R5H, SystemZ::R15H, SystemZ::R14H, SystemZ::R13H, SystemZ::R12H, SystemZ::R11H, SystemZ::R10H, SystemZ::R9H, SystemZ::R8H, SystemZ::R7H, SystemZ::R6H, 
  };

  // GRH32Bit Bit set.
  const uint8_t GRH32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // ADDR32Bit Register Class...
  const MCPhysReg ADDR32Bit[] = {
    SystemZ::R1L, SystemZ::R2L, SystemZ::R3L, SystemZ::R4L, SystemZ::R5L, SystemZ::R15L, SystemZ::R14L, SystemZ::R13L, SystemZ::R12L, SystemZ::R11L, SystemZ::R10L, SystemZ::R9L, SystemZ::R8L, SystemZ::R7L, SystemZ::R6L, 
  };

  // ADDR32Bit Bit set.
  const uint8_t ADDR32BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0xff, 0x03, 
  };

  // CCRegs Register Class...
  const MCPhysReg CCRegs[] = {
    SystemZ::CC, 
  };

  // CCRegs Bit set.
  const uint8_t CCRegsBits[] = {
    0x02, 
  };

  // AnyRegBit Register Class...
  const MCPhysReg AnyRegBit[] = {
    SystemZ::R0D, SystemZ::R1D, SystemZ::R2D, SystemZ::R3D, SystemZ::R4D, SystemZ::R5D, SystemZ::R6D, SystemZ::R7D, SystemZ::R8D, SystemZ::R9D, SystemZ::R10D, SystemZ::R11D, SystemZ::R12D, SystemZ::R13D, SystemZ::R14D, SystemZ::R15D, SystemZ::F0D, SystemZ::F1D, SystemZ::F2D, SystemZ::F3D, SystemZ::F4D, SystemZ::F5D, SystemZ::F6D, SystemZ::F7D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, SystemZ::V0, SystemZ::V1, SystemZ::V2, SystemZ::V3, SystemZ::V4, SystemZ::V5, SystemZ::V6, SystemZ::V7, SystemZ::V8, SystemZ::V9, SystemZ::V10, SystemZ::V11, SystemZ::V12, SystemZ::V13, SystemZ::V14, SystemZ::V15, 
  };

  // AnyRegBit Bit set.
  const uint8_t AnyRegBitBits[] = {
    0xfc, 0xff, 0x03, 0x00, 0xfc, 0xff, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // AnyRegBit_with_subreg_r32 Register Class...
  const MCPhysReg AnyRegBit_with_subreg_r32[] = {
    SystemZ::F0D, SystemZ::F1D, SystemZ::F2D, SystemZ::F3D, SystemZ::F4D, SystemZ::F5D, SystemZ::F6D, SystemZ::F7D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, SystemZ::V0, SystemZ::V1, SystemZ::V2, SystemZ::V3, SystemZ::V4, SystemZ::V5, SystemZ::V6, SystemZ::V7, SystemZ::V8, SystemZ::V9, SystemZ::V10, SystemZ::V11, SystemZ::V12, SystemZ::V13, SystemZ::V14, SystemZ::V15, 
  };

  // AnyRegBit_with_subreg_r32 Bit set.
  const uint8_t AnyRegBit_with_subreg_r32Bits[] = {
    0xfc, 0xff, 0x03, 0x00, 0xfc, 0xff, 0x03, 
  };

  // VR64Bit Register Class...
  const MCPhysReg VR64Bit[] = {
    SystemZ::F0D, SystemZ::F1D, SystemZ::F2D, SystemZ::F3D, SystemZ::F4D, SystemZ::F5D, SystemZ::F6D, SystemZ::F7D, SystemZ::F16D, SystemZ::F17D, SystemZ::F18D, SystemZ::F19D, SystemZ::F20D, SystemZ::F21D, SystemZ::F22D, SystemZ::F23D, SystemZ::F24D, SystemZ::F25D, SystemZ::F26D, SystemZ::F27D, SystemZ::F28D, SystemZ::F29D, SystemZ::F30D, SystemZ::F31D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, 
  };

  // VR64Bit Bit set.
  const uint8_t VR64BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0xff, 0xff, 0x03, 
  };

  // AnyRegBit_with_subreg_r64 Register Class...
  const MCPhysReg AnyRegBit_with_subreg_r64[] = {
    SystemZ::V0, SystemZ::V1, SystemZ::V2, SystemZ::V3, SystemZ::V4, SystemZ::V5, SystemZ::V6, SystemZ::V7, SystemZ::V8, SystemZ::V9, SystemZ::V10, SystemZ::V11, SystemZ::V12, SystemZ::V13, SystemZ::V14, SystemZ::V15, 
  };

  // AnyRegBit_with_subreg_r64 Bit set.
  const uint8_t AnyRegBit_with_subreg_r64Bits[] = {
    0xfc, 0xff, 0x03, 
  };

  // FP64Bit Register Class...
  const MCPhysReg FP64Bit[] = {
    SystemZ::F0D, SystemZ::F1D, SystemZ::F2D, SystemZ::F3D, SystemZ::F4D, SystemZ::F5D, SystemZ::F6D, SystemZ::F7D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, 
  };

  // FP64Bit Bit set.
  const uint8_t FP64BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // GR64Bit Register Class...
  const MCPhysReg GR64Bit[] = {
    SystemZ::R0D, SystemZ::R1D, SystemZ::R2D, SystemZ::R3D, SystemZ::R4D, SystemZ::R5D, SystemZ::R15D, SystemZ::R14D, SystemZ::R13D, SystemZ::R12D, SystemZ::R11D, SystemZ::R10D, SystemZ::R9D, SystemZ::R8D, SystemZ::R7D, SystemZ::R6D, 
  };

  // GR64Bit Bit set.
  const uint8_t GR64BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0xff, 0x03, 
  };

  // ADDR64Bit Register Class...
  const MCPhysReg ADDR64Bit[] = {
    SystemZ::R1D, SystemZ::R2D, SystemZ::R3D, SystemZ::R4D, SystemZ::R5D, SystemZ::R15D, SystemZ::R14D, SystemZ::R13D, SystemZ::R12D, SystemZ::R11D, SystemZ::R10D, SystemZ::R9D, SystemZ::R8D, SystemZ::R7D, SystemZ::R6D, 
  };

  // ADDR64Bit Bit set.
  const uint8_t ADDR64BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0xff, 0x03, 
  };

  // VR128Bit Register Class...
  const MCPhysReg VR128Bit[] = {
    SystemZ::V0, SystemZ::V1, SystemZ::V2, SystemZ::V3, SystemZ::V4, SystemZ::V5, SystemZ::V6, SystemZ::V7, SystemZ::V16, SystemZ::V17, SystemZ::V18, SystemZ::V19, SystemZ::V20, SystemZ::V21, SystemZ::V22, SystemZ::V23, SystemZ::V24, SystemZ::V25, SystemZ::V26, SystemZ::V27, SystemZ::V28, SystemZ::V29, SystemZ::V30, SystemZ::V31, SystemZ::V8, SystemZ::V9, SystemZ::V10, SystemZ::V11, SystemZ::V12, SystemZ::V13, SystemZ::V14, SystemZ::V15, 
  };

  // VR128Bit Bit set.
  const uint8_t VR128BitBits[] = {
    0xfc, 0xff, 0xff, 0xff, 0x03, 
  };

  // VF128Bit Register Class...
  const MCPhysReg VF128Bit[] = {
    SystemZ::V0, SystemZ::V1, SystemZ::V2, SystemZ::V3, SystemZ::V4, SystemZ::V5, SystemZ::V6, SystemZ::V7, SystemZ::V8, SystemZ::V9, SystemZ::V10, SystemZ::V11, SystemZ::V12, SystemZ::V13, SystemZ::V14, SystemZ::V15, 
  };

  // VF128Bit Bit set.
  const uint8_t VF128BitBits[] = {
    0xfc, 0xff, 0x03, 
  };

  // FP128Bit Register Class...
  const MCPhysReg FP128Bit[] = {
    SystemZ::F0Q, SystemZ::F1Q, SystemZ::F4Q, SystemZ::F5Q, SystemZ::F8Q, SystemZ::F9Q, SystemZ::F12Q, SystemZ::F13Q, 
  };

  // FP128Bit Bit set.
  const uint8_t FP128BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x03, 
  };

  // GR128Bit Register Class...
  const MCPhysReg GR128Bit[] = {
    SystemZ::R0Q, SystemZ::R2Q, SystemZ::R4Q, SystemZ::R12Q, SystemZ::R10Q, SystemZ::R8Q, SystemZ::R6Q, SystemZ::R14Q, 
  };

  // GR128Bit Bit set.
  const uint8_t GR128BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xfc, 0x03, 
  };

  // ADDR128Bit Register Class...
  const MCPhysReg ADDR128Bit[] = {
    SystemZ::R2Q, SystemZ::R4Q, SystemZ::R12Q, SystemZ::R10Q, SystemZ::R8Q, SystemZ::R6Q, SystemZ::R14Q, 
  };

  // ADDR128Bit Bit set.
  const uint8_t ADDR128BitBits[] = {
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xf8, 0x03, 
  };

} // end anonymous namespace

extern const char SystemZRegClassStrings[] = {
  /* 0 */ 'A', 'n', 'y', 'R', 'e', 'g', 'B', 'i', 't', '_', 'w', 'i', 't', 'h', '_', 's', 'u', 'b', 'r', 'e', 'g', '_', 'r', '3', '2', 0,
  /* 26 */ 'A', 'n', 'y', 'R', 'e', 'g', 'B', 'i', 't', '_', 'w', 'i', 't', 'h', '_', 's', 'u', 'b', 'r', 'e', 'g', '_', 'r', '6', '4', 0,
  /* 52 */ 'C', 'C', 'R', 'e', 'g', 's', 0,
  /* 59 */ 'G', 'R', 'H', '3', '2', 'B', 'i', 't', 0,
  /* 68 */ 'F', 'P', '3', '2', 'B', 'i', 't', 0,
  /* 76 */ 'A', 'D', 'D', 'R', '3', '2', 'B', 'i', 't', 0,
  /* 86 */ 'G', 'R', '3', '2', 'B', 'i', 't', 0,
  /* 94 */ 'V', 'R', '3', '2', 'B', 'i', 't', 0,
  /* 102 */ 'G', 'R', 'X', '3', '2', 'B', 'i', 't', 0,
  /* 111 */ 'F', 'P', '6', '4', 'B', 'i', 't', 0,
  /* 119 */ 'A', 'D', 'D', 'R', '6', '4', 'B', 'i', 't', 0,
  /* 129 */ 'G', 'R', '6', '4', 'B', 'i', 't', 0,
  /* 137 */ 'V', 'R', '6', '4', 'B', 'i', 't', 0,
  /* 145 */ 'V', 'F', '1', '2', '8', 'B', 'i', 't', 0,
  /* 154 */ 'F', 'P', '1', '2', '8', 'B', 'i', 't', 0,
  /* 163 */ 'A', 'D', 'D', 'R', '1', '2', '8', 'B', 'i', 't', 0,
  /* 174 */ 'G', 'R', '1', '2', '8', 'B', 'i', 't', 0,
  /* 183 */ 'V', 'R', '1', '2', '8', 'B', 'i', 't', 0,
  /* 192 */ 'A', 'n', 'y', 'R', 'e', 'g', 'B', 'i', 't', 0,
};

extern const MCRegisterClass SystemZMCRegisterClasses[] = {
  { GRX32Bit, GRX32BitBits, 102, 32, sizeof(GRX32BitBits), SystemZ::GRX32BitRegClassID, 4, 4, 1, true },
  { VR32Bit, VR32BitBits, 94, 32, sizeof(VR32BitBits), SystemZ::VR32BitRegClassID, 4, 4, 1, true },
  { FP32Bit, FP32BitBits, 68, 16, sizeof(FP32BitBits), SystemZ::FP32BitRegClassID, 4, 4, 1, true },
  { GR32Bit, GR32BitBits, 86, 16, sizeof(GR32BitBits), SystemZ::GR32BitRegClassID, 4, 4, 1, true },
  { GRH32Bit, GRH32BitBits, 59, 16, sizeof(GRH32BitBits), SystemZ::GRH32BitRegClassID, 4, 4, 1, true },
  { ADDR32Bit, ADDR32BitBits, 76, 15, sizeof(ADDR32BitBits), SystemZ::ADDR32BitRegClassID, 4, 4, 1, true },
  { CCRegs, CCRegsBits, 52, 1, sizeof(CCRegsBits), SystemZ::CCRegsRegClassID, 4, 4, 1, false },
  { AnyRegBit, AnyRegBitBits, 192, 48, sizeof(AnyRegBitBits), SystemZ::AnyRegBitRegClassID, 8, 8, 1, true },
  { AnyRegBit_with_subreg_r32, AnyRegBit_with_subreg_r32Bits, 0, 32, sizeof(AnyRegBit_with_subreg_r32Bits), SystemZ::AnyRegBit_with_subreg_r32RegClassID, 8, 8, 1, true },
  { VR64Bit, VR64BitBits, 137, 32, sizeof(VR64BitBits), SystemZ::VR64BitRegClassID, 8, 8, 1, true },
  { AnyRegBit_with_subreg_r64, AnyRegBit_with_subreg_r64Bits, 26, 16, sizeof(AnyRegBit_with_subreg_r64Bits), SystemZ::AnyRegBit_with_subreg_r64RegClassID, 8, 8, 1, true },
  { FP64Bit, FP64BitBits, 111, 16, sizeof(FP64BitBits), SystemZ::FP64BitRegClassID, 8, 8, 1, true },
  { GR64Bit, GR64BitBits, 129, 16, sizeof(GR64BitBits), SystemZ::GR64BitRegClassID, 8, 8, 1, true },
  { ADDR64Bit, ADDR64BitBits, 119, 15, sizeof(ADDR64BitBits), SystemZ::ADDR64BitRegClassID, 8, 8, 1, true },
  { VR128Bit, VR128BitBits, 183, 32, sizeof(VR128BitBits), SystemZ::VR128BitRegClassID, 16, 16, 1, true },
  { VF128Bit, VF128BitBits, 145, 16, sizeof(VF128BitBits), SystemZ::VF128BitRegClassID, 16, 16, 1, true },
  { FP128Bit, FP128BitBits, 154, 8, sizeof(FP128BitBits), SystemZ::FP128BitRegClassID, 16, 16, 1, true },
  { GR128Bit, GR128BitBits, 174, 8, sizeof(GR128BitBits), SystemZ::GR128BitRegClassID, 16, 16, 1, true },
  { ADDR128Bit, ADDR128BitBits, 163, 7, sizeof(ADDR128BitBits), SystemZ::ADDR128BitRegClassID, 16, 16, 1, true },
};

// SystemZ Dwarf<->LLVM register mappings.
extern const MCRegisterInfo::DwarfLLVMRegPair SystemZDwarfFlavour0Dwarf2L[] = {
  { 0U, SystemZ::R0D },
  { 1U, SystemZ::R1D },
  { 2U, SystemZ::R2D },
  { 3U, SystemZ::R3D },
  { 4U, SystemZ::R4D },
  { 5U, SystemZ::R5D },
  { 6U, SystemZ::R6D },
  { 7U, SystemZ::R7D },
  { 8U, SystemZ::R8D },
  { 9U, SystemZ::R9D },
  { 10U, SystemZ::R10D },
  { 11U, SystemZ::R11D },
  { 12U, SystemZ::R12D },
  { 13U, SystemZ::R13D },
  { 14U, SystemZ::R14D },
  { 15U, SystemZ::R15D },
  { 16U, SystemZ::F0D },
  { 17U, SystemZ::F2D },
  { 18U, SystemZ::F4D },
  { 19U, SystemZ::F6D },
  { 20U, SystemZ::F1D },
  { 21U, SystemZ::F3D },
  { 22U, SystemZ::F5D },
  { 23U, SystemZ::F7D },
  { 24U, SystemZ::F8D },
  { 25U, SystemZ::F10D },
  { 26U, SystemZ::F12D },
  { 27U, SystemZ::F14D },
  { 28U, SystemZ::F9D },
  { 29U, SystemZ::F11D },
  { 30U, SystemZ::F13D },
  { 31U, SystemZ::F15D },
  { 68U, SystemZ::F16D },
  { 69U, SystemZ::F18D },
  { 70U, SystemZ::F20D },
  { 71U, SystemZ::F22D },
  { 72U, SystemZ::F17D },
  { 73U, SystemZ::F19D },
  { 74U, SystemZ::F21D },
  { 75U, SystemZ::F23D },
  { 76U, SystemZ::F24D },
  { 77U, SystemZ::F26D },
  { 78U, SystemZ::F28D },
  { 79U, SystemZ::F30D },
  { 80U, SystemZ::F25D },
  { 81U, SystemZ::F27D },
  { 82U, SystemZ::F29D },
  { 83U, SystemZ::F31D },
};
extern const unsigned SystemZDwarfFlavour0Dwarf2LSize = array_lengthof(SystemZDwarfFlavour0Dwarf2L);

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZEHFlavour0Dwarf2L[] = {
  { 0U, SystemZ::R0D },
  { 1U, SystemZ::R1D },
  { 2U, SystemZ::R2D },
  { 3U, SystemZ::R3D },
  { 4U, SystemZ::R4D },
  { 5U, SystemZ::R5D },
  { 6U, SystemZ::R6D },
  { 7U, SystemZ::R7D },
  { 8U, SystemZ::R8D },
  { 9U, SystemZ::R9D },
  { 10U, SystemZ::R10D },
  { 11U, SystemZ::R11D },
  { 12U, SystemZ::R12D },
  { 13U, SystemZ::R13D },
  { 14U, SystemZ::R14D },
  { 15U, SystemZ::R15D },
  { 16U, SystemZ::F0D },
  { 17U, SystemZ::F2D },
  { 18U, SystemZ::F4D },
  { 19U, SystemZ::F6D },
  { 20U, SystemZ::F1D },
  { 21U, SystemZ::F3D },
  { 22U, SystemZ::F5D },
  { 23U, SystemZ::F7D },
  { 24U, SystemZ::F8D },
  { 25U, SystemZ::F10D },
  { 26U, SystemZ::F12D },
  { 27U, SystemZ::F14D },
  { 28U, SystemZ::F9D },
  { 29U, SystemZ::F11D },
  { 30U, SystemZ::F13D },
  { 31U, SystemZ::F15D },
  { 68U, SystemZ::F16D },
  { 69U, SystemZ::F18D },
  { 70U, SystemZ::F20D },
  { 71U, SystemZ::F22D },
  { 72U, SystemZ::F17D },
  { 73U, SystemZ::F19D },
  { 74U, SystemZ::F21D },
  { 75U, SystemZ::F23D },
  { 76U, SystemZ::F24D },
  { 77U, SystemZ::F26D },
  { 78U, SystemZ::F28D },
  { 79U, SystemZ::F30D },
  { 80U, SystemZ::F25D },
  { 81U, SystemZ::F27D },
  { 82U, SystemZ::F29D },
  { 83U, SystemZ::F31D },
};
extern const unsigned SystemZEHFlavour0Dwarf2LSize = array_lengthof(SystemZEHFlavour0Dwarf2L);

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZDwarfFlavour0L2Dwarf[] = {
  { SystemZ::V0, 16U },
  { SystemZ::V1, 20U },
  { SystemZ::V2, 17U },
  { SystemZ::V3, 21U },
  { SystemZ::V4, 18U },
  { SystemZ::V5, 22U },
  { SystemZ::V6, 19U },
  { SystemZ::V7, 23U },
  { SystemZ::V8, 24U },
  { SystemZ::V9, 28U },
  { SystemZ::V10, 25U },
  { SystemZ::V11, 29U },
  { SystemZ::V12, 26U },
  { SystemZ::V13, 30U },
  { SystemZ::V14, 27U },
  { SystemZ::V15, 31U },
  { SystemZ::V16, 68U },
  { SystemZ::V17, 72U },
  { SystemZ::V18, 69U },
  { SystemZ::V19, 73U },
  { SystemZ::V20, 70U },
  { SystemZ::V21, 74U },
  { SystemZ::V22, 71U },
  { SystemZ::V23, 75U },
  { SystemZ::V24, 76U },
  { SystemZ::V25, 80U },
  { SystemZ::V26, 77U },
  { SystemZ::V27, 81U },
  { SystemZ::V28, 78U },
  { SystemZ::V29, 82U },
  { SystemZ::V30, 79U },
  { SystemZ::V31, 83U },
  { SystemZ::F0D, 16U },
  { SystemZ::F1D, 20U },
  { SystemZ::F2D, 17U },
  { SystemZ::F3D, 21U },
  { SystemZ::F4D, 18U },
  { SystemZ::F5D, 22U },
  { SystemZ::F6D, 19U },
  { SystemZ::F7D, 23U },
  { SystemZ::F8D, 24U },
  { SystemZ::F9D, 28U },
  { SystemZ::F10D, 25U },
  { SystemZ::F11D, 29U },
  { SystemZ::F12D, 26U },
  { SystemZ::F13D, 30U },
  { SystemZ::F14D, 27U },
  { SystemZ::F15D, 31U },
  { SystemZ::F16D, 68U },
  { SystemZ::F17D, 72U },
  { SystemZ::F18D, 69U },
  { SystemZ::F19D, 73U },
  { SystemZ::F20D, 70U },
  { SystemZ::F21D, 74U },
  { SystemZ::F22D, 71U },
  { SystemZ::F23D, 75U },
  { SystemZ::F24D, 76U },
  { SystemZ::F25D, 80U },
  { SystemZ::F26D, 77U },
  { SystemZ::F27D, 81U },
  { SystemZ::F28D, 78U },
  { SystemZ::F29D, 82U },
  { SystemZ::F30D, 79U },
  { SystemZ::F31D, 83U },
  { SystemZ::R0D, 0U },
  { SystemZ::R1D, 1U },
  { SystemZ::R2D, 2U },
  { SystemZ::R3D, 3U },
  { SystemZ::R4D, 4U },
  { SystemZ::R5D, 5U },
  { SystemZ::R6D, 6U },
  { SystemZ::R7D, 7U },
  { SystemZ::R8D, 8U },
  { SystemZ::R9D, 9U },
  { SystemZ::R10D, 10U },
  { SystemZ::R11D, 11U },
  { SystemZ::R12D, 12U },
  { SystemZ::R13D, 13U },
  { SystemZ::R14D, 14U },
  { SystemZ::R15D, 15U },
};
extern const unsigned SystemZDwarfFlavour0L2DwarfSize = array_lengthof(SystemZDwarfFlavour0L2Dwarf);

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZEHFlavour0L2Dwarf[] = {
  { SystemZ::V0, 16U },
  { SystemZ::V1, 20U },
  { SystemZ::V2, 17U },
  { SystemZ::V3, 21U },
  { SystemZ::V4, 18U },
  { SystemZ::V5, 22U },
  { SystemZ::V6, 19U },
  { SystemZ::V7, 23U },
  { SystemZ::V8, 24U },
  { SystemZ::V9, 28U },
  { SystemZ::V10, 25U },
  { SystemZ::V11, 29U },
  { SystemZ::V12, 26U },
  { SystemZ::V13, 30U },
  { SystemZ::V14, 27U },
  { SystemZ::V15, 31U },
  { SystemZ::V16, 68U },
  { SystemZ::V17, 72U },
  { SystemZ::V18, 69U },
  { SystemZ::V19, 73U },
  { SystemZ::V20, 70U },
  { SystemZ::V21, 74U },
  { SystemZ::V22, 71U },
  { SystemZ::V23, 75U },
  { SystemZ::V24, 76U },
  { SystemZ::V25, 80U },
  { SystemZ::V26, 77U },
  { SystemZ::V27, 81U },
  { SystemZ::V28, 78U },
  { SystemZ::V29, 82U },
  { SystemZ::V30, 79U },
  { SystemZ::V31, 83U },
  { SystemZ::F0D, 16U },
  { SystemZ::F1D, 20U },
  { SystemZ::F2D, 17U },
  { SystemZ::F3D, 21U },
  { SystemZ::F4D, 18U },
  { SystemZ::F5D, 22U },
  { SystemZ::F6D, 19U },
  { SystemZ::F7D, 23U },
  { SystemZ::F8D, 24U },
  { SystemZ::F9D, 28U },
  { SystemZ::F10D, 25U },
  { SystemZ::F11D, 29U },
  { SystemZ::F12D, 26U },
  { SystemZ::F13D, 30U },
  { SystemZ::F14D, 27U },
  { SystemZ::F15D, 31U },
  { SystemZ::F16D, 68U },
  { SystemZ::F17D, 72U },
  { SystemZ::F18D, 69U },
  { SystemZ::F19D, 73U },
  { SystemZ::F20D, 70U },
  { SystemZ::F21D, 74U },
  { SystemZ::F22D, 71U },
  { SystemZ::F23D, 75U },
  { SystemZ::F24D, 76U },
  { SystemZ::F25D, 80U },
  { SystemZ::F26D, 77U },
  { SystemZ::F27D, 81U },
  { SystemZ::F28D, 78U },
  { SystemZ::F29D, 82U },
  { SystemZ::F30D, 79U },
  { SystemZ::F31D, 83U },
  { SystemZ::R0D, 0U },
  { SystemZ::R1D, 1U },
  { SystemZ::R2D, 2U },
  { SystemZ::R3D, 3U },
  { SystemZ::R4D, 4U },
  { SystemZ::R5D, 5U },
  { SystemZ::R6D, 6U },
  { SystemZ::R7D, 7U },
  { SystemZ::R8D, 8U },
  { SystemZ::R9D, 9U },
  { SystemZ::R10D, 10U },
  { SystemZ::R11D, 11U },
  { SystemZ::R12D, 12U },
  { SystemZ::R13D, 13U },
  { SystemZ::R14D, 14U },
  { SystemZ::R15D, 15U },
};
extern const unsigned SystemZEHFlavour0L2DwarfSize = array_lengthof(SystemZEHFlavour0L2Dwarf);

extern const uint16_t SystemZRegEncodingTable[] = {
  0,
  0,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  0,
  1,
  4,
  5,
  8,
  9,
  12,
  13,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  16,
  17,
  18,
  19,
  20,
  21,
  22,
  23,
  24,
  25,
  26,
  27,
  28,
  29,
  30,
  31,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  0,
  1,
  2,
  3,
  4,
  5,
  6,
  7,
  8,
  9,
  10,
  11,
  12,
  13,
  14,
  15,
  0,
  2,
  4,
  6,
  8,
  10,
  12,
  14,
};
static inline void InitSystemZMCRegisterInfo(MCRegisterInfo *RI, unsigned RA, unsigned DwarfFlavour = 0, unsigned EHFlavour = 0, unsigned PC = 0) {
  RI->InitMCRegisterInfo(SystemZRegDesc, 162, RA, PC, SystemZMCRegisterClasses, 19, SystemZRegUnitRoots, 65, SystemZRegDiffLists, SystemZLaneMaskLists, SystemZRegStrings, SystemZRegClassStrings, SystemZSubRegIdxLists, 10,
SystemZSubRegIdxRanges, SystemZRegEncodingTable);

  switch (DwarfFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    RI->mapDwarfRegsToLLVMRegs(SystemZDwarfFlavour0Dwarf2L, SystemZDwarfFlavour0Dwarf2LSize, false);
    break;
  }
  switch (EHFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    RI->mapDwarfRegsToLLVMRegs(SystemZEHFlavour0Dwarf2L, SystemZEHFlavour0Dwarf2LSize, true);
    break;
  }
  switch (DwarfFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    RI->mapLLVMRegsToDwarfRegs(SystemZDwarfFlavour0L2Dwarf, SystemZDwarfFlavour0L2DwarfSize, false);
    break;
  }
  switch (EHFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    RI->mapLLVMRegsToDwarfRegs(SystemZEHFlavour0L2Dwarf, SystemZEHFlavour0L2DwarfSize, true);
    break;
  }
}

} // end namespace llvm

#endif // GET_REGINFO_MC_DESC

/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Register Information Header Fragment                                       *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/


#ifdef GET_REGINFO_HEADER
#undef GET_REGINFO_HEADER

#include "llvm/Target/TargetRegisterInfo.h"

namespace llvm {

class SystemZFrameLowering;

struct SystemZGenRegisterInfo : public TargetRegisterInfo {
  explicit SystemZGenRegisterInfo(unsigned RA, unsigned D = 0, unsigned E = 0, unsigned PC = 0);
  unsigned composeSubRegIndicesImpl(unsigned, unsigned) const override;
  LaneBitmask composeSubRegIndexLaneMaskImpl(unsigned, LaneBitmask) const override;
  LaneBitmask reverseComposeSubRegIndexLaneMaskImpl(unsigned, LaneBitmask) const override;
  const TargetRegisterClass *getSubClassWithSubReg(const TargetRegisterClass*, unsigned) const override;
  const RegClassWeight &getRegClassWeight(const TargetRegisterClass *RC) const override;
  unsigned getRegUnitWeight(unsigned RegUnit) const override;
  unsigned getNumRegPressureSets() const override;
  const char *getRegPressureSetName(unsigned Idx) const override;
  unsigned getRegPressureSetLimit(const MachineFunction &MF, unsigned Idx) const override;
  const int *getRegClassPressureSets(const TargetRegisterClass *RC) const override;
  const int *getRegUnitPressureSets(unsigned RegUnit) const override;
  ArrayRef<const char *> getRegMaskNames() const override;
  ArrayRef<const uint32_t *> getRegMasks() const override;
  /// Devirtualized TargetFrameLowering.
  static const SystemZFrameLowering *getFrameLowering(
      const MachineFunction &MF);
};

namespace SystemZ { // Register classes
  extern const TargetRegisterClass GRX32BitRegClass;
  extern const TargetRegisterClass VR32BitRegClass;
  extern const TargetRegisterClass FP32BitRegClass;
  extern const TargetRegisterClass GR32BitRegClass;
  extern const TargetRegisterClass GRH32BitRegClass;
  extern const TargetRegisterClass ADDR32BitRegClass;
  extern const TargetRegisterClass CCRegsRegClass;
  extern const TargetRegisterClass AnyRegBitRegClass;
  extern const TargetRegisterClass AnyRegBit_with_subreg_r32RegClass;
  extern const TargetRegisterClass VR64BitRegClass;
  extern const TargetRegisterClass AnyRegBit_with_subreg_r64RegClass;
  extern const TargetRegisterClass FP64BitRegClass;
  extern const TargetRegisterClass GR64BitRegClass;
  extern const TargetRegisterClass ADDR64BitRegClass;
  extern const TargetRegisterClass VR128BitRegClass;
  extern const TargetRegisterClass VF128BitRegClass;
  extern const TargetRegisterClass FP128BitRegClass;
  extern const TargetRegisterClass GR128BitRegClass;
  extern const TargetRegisterClass ADDR128BitRegClass;
} // end namespace SystemZ

} // end namespace llvm

#endif // GET_REGINFO_HEADER

/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Target Register and Register Classes Information                           *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/


#ifdef GET_REGINFO_TARGET_DESC
#undef GET_REGINFO_TARGET_DESC

namespace llvm {

extern const MCRegisterClass SystemZMCRegisterClasses[];

static const MVT::SimpleValueType VTLists[] = {
  /* 0 */ MVT::i32, MVT::Other,
  /* 2 */ MVT::i64, MVT::Other,
  /* 4 */ MVT::f32, MVT::Other,
  /* 6 */ MVT::f64, MVT::Other,
  /* 8 */ MVT::f128, MVT::Other,
  /* 10 */ MVT::f32, MVT::v4i8, MVT::v2i16, MVT::Other,
  /* 14 */ MVT::i64, MVT::f64, MVT::v8i8, MVT::v4i16, MVT::v2i32, MVT::v2f32, MVT::Other,
  /* 21 */ MVT::v16i8, MVT::v8i16, MVT::v4i32, MVT::v2i64, MVT::v4f32, MVT::v2f64, MVT::Other,
  /* 28 */ MVT::Untyped, MVT::Other,
};

static const char *const SubRegIndexNameTable[] = { "subreg_h32", "subreg_h64", "subreg_hh32", "subreg_hl32", "subreg_hr32", "subreg_l32", "subreg_l64", "subreg_r32", "subreg_r64", "" };


static const unsigned SubRegIndexLaneMaskTable[] = {
  ~0u,
  0x00000001, // subreg_h32
  0x0000000e, // subreg_h64
  0x00000002, // subreg_hh32
  0x00000004, // subreg_hl32
  0x00000008, // subreg_hr32
  0x00000010, // subreg_l32
  0x00000031, // subreg_l64
  0x00000020, // subreg_r32
  0x00000020, // subreg_r64
 };



static const TargetRegisterClass *const NullRegClasses[] = { nullptr };

static const uint32_t GRX32BitSubClassMask[] = {
  0x00000039, 
  0x00063000, // subreg_h32
  0x00060000, // subreg_hh32
  0x00060000, // subreg_hl32
  0x00063000, // subreg_l32
};

static const uint32_t VR32BitSubClassMask[] = {
  0x00000006, 
  0x00010000, // subreg_hr32
  0x0001cf00, // subreg_r32
};

static const uint32_t FP32BitSubClassMask[] = {
  0x00000004, 
  0x00010000, // subreg_hr32
  0x00018d00, // subreg_r32
};

static const uint32_t GR32BitSubClassMask[] = {
  0x00000028, 
  0x00060000, // subreg_hl32
  0x00063000, // subreg_l32
};

static const uint32_t GRH32BitSubClassMask[] = {
  0x00000010, 
  0x00063000, // subreg_h32
  0x00060000, // subreg_hh32
};

static const uint32_t ADDR32BitSubClassMask[] = {
  0x00000020, 
  0x00040000, // subreg_hl32
  0x00062000, // subreg_l32
};

static const uint32_t CCRegsSubClassMask[] = {
  0x00000040, 
};

static const uint32_t AnyRegBitSubClassMask[] = {
  0x0000bd80, 
  0x00070000, // subreg_h64
  0x00070000, // subreg_l64
  0x00008400, // subreg_r64
};

static const uint32_t AnyRegBit_with_subreg_r32SubClassMask[] = {
  0x00008d00, 
  0x00010000, // subreg_h64
  0x00010000, // subreg_l64
  0x00008400, // subreg_r64
};

static const uint32_t VR64BitSubClassMask[] = {
  0x00000a00, 
  0x00010000, // subreg_h64
  0x00010000, // subreg_l64
  0x0000c400, // subreg_r64
};

static const uint32_t AnyRegBit_with_subreg_r64SubClassMask[] = {
  0x00008400, 
};

static const uint32_t FP64BitSubClassMask[] = {
  0x00000800, 
  0x00010000, // subreg_h64
  0x00010000, // subreg_l64
  0x00008400, // subreg_r64
};

static const uint32_t GR64BitSubClassMask[] = {
  0x00003000, 
  0x00060000, // subreg_h64
  0x00060000, // subreg_l64
};

static const uint32_t ADDR64BitSubClassMask[] = {
  0x00002000, 
  0x00040000, // subreg_h64
  0x00060000, // subreg_l64
};

static const uint32_t VR128BitSubClassMask[] = {
  0x0000c000, 
};

static const uint32_t VF128BitSubClassMask[] = {
  0x00008000, 
};

static const uint32_t FP128BitSubClassMask[] = {
  0x00010000, 
};

static const uint32_t GR128BitSubClassMask[] = {
  0x00060000, 
};

static const uint32_t ADDR128BitSubClassMask[] = {
  0x00040000, 
};

static const uint16_t SuperRegIdxSeqs[] = {
  /* 0 */ 1, 3, 0,
  /* 3 */ 1, 3, 4, 6, 0,
  /* 8 */ 2, 7, 0,
  /* 11 */ 5, 8, 0,
  /* 14 */ 2, 7, 9, 0,
};

static const TargetRegisterClass *const FP32BitSuperclasses[] = {
  &SystemZ::VR32BitRegClass,
  nullptr
};

static const TargetRegisterClass *const GR32BitSuperclasses[] = {
  &SystemZ::GRX32BitRegClass,
  nullptr
};

static const TargetRegisterClass *const GRH32BitSuperclasses[] = {
  &SystemZ::GRX32BitRegClass,
  nullptr
};

static const TargetRegisterClass *const ADDR32BitSuperclasses[] = {
  &SystemZ::GRX32BitRegClass,
  &SystemZ::GR32BitRegClass,
  nullptr
};

static const TargetRegisterClass *const AnyRegBit_with_subreg_r32Superclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  nullptr
};

static const TargetRegisterClass *const AnyRegBit_with_subreg_r64Superclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  &SystemZ::AnyRegBit_with_subreg_r32RegClass,
  nullptr
};

static const TargetRegisterClass *const FP64BitSuperclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  &SystemZ::AnyRegBit_with_subreg_r32RegClass,
  &SystemZ::VR64BitRegClass,
  nullptr
};

static const TargetRegisterClass *const GR64BitSuperclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  nullptr
};

static const TargetRegisterClass *const ADDR64BitSuperclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  &SystemZ::GR64BitRegClass,
  nullptr
};

static const TargetRegisterClass *const VF128BitSuperclasses[] = {
  &SystemZ::AnyRegBitRegClass,
  &SystemZ::AnyRegBit_with_subreg_r32RegClass,
  &SystemZ::AnyRegBit_with_subreg_r64RegClass,
  &SystemZ::VR128BitRegClass,
  nullptr
};

static const TargetRegisterClass *const ADDR128BitSuperclasses[] = {
  &SystemZ::GR128BitRegClass,
  nullptr
};


namespace SystemZ {   // Register class instances
  extern const TargetRegisterClass GRX32BitRegClass = {
    &SystemZMCRegisterClasses[GRX32BitRegClassID],
    VTLists + 0,
    GRX32BitSubClassMask,
    SuperRegIdxSeqs + 3,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass VR32BitRegClass = {
    &SystemZMCRegisterClasses[VR32BitRegClassID],
    VTLists + 10,
    VR32BitSubClassMask,
    SuperRegIdxSeqs + 11,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass FP32BitRegClass = {
    &SystemZMCRegisterClasses[FP32BitRegClassID],
    VTLists + 4,
    FP32BitSubClassMask,
    SuperRegIdxSeqs + 11,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    FP32BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass GR32BitRegClass = {
    &SystemZMCRegisterClasses[GR32BitRegClassID],
    VTLists + 0,
    GR32BitSubClassMask,
    SuperRegIdxSeqs + 5,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    GR32BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass GRH32BitRegClass = {
    &SystemZMCRegisterClasses[GRH32BitRegClassID],
    VTLists + 0,
    GRH32BitSubClassMask,
    SuperRegIdxSeqs + 0,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    GRH32BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass ADDR32BitRegClass = {
    &SystemZMCRegisterClasses[ADDR32BitRegClassID],
    VTLists + 0,
    ADDR32BitSubClassMask,
    SuperRegIdxSeqs + 5,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    ADDR32BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass CCRegsRegClass = {
    &SystemZMCRegisterClasses[CCRegsRegClassID],
    VTLists + 0,
    CCRegsSubClassMask,
    SuperRegIdxSeqs + 2,
    0x00000001,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass AnyRegBitRegClass = {
    &SystemZMCRegisterClasses[AnyRegBitRegClassID],
    VTLists + 14,
    AnyRegBitSubClassMask,
    SuperRegIdxSeqs + 14,
    0x00000031,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass AnyRegBit_with_subreg_r32RegClass = {
    &SystemZMCRegisterClasses[AnyRegBit_with_subreg_r32RegClassID],
    VTLists + 14,
    AnyRegBit_with_subreg_r32SubClassMask,
    SuperRegIdxSeqs + 14,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    AnyRegBit_with_subreg_r32Superclasses,
    nullptr
  };

  extern const TargetRegisterClass VR64BitRegClass = {
    &SystemZMCRegisterClasses[VR64BitRegClassID],
    VTLists + 15,
    VR64BitSubClassMask,
    SuperRegIdxSeqs + 14,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass AnyRegBit_with_subreg_r64RegClass = {
    &SystemZMCRegisterClasses[AnyRegBit_with_subreg_r64RegClassID],
    VTLists + 14,
    AnyRegBit_with_subreg_r64SubClassMask,
    SuperRegIdxSeqs + 2,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    AnyRegBit_with_subreg_r64Superclasses,
    nullptr
  };

  extern const TargetRegisterClass FP64BitRegClass = {
    &SystemZMCRegisterClasses[FP64BitRegClassID],
    VTLists + 6,
    FP64BitSubClassMask,
    SuperRegIdxSeqs + 14,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    FP64BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass GR64BitRegClass = {
    &SystemZMCRegisterClasses[GR64BitRegClassID],
    VTLists + 2,
    GR64BitSubClassMask,
    SuperRegIdxSeqs + 8,
    0x00000011,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    GR64BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass ADDR64BitRegClass = {
    &SystemZMCRegisterClasses[ADDR64BitRegClassID],
    VTLists + 2,
    ADDR64BitSubClassMask,
    SuperRegIdxSeqs + 8,
    0x00000011,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    ADDR64BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass VR128BitRegClass = {
    &SystemZMCRegisterClasses[VR128BitRegClassID],
    VTLists + 21,
    VR128BitSubClassMask,
    SuperRegIdxSeqs + 2,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass VF128BitRegClass = {
    &SystemZMCRegisterClasses[VF128BitRegClassID],
    VTLists + 21,
    VF128BitSubClassMask,
    SuperRegIdxSeqs + 2,
    0x00000020,
    0,
    false, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    VF128BitSuperclasses,
    nullptr
  };

  extern const TargetRegisterClass FP128BitRegClass = {
    &SystemZMCRegisterClasses[FP128BitRegClassID],
    VTLists + 8,
    FP128BitSubClassMask,
    SuperRegIdxSeqs + 2,
    0x0000003f,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass GR128BitRegClass = {
    &SystemZMCRegisterClasses[GR128BitRegClassID],
    VTLists + 28,
    GR128BitSubClassMask,
    SuperRegIdxSeqs + 2,
    0x0000003f,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    NullRegClasses,
    nullptr
  };

  extern const TargetRegisterClass ADDR128BitRegClass = {
    &SystemZMCRegisterClasses[ADDR128BitRegClassID],
    VTLists + 28,
    ADDR128BitSubClassMask,
    SuperRegIdxSeqs + 2,
    0x0000003f,
    0,
    true, /* HasDisjunctSubRegs */
    false, /* CoveredBySubRegs */
    ADDR128BitSuperclasses,
    nullptr
  };

} // end namespace SystemZ

namespace {
  const TargetRegisterClass* const RegisterClasses[] = {
    &SystemZ::GRX32BitRegClass,
    &SystemZ::VR32BitRegClass,
    &SystemZ::FP32BitRegClass,
    &SystemZ::GR32BitRegClass,
    &SystemZ::GRH32BitRegClass,
    &SystemZ::ADDR32BitRegClass,
    &SystemZ::CCRegsRegClass,
    &SystemZ::AnyRegBitRegClass,
    &SystemZ::AnyRegBit_with_subreg_r32RegClass,
    &SystemZ::VR64BitRegClass,
    &SystemZ::AnyRegBit_with_subreg_r64RegClass,
    &SystemZ::FP64BitRegClass,
    &SystemZ::GR64BitRegClass,
    &SystemZ::ADDR64BitRegClass,
    &SystemZ::VR128BitRegClass,
    &SystemZ::VF128BitRegClass,
    &SystemZ::FP128BitRegClass,
    &SystemZ::GR128BitRegClass,
    &SystemZ::ADDR128BitRegClass,
  };
} // end anonymous namespace

static const TargetRegisterInfoDesc SystemZRegInfoDesc[] = { // Extra Descriptors
  { 0, false },
  { 0, false },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
  { 0, true },
};
unsigned SystemZGenRegisterInfo::composeSubRegIndicesImpl(unsigned IdxA, unsigned IdxB) const {
  static const uint8_t RowMap[9] = {
    0, 0, 0, 0, 0, 0, 1, 0, 1, 
  };
  static const uint8_t Rows[2][9] = {
    { 3, 0, 0, 0, 0, 4, 0, 5, 0, },
    { 1, 0, 0, 0, 0, 6, 0, 8, 0, },
  };

  --IdxA; assert(IdxA < 9);
  --IdxB; assert(IdxB < 9);
  return Rows[RowMap[IdxA]][IdxB];
}

  struct MaskRolOp {
    unsigned Mask;
    uint8_t  RotateLeft;
  };
  static const MaskRolOp LaneMaskComposeSequences[] = {
    { 0xFFFFFFFF,  0 }, { 0, 0 },   // Sequence 0
    { 0x00000001,  1 }, { 0x00000030, 30 }, { 0, 0 },   // Sequence 2
    { 0xFFFFFFFF,  1 }, { 0, 0 },   // Sequence 5
    { 0xFFFFFFFF,  2 }, { 0, 0 },   // Sequence 7
    { 0xFFFFFFFF,  3 }, { 0, 0 },   // Sequence 9
    { 0xFFFFFFFF,  4 }, { 0, 0 },   // Sequence 11
    { 0xFFFFFFFF,  5 }, { 0, 0 }  // Sequence 13
  };
  static const MaskRolOp *const CompositeSequences[] = {
    &LaneMaskComposeSequences[0], // to subreg_h32
    &LaneMaskComposeSequences[2], // to subreg_h64
    &LaneMaskComposeSequences[5], // to subreg_hh32
    &LaneMaskComposeSequences[7], // to subreg_hl32
    &LaneMaskComposeSequences[9], // to subreg_hr32
    &LaneMaskComposeSequences[11], // to subreg_l32
    &LaneMaskComposeSequences[0], // to subreg_l64
    &LaneMaskComposeSequences[13], // to subreg_r32
    &LaneMaskComposeSequences[0] // to subreg_r64
  };

LaneBitmask SystemZGenRegisterInfo::composeSubRegIndexLaneMaskImpl(unsigned IdxA, LaneBitmask LaneMask) const {
  --IdxA; assert(IdxA < 9 && "Subregister index out of bounds");
  LaneBitmask Result = 0;
  for (const MaskRolOp *Ops = CompositeSequences[IdxA]; Ops->Mask != 0; ++Ops) {
    LaneBitmask Masked = LaneMask & Ops->Mask;
    Result |= (Masked << Ops->RotateLeft) & 0xFFFFFFFF;
    Result |= (Masked >> ((32 - Ops->RotateLeft) & 0x1F));
  }
  return Result;
}

LaneBitmask SystemZGenRegisterInfo::reverseComposeSubRegIndexLaneMaskImpl(unsigned IdxA,  LaneBitmask LaneMask) const {
  LaneMask &= getSubRegIndexLaneMask(IdxA);
  --IdxA; assert(IdxA < 9 && "Subregister index out of bounds");
  LaneBitmask Result = 0;
  for (const MaskRolOp *Ops = CompositeSequences[IdxA]; Ops->Mask != 0; ++Ops) {
    LaneBitmask Rotated = (LaneMask >> Ops->RotateLeft) |
                          ((LaneMask << ((32 - Ops->RotateLeft) & 0x1F)) & 0xFFFFFFFF);
    Result |= Rotated & Ops->Mask;
  }
  return Result;
}

const TargetRegisterClass *SystemZGenRegisterInfo::getSubClassWithSubReg(const TargetRegisterClass *RC, unsigned Idx) const {
  static const uint8_t Table[19][9] = {
    {	// GRX32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// VR32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// FP32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// GR32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// GRH32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// ADDR32Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// CCRegs
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// AnyRegBit
      13,	// subreg_h32 -> GR64Bit
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      13,	// subreg_l32 -> GR64Bit
      0,	// subreg_l64
      9,	// subreg_r32 -> AnyRegBit_with_subreg_r32
      11,	// subreg_r64 -> AnyRegBit_with_subreg_r64
    },
    {	// AnyRegBit_with_subreg_r32
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      9,	// subreg_r32 -> AnyRegBit_with_subreg_r32
      11,	// subreg_r64 -> AnyRegBit_with_subreg_r64
    },
    {	// VR64Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      10,	// subreg_r32 -> VR64Bit
      0,	// subreg_r64
    },
    {	// AnyRegBit_with_subreg_r64
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      11,	// subreg_r32 -> AnyRegBit_with_subreg_r64
      11,	// subreg_r64 -> AnyRegBit_with_subreg_r64
    },
    {	// FP64Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      12,	// subreg_r32 -> FP64Bit
      0,	// subreg_r64
    },
    {	// GR64Bit
      13,	// subreg_h32 -> GR64Bit
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      13,	// subreg_l32 -> GR64Bit
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// ADDR64Bit
      14,	// subreg_h32 -> ADDR64Bit
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      14,	// subreg_l32 -> ADDR64Bit
      0,	// subreg_l64
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// VR128Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      15,	// subreg_r32 -> VR128Bit
      15,	// subreg_r64 -> VR128Bit
    },
    {	// VF128Bit
      0,	// subreg_h32
      0,	// subreg_h64
      0,	// subreg_hh32
      0,	// subreg_hl32
      0,	// subreg_hr32
      0,	// subreg_l32
      0,	// subreg_l64
      16,	// subreg_r32 -> VF128Bit
      16,	// subreg_r64 -> VF128Bit
    },
    {	// FP128Bit
      0,	// subreg_h32
      17,	// subreg_h64 -> FP128Bit
      0,	// subreg_hh32
      0,	// subreg_hl32
      17,	// subreg_hr32 -> FP128Bit
      0,	// subreg_l32
      17,	// subreg_l64 -> FP128Bit
      17,	// subreg_r32 -> FP128Bit
      0,	// subreg_r64
    },
    {	// GR128Bit
      18,	// subreg_h32 -> GR128Bit
      18,	// subreg_h64 -> GR128Bit
      18,	// subreg_hh32 -> GR128Bit
      18,	// subreg_hl32 -> GR128Bit
      0,	// subreg_hr32
      18,	// subreg_l32 -> GR128Bit
      18,	// subreg_l64 -> GR128Bit
      0,	// subreg_r32
      0,	// subreg_r64
    },
    {	// ADDR128Bit
      19,	// subreg_h32 -> ADDR128Bit
      19,	// subreg_h64 -> ADDR128Bit
      19,	// subreg_hh32 -> ADDR128Bit
      19,	// subreg_hl32 -> ADDR128Bit
      0,	// subreg_hr32
      19,	// subreg_l32 -> ADDR128Bit
      19,	// subreg_l64 -> ADDR128Bit
      0,	// subreg_r32
      0,	// subreg_r64
    },
  };
  assert(RC && "Missing regclass");
  if (!Idx) return RC;
  --Idx;
  assert(Idx < 9 && "Bad subreg");
  unsigned TV = Table[RC->getID()][Idx];
  return TV ? getRegClass(TV - 1) : nullptr;
}

/// Get the weight in units of pressure for this register class.
const RegClassWeight &SystemZGenRegisterInfo::
getRegClassWeight(const TargetRegisterClass *RC) const {
  static const RegClassWeight RCWeightTable[] = {
    {1, 32},  	// GRX32Bit
    {1, 32},  	// VR32Bit
    {1, 16},  	// FP32Bit
    {1, 16},  	// GR32Bit
    {1, 16},  	// GRH32Bit
    {1, 15},  	// ADDR32Bit
    {0, 0},  	// CCRegs
    {2, 64},  	// AnyRegBit
    {2, 32},  	// AnyRegBit_with_subreg_r32
    {2, 64},  	// VR64Bit
    {2, 32},  	// AnyRegBit_with_subreg_r64
    {2, 32},  	// FP64Bit
    {2, 32},  	// GR64Bit
    {2, 30},  	// ADDR64Bit
    {2, 64},  	// VR128Bit
    {2, 32},  	// VF128Bit
    {4, 32},  	// FP128Bit
    {4, 32},  	// GR128Bit
    {4, 28},  	// ADDR128Bit
  };
  return RCWeightTable[RC->getID()];
}

/// Get the weight in units of pressure for this register unit.
unsigned SystemZGenRegisterInfo::
getRegUnitWeight(unsigned RegUnit) const {
  assert(RegUnit < 65 && "invalid register unit");
  // All register units have unit weight.
  return 1;
}


// Get the number of dimensions of register pressure.
unsigned SystemZGenRegisterInfo::getNumRegPressureSets() const {
  return 11;
}

// Get the name of this register unit pressure set.
const char *SystemZGenRegisterInfo::
getRegPressureSetName(unsigned Idx) const {
  static const char *const PressureNameTable[] = {
    "FP32Bit",
    "GR32Bit",
    "GRH32Bit",
    "GRX32Bit",
    "VR32Bit",
    "AnyRegBit_with_subreg_r32",
    "VR32Bit+AnyRegBit_with_subreg_r32",
    "AnyRegBit",
    "VR64Bit",
    "VR32Bit+AnyRegBit",
    "AnyRegBit+VR64Bit",
  };
  return PressureNameTable[Idx];
}

// Get the register unit pressure limit for this dimension.
// This limit must be adjusted dynamically for reserved registers.
unsigned SystemZGenRegisterInfo::
getRegPressureSetLimit(const MachineFunction &MF, unsigned Idx) const {
  static const uint8_t PressureLimitTable[] = {
    16,  	// 0: FP32Bit
    16,  	// 1: GR32Bit
    16,  	// 2: GRH32Bit
    32,  	// 3: GRX32Bit
    32,  	// 4: VR32Bit
    32,  	// 5: AnyRegBit_with_subreg_r32
    48,  	// 6: VR32Bit+AnyRegBit_with_subreg_r32
    64,  	// 7: AnyRegBit
    64,  	// 8: VR64Bit
    80,  	// 9: VR32Bit+AnyRegBit
    96,  	// 10: AnyRegBit+VR64Bit
  };
  return PressureLimitTable[Idx];
}

/// Table of pressure sets per register class or unit.
static const int RCSetsTable[] = {
  /* 0 */ 8, 10, -1,
  /* 3 */ 1, 3, 7, 9, 10, -1,
  /* 9 */ 2, 3, 7, 9, 10, -1,
  /* 15 */ 4, 6, 8, 9, 10, -1,
  /* 21 */ 0, 4, 5, 6, 7, 8, 9, 10, -1,
};

/// Get the dimensions of register pressure impacted by this register class.
/// Returns a -1 terminated array of pressure set IDs
const int* SystemZGenRegisterInfo::
getRegClassPressureSets(const TargetRegisterClass *RC) const {
  static const uint8_t RCSetStartTable[] = {
    4,15,21,3,9,3,2,5,23,0,23,23,4,4,0,23,23,4,4,};
  return &RCSetsTable[RCSetStartTable[RC->getID()]];
}

/// Get the dimensions of register pressure impacted by this register unit.
/// Returns a -1 terminated array of pressure set IDs
const int* SystemZGenRegisterInfo::
getRegUnitPressureSets(unsigned RegUnit) const {
  assert(RegUnit < 65 && "invalid register unit");
  static const uint8_t RUSetStartTable[] = {
    2,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,21,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,3,9,};
  return &RCSetsTable[RUSetStartTable[RegUnit]];
}

extern const MCRegisterDesc SystemZRegDesc[];
extern const MCPhysReg SystemZRegDiffLists[];
extern const unsigned SystemZLaneMaskLists[];
extern const char SystemZRegStrings[];
extern const char SystemZRegClassStrings[];
extern const MCPhysReg SystemZRegUnitRoots[][2];
extern const uint16_t SystemZSubRegIdxLists[];
extern const MCRegisterInfo::SubRegCoveredBits SystemZSubRegIdxRanges[];
extern const uint16_t SystemZRegEncodingTable[];
// SystemZ Dwarf<->LLVM register mappings.
extern const MCRegisterInfo::DwarfLLVMRegPair SystemZDwarfFlavour0Dwarf2L[];
extern const unsigned SystemZDwarfFlavour0Dwarf2LSize;

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZEHFlavour0Dwarf2L[];
extern const unsigned SystemZEHFlavour0Dwarf2LSize;

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZDwarfFlavour0L2Dwarf[];
extern const unsigned SystemZDwarfFlavour0L2DwarfSize;

extern const MCRegisterInfo::DwarfLLVMRegPair SystemZEHFlavour0L2Dwarf[];
extern const unsigned SystemZEHFlavour0L2DwarfSize;

SystemZGenRegisterInfo::
SystemZGenRegisterInfo(unsigned RA, unsigned DwarfFlavour, unsigned EHFlavour, unsigned PC)
  : TargetRegisterInfo(SystemZRegInfoDesc, RegisterClasses, RegisterClasses+19,
             SubRegIndexNameTable, SubRegIndexLaneMaskTable, 0xffffffc0) {
  InitMCRegisterInfo(SystemZRegDesc, 162, RA, PC,
                     SystemZMCRegisterClasses, 19,
                     SystemZRegUnitRoots,
                     65,
                     SystemZRegDiffLists,
                     SystemZLaneMaskLists,
                     SystemZRegStrings,
                     SystemZRegClassStrings,
                     SystemZSubRegIdxLists,
                     10,
                     SystemZSubRegIdxRanges,
                     SystemZRegEncodingTable);

  switch (DwarfFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    mapDwarfRegsToLLVMRegs(SystemZDwarfFlavour0Dwarf2L, SystemZDwarfFlavour0Dwarf2LSize, false);
    break;
  }
  switch (EHFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    mapDwarfRegsToLLVMRegs(SystemZEHFlavour0Dwarf2L, SystemZEHFlavour0Dwarf2LSize, true);
    break;
  }
  switch (DwarfFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    mapLLVMRegsToDwarfRegs(SystemZDwarfFlavour0L2Dwarf, SystemZDwarfFlavour0L2DwarfSize, false);
    break;
  }
  switch (EHFlavour) {
  default:
    llvm_unreachable("Unknown DWARF flavour");
  case 0:
    mapLLVMRegsToDwarfRegs(SystemZEHFlavour0L2Dwarf, SystemZEHFlavour0L2DwarfSize, true);
    break;
  }
}

static const MCPhysReg CSR_SystemZ_SaveList[] = { SystemZ::R6D, SystemZ::R7D, SystemZ::R8D, SystemZ::R9D, SystemZ::R10D, SystemZ::R11D, SystemZ::R12D, SystemZ::R13D, SystemZ::R14D, SystemZ::R15D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, 0 };
static const uint32_t CSR_SystemZ_RegMask[] = { 0x00000000, 0x0003fc00, 0x03fc0000, 0x03ff0000, 0x03ff03ff, 0x00000000, };
static const MCPhysReg CSR_SystemZ_SwiftError_SaveList[] = { SystemZ::R6D, SystemZ::R7D, SystemZ::R8D, SystemZ::R10D, SystemZ::R11D, SystemZ::R12D, SystemZ::R13D, SystemZ::R14D, SystemZ::R15D, SystemZ::F8D, SystemZ::F9D, SystemZ::F10D, SystemZ::F11D, SystemZ::F12D, SystemZ::F13D, SystemZ::F14D, SystemZ::F15D, 0 };
static const uint32_t CSR_SystemZ_SwiftError_RegMask[] = { 0x00000000, 0x0003fc00, 0x03fc0000, 0x03f70000, 0x03f703f7, 0x00000000, };


ArrayRef<const uint32_t *> SystemZGenRegisterInfo::getRegMasks() const {
  static const uint32_t *const Masks[] = {
    CSR_SystemZ_RegMask,
    CSR_SystemZ_SwiftError_RegMask,
  };
  return makeArrayRef(Masks);
}

ArrayRef<const char *> SystemZGenRegisterInfo::getRegMaskNames() const {
  static const char *const Names[] = {
    "CSR_SystemZ",
    "CSR_SystemZ_SwiftError",
  };
  return makeArrayRef(Names);
}

const SystemZFrameLowering *
SystemZGenRegisterInfo::getFrameLowering(const MachineFunction &MF) {
  return static_cast<const SystemZFrameLowering *>(
      MF.getSubtarget().getFrameLowering());
}

} // end namespace llvm

#endif // GET_REGINFO_TARGET_DESC

