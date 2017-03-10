/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Assembly Matcher Source Fragment                                           *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/


#ifdef GET_ASSEMBLER_HEADER
#undef GET_ASSEMBLER_HEADER
  // This should be included into the middle of the declaration of
  // your subclasses implementation of MCTargetAsmParser.
  uint64_t ComputeAvailableFeatures(const FeatureBitset& FB) const;
  void convertToMCInst(unsigned Kind, MCInst &Inst, unsigned Opcode,
                       const OperandVector &Operands);
  void convertToMapAndConstraints(unsigned Kind,
                           const OperandVector &Operands) override;
  bool mnemonicIsValid(StringRef Mnemonic, unsigned VariantID);
  unsigned MatchInstructionImpl(const OperandVector &Operands,
                                MCInst &Inst,
                                uint64_t &ErrorInfo, bool matchingInlineAsm,
                                unsigned VariantID = 0);
#endif // GET_ASSEMBLER_HEADER_INFO


#ifdef GET_OPERAND_DIAGNOSTIC_TYPES
#undef GET_OPERAND_DIAGNOSTIC_TYPES

#endif // GET_OPERAND_DIAGNOSTIC_TYPES


#ifdef GET_REGISTER_MATCHER
#undef GET_REGISTER_MATCHER

// Flags for subtarget features that participate in instruction matching.
enum SubtargetFeatureFlag : uint8_t {
  Feature_None = 0
};

#endif // GET_REGISTER_MATCHER


#ifdef GET_SUBTARGET_FEATURE_NAME
#undef GET_SUBTARGET_FEATURE_NAME

// User-level names for subtarget features that participate in
// instruction matching.
static const char *getSubtargetFeatureName(uint64_t Val) {
  return "(unknown)";
}

#endif // GET_SUBTARGET_FEATURE_NAME


#ifdef GET_MATCHER_IMPLEMENTATION
#undef GET_MATCHER_IMPLEMENTATION

static void applyMnemonicAliases(StringRef &Mnemonic, uint64_t Features, unsigned VariantID) {
  switch (VariantID) {
    case 0:
      switch (Mnemonic.size()) {
      default: break;
      case 5:	 // 1 string to match.
        if (memcmp(Mnemonic.data()+0, "cntlz", 5))
          break;
        Mnemonic = "cntlzw";	 // "cntlz"
        return;
      case 6:	 // 1 string to match.
        if (memcmp(Mnemonic.data()+0, "cntlz.", 6))
          break;
        Mnemonic = "cntlzw.";	 // "cntlz."
        return;
      }
    break;
  }
  switch (Mnemonic.size()) {
  default: break;
  case 5:	 // 1 string to match.
    if (memcmp(Mnemonic.data()+0, "cntlz", 5))
      break;
    Mnemonic = "cntlzw";	 // "cntlz"
    return;
  case 6:	 // 1 string to match.
    if (memcmp(Mnemonic.data()+0, "cntlz.", 6))
      break;
    Mnemonic = "cntlzw.";	 // "cntlz."
    return;
  }
}

namespace {
enum OperatorConversionKind {
  CVT_Done,
  CVT_Reg,
  CVT_Tied,
  CVT_95_addRegG8RCOperands,
  CVT_95_addTLSRegOperands,
  CVT_95_addRegGPRCOperands,
  CVT_95_addRegGPRCNoR0Operands,
  CVT_95_addS16ImmOperands,
  CVT_95_addU16ImmOperands,
  CVT_95_addBranchTargetOperands,
  CVT_95_addImmOperands,
  CVT_95_addRegCRBITRCOperands,
  CVT_imm_95_0,
  CVT_95_addRegVRRCOperands,
  CVT_imm_95_8,
  CVT_imm_95_2,
  CVT_imm_95_10,
  CVT_imm_95_76,
  CVT_regCR0,
  CVT_95_addRegCRRCOperands,
  CVT_imm_95_79,
  CVT_imm_95_78,
  CVT_imm_95_4,
  CVT_imm_95_7,
  CVT_imm_95_6,
  CVT_imm_95_44,
  CVT_imm_95_47,
  CVT_imm_95_46,
  CVT_imm_95_36,
  CVT_imm_95_39,
  CVT_imm_95_38,
  CVT_imm_95_12,
  CVT_imm_95_15,
  CVT_imm_95_14,
  CVT_imm_95_68,
  CVT_imm_95_71,
  CVT_imm_95_70,
  CVT_imm_95_100,
  CVT_imm_95_103,
  CVT_imm_95_102,
  CVT_imm_95_108,
  CVT_imm_95_111,
  CVT_imm_95_110,
  CVT_imm_95_31,
  CVT_95_addRegGxRCNoR0Operands,
  CVT_95_addRegGxRCOperands,
  CVT_regR0,
  CVT_95_addRegF4RCOperands,
  CVT_95_addRegF8RCOperands,
  CVT_imm_95_1,
  CVT_95_addRegVSFRCOperands,
  CVT_95_addRegVSSRCOperands,
  CVT_95_addRegVSRCOperands,
  CVT_imm_95_29,
  CVT_imm_95_280,
  CVT_imm_95_128,
  CVT_imm_95_129,
  CVT_imm_95_130,
  CVT_imm_95_131,
  CVT_imm_95_132,
  CVT_imm_95_133,
  CVT_imm_95_134,
  CVT_imm_95_135,
  CVT_imm_95_28,
  CVT_imm_95_19,
  CVT_imm_95_537,
  CVT_imm_95_539,
  CVT_imm_95_541,
  CVT_imm_95_543,
  CVT_imm_95_536,
  CVT_imm_95_538,
  CVT_imm_95_540,
  CVT_imm_95_542,
  CVT_imm_95_1018,
  CVT_imm_95_981,
  CVT_imm_95_22,
  CVT_imm_95_17,
  CVT_imm_95_18,
  CVT_imm_95_980,
  CVT_imm_95_529,
  CVT_imm_95_531,
  CVT_imm_95_533,
  CVT_imm_95_535,
  CVT_imm_95_528,
  CVT_imm_95_530,
  CVT_imm_95_532,
  CVT_imm_95_534,
  CVT_imm_95_1019,
  CVT_95_addCRBitMaskOperands,
  CVT_imm_95_48,
  CVT_imm_95_287,
  CVT_imm_95_5,
  CVT_imm_95_25,
  CVT_imm_95_512,
  CVT_imm_95_272,
  CVT_imm_95_273,
  CVT_imm_95_274,
  CVT_imm_95_275,
  CVT_imm_95_260,
  CVT_imm_95_261,
  CVT_imm_95_262,
  CVT_imm_95_263,
  CVT_imm_95_26,
  CVT_imm_95_27,
  CVT_imm_95_990,
  CVT_imm_95_991,
  CVT_imm_95_268,
  CVT_imm_95_988,
  CVT_imm_95_989,
  CVT_imm_95_269,
  CVT_imm_95_986,
  CVT_imm_95_255,
  CVT_imm_95_284,
  CVT_imm_95_285,
  CVT_95_addRegQFRCOperands,
  CVT_95_addRegQSRCOperands,
  CVT_95_addRegQBRCOperands,
  CVT_imm_95_9,
  CVT_imm_95_13,
  CVT_imm_95_20,
  CVT_imm_95_16,
  CVT_imm_95_24,
  CVT_imm_95_3,
  CVT_NUM_CONVERTERS
};

enum InstructionConversionKind {
  Convert__RegG8RC1_0__RegG8RC1_1__TLSReg1_2,
  Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2,
  Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3,
  Convert__RegGPRC1_0__RegGPRCNoR01_1__S16Imm1_2,
  Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2,
  Convert__RegGPRC1_1__RegGPRC1_2__S16Imm1_3,
  Convert__RegGPRC1_0__RegGPRCNoR01_1__S17Imm1_2,
  Convert__RegGPRC1_0__RegGPRC1_1,
  Convert__RegGPRC1_1__RegGPRC1_2,
  Convert__RegGPRC1_1__RegGPRC1_2__U16Imm1_3,
  Convert_NoOperands,
  Convert__DirectBr1_0,
  Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2,
  Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0,
  Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2,
  Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3,
  Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3,
  Convert__RegVRRC1_1__RegVRRC1_2,
  Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3__U1Imm1_4,
  Convert__CondBr1_0,
  Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_0__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_8__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_2__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_10__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_76__regCR0__CondBr1_0,
  Convert__imm_95_76__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_79__regCR0__CondBr1_0,
  Convert__imm_95_79__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_78__regCR0__CondBr1_0,
  Convert__imm_95_78__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_76__regCR0,
  Convert__imm_95_76__RegCRRC1_0,
  Convert__imm_95_79__regCR0,
  Convert__imm_95_79__RegCRRC1_0,
  Convert__imm_95_78__regCR0,
  Convert__imm_95_78__RegCRRC1_0,
  Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_4__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_7__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_6__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_4__regCR0__CondBr1_0,
  Convert__imm_95_4__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_7__regCR0__CondBr1_0,
  Convert__imm_95_7__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_6__regCR0__CondBr1_0,
  Convert__imm_95_6__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_4__regCR0,
  Convert__imm_95_4__RegCRRC1_0,
  Convert__imm_95_7__regCR0,
  Convert__imm_95_7__RegCRRC1_0,
  Convert__imm_95_6__regCR0,
  Convert__imm_95_6__RegCRRC1_0,
  Convert__imm_95_44__regCR0__CondBr1_0,
  Convert__imm_95_44__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_47__regCR0__CondBr1_0,
  Convert__imm_95_47__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_46__regCR0__CondBr1_0,
  Convert__imm_95_46__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_44__regCR0,
  Convert__imm_95_44__RegCRRC1_0,
  Convert__imm_95_47__regCR0,
  Convert__imm_95_47__RegCRRC1_0,
  Convert__imm_95_46__regCR0,
  Convert__imm_95_46__RegCRRC1_0,
  Convert__DirectBr1_0__Imm1_1,
  Convert__imm_95_36__regCR0__CondBr1_0,
  Convert__imm_95_36__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_39__regCR0__CondBr1_0,
  Convert__imm_95_39__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_38__regCR0__CondBr1_0,
  Convert__imm_95_38__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_36__regCR0,
  Convert__imm_95_36__RegCRRC1_0,
  Convert__imm_95_39__regCR0,
  Convert__imm_95_39__RegCRRC1_0,
  Convert__imm_95_38__regCR0,
  Convert__imm_95_38__RegCRRC1_0,
  Convert__imm_95_12__regCR0__CondBr1_0,
  Convert__imm_95_12__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_15__regCR0__CondBr1_0,
  Convert__imm_95_15__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_14__regCR0__CondBr1_0,
  Convert__imm_95_14__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_12__regCR0,
  Convert__imm_95_12__RegCRRC1_0,
  Convert__imm_95_15__regCR0,
  Convert__imm_95_15__RegCRRC1_0,
  Convert__imm_95_14__regCR0,
  Convert__imm_95_14__RegCRRC1_0,
  Convert__imm_95_68__regCR0__CondBr1_0,
  Convert__imm_95_68__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_71__regCR0__CondBr1_0,
  Convert__imm_95_71__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_70__regCR0__CondBr1_0,
  Convert__imm_95_70__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_68__regCR0,
  Convert__imm_95_68__RegCRRC1_0,
  Convert__imm_95_71__regCR0,
  Convert__imm_95_71__RegCRRC1_0,
  Convert__imm_95_70__regCR0,
  Convert__imm_95_70__RegCRRC1_0,
  Convert__imm_95_100__regCR0__CondBr1_0,
  Convert__imm_95_100__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_103__regCR0__CondBr1_0,
  Convert__imm_95_103__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_102__regCR0__CondBr1_0,
  Convert__imm_95_102__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_100__regCR0,
  Convert__imm_95_100__RegCRRC1_0,
  Convert__imm_95_103__regCR0,
  Convert__imm_95_103__RegCRRC1_0,
  Convert__imm_95_102__regCR0,
  Convert__imm_95_102__RegCRRC1_0,
  Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2,
  Convert__imm_95_108__regCR0__CondBr1_0,
  Convert__imm_95_108__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_111__regCR0__CondBr1_0,
  Convert__imm_95_111__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_110__regCR0__CondBr1_0,
  Convert__imm_95_110__RegCRRC1_0__CondBr1_1,
  Convert__imm_95_108__regCR0,
  Convert__imm_95_108__RegCRRC1_0,
  Convert__imm_95_111__regCR0,
  Convert__imm_95_111__RegCRRC1_0,
  Convert__imm_95_110__regCR0,
  Convert__imm_95_110__RegCRRC1_0,
  Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1,
  Convert__imm_95_12__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_15__RegCRBITRC1_0__imm_95_0,
  Convert__imm_95_14__RegCRBITRC1_0__imm_95_0,
  Convert__RegG8RC1_0__RegG8RC1_1__imm_95_0__U6Imm1_2,
  Convert__RegG8RC1_1__RegG8RC1_2__imm_95_0__U6Imm1_3,
  Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3,
  Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4,
  Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3,
  Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4,
  Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0__U5Imm1_2__imm_95_31,
  Convert__RegGPRC1_1__RegGPRC1_2__imm_95_0__U5Imm1_3__imm_95_31,
  Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2,
  Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3,
  Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2,
  Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3,
  Convert__RegCRRC1_0__RegGPRC1_2__RegGPRC1_3,
  Convert__RegCRRC1_0__RegG8RC1_2__RegG8RC1_3,
  Convert__regCR0__RegG8RC1_0__RegG8RC1_1,
  Convert__RegCRRC1_0__RegG8RC1_1__RegG8RC1_2,
  Convert__regCR0__RegG8RC1_0__S16Imm1_1,
  Convert__RegCRRC1_0__RegG8RC1_1__S16Imm1_2,
  Convert__RegCRBITRC1_0__RegG8RC1_1__RegG8RC1_2,
  Convert__RegCRRC1_0__RegGPRC1_2__S16Imm1_3,
  Convert__RegCRRC1_0__RegG8RC1_2__S16Imm1_3,
  Convert__regCR0__RegG8RC1_0__U16Imm1_1,
  Convert__RegCRRC1_0__RegG8RC1_1__U16Imm1_2,
  Convert__RegCRRC1_0__RegGPRC1_2__U16Imm1_3,
  Convert__RegCRRC1_0__RegG8RC1_2__U16Imm1_3,
  Convert__regCR0__RegGPRC1_0__RegGPRC1_1,
  Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2,
  Convert__regCR0__RegGPRC1_0__U16Imm1_1,
  Convert__RegCRRC1_0__RegGPRC1_1__U16Imm1_2,
  Convert__RegCRBITRC1_0__U1Imm1_1__RegG8RC1_2__RegG8RC1_3,
  Convert__regCR0__RegGPRC1_0__S16Imm1_1,
  Convert__RegCRRC1_0__RegGPRC1_1__S16Imm1_2,
  Convert__RegG8RC1_0__RegG8RC1_1,
  Convert__RegG8RC1_1__RegG8RC1_2,
  Convert__RegGPRC1_0__RegGPRC1_1__U1Imm1_2,
  Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2,
  Convert__RegCRBITRC1_0__RegCRBITRC1_0__RegCRBITRC1_0,
  Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_1,
  Convert__RegGxRCNoR01_0__RegGxRC1_1,
  Convert__U5Imm1_2__RegGxRCNoR01_0__RegGxRC1_1,
  Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2,
  Convert__regR0__regR0,
  Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3,
  Convert__U5Imm1_0,
  Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1,
  Convert__RegGPRC1_0__RegGPRC1_2__U5Imm1_1,
  Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2,
  Convert__RegGPRC1_0__DispSPE21_1__RegGxRCNoR01_2,
  Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2,
  Convert__RegGPRC1_0__Imm1_1,
  Convert__RegGPRC1_0__U5Imm1_1__RegGPRC1_2,
  Convert__RegF4RC1_0__RegF4RC1_1,
  Convert__RegF4RC1_1__RegF4RC1_2,
  Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2,
  Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3,
  Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2,
  Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3,
  Convert__RegF8RC1_0__RegF8RC1_1,
  Convert__RegF8RC1_1__RegF8RC1_2,
  Convert__RegF4RC1_0__RegF8RC1_1,
  Convert__RegF4RC1_1__RegF8RC1_2,
  Convert__RegCRRC1_0__RegF4RC1_1__RegF4RC1_2,
  Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3,
  Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4,
  Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3,
  Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4,
  Convert__RegF4RC1_0__RegF8RC1_1__RegF4RC1_2__RegF4RC1_3,
  Convert__RegF4RC1_1__RegF8RC1_2__RegF4RC1_3__RegF4RC1_4,
  Convert__U4Imm1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegGPRC1_0__RegGPRCNoR01_1__RegGPRC1_2__RegCRBITRC1_3,
  Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2,
  Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2,
  Convert__RegG8RC1_0__imm_95_0__DispRIX1_1__RegGxRCNoR01_2,
  Convert__RegG8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegF8RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegF8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegF4RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__RegF4RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegGPRC1_0__S16Imm1_1,
  Convert__RegGPRC1_0__S17Imm1_1,
  Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_1,
  Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2,
  Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegVSSRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegVSRC1_0__DispRIX161_1__RegGxRCNoR01_2,
  Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_0,
  Convert__RegCRRC1_0__RegCRRC1_1,
  Convert__RegCRRC1_0,
  Convert__RegGPRC1_0__imm_95_29,
  Convert__RegGPRC1_0__imm_95_280,
  Convert__RegGPRC1_0__U10Imm1_1__imm_95_0,
  Convert__RegGPRC1_0__imm_95_128,
  Convert__RegGPRC1_0__imm_95_129,
  Convert__RegGPRC1_0__imm_95_130,
  Convert__RegGPRC1_0__imm_95_131,
  Convert__RegGPRC1_0__imm_95_132,
  Convert__RegGPRC1_0__imm_95_133,
  Convert__RegGPRC1_0__imm_95_134,
  Convert__RegGPRC1_0__imm_95_135,
  Convert__RegGPRC1_0__imm_95_28,
  Convert__RegGPRC1_0,
  Convert__RegGPRC1_0__imm_95_19,
  Convert__RegGPRC1_0__imm_95_537,
  Convert__RegGPRC1_0__imm_95_539,
  Convert__RegGPRC1_0__imm_95_541,
  Convert__RegGPRC1_0__imm_95_543,
  Convert__RegGPRC1_0__imm_95_536,
  Convert__RegGPRC1_0__imm_95_538,
  Convert__RegGPRC1_0__imm_95_540,
  Convert__RegGPRC1_0__imm_95_542,
  Convert__RegGPRC1_0__imm_95_1018,
  Convert__RegGPRC1_0__imm_95_981,
  Convert__RegGPRC1_0__imm_95_22,
  Convert__RegGPRC1_0__imm_95_17,
  Convert__RegGPRC1_0__imm_95_18,
  Convert__RegGPRC1_0__imm_95_980,
  Convert__RegF8RC1_0,
  Convert__RegF8RC1_1,
  Convert__RegGPRC1_0__imm_95_529,
  Convert__RegGPRC1_0__imm_95_531,
  Convert__RegGPRC1_0__imm_95_533,
  Convert__RegGPRC1_0__imm_95_535,
  Convert__RegGPRC1_0__imm_95_528,
  Convert__RegGPRC1_0__imm_95_530,
  Convert__RegGPRC1_0__imm_95_532,
  Convert__RegGPRC1_0__imm_95_534,
  Convert__RegGPRC1_0__imm_95_1019,
  Convert__RegGPRC1_0__CRBitMask1_1,
  Convert__RegGPRC1_0__imm_95_48,
  Convert__RegGPRC1_0__imm_95_287,
  Convert__RegGPRC1_0__imm_95_5,
  Convert__RegGPRC1_0__imm_95_4,
  Convert__RegGPRC1_0__imm_95_25,
  Convert__RegGPRC1_0__imm_95_512,
  Convert__RegGPRC1_0__imm_95_272,
  Convert__RegGPRC1_0__imm_95_273,
  Convert__RegGPRC1_0__imm_95_274,
  Convert__RegGPRC1_0__imm_95_275,
  Convert__RegGPRC1_0__imm_95_260,
  Convert__RegGPRC1_0__imm_95_261,
  Convert__RegGPRC1_0__imm_95_262,
  Convert__RegGPRC1_0__imm_95_263,
  Convert__RegGPRC1_0__U4Imm1_1,
  Convert__RegGPRC1_0__imm_95_26,
  Convert__RegGPRC1_0__imm_95_27,
  Convert__RegGPRC1_0__imm_95_990,
  Convert__RegGPRC1_0__imm_95_991,
  Convert__RegGPRC1_0__imm_95_268,
  Convert__RegGPRC1_0__imm_95_988,
  Convert__RegGPRC1_0__imm_95_989,
  Convert__RegGPRC1_0__imm_95_269,
  Convert__RegGPRC1_0__imm_95_986,
  Convert__RegVRRC1_0,
  Convert__RegG8RC1_0__RegVSFRC1_1,
  Convert__RegG8RC1_0__RegVSRC1_1,
  Convert__RegGPRC1_0__RegVSFRC1_1,
  Convert__RegGPRC1_0__imm_95_1,
  Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_1,
  Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_2,
  Convert__imm_95_29__RegGPRC1_0,
  Convert__imm_95_280__RegGPRC1_0,
  Convert__imm_95_28__RegGPRC1_0,
  Convert__imm_95_255__RegG8RC1_0,
  Convert__Imm1_0__RegGPRC1_1,
  Convert__imm_95_19__RegGPRC1_0,
  Convert__imm_95_537__RegGPRC1_1,
  Convert__imm_95_539__RegGPRC1_1,
  Convert__imm_95_541__RegGPRC1_1,
  Convert__imm_95_543__RegGPRC1_1,
  Convert__imm_95_536__RegGPRC1_1,
  Convert__imm_95_538__RegGPRC1_1,
  Convert__imm_95_540__RegGPRC1_1,
  Convert__imm_95_542__RegGPRC1_1,
  Convert__imm_95_1018__RegGPRC1_0,
  Convert__RegGPRC1_1__Imm1_0,
  Convert__imm_95_981__RegGPRC1_0,
  Convert__imm_95_22__RegGPRC1_0,
  Convert__imm_95_17__RegGPRC1_0,
  Convert__imm_95_18__RegGPRC1_0,
  Convert__imm_95_980__RegGPRC1_0,
  Convert__Imm1_0__RegF8RC1_1__imm_95_0__imm_95_0,
  Convert__Imm1_1__RegF8RC1_2__imm_95_0__imm_95_0,
  Convert__Imm1_0__RegF8RC1_1__Imm1_2__Imm1_3,
  Convert__Imm1_1__RegF8RC1_2__Imm1_3__Imm1_4,
  Convert__RegCRRC1_0__Imm1_1__imm_95_0,
  Convert__RegCRRC1_1__Imm1_2__imm_95_0,
  Convert__RegCRRC1_0__Imm1_1__Imm1_2,
  Convert__RegCRRC1_1__Imm1_2__Imm1_3,
  Convert__imm_95_529__RegGPRC1_1,
  Convert__imm_95_531__RegGPRC1_1,
  Convert__imm_95_533__RegGPRC1_1,
  Convert__imm_95_535__RegGPRC1_1,
  Convert__imm_95_528__RegGPRC1_1,
  Convert__imm_95_530__RegGPRC1_1,
  Convert__imm_95_532__RegGPRC1_1,
  Convert__imm_95_534__RegGPRC1_1,
  Convert__imm_95_1019__RegGPRC1_0,
  Convert__RegGPRC1_0__imm_95_0,
  Convert__CRBitMask1_0__RegGPRC1_1,
  Convert__imm_95_48__RegGPRC1_0,
  Convert__imm_95_25__RegGPRC1_0,
  Convert__imm_95_512__RegGPRC1_0,
  Convert__imm_95_272__RegGPRC1_1,
  Convert__imm_95_273__RegGPRC1_1,
  Convert__imm_95_274__RegGPRC1_1,
  Convert__imm_95_275__RegGPRC1_1,
  Convert__imm_95_260__RegGPRC1_1,
  Convert__imm_95_261__RegGPRC1_1,
  Convert__imm_95_262__RegGPRC1_1,
  Convert__imm_95_263__RegGPRC1_1,
  Convert__imm_95_272__RegGPRC1_0,
  Convert__imm_95_273__RegGPRC1_0,
  Convert__imm_95_274__RegGPRC1_0,
  Convert__imm_95_275__RegGPRC1_0,
  Convert__imm_95_260__RegGPRC1_0,
  Convert__imm_95_261__RegGPRC1_0,
  Convert__imm_95_262__RegGPRC1_0,
  Convert__imm_95_263__RegGPRC1_0,
  Convert__RegGPRC1_1__U4Imm1_0,
  Convert__imm_95_26__RegGPRC1_0,
  Convert__imm_95_27__RegGPRC1_0,
  Convert__imm_95_990__RegGPRC1_0,
  Convert__imm_95_991__RegGPRC1_0,
  Convert__imm_95_988__RegGPRC1_0,
  Convert__imm_95_284__RegGPRC1_0,
  Convert__imm_95_989__RegGPRC1_0,
  Convert__imm_95_285__RegGPRC1_0,
  Convert__imm_95_986__RegGPRC1_0,
  Convert__RegVSFRC1_0__RegG8RC1_1,
  Convert__RegVSRC1_0__RegG8RC1_1__RegG8RC1_2,
  Convert__RegVSFRC1_0__RegGPRC1_1,
  Convert__RegVSRC1_0__RegGPRC1_1,
  Convert__imm_95_1__RegGPRC1_0,
  Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2,
  Convert__RegGPRC1_1__RegGPRC1_2__U1Imm1_3,
  Convert__imm_95_2,
  Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__U2Imm1_3,
  Convert__RegQFRC1_0__RegQFRC1_1__U2Imm1_2,
  Convert__RegQFRC1_0__RegQFRC1_1,
  Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2,
  Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_2,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_1,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_4,
  Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_0,
  Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_5,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_9,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__U12Imm1_3,
  Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2,
  Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_14,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_8,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_10,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_7,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_13,
  Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__RegQFRC1_3,
  Convert__RegQSRC1_0__RegQFRC1_1,
  Convert__RegQFRC1_0__RegQBRC1_1__RegQFRC1_3__RegQFRC1_2,
  Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_15,
  Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_6,
  Convert__RegQFRC1_0__U12Imm1_1,
  Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegQFRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegQSRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_0__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_0__RegQSRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__U1Imm1_0,
  Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__U6Imm1_3,
  Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__U6Imm1_4,
  Convert__RegG8RC1_0__Tie0__RegG8RC1_1__U6Imm1_2__U6Imm1_3,
  Convert__RegG8RC1_1__Tie0__RegG8RC1_2__U6Imm1_3__U6Imm1_4,
  Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2__Imm1_3,
  Convert__RegG8RC1_1__RegG8RC1_2__U5Imm1_3__Imm1_4,
  Convert__RegGPRC1_0__Tie0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4,
  Convert__RegGPRC1_1__Tie0__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5,
  Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4,
  Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5,
  Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4,
  Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__U5Imm1_4__U5Imm1_5,
  Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__imm_95_0,
  Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__imm_95_0,
  Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__imm_95_0,
  Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__imm_95_0,
  Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__imm_95_0__imm_95_31,
  Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__imm_95_0__imm_95_31,
  Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__imm_95_0__imm_95_31,
  Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__imm_95_0__imm_95_31,
  Convert__Imm1_0,
  Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2,
  Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3,
  Convert__RegGPRC1_1__RegGxRCNoR01_2__RegGxRC1_3,
  Convert__imm_95_0__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__imm_95_0__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegG8RC1_1__RegGxRCNoR01_2__RegGxRC1_3,
  Convert__imm_95_0__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2,
  Convert__imm_95_0__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_0__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__imm_95_0__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__imm_95_0__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2,
  Convert__imm_95_0__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2,
  Convert__RegG8RC1_0__RegG8RC1_2__RegG8RC1_1,
  Convert__RegG8RC1_1__RegG8RC1_3__RegG8RC1_2,
  Convert__imm_95_0__RegGPRC1_1,
  Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__RegGPRC1_3,
  Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__U5Imm1_3,
  Convert__imm_95_0__U1Imm1_1,
  Convert__U5Imm1_0__RegG8RC1_1__RegG8RC1_2,
  Convert__imm_95_4__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_4__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_12__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_12__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_8__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_8__RegG8RC1_0__S16Imm1_1,
  Convert__U5Imm1_0__RegG8RC1_1__S16Imm1_2,
  Convert__imm_95_20__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_20__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_5__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_5__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_1__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_1__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_6__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_6__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_2__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_2__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_16__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_16__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_24__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_24__RegG8RC1_0__S16Imm1_1,
  Convert__imm_95_31__RegG8RC1_0__RegG8RC1_1,
  Convert__imm_95_31__RegG8RC1_0__S16Imm1_1,
  Convert__regR0__RegGPRC1_0,
  Convert__RegGPRC1_1__RegGPRC1_0,
  Convert__RegGPRC1_0__RegGPRC1_1__Imm1_2,
  Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0,
  Convert__RegGPRC1_0__RegGPRC1_1__imm_95_1,
  Convert__U5Imm1_0__RegGPRC1_1__RegGPRC1_2,
  Convert__imm_95_4__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_4__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_12__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_12__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_8__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_8__RegGPRC1_0__S16Imm1_1,
  Convert__U5Imm1_0__RegGPRC1_1__S16Imm1_2,
  Convert__imm_95_20__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_20__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_5__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_5__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_1__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_1__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_6__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_6__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_2__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_2__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_16__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_16__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_24__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_24__RegGPRC1_0__S16Imm1_1,
  Convert__imm_95_31__RegGPRC1_0__RegGPRC1_1,
  Convert__imm_95_31__RegGPRC1_0__S16Imm1_1,
  Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2,
  Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3,
  Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1,
  Convert__RegVRRC1_0__RegVRRC1_1,
  Convert__RegG8RC1_0__RegVRRC1_1,
  Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1,
  Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2,
  Convert__RegVRRC1_0__RegVRRC1_1__U1Imm1_2__U4Imm1_3,
  Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__U5Imm1_3,
  Convert__RegVRRC1_0__S5Imm1_1,
  Convert__regR0__regR0__imm_95_0,
  Convert__RegVSFRC1_0__RegVSFRC1_1,
  Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2,
  Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2,
  Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2,
  Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2,
  Convert__RegCRRC1_0__RegVRRC1_1__RegVRRC1_2,
  Convert__RegVRRC1_0__RegVSFRC1_1,
  Convert__RegVSRC1_0__RegVSSRC1_1,
  Convert__RegVSSRC1_0__RegVSRC1_1,
  Convert__RegVSSRC1_0__RegVSFRC1_1,
  Convert__RegVRRC1_0__RegVRRC1_1__RegVSFRC1_2,
  Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2,
  Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2,
  Convert__RegVSSRC1_0__RegVSSRC1_1,
  Convert__RegVRRC1_1__U1Imm1_0__RegVRRC1_2__U2Imm1_3,
  Convert__RegCRRC1_0__RegVSFRC1_1,
  Convert__RegCRRC1_0__U7Imm1_2__RegVSFRC1_1,
  Convert__RegCRRC1_0__U7Imm1_2__RegVRRC1_1,
  Convert__RegVSRC1_0__RegVSRC1_1,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2,
  Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3,
  Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1,
  Convert__RegCRRC1_0__RegVSRC1_1__RegVSRC1_2,
  Convert__RegCRRC1_0__RegVSRC1_1,
  Convert__RegVSRC1_0__U7Imm1_2__RegVSRC1_1,
  Convert__RegVSFRC1_0__RegVSRC1_1__U4Imm1_2,
  Convert__RegVSRC1_0__Tie0__RegVSRC1_1__U4Imm1_2,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_0,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_3,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__U2Imm1_3,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_0,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_3,
  Convert__RegVSRC1_0__U8Imm1_1,
  Convert__RegVSRC1_0__RegVSRC1_1__U2Imm1_2,
  Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_2,
  CVT_NUM_SIGNATURES
};

} // end anonymous namespace

static const uint8_t ConversionTable[CVT_NUM_SIGNATURES][13] = {
  // Convert__RegG8RC1_0__RegG8RC1_1__TLSReg1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addTLSRegOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRCNoR01_1__S16Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCNoR0Operands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__S16Imm1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addS16ImmOperands, 4, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRCNoR01_1__S17Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCNoR0Operands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U16Imm1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addU16ImmOperands, 4, CVT_Done },
  // Convert_NoOperands
  { CVT_Done },
  // Convert__DirectBr1_0
  { CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegCRBITRCOperands, 2, CVT_95_addBranchTargetOperands, 3, CVT_Done },
  // Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0
  { CVT_95_addImmOperands, 1, CVT_95_addRegCRBITRCOperands, 2, CVT_imm_95_0, 0, CVT_Done },
  // Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegCRBITRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3
  { CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3
  { CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_95_addRegVRRCOperands, 4, CVT_Done },
  // Convert__RegVRRC1_1__RegVRRC1_2
  { CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_Done },
  // Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3__U1Imm1_4
  { CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_95_addRegVRRCOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__CondBr1_0
  { CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_0, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_0__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_0, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_8, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_8__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_8, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_2, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_2__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_2, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_10, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_10__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_10, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_76__regCR0__CondBr1_0
  { CVT_imm_95_76, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_76__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_76, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_79__regCR0__CondBr1_0
  { CVT_imm_95_79, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_79__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_79, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_78__regCR0__CondBr1_0
  { CVT_imm_95_78, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_78__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_78, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_76__regCR0
  { CVT_imm_95_76, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_76__RegCRRC1_0
  { CVT_imm_95_76, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_79__regCR0
  { CVT_imm_95_79, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_79__RegCRRC1_0
  { CVT_imm_95_79, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_78__regCR0
  { CVT_imm_95_78, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_78__RegCRRC1_0
  { CVT_imm_95_78, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_4, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_7, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_6, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_4__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_4, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_7__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_7, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_6__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_6, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_4__regCR0__CondBr1_0
  { CVT_imm_95_4, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_4__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_4, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_7__regCR0__CondBr1_0
  { CVT_imm_95_7, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_7__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_7, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_6__regCR0__CondBr1_0
  { CVT_imm_95_6, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_6__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_6, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_4__regCR0
  { CVT_imm_95_4, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_4__RegCRRC1_0
  { CVT_imm_95_4, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_7__regCR0
  { CVT_imm_95_7, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_7__RegCRRC1_0
  { CVT_imm_95_7, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_6__regCR0
  { CVT_imm_95_6, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_6__RegCRRC1_0
  { CVT_imm_95_6, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_44__regCR0__CondBr1_0
  { CVT_imm_95_44, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_44__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_44, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_47__regCR0__CondBr1_0
  { CVT_imm_95_47, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_47__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_47, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_46__regCR0__CondBr1_0
  { CVT_imm_95_46, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_46__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_46, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_44__regCR0
  { CVT_imm_95_44, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_44__RegCRRC1_0
  { CVT_imm_95_44, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_47__regCR0
  { CVT_imm_95_47, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_47__RegCRRC1_0
  { CVT_imm_95_47, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_46__regCR0
  { CVT_imm_95_46, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_46__RegCRRC1_0
  { CVT_imm_95_46, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__DirectBr1_0__Imm1_1
  { CVT_95_addBranchTargetOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__imm_95_36__regCR0__CondBr1_0
  { CVT_imm_95_36, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_36__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_36, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_39__regCR0__CondBr1_0
  { CVT_imm_95_39, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_39__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_39, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_38__regCR0__CondBr1_0
  { CVT_imm_95_38, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_38__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_38, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_36__regCR0
  { CVT_imm_95_36, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_36__RegCRRC1_0
  { CVT_imm_95_36, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_39__regCR0
  { CVT_imm_95_39, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_39__RegCRRC1_0
  { CVT_imm_95_39, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_38__regCR0
  { CVT_imm_95_38, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_38__RegCRRC1_0
  { CVT_imm_95_38, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_12__regCR0__CondBr1_0
  { CVT_imm_95_12, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_12__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_12, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_15__regCR0__CondBr1_0
  { CVT_imm_95_15, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_15__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_15, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_14__regCR0__CondBr1_0
  { CVT_imm_95_14, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_14__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_14, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_12__regCR0
  { CVT_imm_95_12, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_12__RegCRRC1_0
  { CVT_imm_95_12, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_15__regCR0
  { CVT_imm_95_15, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_15__RegCRRC1_0
  { CVT_imm_95_15, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_14__regCR0
  { CVT_imm_95_14, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_14__RegCRRC1_0
  { CVT_imm_95_14, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_68__regCR0__CondBr1_0
  { CVT_imm_95_68, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_68__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_68, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_71__regCR0__CondBr1_0
  { CVT_imm_95_71, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_71__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_71, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_70__regCR0__CondBr1_0
  { CVT_imm_95_70, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_70__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_70, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_68__regCR0
  { CVT_imm_95_68, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_68__RegCRRC1_0
  { CVT_imm_95_68, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_71__regCR0
  { CVT_imm_95_71, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_71__RegCRRC1_0
  { CVT_imm_95_71, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_70__regCR0
  { CVT_imm_95_70, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_70__RegCRRC1_0
  { CVT_imm_95_70, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_100__regCR0__CondBr1_0
  { CVT_imm_95_100, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_100__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_100, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_103__regCR0__CondBr1_0
  { CVT_imm_95_103, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_103__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_103, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_102__regCR0__CondBr1_0
  { CVT_imm_95_102, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_102__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_102, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_100__regCR0
  { CVT_imm_95_100, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_100__RegCRRC1_0
  { CVT_imm_95_100, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_103__regCR0
  { CVT_imm_95_103, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_103__RegCRRC1_0
  { CVT_imm_95_103, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_102__regCR0
  { CVT_imm_95_102, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_102__RegCRRC1_0
  { CVT_imm_95_102, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__imm_95_108__regCR0__CondBr1_0
  { CVT_imm_95_108, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_108__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_108, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_111__regCR0__CondBr1_0
  { CVT_imm_95_111, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_111__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_111, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_110__regCR0__CondBr1_0
  { CVT_imm_95_110, 0, CVT_regCR0, 0, CVT_95_addBranchTargetOperands, 1, CVT_Done },
  // Convert__imm_95_110__RegCRRC1_0__CondBr1_1
  { CVT_imm_95_110, 0, CVT_95_addRegCRRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_108__regCR0
  { CVT_imm_95_108, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_108__RegCRRC1_0
  { CVT_imm_95_108, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_111__regCR0
  { CVT_imm_95_111, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_111__RegCRRC1_0
  { CVT_imm_95_111, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_110__regCR0
  { CVT_imm_95_110, 0, CVT_regCR0, 0, CVT_Done },
  // Convert__imm_95_110__RegCRRC1_0
  { CVT_imm_95_110, 0, CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_12, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_15, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1
  { CVT_imm_95_14, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addBranchTargetOperands, 2, CVT_Done },
  // Convert__imm_95_12__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_12, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_15__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_15, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__imm_95_14__RegCRBITRC1_0__imm_95_0
  { CVT_imm_95_14, 0, CVT_95_addRegCRBITRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__imm_95_0__U6Imm1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_imm_95_0, 0, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__imm_95_0__U6Imm1_3
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_imm_95_0, 0, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0__U5Imm1_2__imm_95_31
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_imm_95_0, 0, CVT_95_addImmOperands, 3, CVT_imm_95_31, 0, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__imm_95_0__U5Imm1_3__imm_95_31
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_imm_95_0, 0, CVT_95_addImmOperands, 4, CVT_imm_95_31, 0, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_2__RegGPRC1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_2__RegG8RC1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegG8RCOperands, 4, CVT_Done },
  // Convert__regCR0__RegG8RC1_0__RegG8RC1_1
  { CVT_regCR0, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__regCR0__RegG8RC1_0__S16Imm1_1
  { CVT_regCR0, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_1__S16Imm1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__RegCRBITRC1_0__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addRegCRBITRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_2__S16Imm1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 3, CVT_95_addS16ImmOperands, 4, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_2__S16Imm1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 3, CVT_95_addS16ImmOperands, 4, CVT_Done },
  // Convert__regCR0__RegG8RC1_0__U16Imm1_1
  { CVT_regCR0, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addU16ImmOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_1__U16Imm1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addU16ImmOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_2__U16Imm1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 3, CVT_95_addU16ImmOperands, 4, CVT_Done },
  // Convert__RegCRRC1_0__RegG8RC1_2__U16Imm1_3
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegG8RCOperands, 3, CVT_95_addU16ImmOperands, 4, CVT_Done },
  // Convert__regCR0__RegGPRC1_0__RegGPRC1_1
  { CVT_regCR0, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__regCR0__RegGPRC1_0__U16Imm1_1
  { CVT_regCR0, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addU16ImmOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_1__U16Imm1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addU16ImmOperands, 3, CVT_Done },
  // Convert__RegCRBITRC1_0__U1Imm1_1__RegG8RC1_2__RegG8RC1_3
  { CVT_95_addRegCRBITRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegG8RCOperands, 4, CVT_Done },
  // Convert__regCR0__RegGPRC1_0__S16Imm1_1
  { CVT_regCR0, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegGPRC1_1__S16Imm1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U1Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2
  { CVT_95_addRegCRBITRCOperands, 1, CVT_95_addRegCRBITRCOperands, 2, CVT_95_addRegCRBITRCOperands, 3, CVT_Done },
  // Convert__RegCRBITRC1_0__RegCRBITRC1_0__RegCRBITRC1_0
  { CVT_95_addRegCRBITRCOperands, 1, CVT_95_addRegCRBITRCOperands, 1, CVT_95_addRegCRBITRCOperands, 1, CVT_Done },
  // Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_1
  { CVT_95_addRegCRBITRCOperands, 1, CVT_95_addRegCRBITRCOperands, 2, CVT_95_addRegCRBITRCOperands, 2, CVT_Done },
  // Convert__RegGxRCNoR01_0__RegGxRC1_1
  { CVT_95_addRegGxRCNoR0Operands, 1, CVT_95_addRegGxRCOperands, 2, CVT_Done },
  // Convert__U5Imm1_2__RegGxRCNoR01_0__RegGxRC1_1
  { CVT_95_addImmOperands, 3, CVT_95_addRegGxRCNoR0Operands, 1, CVT_95_addRegGxRCOperands, 2, CVT_Done },
  // Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2
  { CVT_95_addRegGxRCNoR0Operands, 1, CVT_95_addRegGxRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__regR0__regR0
  { CVT_regR0, 0, CVT_regR0, 0, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegG8RCOperands, 4, CVT_Done },
  // Convert__U5Imm1_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1
  { CVT_95_addImmOperands, 3, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_2__U5Imm1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegGPRC1_0__DispSPE21_1__RegGxRCNoR01_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegGPRC1_0__Imm1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__U5Imm1_1__RegGPRC1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__RegF4RC1_0__RegF4RC1_1
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegF4RCOperands, 2, CVT_Done },
  // Convert__RegF4RC1_1__RegF4RC1_2
  { CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_Done },
  // Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2
  { CVT_95_addRegF8RCOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_Done },
  // Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3
  { CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_95_addRegF8RCOperands, 4, CVT_Done },
  // Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_Done },
  // Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3
  { CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_95_addRegF4RCOperands, 4, CVT_Done },
  // Convert__RegF8RC1_0__RegF8RC1_1
  { CVT_95_addRegF8RCOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_Done },
  // Convert__RegF8RC1_1__RegF8RC1_2
  { CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_Done },
  // Convert__RegF4RC1_0__RegF8RC1_1
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_Done },
  // Convert__RegF4RC1_1__RegF8RC1_2
  { CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegF4RC1_1__RegF4RC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_Done },
  // Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3
  { CVT_95_addRegF8RCOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_95_addRegF8RCOperands, 4, CVT_Done },
  // Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4
  { CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_95_addRegF8RCOperands, 4, CVT_95_addRegF8RCOperands, 5, CVT_Done },
  // Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_95_addRegF4RCOperands, 4, CVT_Done },
  // Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4
  { CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_95_addRegF4RCOperands, 4, CVT_95_addRegF4RCOperands, 5, CVT_Done },
  // Convert__RegF4RC1_0__RegF8RC1_1__RegF4RC1_2__RegF4RC1_3
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_95_addRegF4RCOperands, 3, CVT_95_addRegF4RCOperands, 4, CVT_Done },
  // Convert__RegF4RC1_1__RegF8RC1_2__RegF4RC1_3__RegF4RC1_4
  { CVT_95_addRegF4RCOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_95_addRegF4RCOperands, 4, CVT_95_addRegF4RCOperands, 5, CVT_Done },
  // Convert__U4Imm1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRCNoR01_1__RegGPRC1_2__RegCRBITRC1_3
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCNoR0Operands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegCRBITRCOperands, 4, CVT_Done },
  // Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_0, 0, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegG8RC1_0__imm_95_0__DispRIX1_1__RegGxRCNoR01_2
  { CVT_95_addRegG8RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegG8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegF8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegF8RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegF8RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegF8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegF8RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegF8RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegF4RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_95_addRegF4RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegF4RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegF4RCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegF4RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__S16Imm1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__S17Imm1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_1
  { CVT_imm_95_1, 0, CVT_Done },
  // Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegVSSRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegVSSRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__DispRIX161_1__RegGxRCNoR01_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_0
  { CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegCRRC1_0__RegCRRC1_1
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegCRRCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0
  { CVT_95_addRegCRRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_29
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_29, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_280
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_280, 0, CVT_Done },
  // Convert__RegGPRC1_0__U10Imm1_1__imm_95_0
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_128
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_128, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_129
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_129, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_130
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_130, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_131
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_131, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_132
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_132, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_133
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_133, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_134
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_134, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_135
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_135, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_28
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_28, 0, CVT_Done },
  // Convert__RegGPRC1_0
  { CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_19
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_19, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_537
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_537, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_539
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_539, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_541
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_541, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_543
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_543, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_536
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_536, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_538
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_538, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_540
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_540, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_542
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_542, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_1018
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_1018, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_981
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_981, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_22
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_22, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_17
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_17, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_18
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_18, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_980
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_980, 0, CVT_Done },
  // Convert__RegF8RC1_0
  { CVT_95_addRegF8RCOperands, 1, CVT_Done },
  // Convert__RegF8RC1_1
  { CVT_95_addRegF8RCOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_529
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_529, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_531
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_531, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_533
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_533, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_535
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_535, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_528
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_528, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_530
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_530, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_532
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_532, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_534
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_534, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_1019
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_1019, 0, CVT_Done },
  // Convert__RegGPRC1_0__CRBitMask1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addCRBitMaskOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_48
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_48, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_287
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_287, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_5
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_5, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_4
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_4, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_25
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_25, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_512
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_512, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_272
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_272, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_273
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_273, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_274
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_274, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_275
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_275, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_260
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_260, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_261
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_261, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_262
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_262, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_263
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_263, 0, CVT_Done },
  // Convert__RegGPRC1_0__U4Imm1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_26
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_26, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_27
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_27, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_990
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_990, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_991
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_991, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_268
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_268, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_988
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_988, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_989
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_989, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_269
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_269, 0, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_986
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_986, 0, CVT_Done },
  // Convert__RegVRRC1_0
  { CVT_95_addRegVRRCOperands, 1, CVT_Done },
  // Convert__RegG8RC1_0__RegVSFRC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_0__RegVSRC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__RegVSFRC1_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_1
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_1, 0, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_2
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__imm_95_29__RegGPRC1_0
  { CVT_imm_95_29, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_280__RegGPRC1_0
  { CVT_imm_95_280, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_28__RegGPRC1_0
  { CVT_imm_95_28, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_255__RegG8RC1_0
  { CVT_imm_95_255, 0, CVT_95_addRegG8RCOperands, 1, CVT_Done },
  // Convert__Imm1_0__RegGPRC1_1
  { CVT_95_addImmOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_19__RegGPRC1_0
  { CVT_imm_95_19, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_537__RegGPRC1_1
  { CVT_imm_95_537, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_539__RegGPRC1_1
  { CVT_imm_95_539, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_541__RegGPRC1_1
  { CVT_imm_95_541, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_543__RegGPRC1_1
  { CVT_imm_95_543, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_536__RegGPRC1_1
  { CVT_imm_95_536, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_538__RegGPRC1_1
  { CVT_imm_95_538, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_540__RegGPRC1_1
  { CVT_imm_95_540, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_542__RegGPRC1_1
  { CVT_imm_95_542, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_1018__RegGPRC1_0
  { CVT_imm_95_1018, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_1__Imm1_0
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__imm_95_981__RegGPRC1_0
  { CVT_imm_95_981, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_22__RegGPRC1_0
  { CVT_imm_95_22, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_17__RegGPRC1_0
  { CVT_imm_95_17, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_18__RegGPRC1_0
  { CVT_imm_95_18, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_980__RegGPRC1_0
  { CVT_imm_95_980, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__Imm1_0__RegF8RC1_1__imm_95_0__imm_95_0
  { CVT_95_addImmOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_imm_95_0, 0, CVT_imm_95_0, 0, CVT_Done },
  // Convert__Imm1_1__RegF8RC1_2__imm_95_0__imm_95_0
  { CVT_95_addImmOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_imm_95_0, 0, CVT_imm_95_0, 0, CVT_Done },
  // Convert__Imm1_0__RegF8RC1_1__Imm1_2__Imm1_3
  { CVT_95_addImmOperands, 1, CVT_95_addRegF8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__Imm1_1__RegF8RC1_2__Imm1_3__Imm1_4
  { CVT_95_addImmOperands, 2, CVT_95_addRegF8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegCRRC1_0__Imm1_1__imm_95_0
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addImmOperands, 2, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegCRRC1_1__Imm1_2__imm_95_0
  { CVT_95_addRegCRRCOperands, 2, CVT_95_addImmOperands, 3, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegCRRC1_0__Imm1_1__Imm1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegCRRC1_1__Imm1_2__Imm1_3
  { CVT_95_addRegCRRCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__imm_95_529__RegGPRC1_1
  { CVT_imm_95_529, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_531__RegGPRC1_1
  { CVT_imm_95_531, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_533__RegGPRC1_1
  { CVT_imm_95_533, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_535__RegGPRC1_1
  { CVT_imm_95_535, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_528__RegGPRC1_1
  { CVT_imm_95_528, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_530__RegGPRC1_1
  { CVT_imm_95_530, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_532__RegGPRC1_1
  { CVT_imm_95_532, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_534__RegGPRC1_1
  { CVT_imm_95_534, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_1019__RegGPRC1_0
  { CVT_imm_95_1019, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_0__imm_95_0
  { CVT_95_addRegGPRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__CRBitMask1_0__RegGPRC1_1
  { CVT_95_addCRBitMaskOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_48__RegGPRC1_0
  { CVT_imm_95_48, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_25__RegGPRC1_0
  { CVT_imm_95_25, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_512__RegGPRC1_0
  { CVT_imm_95_512, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_272__RegGPRC1_1
  { CVT_imm_95_272, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_273__RegGPRC1_1
  { CVT_imm_95_273, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_274__RegGPRC1_1
  { CVT_imm_95_274, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_275__RegGPRC1_1
  { CVT_imm_95_275, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_260__RegGPRC1_1
  { CVT_imm_95_260, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_261__RegGPRC1_1
  { CVT_imm_95_261, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_262__RegGPRC1_1
  { CVT_imm_95_262, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_263__RegGPRC1_1
  { CVT_imm_95_263, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_272__RegGPRC1_0
  { CVT_imm_95_272, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_273__RegGPRC1_0
  { CVT_imm_95_273, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_274__RegGPRC1_0
  { CVT_imm_95_274, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_275__RegGPRC1_0
  { CVT_imm_95_275, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_260__RegGPRC1_0
  { CVT_imm_95_260, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_261__RegGPRC1_0
  { CVT_imm_95_261, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_262__RegGPRC1_0
  { CVT_imm_95_262, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_263__RegGPRC1_0
  { CVT_imm_95_263, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_1__U4Imm1_0
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__imm_95_26__RegGPRC1_0
  { CVT_imm_95_26, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_27__RegGPRC1_0
  { CVT_imm_95_27, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_990__RegGPRC1_0
  { CVT_imm_95_990, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_991__RegGPRC1_0
  { CVT_imm_95_991, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_988__RegGPRC1_0
  { CVT_imm_95_988, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_284__RegGPRC1_0
  { CVT_imm_95_284, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_989__RegGPRC1_0
  { CVT_imm_95_989, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_285__RegGPRC1_0
  { CVT_imm_95_285, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__imm_95_986__RegGPRC1_0
  { CVT_imm_95_986, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegVSFRC1_0__RegG8RC1_1
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__RegVSFRC1_0__RegGPRC1_1
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegGPRC1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_1__RegGPRC1_0
  { CVT_imm_95_1, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addU16ImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U1Imm1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__imm_95_2
  { CVT_imm_95_2, 0, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__U2Imm1_3
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addRegQFRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1__U2Imm1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addRegQFRCOperands, 3, CVT_Done },
  // Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_2
  { CVT_95_addRegQSRCOperands, 1, CVT_95_addRegQSRCOperands, 2, CVT_95_addRegQSRCOperands, 3, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_1
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_1, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_4
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_4, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_0
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 1, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addRegQFRCOperands, 3, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_5
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 2, CVT_imm_95_5, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_9
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_9, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__U12Imm1_3
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addRegQFRCOperands, 4, CVT_95_addRegQFRCOperands, 3, CVT_Done },
  // Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2
  { CVT_95_addRegQSRCOperands, 1, CVT_95_addRegQSRCOperands, 2, CVT_95_addRegQSRCOperands, 4, CVT_95_addRegQSRCOperands, 3, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_14
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_14, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_8
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_8, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_10
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 2, CVT_imm_95_10, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_7
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_7, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_13
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_13, 0, CVT_Done },
  // Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__RegQFRC1_3
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_95_addRegQFRCOperands, 3, CVT_95_addRegQFRCOperands, 4, CVT_Done },
  // Convert__RegQSRC1_0__RegQFRC1_1
  { CVT_95_addRegQSRCOperands, 1, CVT_95_addRegQFRCOperands, 2, CVT_Done },
  // Convert__RegQFRC1_0__RegQBRC1_1__RegQFRC1_3__RegQFRC1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQFRCOperands, 4, CVT_95_addRegQFRCOperands, 3, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_15
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 1, CVT_imm_95_15, 0, CVT_Done },
  // Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_6
  { CVT_95_addRegQBRCOperands, 1, CVT_95_addRegQBRCOperands, 2, CVT_95_addRegQBRCOperands, 3, CVT_imm_95_6, 0, CVT_Done },
  // Convert__RegQFRC1_0__U12Imm1_1
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegQFRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegQFRCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegQSRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_95_addRegQSRCOperands, 1, CVT_imm_95_0, 0, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_0__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegQFRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_0__RegQSRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegQSRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__U1Imm1_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__U6Imm1_3
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__U6Imm1_4
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegG8RC1_0__Tie0__RegG8RC1_1__U6Imm1_2__U6Imm1_3
  { CVT_95_addRegG8RCOperands, 1, CVT_Tied, 0, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegG8RC1_1__Tie0__RegG8RC1_2__U6Imm1_3__U6Imm1_4
  { CVT_95_addRegG8RCOperands, 2, CVT_Tied, 0, CVT_95_addRegG8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2__Imm1_3
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__U5Imm1_3__Imm1_4
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_0__Tie0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4
  { CVT_95_addRegGPRCOperands, 1, CVT_Tied, 0, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_1__Tie0__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5
  { CVT_95_addRegGPRCOperands, 2, CVT_Tied, 0, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_95_addImmOperands, 6, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_95_addImmOperands, 6, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__U5Imm1_4__U5Imm1_5
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_95_addImmOperands, 5, CVT_95_addImmOperands, 6, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__imm_95_0
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__imm_95_0
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__imm_95_0
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addImmOperands, 3, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__imm_95_0
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addImmOperands, 4, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__imm_95_0__imm_95_31
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_imm_95_0, 0, CVT_imm_95_31, 0, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__imm_95_0__imm_95_31
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_imm_95_0, 0, CVT_imm_95_31, 0, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__imm_95_0__imm_95_31
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_imm_95_0, 0, CVT_imm_95_31, 0, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__imm_95_0__imm_95_31
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_imm_95_0, 0, CVT_imm_95_31, 0, CVT_Done },
  // Convert__Imm1_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_Done },
  // Convert__RegGPRC1_1__RegGxRCNoR01_2__RegGxRC1_3
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_95_addRegGxRCOperands, 4, CVT_Done },
  // Convert__imm_95_0__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_imm_95_0, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__imm_95_0__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegG8RC1_1__RegGxRCNoR01_2__RegGxRC1_3
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_95_addRegGxRCOperands, 4, CVT_Done },
  // Convert__imm_95_0__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2
  { CVT_imm_95_0, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__imm_95_0__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_0__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_imm_95_0, 0, CVT_95_addRegF8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__imm_95_0__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegF8RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__imm_95_0__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2
  { CVT_imm_95_0, 0, CVT_95_addRegF4RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_95_addRegGxRCNoR0Operands, 3, CVT_Done },
  // Convert__imm_95_0__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2
  { CVT_imm_95_0, 0, CVT_95_addRegF4RCOperands, 1, CVT_95_addRegGxRCNoR0Operands, 2, CVT_95_addRegGxRCOperands, 3, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_2__RegG8RC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 3, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_1__RegG8RC1_3__RegG8RC1_2
  { CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 4, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__imm_95_0__RegGPRC1_1
  { CVT_imm_95_0, 0, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__RegGPRC1_3
  { CVT_imm_95_0, 0, CVT_95_addImmOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addRegGPRCOperands, 4, CVT_Done },
  // Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__U5Imm1_3
  { CVT_imm_95_0, 0, CVT_95_addImmOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__imm_95_0__U1Imm1_1
  { CVT_imm_95_0, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__U5Imm1_0__RegG8RC1_1__RegG8RC1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegG8RCOperands, 3, CVT_Done },
  // Convert__imm_95_4__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_4, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_4__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_4, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_12__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_12, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_12__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_12, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_8__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_8, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_8__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_8, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__U5Imm1_0__RegG8RC1_1__S16Imm1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__imm_95_20__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_20, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_20__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_20, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_5__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_5, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_5__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_5, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_1__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_1, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_1__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_1, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_6__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_6, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_6__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_6, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_2__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_2, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_2__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_2, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_16__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_16, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_16__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_16, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_24__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_24, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_24__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_24, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_31__RegG8RC1_0__RegG8RC1_1
  { CVT_imm_95_31, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_Done },
  // Convert__imm_95_31__RegG8RC1_0__S16Imm1_1
  { CVT_imm_95_31, 0, CVT_95_addRegG8RCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__regR0__RegGPRC1_0
  { CVT_regR0, 0, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_1__RegGPRC1_0
  { CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 1, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__Imm1_2
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegGPRC1_0__RegGPRC1_1__imm_95_1
  { CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_imm_95_1, 0, CVT_Done },
  // Convert__U5Imm1_0__RegGPRC1_1__RegGPRC1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addRegGPRCOperands, 3, CVT_Done },
  // Convert__imm_95_4__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_4, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_4__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_4, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_12__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_12, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_12__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_12, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_8__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_8, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_8__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_8, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__U5Imm1_0__RegGPRC1_1__S16Imm1_2
  { CVT_95_addImmOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_95_addS16ImmOperands, 3, CVT_Done },
  // Convert__imm_95_20__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_20, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_20__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_20, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_5__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_5, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_5__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_5, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_1__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_1, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_1__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_1, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_6__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_6, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_6__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_6, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_2__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_2, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_2__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_2, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_16__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_16, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_16__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_16, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_24__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_24, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_24__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_24, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__imm_95_31__RegGPRC1_0__RegGPRC1_1
  { CVT_imm_95_31, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addRegGPRCOperands, 2, CVT_Done },
  // Convert__imm_95_31__RegGPRC1_0__S16Imm1_1
  { CVT_imm_95_31, 0, CVT_95_addRegGPRCOperands, 1, CVT_95_addS16ImmOperands, 2, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_95_addRegVRRCOperands, 4, CVT_Done },
  // Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addImmOperands, 3, CVT_95_addRegVRRCOperands, 2, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_0__RegVRRC1_1
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_Done },
  // Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addImmOperands, 3, CVT_95_addRegVRRCOperands, 2, CVT_Done },
  // Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2
  { CVT_95_addRegG8RCOperands, 1, CVT_95_addRegG8RCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1__U1Imm1_2__U4Imm1_3
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__U5Imm1_3
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegVRRC1_0__S5Imm1_1
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__regR0__regR0__imm_95_0
  { CVT_regR0, 0, CVT_regR0, 0, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegVSFRC1_0__RegVSFRC1_1
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_95_addRegVSFRCOperands, 3, CVT_Done },
  // Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2
  { CVT_95_addRegVSSRCOperands, 1, CVT_95_addRegVSSRCOperands, 2, CVT_95_addRegVSSRCOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_95_addRegVSFRCOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_95_addRegVSFRCOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegVRRC1_1__RegVRRC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVRRCOperands, 3, CVT_Done },
  // Convert__RegVRRC1_0__RegVSFRC1_1
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegVSSRC1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSSRCOperands, 2, CVT_Done },
  // Convert__RegVSSRC1_0__RegVSRC1_1
  { CVT_95_addRegVSSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegVSSRC1_0__RegVSFRC1_1
  { CVT_95_addRegVSSRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegVRRC1_0__RegVRRC1_1__RegVSFRC1_2
  { CVT_95_addRegVRRCOperands, 1, CVT_95_addRegVRRCOperands, 2, CVT_95_addRegVSFRCOperands, 3, CVT_Done },
  // Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2
  { CVT_95_addRegVSFRCOperands, 1, CVT_Tied, 0, CVT_95_addRegVSFRCOperands, 2, CVT_95_addRegVSFRCOperands, 3, CVT_Done },
  // Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2
  { CVT_95_addRegVSSRCOperands, 1, CVT_Tied, 0, CVT_95_addRegVSSRCOperands, 2, CVT_95_addRegVSSRCOperands, 3, CVT_Done },
  // Convert__RegVSSRC1_0__RegVSSRC1_1
  { CVT_95_addRegVSSRCOperands, 1, CVT_95_addRegVSSRCOperands, 2, CVT_Done },
  // Convert__RegVRRC1_1__U1Imm1_0__RegVRRC1_2__U2Imm1_3
  { CVT_95_addRegVRRCOperands, 2, CVT_95_addImmOperands, 1, CVT_95_addRegVRRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegCRRC1_0__RegVSFRC1_1
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__U7Imm1_2__RegVSFRC1_1
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addImmOperands, 3, CVT_95_addRegVSFRCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__U7Imm1_2__RegVRRC1_1
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addImmOperands, 3, CVT_95_addRegVRRCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_Done },
  // Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3
  { CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_95_addRegVSRCOperands, 4, CVT_Done },
  // Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_Tied, 0, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegCRRC1_0__RegVSRC1_1__RegVSRC1_2
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_Done },
  // Convert__RegCRRC1_0__RegVSRC1_1
  { CVT_95_addRegCRRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__U7Imm1_2__RegVSRC1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addImmOperands, 3, CVT_95_addRegVSRCOperands, 2, CVT_Done },
  // Convert__RegVSFRC1_0__RegVSRC1_1__U4Imm1_2
  { CVT_95_addRegVSFRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__Tie0__RegVSRC1_1__U4Imm1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_Tied, 0, CVT_95_addRegVSRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_0
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_3
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_imm_95_3, 0, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__U2Imm1_3
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 3, CVT_95_addRegVSRCOperands, 4, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_0
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 2, CVT_imm_95_0, 0, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_3
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 2, CVT_imm_95_3, 0, CVT_Done },
  // Convert__RegVSRC1_0__U8Imm1_1
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__U2Imm1_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_2
  { CVT_95_addRegVSRCOperands, 1, CVT_95_addRegVSRCOperands, 2, CVT_95_addRegVSRCOperands, 2, CVT_imm_95_2, 0, CVT_Done },
};

void PPCAsmParser::
convertToMCInst(unsigned Kind, MCInst &Inst, unsigned Opcode,
                const OperandVector &Operands) {
  assert(Kind < CVT_NUM_SIGNATURES && "Invalid signature!");
  const uint8_t *Converter = ConversionTable[Kind];
  unsigned OpIdx;
  Inst.setOpcode(Opcode);
  for (const uint8_t *p = Converter; *p; p+= 2) {
    OpIdx = *(p + 1);
    switch (*p) {
    default: llvm_unreachable("invalid conversion entry!");
    case CVT_Reg:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegOperands(Inst, 1);
      break;
    case CVT_Tied:
      Inst.addOperand(Inst.getOperand(OpIdx));
      break;
    case CVT_95_addRegG8RCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegG8RCOperands(Inst, 1);
      break;
    case CVT_95_addTLSRegOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addTLSRegOperands(Inst, 1);
      break;
    case CVT_95_addRegGPRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegGPRCOperands(Inst, 1);
      break;
    case CVT_95_addRegGPRCNoR0Operands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegGPRCNoR0Operands(Inst, 1);
      break;
    case CVT_95_addS16ImmOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addS16ImmOperands(Inst, 1);
      break;
    case CVT_95_addU16ImmOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addU16ImmOperands(Inst, 1);
      break;
    case CVT_95_addBranchTargetOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addBranchTargetOperands(Inst, 1);
      break;
    case CVT_95_addImmOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addImmOperands(Inst, 1);
      break;
    case CVT_95_addRegCRBITRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegCRBITRCOperands(Inst, 1);
      break;
    case CVT_imm_95_0:
      Inst.addOperand(MCOperand::createImm(0));
      break;
    case CVT_95_addRegVRRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegVRRCOperands(Inst, 1);
      break;
    case CVT_imm_95_8:
      Inst.addOperand(MCOperand::createImm(8));
      break;
    case CVT_imm_95_2:
      Inst.addOperand(MCOperand::createImm(2));
      break;
    case CVT_imm_95_10:
      Inst.addOperand(MCOperand::createImm(10));
      break;
    case CVT_imm_95_76:
      Inst.addOperand(MCOperand::createImm(76));
      break;
    case CVT_regCR0:
      Inst.addOperand(MCOperand::createReg(PPC::CR0));
      break;
    case CVT_95_addRegCRRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegCRRCOperands(Inst, 1);
      break;
    case CVT_imm_95_79:
      Inst.addOperand(MCOperand::createImm(79));
      break;
    case CVT_imm_95_78:
      Inst.addOperand(MCOperand::createImm(78));
      break;
    case CVT_imm_95_4:
      Inst.addOperand(MCOperand::createImm(4));
      break;
    case CVT_imm_95_7:
      Inst.addOperand(MCOperand::createImm(7));
      break;
    case CVT_imm_95_6:
      Inst.addOperand(MCOperand::createImm(6));
      break;
    case CVT_imm_95_44:
      Inst.addOperand(MCOperand::createImm(44));
      break;
    case CVT_imm_95_47:
      Inst.addOperand(MCOperand::createImm(47));
      break;
    case CVT_imm_95_46:
      Inst.addOperand(MCOperand::createImm(46));
      break;
    case CVT_imm_95_36:
      Inst.addOperand(MCOperand::createImm(36));
      break;
    case CVT_imm_95_39:
      Inst.addOperand(MCOperand::createImm(39));
      break;
    case CVT_imm_95_38:
      Inst.addOperand(MCOperand::createImm(38));
      break;
    case CVT_imm_95_12:
      Inst.addOperand(MCOperand::createImm(12));
      break;
    case CVT_imm_95_15:
      Inst.addOperand(MCOperand::createImm(15));
      break;
    case CVT_imm_95_14:
      Inst.addOperand(MCOperand::createImm(14));
      break;
    case CVT_imm_95_68:
      Inst.addOperand(MCOperand::createImm(68));
      break;
    case CVT_imm_95_71:
      Inst.addOperand(MCOperand::createImm(71));
      break;
    case CVT_imm_95_70:
      Inst.addOperand(MCOperand::createImm(70));
      break;
    case CVT_imm_95_100:
      Inst.addOperand(MCOperand::createImm(100));
      break;
    case CVT_imm_95_103:
      Inst.addOperand(MCOperand::createImm(103));
      break;
    case CVT_imm_95_102:
      Inst.addOperand(MCOperand::createImm(102));
      break;
    case CVT_imm_95_108:
      Inst.addOperand(MCOperand::createImm(108));
      break;
    case CVT_imm_95_111:
      Inst.addOperand(MCOperand::createImm(111));
      break;
    case CVT_imm_95_110:
      Inst.addOperand(MCOperand::createImm(110));
      break;
    case CVT_imm_95_31:
      Inst.addOperand(MCOperand::createImm(31));
      break;
    case CVT_95_addRegGxRCNoR0Operands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegGxRCNoR0Operands(Inst, 1);
      break;
    case CVT_95_addRegGxRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegGxRCOperands(Inst, 1);
      break;
    case CVT_regR0:
      Inst.addOperand(MCOperand::createReg(PPC::R0));
      break;
    case CVT_95_addRegF4RCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegF4RCOperands(Inst, 1);
      break;
    case CVT_95_addRegF8RCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegF8RCOperands(Inst, 1);
      break;
    case CVT_imm_95_1:
      Inst.addOperand(MCOperand::createImm(1));
      break;
    case CVT_95_addRegVSFRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegVSFRCOperands(Inst, 1);
      break;
    case CVT_95_addRegVSSRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegVSSRCOperands(Inst, 1);
      break;
    case CVT_95_addRegVSRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegVSRCOperands(Inst, 1);
      break;
    case CVT_imm_95_29:
      Inst.addOperand(MCOperand::createImm(29));
      break;
    case CVT_imm_95_280:
      Inst.addOperand(MCOperand::createImm(280));
      break;
    case CVT_imm_95_128:
      Inst.addOperand(MCOperand::createImm(128));
      break;
    case CVT_imm_95_129:
      Inst.addOperand(MCOperand::createImm(129));
      break;
    case CVT_imm_95_130:
      Inst.addOperand(MCOperand::createImm(130));
      break;
    case CVT_imm_95_131:
      Inst.addOperand(MCOperand::createImm(131));
      break;
    case CVT_imm_95_132:
      Inst.addOperand(MCOperand::createImm(132));
      break;
    case CVT_imm_95_133:
      Inst.addOperand(MCOperand::createImm(133));
      break;
    case CVT_imm_95_134:
      Inst.addOperand(MCOperand::createImm(134));
      break;
    case CVT_imm_95_135:
      Inst.addOperand(MCOperand::createImm(135));
      break;
    case CVT_imm_95_28:
      Inst.addOperand(MCOperand::createImm(28));
      break;
    case CVT_imm_95_19:
      Inst.addOperand(MCOperand::createImm(19));
      break;
    case CVT_imm_95_537:
      Inst.addOperand(MCOperand::createImm(537));
      break;
    case CVT_imm_95_539:
      Inst.addOperand(MCOperand::createImm(539));
      break;
    case CVT_imm_95_541:
      Inst.addOperand(MCOperand::createImm(541));
      break;
    case CVT_imm_95_543:
      Inst.addOperand(MCOperand::createImm(543));
      break;
    case CVT_imm_95_536:
      Inst.addOperand(MCOperand::createImm(536));
      break;
    case CVT_imm_95_538:
      Inst.addOperand(MCOperand::createImm(538));
      break;
    case CVT_imm_95_540:
      Inst.addOperand(MCOperand::createImm(540));
      break;
    case CVT_imm_95_542:
      Inst.addOperand(MCOperand::createImm(542));
      break;
    case CVT_imm_95_1018:
      Inst.addOperand(MCOperand::createImm(1018));
      break;
    case CVT_imm_95_981:
      Inst.addOperand(MCOperand::createImm(981));
      break;
    case CVT_imm_95_22:
      Inst.addOperand(MCOperand::createImm(22));
      break;
    case CVT_imm_95_17:
      Inst.addOperand(MCOperand::createImm(17));
      break;
    case CVT_imm_95_18:
      Inst.addOperand(MCOperand::createImm(18));
      break;
    case CVT_imm_95_980:
      Inst.addOperand(MCOperand::createImm(980));
      break;
    case CVT_imm_95_529:
      Inst.addOperand(MCOperand::createImm(529));
      break;
    case CVT_imm_95_531:
      Inst.addOperand(MCOperand::createImm(531));
      break;
    case CVT_imm_95_533:
      Inst.addOperand(MCOperand::createImm(533));
      break;
    case CVT_imm_95_535:
      Inst.addOperand(MCOperand::createImm(535));
      break;
    case CVT_imm_95_528:
      Inst.addOperand(MCOperand::createImm(528));
      break;
    case CVT_imm_95_530:
      Inst.addOperand(MCOperand::createImm(530));
      break;
    case CVT_imm_95_532:
      Inst.addOperand(MCOperand::createImm(532));
      break;
    case CVT_imm_95_534:
      Inst.addOperand(MCOperand::createImm(534));
      break;
    case CVT_imm_95_1019:
      Inst.addOperand(MCOperand::createImm(1019));
      break;
    case CVT_95_addCRBitMaskOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addCRBitMaskOperands(Inst, 1);
      break;
    case CVT_imm_95_48:
      Inst.addOperand(MCOperand::createImm(48));
      break;
    case CVT_imm_95_287:
      Inst.addOperand(MCOperand::createImm(287));
      break;
    case CVT_imm_95_5:
      Inst.addOperand(MCOperand::createImm(5));
      break;
    case CVT_imm_95_25:
      Inst.addOperand(MCOperand::createImm(25));
      break;
    case CVT_imm_95_512:
      Inst.addOperand(MCOperand::createImm(512));
      break;
    case CVT_imm_95_272:
      Inst.addOperand(MCOperand::createImm(272));
      break;
    case CVT_imm_95_273:
      Inst.addOperand(MCOperand::createImm(273));
      break;
    case CVT_imm_95_274:
      Inst.addOperand(MCOperand::createImm(274));
      break;
    case CVT_imm_95_275:
      Inst.addOperand(MCOperand::createImm(275));
      break;
    case CVT_imm_95_260:
      Inst.addOperand(MCOperand::createImm(260));
      break;
    case CVT_imm_95_261:
      Inst.addOperand(MCOperand::createImm(261));
      break;
    case CVT_imm_95_262:
      Inst.addOperand(MCOperand::createImm(262));
      break;
    case CVT_imm_95_263:
      Inst.addOperand(MCOperand::createImm(263));
      break;
    case CVT_imm_95_26:
      Inst.addOperand(MCOperand::createImm(26));
      break;
    case CVT_imm_95_27:
      Inst.addOperand(MCOperand::createImm(27));
      break;
    case CVT_imm_95_990:
      Inst.addOperand(MCOperand::createImm(990));
      break;
    case CVT_imm_95_991:
      Inst.addOperand(MCOperand::createImm(991));
      break;
    case CVT_imm_95_268:
      Inst.addOperand(MCOperand::createImm(268));
      break;
    case CVT_imm_95_988:
      Inst.addOperand(MCOperand::createImm(988));
      break;
    case CVT_imm_95_989:
      Inst.addOperand(MCOperand::createImm(989));
      break;
    case CVT_imm_95_269:
      Inst.addOperand(MCOperand::createImm(269));
      break;
    case CVT_imm_95_986:
      Inst.addOperand(MCOperand::createImm(986));
      break;
    case CVT_imm_95_255:
      Inst.addOperand(MCOperand::createImm(255));
      break;
    case CVT_imm_95_284:
      Inst.addOperand(MCOperand::createImm(284));
      break;
    case CVT_imm_95_285:
      Inst.addOperand(MCOperand::createImm(285));
      break;
    case CVT_95_addRegQFRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegQFRCOperands(Inst, 1);
      break;
    case CVT_95_addRegQSRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegQSRCOperands(Inst, 1);
      break;
    case CVT_95_addRegQBRCOperands:
      static_cast<PPCOperand&>(*Operands[OpIdx]).addRegQBRCOperands(Inst, 1);
      break;
    case CVT_imm_95_9:
      Inst.addOperand(MCOperand::createImm(9));
      break;
    case CVT_imm_95_13:
      Inst.addOperand(MCOperand::createImm(13));
      break;
    case CVT_imm_95_20:
      Inst.addOperand(MCOperand::createImm(20));
      break;
    case CVT_imm_95_16:
      Inst.addOperand(MCOperand::createImm(16));
      break;
    case CVT_imm_95_24:
      Inst.addOperand(MCOperand::createImm(24));
      break;
    case CVT_imm_95_3:
      Inst.addOperand(MCOperand::createImm(3));
      break;
    }
  }
}

void PPCAsmParser::
convertToMapAndConstraints(unsigned Kind,
                           const OperandVector &Operands) {
  assert(Kind < CVT_NUM_SIGNATURES && "Invalid signature!");
  unsigned NumMCOperands = 0;
  const uint8_t *Converter = ConversionTable[Kind];
  for (const uint8_t *p = Converter; *p; p+= 2) {
    switch (*p) {
    default: llvm_unreachable("invalid conversion entry!");
    case CVT_Reg:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("r");
      ++NumMCOperands;
      break;
    case CVT_Tied:
      ++NumMCOperands;
      break;
    case CVT_95_addRegG8RCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addTLSRegOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegGPRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegGPRCNoR0Operands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addS16ImmOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addU16ImmOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addBranchTargetOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addImmOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegCRBITRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_0:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addRegVRRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_8:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_2:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_10:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_76:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_regCR0:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      ++NumMCOperands;
      break;
    case CVT_95_addRegCRRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_79:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_78:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_4:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_7:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_6:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_44:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_47:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_46:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_36:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_39:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_38:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_12:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_15:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_14:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_68:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_71:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_70:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_100:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_103:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_102:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_108:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_111:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_110:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_31:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addRegGxRCNoR0Operands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegGxRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_regR0:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      ++NumMCOperands;
      break;
    case CVT_95_addRegF4RCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegF8RCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_1:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addRegVSFRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegVSSRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegVSRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_29:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_280:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_128:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_129:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_130:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_131:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_132:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_133:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_134:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_135:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_28:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_19:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_537:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_539:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_541:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_543:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_536:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_538:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_540:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_542:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_1018:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_981:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_22:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_17:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_18:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_980:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_529:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_531:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_533:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_535:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_528:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_530:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_532:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_534:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_1019:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addCRBitMaskOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_48:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_287:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_5:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_25:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_512:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_272:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_273:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_274:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_275:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_260:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_261:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_262:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_263:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_26:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_27:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_990:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_991:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_268:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_988:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_989:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_269:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_986:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_255:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_284:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_285:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addRegQFRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegQSRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addRegQBRCOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_9:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_13:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_20:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_16:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_24:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_imm_95_3:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    }
  }
}

namespace {

/// MatchClassKind - The kinds of classes which participate in
/// instruction matching.
enum MatchClassKind {
  InvalidMatchClass = 0,
  OptionalMatchClass = 1,
  MCK__DOT_, // '.'
  MCK_0, // '0'
  MCK_1, // '1'
  MCK_2, // '2'
  MCK_3, // '3'
  MCK_4, // '4'
  MCK_5, // '5'
  MCK_6, // '6'
  MCK_7, // '7'
  MCK_CARRYRC, // register class 'CARRYRC'
  MCK_CRRC0, // register class 'CRRC0'
  MCK_CTRRC, // register class 'CTRRC'
  MCK_CTRRC8, // register class 'CTRRC8'
  MCK_VRSAVERC, // register class 'VRSAVERC'
  MCK_CRRC, // register class 'CRRC'
  MCK_CRBITRC, // register class 'CRBITRC'
  MCK_F4RC, // register class 'F4RC,F8RC'
  MCK_QSRC, // register class 'QSRC,QBRC,QFRC'
  MCK_VFRC, // register class 'VFRC'
  MCK_VRRC, // register class 'VRRC'
  MCK_VSHRC, // register class 'VSHRC'
  MCK_VSLRC, // register class 'VSLRC'
  MCK_Reg2, // derived register class
  MCK_Reg5, // derived register class
  MCK_G8RC, // register class 'G8RC'
  MCK_G8RC_NOX0, // register class 'G8RC_NOX0'
  MCK_GPRC, // register class 'GPRC'
  MCK_GPRC_NOR0, // register class 'GPRC_NOR0'
  MCK_VSRC, // register class 'VSRC'
  MCK_VSSRC, // register class 'VSSRC,VSFRC'
  MCK_Imm, // user defined class 'ImmAsmOperand'
  MCK_CRBitMask, // user defined class 'PPCCRBitMaskOperand'
  MCK_CondBr, // user defined class 'PPCCondBrAsmOperand'
  MCK_DirectBr, // user defined class 'PPCDirectBrAsmOperand'
  MCK_DispRI, // user defined class 'PPCDispRIOperand'
  MCK_DispRIX16, // user defined class 'PPCDispRIX16Operand'
  MCK_DispRIX, // user defined class 'PPCDispRIXOperand'
  MCK_DispSPE2, // user defined class 'PPCDispSPE2Operand'
  MCK_DispSPE4, // user defined class 'PPCDispSPE4Operand'
  MCK_DispSPE8, // user defined class 'PPCDispSPE8Operand'
  MCK_RegCRBITRC, // user defined class 'PPCRegCRBITRCAsmOperand'
  MCK_RegCRRC, // user defined class 'PPCRegCRRCAsmOperand'
  MCK_RegF4RC, // user defined class 'PPCRegF4RCAsmOperand'
  MCK_RegF8RC, // user defined class 'PPCRegF8RCAsmOperand'
  MCK_RegG8RC, // user defined class 'PPCRegG8RCAsmOperand'
  MCK_RegG8RCNoX0, // user defined class 'PPCRegG8RCNoX0AsmOperand'
  MCK_RegGPRC, // user defined class 'PPCRegGPRCAsmOperand'
  MCK_RegGPRCNoR0, // user defined class 'PPCRegGPRCNoR0AsmOperand'
  MCK_RegGxRCNoR0, // user defined class 'PPCRegGxRCNoR0Operand'
  MCK_RegGxRC, // user defined class 'PPCRegGxRCOperand'
  MCK_RegQBRC, // user defined class 'PPCRegQBRCAsmOperand'
  MCK_RegQFRC, // user defined class 'PPCRegQFRCAsmOperand'
  MCK_RegQSRC, // user defined class 'PPCRegQSRCAsmOperand'
  MCK_RegVRRC, // user defined class 'PPCRegVRRCAsmOperand'
  MCK_RegVSFRC, // user defined class 'PPCRegVSFRCAsmOperand'
  MCK_RegVSRC, // user defined class 'PPCRegVSRCAsmOperand'
  MCK_RegVSSRC, // user defined class 'PPCRegVSSRCAsmOperand'
  MCK_S16Imm, // user defined class 'PPCS16ImmAsmOperand'
  MCK_S17Imm, // user defined class 'PPCS17ImmAsmOperand'
  MCK_S5Imm, // user defined class 'PPCS5ImmAsmOperand'
  MCK_TLSReg, // user defined class 'PPCTLSRegOperand'
  MCK_U10Imm, // user defined class 'PPCU10ImmAsmOperand'
  MCK_U12Imm, // user defined class 'PPCU12ImmAsmOperand'
  MCK_U16Imm, // user defined class 'PPCU16ImmAsmOperand'
  MCK_U1Imm, // user defined class 'PPCU1ImmAsmOperand'
  MCK_U2Imm, // user defined class 'PPCU2ImmAsmOperand'
  MCK_U3Imm, // user defined class 'PPCU3ImmAsmOperand'
  MCK_U4Imm, // user defined class 'PPCU4ImmAsmOperand'
  MCK_U5Imm, // user defined class 'PPCU5ImmAsmOperand'
  MCK_U6Imm, // user defined class 'PPCU6ImmAsmOperand'
  MCK_U7Imm, // user defined class 'PPCU7ImmAsmOperand'
  MCK_U8Imm, // user defined class 'PPCU8ImmAsmOperand'
  NumMatchClassKinds
};

}

static MatchClassKind matchTokenString(StringRef Name) {
  switch (Name.size()) {
  default: break;
  case 1:	 // 9 strings to match.
    switch (Name[0]) {
    default: break;
    case '.':	 // 1 string to match.
      return MCK__DOT_;	 // "."
    case '0':	 // 1 string to match.
      return MCK_0;	 // "0"
    case '1':	 // 1 string to match.
      return MCK_1;	 // "1"
    case '2':	 // 1 string to match.
      return MCK_2;	 // "2"
    case '3':	 // 1 string to match.
      return MCK_3;	 // "3"
    case '4':	 // 1 string to match.
      return MCK_4;	 // "4"
    case '5':	 // 1 string to match.
      return MCK_5;	 // "5"
    case '6':	 // 1 string to match.
      return MCK_6;	 // "6"
    case '7':	 // 1 string to match.
      return MCK_7;	 // "7"
    }
    break;
  }
  return InvalidMatchClass;
}

/// isSubclass - Compute whether \p A is a subclass of \p B.
static bool isSubclass(MatchClassKind A, MatchClassKind B) {
  if (A == B)
    return true;

  switch (A) {
  default:
    return false;

  case MCK_CRRC0:
    return B == MCK_CRRC;

  case MCK_F4RC:
    return B == MCK_VSSRC;

  case MCK_VFRC:
    return B == MCK_VSSRC;

  case MCK_VSHRC:
    return B == MCK_VSRC;

  case MCK_VSLRC:
    return B == MCK_VSRC;

  case MCK_Reg2:
    switch (B) {
    default: return false;
    case MCK_GPRC: return true;
    case MCK_GPRC_NOR0: return true;
    }

  case MCK_Reg5:
    switch (B) {
    default: return false;
    case MCK_G8RC: return true;
    case MCK_G8RC_NOX0: return true;
    }
  }
}

static unsigned validateOperandClass(MCParsedAsmOperand &GOp, MatchClassKind Kind) {
  PPCOperand &Operand = (PPCOperand&)GOp;
  if (Kind == InvalidMatchClass)
    return MCTargetAsmParser::Match_InvalidOperand;

  if (Operand.isToken())
    return isSubclass(matchTokenString(Operand.getToken()), Kind) ?
             MCTargetAsmParser::Match_Success :
             MCTargetAsmParser::Match_InvalidOperand;

  switch (Kind) {
  default: break;
  // 'Imm' class
  case MCK_Imm:
    if (Operand.isImm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'CRBitMask' class
  case MCK_CRBitMask:
    if (Operand.isCRBitMask())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'CondBr' class
  case MCK_CondBr:
    if (Operand.isCondBr())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DirectBr' class
  case MCK_DirectBr:
    if (Operand.isDirectBr())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispRI' class
  case MCK_DispRI:
    if (Operand.isS16Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispRIX16' class
  case MCK_DispRIX16:
    if (Operand.isS16ImmX16())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispRIX' class
  case MCK_DispRIX:
    if (Operand.isS16ImmX4())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispSPE2' class
  case MCK_DispSPE2:
    if (Operand.isU6ImmX2())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispSPE4' class
  case MCK_DispSPE4:
    if (Operand.isU7ImmX4())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'DispSPE8' class
  case MCK_DispSPE8:
    if (Operand.isU8ImmX8())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegCRBITRC' class
  case MCK_RegCRBITRC:
    if (Operand.isCRBitNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegCRRC' class
  case MCK_RegCRRC:
    if (Operand.isCCRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegF4RC' class
  case MCK_RegF4RC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegF8RC' class
  case MCK_RegF8RC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegG8RC' class
  case MCK_RegG8RC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegG8RCNoX0' class
  case MCK_RegG8RCNoX0:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegGPRC' class
  case MCK_RegGPRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegGPRCNoR0' class
  case MCK_RegGPRCNoR0:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegGxRCNoR0' class
  case MCK_RegGxRCNoR0:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegGxRC' class
  case MCK_RegGxRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegQBRC' class
  case MCK_RegQBRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegQFRC' class
  case MCK_RegQFRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegQSRC' class
  case MCK_RegQSRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegVRRC' class
  case MCK_RegVRRC:
    if (Operand.isRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegVSFRC' class
  case MCK_RegVSFRC:
    if (Operand.isVSRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegVSRC' class
  case MCK_RegVSRC:
    if (Operand.isVSRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'RegVSSRC' class
  case MCK_RegVSSRC:
    if (Operand.isVSRegNumber())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S16Imm' class
  case MCK_S16Imm:
    if (Operand.isS16Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S17Imm' class
  case MCK_S17Imm:
    if (Operand.isS17Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S5Imm' class
  case MCK_S5Imm:
    if (Operand.isS5Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'TLSReg' class
  case MCK_TLSReg:
    if (Operand.isTLSReg())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U10Imm' class
  case MCK_U10Imm:
    if (Operand.isU10Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U12Imm' class
  case MCK_U12Imm:
    if (Operand.isU12Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U16Imm' class
  case MCK_U16Imm:
    if (Operand.isU16Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U1Imm' class
  case MCK_U1Imm:
    if (Operand.isU1Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U2Imm' class
  case MCK_U2Imm:
    if (Operand.isU2Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U3Imm' class
  case MCK_U3Imm:
    if (Operand.isU3Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U4Imm' class
  case MCK_U4Imm:
    if (Operand.isU4Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U5Imm' class
  case MCK_U5Imm:
    if (Operand.isU5Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U6Imm' class
  case MCK_U6Imm:
    if (Operand.isU6Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U7Imm' class
  case MCK_U7Imm:
    if (Operand.isU7Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U8Imm' class
  case MCK_U8Imm:
    if (Operand.isU8Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  } // end switch (Kind)

  if (Operand.isReg()) {
    MatchClassKind OpKind;
    switch (Operand.getReg()) {
    default: OpKind = InvalidMatchClass; break;
    case PPC::R0: OpKind = MCK_GPRC; break;
    case PPC::R1: OpKind = MCK_Reg2; break;
    case PPC::R2: OpKind = MCK_Reg2; break;
    case PPC::R3: OpKind = MCK_Reg2; break;
    case PPC::R4: OpKind = MCK_Reg2; break;
    case PPC::R5: OpKind = MCK_Reg2; break;
    case PPC::R6: OpKind = MCK_Reg2; break;
    case PPC::R7: OpKind = MCK_Reg2; break;
    case PPC::R8: OpKind = MCK_Reg2; break;
    case PPC::R9: OpKind = MCK_Reg2; break;
    case PPC::R10: OpKind = MCK_Reg2; break;
    case PPC::R11: OpKind = MCK_Reg2; break;
    case PPC::R12: OpKind = MCK_Reg2; break;
    case PPC::R13: OpKind = MCK_Reg2; break;
    case PPC::R14: OpKind = MCK_Reg2; break;
    case PPC::R15: OpKind = MCK_Reg2; break;
    case PPC::R16: OpKind = MCK_Reg2; break;
    case PPC::R17: OpKind = MCK_Reg2; break;
    case PPC::R18: OpKind = MCK_Reg2; break;
    case PPC::R19: OpKind = MCK_Reg2; break;
    case PPC::R20: OpKind = MCK_Reg2; break;
    case PPC::R21: OpKind = MCK_Reg2; break;
    case PPC::R22: OpKind = MCK_Reg2; break;
    case PPC::R23: OpKind = MCK_Reg2; break;
    case PPC::R24: OpKind = MCK_Reg2; break;
    case PPC::R25: OpKind = MCK_Reg2; break;
    case PPC::R26: OpKind = MCK_Reg2; break;
    case PPC::R27: OpKind = MCK_Reg2; break;
    case PPC::R28: OpKind = MCK_Reg2; break;
    case PPC::R29: OpKind = MCK_Reg2; break;
    case PPC::R30: OpKind = MCK_Reg2; break;
    case PPC::R31: OpKind = MCK_Reg2; break;
    case PPC::X0: OpKind = MCK_G8RC; break;
    case PPC::X1: OpKind = MCK_Reg5; break;
    case PPC::X2: OpKind = MCK_Reg5; break;
    case PPC::X3: OpKind = MCK_Reg5; break;
    case PPC::X4: OpKind = MCK_Reg5; break;
    case PPC::X5: OpKind = MCK_Reg5; break;
    case PPC::X6: OpKind = MCK_Reg5; break;
    case PPC::X7: OpKind = MCK_Reg5; break;
    case PPC::X8: OpKind = MCK_Reg5; break;
    case PPC::X9: OpKind = MCK_Reg5; break;
    case PPC::X10: OpKind = MCK_Reg5; break;
    case PPC::X11: OpKind = MCK_Reg5; break;
    case PPC::X12: OpKind = MCK_Reg5; break;
    case PPC::X13: OpKind = MCK_Reg5; break;
    case PPC::X14: OpKind = MCK_Reg5; break;
    case PPC::X15: OpKind = MCK_Reg5; break;
    case PPC::X16: OpKind = MCK_Reg5; break;
    case PPC::X17: OpKind = MCK_Reg5; break;
    case PPC::X18: OpKind = MCK_Reg5; break;
    case PPC::X19: OpKind = MCK_Reg5; break;
    case PPC::X20: OpKind = MCK_Reg5; break;
    case PPC::X21: OpKind = MCK_Reg5; break;
    case PPC::X22: OpKind = MCK_Reg5; break;
    case PPC::X23: OpKind = MCK_Reg5; break;
    case PPC::X24: OpKind = MCK_Reg5; break;
    case PPC::X25: OpKind = MCK_Reg5; break;
    case PPC::X26: OpKind = MCK_Reg5; break;
    case PPC::X27: OpKind = MCK_Reg5; break;
    case PPC::X28: OpKind = MCK_Reg5; break;
    case PPC::X29: OpKind = MCK_Reg5; break;
    case PPC::X30: OpKind = MCK_Reg5; break;
    case PPC::X31: OpKind = MCK_Reg5; break;
    case PPC::F0: OpKind = MCK_F4RC; break;
    case PPC::F1: OpKind = MCK_F4RC; break;
    case PPC::F2: OpKind = MCK_F4RC; break;
    case PPC::F3: OpKind = MCK_F4RC; break;
    case PPC::F4: OpKind = MCK_F4RC; break;
    case PPC::F5: OpKind = MCK_F4RC; break;
    case PPC::F6: OpKind = MCK_F4RC; break;
    case PPC::F7: OpKind = MCK_F4RC; break;
    case PPC::F8: OpKind = MCK_F4RC; break;
    case PPC::F9: OpKind = MCK_F4RC; break;
    case PPC::F10: OpKind = MCK_F4RC; break;
    case PPC::F11: OpKind = MCK_F4RC; break;
    case PPC::F12: OpKind = MCK_F4RC; break;
    case PPC::F13: OpKind = MCK_F4RC; break;
    case PPC::F14: OpKind = MCK_F4RC; break;
    case PPC::F15: OpKind = MCK_F4RC; break;
    case PPC::F16: OpKind = MCK_F4RC; break;
    case PPC::F17: OpKind = MCK_F4RC; break;
    case PPC::F18: OpKind = MCK_F4RC; break;
    case PPC::F19: OpKind = MCK_F4RC; break;
    case PPC::F20: OpKind = MCK_F4RC; break;
    case PPC::F21: OpKind = MCK_F4RC; break;
    case PPC::F22: OpKind = MCK_F4RC; break;
    case PPC::F23: OpKind = MCK_F4RC; break;
    case PPC::F24: OpKind = MCK_F4RC; break;
    case PPC::F25: OpKind = MCK_F4RC; break;
    case PPC::F26: OpKind = MCK_F4RC; break;
    case PPC::F27: OpKind = MCK_F4RC; break;
    case PPC::F28: OpKind = MCK_F4RC; break;
    case PPC::F29: OpKind = MCK_F4RC; break;
    case PPC::F30: OpKind = MCK_F4RC; break;
    case PPC::F31: OpKind = MCK_F4RC; break;
    case PPC::VF0: OpKind = MCK_VFRC; break;
    case PPC::VF1: OpKind = MCK_VFRC; break;
    case PPC::VF2: OpKind = MCK_VFRC; break;
    case PPC::VF3: OpKind = MCK_VFRC; break;
    case PPC::VF4: OpKind = MCK_VFRC; break;
    case PPC::VF5: OpKind = MCK_VFRC; break;
    case PPC::VF6: OpKind = MCK_VFRC; break;
    case PPC::VF7: OpKind = MCK_VFRC; break;
    case PPC::VF8: OpKind = MCK_VFRC; break;
    case PPC::VF9: OpKind = MCK_VFRC; break;
    case PPC::VF10: OpKind = MCK_VFRC; break;
    case PPC::VF11: OpKind = MCK_VFRC; break;
    case PPC::VF12: OpKind = MCK_VFRC; break;
    case PPC::VF13: OpKind = MCK_VFRC; break;
    case PPC::VF14: OpKind = MCK_VFRC; break;
    case PPC::VF15: OpKind = MCK_VFRC; break;
    case PPC::VF16: OpKind = MCK_VFRC; break;
    case PPC::VF17: OpKind = MCK_VFRC; break;
    case PPC::VF18: OpKind = MCK_VFRC; break;
    case PPC::VF19: OpKind = MCK_VFRC; break;
    case PPC::VF20: OpKind = MCK_VFRC; break;
    case PPC::VF21: OpKind = MCK_VFRC; break;
    case PPC::VF22: OpKind = MCK_VFRC; break;
    case PPC::VF23: OpKind = MCK_VFRC; break;
    case PPC::VF24: OpKind = MCK_VFRC; break;
    case PPC::VF25: OpKind = MCK_VFRC; break;
    case PPC::VF26: OpKind = MCK_VFRC; break;
    case PPC::VF27: OpKind = MCK_VFRC; break;
    case PPC::VF28: OpKind = MCK_VFRC; break;
    case PPC::VF29: OpKind = MCK_VFRC; break;
    case PPC::VF30: OpKind = MCK_VFRC; break;
    case PPC::VF31: OpKind = MCK_VFRC; break;
    case PPC::QF0: OpKind = MCK_QSRC; break;
    case PPC::QF1: OpKind = MCK_QSRC; break;
    case PPC::QF2: OpKind = MCK_QSRC; break;
    case PPC::QF3: OpKind = MCK_QSRC; break;
    case PPC::QF4: OpKind = MCK_QSRC; break;
    case PPC::QF5: OpKind = MCK_QSRC; break;
    case PPC::QF6: OpKind = MCK_QSRC; break;
    case PPC::QF7: OpKind = MCK_QSRC; break;
    case PPC::QF8: OpKind = MCK_QSRC; break;
    case PPC::QF9: OpKind = MCK_QSRC; break;
    case PPC::QF10: OpKind = MCK_QSRC; break;
    case PPC::QF11: OpKind = MCK_QSRC; break;
    case PPC::QF12: OpKind = MCK_QSRC; break;
    case PPC::QF13: OpKind = MCK_QSRC; break;
    case PPC::QF14: OpKind = MCK_QSRC; break;
    case PPC::QF15: OpKind = MCK_QSRC; break;
    case PPC::QF16: OpKind = MCK_QSRC; break;
    case PPC::QF17: OpKind = MCK_QSRC; break;
    case PPC::QF18: OpKind = MCK_QSRC; break;
    case PPC::QF19: OpKind = MCK_QSRC; break;
    case PPC::QF20: OpKind = MCK_QSRC; break;
    case PPC::QF21: OpKind = MCK_QSRC; break;
    case PPC::QF22: OpKind = MCK_QSRC; break;
    case PPC::QF23: OpKind = MCK_QSRC; break;
    case PPC::QF24: OpKind = MCK_QSRC; break;
    case PPC::QF25: OpKind = MCK_QSRC; break;
    case PPC::QF26: OpKind = MCK_QSRC; break;
    case PPC::QF27: OpKind = MCK_QSRC; break;
    case PPC::QF28: OpKind = MCK_QSRC; break;
    case PPC::QF29: OpKind = MCK_QSRC; break;
    case PPC::QF30: OpKind = MCK_QSRC; break;
    case PPC::QF31: OpKind = MCK_QSRC; break;
    case PPC::V0: OpKind = MCK_VRRC; break;
    case PPC::V1: OpKind = MCK_VRRC; break;
    case PPC::V2: OpKind = MCK_VRRC; break;
    case PPC::V3: OpKind = MCK_VRRC; break;
    case PPC::V4: OpKind = MCK_VRRC; break;
    case PPC::V5: OpKind = MCK_VRRC; break;
    case PPC::V6: OpKind = MCK_VRRC; break;
    case PPC::V7: OpKind = MCK_VRRC; break;
    case PPC::V8: OpKind = MCK_VRRC; break;
    case PPC::V9: OpKind = MCK_VRRC; break;
    case PPC::V10: OpKind = MCK_VRRC; break;
    case PPC::V11: OpKind = MCK_VRRC; break;
    case PPC::V12: OpKind = MCK_VRRC; break;
    case PPC::V13: OpKind = MCK_VRRC; break;
    case PPC::V14: OpKind = MCK_VRRC; break;
    case PPC::V15: OpKind = MCK_VRRC; break;
    case PPC::V16: OpKind = MCK_VRRC; break;
    case PPC::V17: OpKind = MCK_VRRC; break;
    case PPC::V18: OpKind = MCK_VRRC; break;
    case PPC::V19: OpKind = MCK_VRRC; break;
    case PPC::V20: OpKind = MCK_VRRC; break;
    case PPC::V21: OpKind = MCK_VRRC; break;
    case PPC::V22: OpKind = MCK_VRRC; break;
    case PPC::V23: OpKind = MCK_VRRC; break;
    case PPC::V24: OpKind = MCK_VRRC; break;
    case PPC::V25: OpKind = MCK_VRRC; break;
    case PPC::V26: OpKind = MCK_VRRC; break;
    case PPC::V27: OpKind = MCK_VRRC; break;
    case PPC::V28: OpKind = MCK_VRRC; break;
    case PPC::V29: OpKind = MCK_VRRC; break;
    case PPC::V30: OpKind = MCK_VRRC; break;
    case PPC::V31: OpKind = MCK_VRRC; break;
    case PPC::VSL0: OpKind = MCK_VSLRC; break;
    case PPC::VSL1: OpKind = MCK_VSLRC; break;
    case PPC::VSL2: OpKind = MCK_VSLRC; break;
    case PPC::VSL3: OpKind = MCK_VSLRC; break;
    case PPC::VSL4: OpKind = MCK_VSLRC; break;
    case PPC::VSL5: OpKind = MCK_VSLRC; break;
    case PPC::VSL6: OpKind = MCK_VSLRC; break;
    case PPC::VSL7: OpKind = MCK_VSLRC; break;
    case PPC::VSL8: OpKind = MCK_VSLRC; break;
    case PPC::VSL9: OpKind = MCK_VSLRC; break;
    case PPC::VSL10: OpKind = MCK_VSLRC; break;
    case PPC::VSL11: OpKind = MCK_VSLRC; break;
    case PPC::VSL12: OpKind = MCK_VSLRC; break;
    case PPC::VSL13: OpKind = MCK_VSLRC; break;
    case PPC::VSL14: OpKind = MCK_VSLRC; break;
    case PPC::VSL15: OpKind = MCK_VSLRC; break;
    case PPC::VSL16: OpKind = MCK_VSLRC; break;
    case PPC::VSL17: OpKind = MCK_VSLRC; break;
    case PPC::VSL18: OpKind = MCK_VSLRC; break;
    case PPC::VSL19: OpKind = MCK_VSLRC; break;
    case PPC::VSL20: OpKind = MCK_VSLRC; break;
    case PPC::VSL21: OpKind = MCK_VSLRC; break;
    case PPC::VSL22: OpKind = MCK_VSLRC; break;
    case PPC::VSL23: OpKind = MCK_VSLRC; break;
    case PPC::VSL24: OpKind = MCK_VSLRC; break;
    case PPC::VSL25: OpKind = MCK_VSLRC; break;
    case PPC::VSL26: OpKind = MCK_VSLRC; break;
    case PPC::VSL27: OpKind = MCK_VSLRC; break;
    case PPC::VSL28: OpKind = MCK_VSLRC; break;
    case PPC::VSL29: OpKind = MCK_VSLRC; break;
    case PPC::VSL30: OpKind = MCK_VSLRC; break;
    case PPC::VSL31: OpKind = MCK_VSLRC; break;
    case PPC::VSH0: OpKind = MCK_VSHRC; break;
    case PPC::VSH1: OpKind = MCK_VSHRC; break;
    case PPC::VSH2: OpKind = MCK_VSHRC; break;
    case PPC::VSH3: OpKind = MCK_VSHRC; break;
    case PPC::VSH4: OpKind = MCK_VSHRC; break;
    case PPC::VSH5: OpKind = MCK_VSHRC; break;
    case PPC::VSH6: OpKind = MCK_VSHRC; break;
    case PPC::VSH7: OpKind = MCK_VSHRC; break;
    case PPC::VSH8: OpKind = MCK_VSHRC; break;
    case PPC::VSH9: OpKind = MCK_VSHRC; break;
    case PPC::VSH10: OpKind = MCK_VSHRC; break;
    case PPC::VSH11: OpKind = MCK_VSHRC; break;
    case PPC::VSH12: OpKind = MCK_VSHRC; break;
    case PPC::VSH13: OpKind = MCK_VSHRC; break;
    case PPC::VSH14: OpKind = MCK_VSHRC; break;
    case PPC::VSH15: OpKind = MCK_VSHRC; break;
    case PPC::VSH16: OpKind = MCK_VSHRC; break;
    case PPC::VSH17: OpKind = MCK_VSHRC; break;
    case PPC::VSH18: OpKind = MCK_VSHRC; break;
    case PPC::VSH19: OpKind = MCK_VSHRC; break;
    case PPC::VSH20: OpKind = MCK_VSHRC; break;
    case PPC::VSH21: OpKind = MCK_VSHRC; break;
    case PPC::VSH22: OpKind = MCK_VSHRC; break;
    case PPC::VSH23: OpKind = MCK_VSHRC; break;
    case PPC::VSH24: OpKind = MCK_VSHRC; break;
    case PPC::VSH25: OpKind = MCK_VSHRC; break;
    case PPC::VSH26: OpKind = MCK_VSHRC; break;
    case PPC::VSH27: OpKind = MCK_VSHRC; break;
    case PPC::VSH28: OpKind = MCK_VSHRC; break;
    case PPC::VSH29: OpKind = MCK_VSHRC; break;
    case PPC::VSH30: OpKind = MCK_VSHRC; break;
    case PPC::VSH31: OpKind = MCK_VSHRC; break;
    case PPC::ZERO: OpKind = MCK_GPRC_NOR0; break;
    case PPC::ZERO8: OpKind = MCK_G8RC_NOX0; break;
    case PPC::FP: OpKind = MCK_Reg2; break;
    case PPC::FP8: OpKind = MCK_Reg5; break;
    case PPC::BP: OpKind = MCK_Reg2; break;
    case PPC::BP8: OpKind = MCK_Reg5; break;
    case PPC::CR0LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR0GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR0EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR0UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR1LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR1GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR1EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR1UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR2LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR2GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR2EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR2UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR3LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR3GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR3EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR3UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR4LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR4GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR4EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR4UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR5LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR5GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR5EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR5UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR6LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR6GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR6EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR6UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR7LT: OpKind = MCK_CRBITRC; break;
    case PPC::CR7GT: OpKind = MCK_CRBITRC; break;
    case PPC::CR7EQ: OpKind = MCK_CRBITRC; break;
    case PPC::CR7UN: OpKind = MCK_CRBITRC; break;
    case PPC::CR0: OpKind = MCK_CRRC0; break;
    case PPC::CR1: OpKind = MCK_CRRC; break;
    case PPC::CR2: OpKind = MCK_CRRC; break;
    case PPC::CR3: OpKind = MCK_CRRC; break;
    case PPC::CR4: OpKind = MCK_CRRC; break;
    case PPC::CR5: OpKind = MCK_CRRC; break;
    case PPC::CR6: OpKind = MCK_CRRC; break;
    case PPC::CR7: OpKind = MCK_CRRC; break;
    case PPC::CTR: OpKind = MCK_CTRRC; break;
    case PPC::CTR8: OpKind = MCK_CTRRC8; break;
    case PPC::VRSAVE: OpKind = MCK_VRSAVERC; break;
    case PPC::CARRY: OpKind = MCK_CARRYRC; break;
    }
    return isSubclass(OpKind, Kind) ? MCTargetAsmParser::Match_Success :
                                      MCTargetAsmParser::Match_InvalidOperand;
  }

  return MCTargetAsmParser::Match_InvalidOperand;
}

uint64_t PPCAsmParser::
ComputeAvailableFeatures(const FeatureBitset& FB) const {
  uint64_t Features = 0;
  return Features;
}

static const char *const MnemonicTable =
    "\003add\004addc\004adde\004addi\005addic\005addis\005addme\005addze\003"
    "and\004andc\004andi\005andis\004attn\001b\002ba\002bc\003bca\005bcctr\006"
    "bcctrl\006bcdcfn\007bcdcfsq\006bcdcfz\010bcdcpsgn\006bcdctn\007bcdctsq\006"
    "bcdctz\004bcds\tbcdsetsgn\005bcdsr\010bcdtrunc\005bcdus\tbcdutrunc\003b"
    "cl\004bcla\004bclr\005bclrl\004bctr\005bctrl\004bdnz\005bdnz+\005bdnz-\005"
    "bdnza\006bdnza+\006bdnza-\005bdnzf\006bdnzfa\006bdnzfl\007bdnzfla\007bd"
    "nzflr\010bdnzflrl\005bdnzl\006bdnzl+\006bdnzl-\006bdnzla\007bdnzla+\007"
    "bdnzla-\006bdnzlr\007bdnzlr+\007bdnzlr-\007bdnzlrl\010bdnzlrl+\010bdnzl"
    "rl-\005bdnzt\006bdnzta\006bdnztl\007bdnztla\007bdnztlr\010bdnztlrl\003b"
    "dz\004bdz+\004bdz-\004bdza\005bdza+\005bdza-\004bdzf\005bdzfa\005bdzfl\006"
    "bdzfla\006bdzflr\007bdzflrl\004bdzl\005bdzl+\005bdzl-\005bdzla\006bdzla"
    "+\006bdzla-\005bdzlr\006bdzlr+\006bdzlr-\006bdzlrl\007bdzlrl+\007bdzlrl"
    "-\004bdzt\005bdzta\005bdztl\006bdztla\006bdztlr\007bdztlrl\003beq\004be"
    "q+\004beq-\004beqa\005beqa+\005beqa-\006beqctr\007beqctr+\007beqctr-\007"
    "beqctrl\010beqctrl+\010beqctrl-\004beql\005beql+\005beql-\005beqla\006b"
    "eqla+\006beqla-\005beqlr\006beqlr+\006beqlr-\006beqlrl\007beqlrl+\007be"
    "qlrl-\002bf\003bf+\003bf-\003bfa\004bfa+\004bfa-\005bfctr\006bfctr+\006"
    "bfctr-\006bfctrl\007bfctrl+\007bfctrl-\003bfl\004bfl+\004bfl-\004bfla\005"
    "bfla+\005bfla-\004bflr\005bflr+\005bflr-\005bflrl\006bflrl+\006bflrl-\003"
    "bge\004bge+\004bge-\004bgea\005bgea+\005bgea-\006bgectr\007bgectr+\007b"
    "gectr-\007bgectrl\010bgectrl+\010bgectrl-\004bgel\005bgel+\005bgel-\005"
    "bgela\006bgela+\006bgela-\005bgelr\006bgelr+\006bgelr-\006bgelrl\007bge"
    "lrl+\007bgelrl-\003bgt\004bgt+\004bgt-\004bgta\005bgta+\005bgta-\006bgt"
    "ctr\007bgtctr+\007bgtctr-\007bgtctrl\010bgtctrl+\010bgtctrl-\004bgtl\005"
    "bgtl+\005bgtl-\005bgtla\006bgtla+\006bgtla-\005bgtlr\006bgtlr+\006bgtlr"
    "-\006bgtlrl\007bgtlrl+\007bgtlrl-\002bl\003bla\003ble\004ble+\004ble-\004"
    "blea\005blea+\005blea-\006blectr\007blectr+\007blectr-\007blectrl\010bl"
    "ectrl+\010blectrl-\004blel\005blel+\005blel-\005blela\006blela+\006blel"
    "a-\005blelr\006blelr+\006blelr-\006blelrl\007blelrl+\007blelrl-\003blr\004"
    "blrl\003blt\004blt+\004blt-\004blta\005blta+\005blta-\006bltctr\007bltc"
    "tr+\007bltctr-\007bltctrl\010bltctrl+\010bltctrl-\004bltl\005bltl+\005b"
    "ltl-\005bltla\006bltla+\006bltla-\005bltlr\006bltlr+\006bltlr-\006bltlr"
    "l\007bltlrl+\007bltlrl-\003bne\004bne+\004bne-\004bnea\005bnea+\005bnea"
    "-\006bnectr\007bnectr+\007bnectr-\007bnectrl\010bnectrl+\010bnectrl-\004"
    "bnel\005bnel+\005bnel-\005bnela\006bnela+\006bnela-\005bnelr\006bnelr+\006"
    "bnelr-\006bnelrl\007bnelrl+\007bnelrl-\003bng\004bng+\004bng-\004bnga\005"
    "bnga+\005bnga-\006bngctr\007bngctr+\007bngctr-\007bngctrl\010bngctrl+\010"
    "bngctrl-\004bngl\005bngl+\005bngl-\005bngla\006bngla+\006bngla-\005bngl"
    "r\006bnglr+\006bnglr-\006bnglrl\007bnglrl+\007bnglrl-\003bnl\004bnl+\004"
    "bnl-\004bnla\005bnla+\005bnla-\006bnlctr\007bnlctr+\007bnlctr-\007bnlct"
    "rl\010bnlctrl+\010bnlctrl-\004bnll\005bnll+\005bnll-\005bnlla\006bnlla+"
    "\006bnlla-\005bnllr\006bnllr+\006bnllr-\006bnllrl\007bnllrl+\007bnllrl-"
    "\003bns\004bns+\004bns-\004bnsa\005bnsa+\005bnsa-\006bnsctr\007bnsctr+\007"
    "bnsctr-\007bnsctrl\010bnsctrl+\010bnsctrl-\004bnsl\005bnsl+\005bnsl-\005"
    "bnsla\006bnsla+\006bnsla-\005bnslr\006bnslr+\006bnslr-\006bnslrl\007bns"
    "lrl+\007bnslrl-\003bnu\004bnu+\004bnu-\004bnua\005bnua+\005bnua-\006bnu"
    "ctr\007bnuctr+\007bnuctr-\007bnuctrl\010bnuctrl+\010bnuctrl-\004bnul\005"
    "bnul+\005bnul-\005bnula\006bnula+\006bnula-\005bnulr\006bnulr+\006bnulr"
    "-\006bnulrl\007bnulrl+\007bnulrl-\006bpermd\005brinc\003bso\004bso+\004"
    "bso-\004bsoa\005bsoa+\005bsoa-\006bsoctr\007bsoctr+\007bsoctr-\007bsoct"
    "rl\010bsoctrl+\010bsoctrl-\004bsol\005bsol+\005bsol-\005bsola\006bsola+"
    "\006bsola-\005bsolr\006bsolr+\006bsolr-\006bsolrl\007bsolrl+\007bsolrl-"
    "\002bt\003bt+\003bt-\003bta\004bta+\004bta-\005btctr\006btctr+\006btctr"
    "-\006btctrl\007btctrl+\007btctrl-\003btl\004btl+\004btl-\004btla\005btl"
    "a+\005btla-\004btlr\005btlr+\005btlr-\005btlrl\006btlrl+\006btlrl-\003b"
    "un\004bun+\004bun-\004buna\005buna+\005buna-\006bunctr\007bunctr+\007bu"
    "nctr-\007bunctrl\010bunctrl+\010bunctrl-\004bunl\005bunl+\005bunl-\005b"
    "unla\006bunla+\006bunla-\005bunlr\006bunlr+\006bunlr-\006bunlrl\007bunl"
    "rl+\007bunlrl-\007clrbhrb\006clrldi\010clrlsldi\010clrlslwi\006clrlwi\006"
    "clrrdi\006clrrwi\003cmp\004cmpb\004cmpd\005cmpdi\006cmpeqb\004cmpi\004c"
    "mpl\005cmpld\006cmpldi\005cmpli\005cmplw\006cmplwi\005cmprb\004cmpw\005"
    "cmpwi\006cntlzd\006cntlzw\006cnttzd\006cnttzw\004copy\ncopy_first\010cp"
    "_abort\005crand\006crandc\005crclr\005creqv\006crmove\006crnand\005crno"
    "r\005crnot\004cror\005crorc\005crset\005crxor\004dcba\004dcbf\004dcbi\005"
    "dcbst\004dcbt\006dcbtct\006dcbtds\006dcbtst\010dcbtstct\010dcbtstds\007"
    "dcbtstt\005dcbtt\004dcbz\005dcbzl\005dccci\003dci\004divd\005divde\006d"
    "ivdeu\005divdu\004divw\005divwe\006divweu\005divwu\003dss\006dssall\003"
    "dst\005dstst\006dststt\004dstt\005eieio\003eqv\005evabs\007evaddiw\013e"
    "vaddsmiaaw\013evaddssiaaw\013evaddumiaaw\013evaddusiaaw\006evaddw\005ev"
    "and\006evandc\007evcmpeq\010evcmpgts\010evcmpgtu\010evcmplts\010evcmplt"
    "u\010evcntlsw\010evcntlzw\007evdivws\007evdivwu\005eveqv\007evextsb\007"
    "evextsh\005evldd\006evlddx\005evldh\006evldhx\005evldw\006evldwx\013evl"
    "hhesplat\014evlhhesplatx\014evlhhossplat\015evlhhossplatx\014evlhhouspl"
    "at\015evlhhousplatx\006evlwhe\007evlwhex\007evlwhos\010evlwhosx\007evlw"
    "hou\010evlwhoux\nevlwhsplat\013evlwhsplatx\nevlwwsplat\013evlwwsplatx\t"
    "evmergehi\013evmergehilo\tevmergelo\013evmergelohi\013evmhegsmfaa\013ev"
    "mhegsmfan\013evmhegsmiaa\013evmhegsmian\013evmhegumiaa\013evmhegumian\010"
    "evmhesmf\tevmhesmfa\013evmhesmfaaw\013evmhesmfanw\010evmhesmi\tevmhesmi"
    "a\013evmhesmiaaw\013evmhesmianw\010evmhessf\tevmhessfa\013evmhessfaaw\013"
    "evmhessfanw\013evmhessiaaw\013evmhessianw\010evmheumi\tevmheumia\013evm"
    "heumiaaw\013evmheumianw\013evmheusiaaw\013evmheusianw\013evmhogsmfaa\013"
    "evmhogsmfan\013evmhogsmiaa\013evmhogsmian\013evmhogumiaa\013evmhogumian"
    "\010evmhosmf\tevmhosmfa\013evmhosmfaaw\013evmhosmfanw\010evmhosmi\tevmh"
    "osmia\013evmhosmiaaw\013evmhosmianw\010evmhossf\tevmhossfa\013evmhossfa"
    "aw\013evmhossfanw\013evmhossiaaw\013evmhossianw\010evmhoumi\tevmhoumia\013"
    "evmhoumiaaw\013evmhoumianw\013evmhousiaaw\013evmhousianw\005evmra\010ev"
    "mwhsmf\tevmwhsmfa\010evmwhsmi\tevmwhsmia\010evmwhssf\tevmwhssfa\010evmw"
    "humi\tevmwhumia\013evmwlsmiaaw\013evmwlsmianw\013evmwlssiaaw\013evmwlss"
    "ianw\010evmwlumi\tevmwlumia\013evmwlumiaaw\013evmwlumianw\013evmwlusiaa"
    "w\013evmwlusianw\007evmwsmf\010evmwsmfa\tevmwsmfaa\tevmwsmfan\007evmwsm"
    "i\010evmwsmia\tevmwsmiaa\tevmwsmian\007evmwssf\010evmwssfa\tevmwssfaa\t"
    "evmwssfan\007evmwumi\010evmwumia\tevmwumiaa\tevmwumian\006evnand\005evn"
    "eg\005evnor\004evor\005evorc\005evrlw\006evrlwi\006evrndw\005evslw\006e"
    "vslwi\tevsplatfi\010evsplati\007evsrwis\007evsrwiu\006evsrws\006evsrwu\006"
    "evstdd\007evstddx\006evstdh\007evstdhx\006evstdw\007evstdwx\007evstwhe\010"
    "evstwhex\007evstwho\010evstwhox\007evstwwe\010evstwwex\007evstwwo\010ev"
    "stwwox\014evsubfsmiaaw\014evsubfssiaaw\014evsubfumiaaw\014evsubfusiaaw\007"
    "evsubfw\010evsubifw\005evxor\006extldi\006extlwi\006extrdi\006extrwi\005"
    "extsb\005extsh\005extsw\004fabs\004fadd\005fadds\005fcfid\006fcfids\006"
    "fcfidu\007fcfidus\005fcmpu\006fcpsgn\005fctid\007fctiduz\006fctidz\005f"
    "ctiw\007fctiwuz\006fctiwz\004fdiv\005fdivs\005fmadd\006fmadds\003fmr\005"
    "fmsub\006fmsubs\004fmul\005fmuls\005fnabs\004fneg\006fnmadd\007fnmadds\006"
    "fnmsub\007fnmsubs\003fre\004fres\004frim\004frin\004frip\004friz\004frs"
    "p\007frsqrte\010frsqrtes\004fsel\005fsqrt\006fsqrts\004fsub\005fsubs\004"
    "icbi\004icbt\005iccci\003ici\006inslwi\006insrdi\006insrwi\004isel\005i"
    "sync\002la\005lbarx\003lbz\006lbzcix\004lbzu\005lbzux\004lbzx\002ld\005"
    "ldarx\004ldat\005ldbrx\005ldcix\004ldmx\003ldu\004ldux\003ldx\003lfd\004"
    "lfdu\005lfdux\004lfdx\006lfiwax\006lfiwzx\003lfs\004lfsu\005lfsux\004lf"
    "sx\003lha\005lharx\004lhau\005lhaux\004lhax\005lhbrx\003lhz\006lhzcix\004"
    "lhzu\005lhzux\004lhzx\002li\003lis\003lmw\004lswi\005lvebx\005lvehx\005"
    "lvewx\004lvsl\004lvsr\003lvx\004lvxl\003lwa\005lwarx\004lwat\005lwaux\004"
    "lwax\005lwbrx\006lwsync\003lwz\006lwzcix\004lwzu\005lwzux\004lwzx\004lx"
    "sd\005lxsdx\007lxsibzx\007lxsihzx\007lxsiwax\007lxsiwzx\005lxssp\006lxs"
    "spx\003lxv\007lxvb16x\006lxvd2x\006lxvdsx\006lxvh8x\004lxvl\005lxvll\006"
    "lxvw4x\006lxvwsx\004lxvx\004mbar\004mcrf\005mcrfs\006mcrxrx\005mfamr\005"
    "mfasr\007mfbhrbe\005mfbr0\005mfbr1\005mfbr2\005mfbr3\005mfbr4\005mfbr5\005"
    "mfbr6\005mfbr7\006mfcfar\004mfcr\005mfctr\005mfdar\007mfdbatl\007mfdbat"
    "u\006mfdccr\005mfdcr\006mfdear\005mfdec\006mfdscr\007mfdsisr\005mfesr\004"
    "mffs\007mfibatl\007mfibatu\006mficcr\004mflr\005mfmsr\006mfocrf\005mfpi"
    "d\005mfpvr\006mfrtcl\006mfrtcu\006mfsdr1\tmfspefscr\005mfspr\006mfsprg\007"
    "mfsprg0\007mfsprg1\007mfsprg2\007mfsprg3\007mfsprg4\007mfsprg5\007mfspr"
    "g6\007mfsprg7\004mfsr\006mfsrin\006mfsrr0\006mfsrr1\006mfsrr2\006mfsrr3"
    "\004mftb\006mftbhi\005mftbl\006mftblo\005mftbu\005mftcr\010mfvrsave\006"
    "mfvscr\006mfvsrd\007mfvsrld\007mfvsrwz\005mfxer\002mr\007msgsync\005msy"
    "nc\005mtamr\005mtasr\005mtbr0\005mtbr1\005mtbr2\005mtbr3\005mtbr4\005mt"
    "br5\005mtbr6\005mtbr7\006mtcfar\004mtcr\005mtcrf\005mtctr\005mtdar\007m"
    "tdbatl\007mtdbatu\006mtdccr\005mtdcr\006mtdear\005mtdec\006mtdscr\007mt"
    "dsisr\005mtesr\006mtfsb0\006mtfsb1\005mtfsf\006mtfsfi\007mtibatl\007mti"
    "batu\006mticcr\004mtlr\005mtmsr\006mtmsrd\006mtocrf\005mtpid\006mtsdr1\t"
    "mtspefscr\005mtspr\006mtsprg\007mtsprg0\007mtsprg1\007mtsprg2\007mtsprg"
    "3\007mtsprg4\007mtsprg5\007mtsprg6\007mtsprg7\004mtsr\006mtsrin\006mtsr"
    "r0\006mtsrr1\006mtsrr2\006mtsrr3\006mttbhi\005mttbl\006mttblo\005mttbu\005"
    "mttcr\010mtvrsave\006mtvscr\006mtvsrd\007mtvsrdd\007mtvsrwa\007mtvsrws\007"
    "mtvsrwz\005mtxer\005mulhd\006mulhdu\005mulhw\006mulhwu\005mulld\005mull"
    "i\005mullw\004nand\003neg\003nop\003nor\003not\002or\003orc\003ori\004o"
    "ris\005paste\npaste_last\007popcntd\007popcntw\007ptesync\010qvaligni\t"
    "qvesplati\006qvfabs\006qvfadd\007qvfadds\006qvfand\007qvfandc\007qvfcfi"
    "d\010qvfcfids\010qvfcfidu\tqvfcfidus\006qvfclr\010qvfcmpeq\010qvfcmpgt\010"
    "qvfcmplt\010qvfcpsgn\007qvfctfb\007qvfctid\010qvfctidu\tqvfctiduz\010qv"
    "fctidz\007qvfctiw\010qvfctiwu\tqvfctiwuz\010qvfctiwz\006qvfequ\nqvflogi"
    "cal\007qvfmadd\010qvfmadds\005qvfmr\007qvfmsub\010qvfmsubs\006qvfmul\007"
    "qvfmuls\007qvfnabs\007qvfnand\006qvfneg\010qvfnmadd\tqvfnmadds\010qvfnm"
    "sub\tqvfnmsubs\006qvfnor\006qvfnot\005qvfor\006qvforc\007qvfperm\005qvf"
    "re\006qvfres\006qvfrim\006qvfrin\006qvfrip\006qvfriz\006qvfrsp\tqvfrsqr"
    "te\nqvfrsqrtes\006qvfsel\006qvfset\006qvfsub\007qvfsubs\tqvftstnan\010q"
    "vfxmadd\tqvfxmadds\007qvfxmul\010qvfxmuls\006qvfxor\014qvfxxcpnmadd\015"
    "qvfxxcpnmadds\tqvfxxmadd\nqvfxxmadds\013qvfxxnpmadd\014qvfxxnpmadds\006"
    "qvgpci\010qvlfcdux\tqvlfcduxa\007qvlfcdx\010qvlfcdxa\010qvlfcsux\tqvlfc"
    "suxa\007qvlfcsx\010qvlfcsxa\007qvlfdux\010qvlfduxa\006qvlfdx\007qvlfdxa"
    "\010qvlfiwax\tqvlfiwaxa\010qvlfiwzx\tqvlfiwzxa\007qvlfsux\010qvlfsuxa\006"
    "qvlfsx\007qvlfsxa\010qvlpcldx\010qvlpclsx\010qvlpcrdx\010qvlpcrsx\tqvst"
    "fcdux\nqvstfcduxa\nqvstfcduxi\013qvstfcduxia\010qvstfcdx\tqvstfcdxa\tqv"
    "stfcdxi\nqvstfcdxia\tqvstfcsux\nqvstfcsuxa\nqvstfcsuxi\013qvstfcsuxia\010"
    "qvstfcsx\tqvstfcsxa\tqvstfcsxi\nqvstfcsxia\010qvstfdux\tqvstfduxa\tqvst"
    "fduxi\nqvstfduxia\007qvstfdx\010qvstfdxa\010qvstfdxi\tqvstfdxia\010qvst"
    "fiwx\tqvstfiwxa\010qvstfsux\tqvstfsuxa\tqvstfsuxi\nqvstfsuxia\007qvstfs"
    "x\010qvstfsxa\010qvstfsxi\tqvstfsxia\004rfci\004rfdi\005rfebb\003rfi\004"
    "rfid\005rfmci\005rldcl\005rldcr\005rldic\006rldicl\006rldicr\006rldimi\006"
    "rlwimi\006rlwinm\005rlwnm\005rotld\006rotldi\005rotlw\006rotlwi\006rotr"
    "di\006rotrwi\002sc\005slbia\005slbie\006slbieg\007slbmfee\006slbmte\007"
    "slbsync\003sld\004sldi\003slw\004slwi\004srad\005sradi\004sraw\005srawi"
    "\003srd\004srdi\003srw\004srwi\003stb\006stbcix\005stbcx\004stbu\005stb"
    "ux\004stbx\003std\005stdat\006stdbrx\006stdcix\005stdcx\004stdu\005stdu"
    "x\004stdx\004stfd\005stfdu\006stfdux\005stfdx\006stfiwx\004stfs\005stfs"
    "u\006stfsux\005stfsx\003sth\006sthbrx\006sthcix\005sthcx\004sthu\005sth"
    "ux\004sthx\004stmw\004stop\005stswi\006stvebx\006stvehx\006stvewx\004st"
    "vx\005stvxl\003stw\005stwat\006stwbrx\006stwcix\005stwcx\004stwu\005stw"
    "ux\004stwx\005stxsd\006stxsdx\007stxsibx\007stxsihx\007stxsiwx\006stxss"
    "p\007stxsspx\004stxv\010stxvb16x\007stxvd2x\007stxvh8x\005stxvl\006stxv"
    "ll\007stxvw4x\005stxvx\003sub\004subc\004subf\005subfc\005subfe\006subf"
    "ic\006subfme\006subfze\004subi\005subic\005subis\004sync\006tabort\010t"
    "abortdc\ttabortdci\010tabortwc\ttabortwci\006tbegin\006tcheck\002td\004"
    "tdeq\005tdeqi\004tdge\005tdgei\004tdgt\005tdgti\003tdi\004tdle\005tdlei"
    "\005tdlge\006tdlgei\005tdlgt\006tdlgti\005tdlle\006tdllei\005tdllt\006t"
    "dllti\005tdlng\006tdlngi\005tdlnl\006tdlnli\004tdlt\005tdlti\004tdne\005"
    "tdnei\004tdng\005tdngi\004tdnl\005tdnli\003tdu\004tdui\004tend\005tlbia"
    "\005tlbie\006tlbiel\007tlbivax\005tlbld\005tlbli\005tlbre\007tlbrehi\007"
    "tlbrelo\005tlbsx\007tlbsync\005tlbwe\007tlbwehi\007tlbwelo\004trap\010t"
    "rechkpt\010treclaim\003tsr\002tw\004tweq\005tweqi\004twge\005twgei\004t"
    "wgt\005twgti\003twi\004twle\005twlei\005twlge\006twlgei\005twlgt\006twl"
    "gti\005twlle\006twllei\005twllt\006twllti\005twlng\006twlngi\005twlnl\006"
    "twlnli\004twlt\005twlti\004twne\005twnei\004twng\005twngi\004twnl\005tw"
    "nli\003twu\004twui\007vaddcuq\007vaddcuw\010vaddecuq\010vaddeuqm\006vad"
    "dfp\007vaddsbs\007vaddshs\007vaddsws\007vaddubm\007vaddubs\007vaddudm\007"
    "vadduhm\007vadduhs\007vadduqm\007vadduwm\007vadduws\004vand\005vandc\006"
    "vavgsb\006vavgsh\006vavgsw\006vavgub\006vavguh\006vavguw\007vbpermd\007"
    "vbpermq\005vcfsx\005vcfux\007vcipher\013vcipherlast\005vclzb\005vclzd\005"
    "vclzh\010vclzlsbb\005vclzw\007vcmpbfp\010vcmpeqfp\010vcmpequb\010vcmpeq"
    "ud\010vcmpequh\010vcmpequw\010vcmpgefp\010vcmpgtfp\010vcmpgtsb\010vcmpg"
    "tsd\010vcmpgtsh\010vcmpgtsw\010vcmpgtub\010vcmpgtud\010vcmpgtuh\010vcmp"
    "gtuw\007vcmpneb\007vcmpneh\007vcmpnew\010vcmpnezb\010vcmpnezh\010vcmpne"
    "zw\006vctsxs\006vctuxs\005vctzb\005vctzd\005vctzh\010vctzlsbb\005vctzw\004"
    "veqv\010vexptefp\tvextractd\nvextractub\nvextractuh\nvextractuw\010vext"
    "sb2d\010vextsb2w\010vextsh2d\010vextsh2w\010vextsw2d\010vextublx\010vex"
    "tubrx\010vextuhlx\010vextuhrx\010vextuwlx\010vextuwrx\005vgbbd\010vinse"
    "rtb\010vinsertd\010vinserth\010vinsertw\007vlogefp\007vmaddfp\006vmaxfp"
    "\006vmaxsb\006vmaxsd\006vmaxsh\006vmaxsw\006vmaxub\006vmaxud\006vmaxuh\006"
    "vmaxuw\tvmhaddshs\nvmhraddshs\006vminfp\006vminsb\006vminsd\006vminsh\006"
    "vminsw\006vminub\006vminud\006vminuh\006vminuw\tvmladduhm\006vmrgew\006"
    "vmrghb\006vmrghh\006vmrghw\006vmrglb\006vmrglh\006vmrglw\006vmrgow\010v"
    "msummbm\010vmsumshm\010vmsumshs\010vmsumubm\010vmsumuhm\010vmsumuhs\tvm"
    "ul10cuq\nvmul10ecuq\tvmul10euq\010vmul10uq\007vmulesb\007vmulesh\007vmu"
    "lesw\007vmuleub\007vmuleuh\007vmuleuw\007vmulosb\007vmulosh\007vmulosw\007"
    "vmuloub\007vmulouh\007vmulouw\007vmuluwm\005vnand\010vncipher\014vnciph"
    "erlast\005vnegd\005vnegw\010vnmsubfp\004vnor\003vor\004vorc\005vperm\006"
    "vpermr\010vpermxor\005vpkpx\007vpksdss\007vpksdus\007vpkshss\007vpkshus"
    "\007vpkswss\007vpkswus\007vpkudum\007vpkudus\007vpkuhum\007vpkuhus\007v"
    "pkuwum\007vpkuwus\007vpmsumb\007vpmsumd\007vpmsumh\007vpmsumw\010vpopcn"
    "tb\010vpopcntd\010vpopcnth\010vpopcntw\007vprtybd\007vprtybq\007vprtybw"
    "\005vrefp\005vrfim\005vrfin\005vrfip\005vrfiz\004vrlb\004vrld\006vrldmi"
    "\006vrldnm\004vrlh\004vrlw\006vrlwmi\006vrlwnm\tvrsqrtefp\005vsbox\004v"
    "sel\nvshasigmad\nvshasigmaw\003vsl\004vslb\004vsld\006vsldoi\004vslh\004"
    "vslo\004vslv\004vslw\006vspltb\006vsplth\010vspltisb\010vspltish\010vsp"
    "ltisw\006vspltw\003vsr\005vsrab\005vsrad\005vsrah\005vsraw\004vsrb\004v"
    "srd\004vsrh\004vsro\004vsrv\004vsrw\007vsubcuq\007vsubcuw\010vsubecuq\010"
    "vsubeuqm\006vsubfp\007vsubsbs\007vsubshs\007vsubsws\007vsububm\007vsubu"
    "bs\007vsubudm\007vsubuhm\007vsubuhs\007vsubuqm\007vsubuwm\007vsubuws\010"
    "vsum2sws\010vsum4sbs\010vsum4shs\010vsum4ubs\007vsumsws\007vupkhpx\007v"
    "upkhsb\007vupkhsh\007vupkhsw\007vupklpx\007vupklsb\007vupklsh\007vupkls"
    "w\004vxor\004wait\010waitimpl\007waitrsv\005wrtee\006wrteei\004xnop\003"
    "xor\004xori\005xoris\007xsabsdp\007xsabsqp\007xsadddp\007xsaddqp\010xsa"
    "ddqpo\007xsaddsp\txscmpeqdp\nxscmpexpdp\nxscmpexpqp\txscmpgedp\txscmpgt"
    "dp\txscmpnedp\010xscmpodp\010xscmpoqp\010xscmpudp\010xscmpuqp\txscpsgnd"
    "p\txscpsgnqp\010xscvdphp\010xscvdpqp\010xscvdpsp\txscvdpspn\nxscvdpsxds"
    "\nxscvdpsxws\nxscvdpuxds\nxscvdpuxws\010xscvhpdp\010xscvqpdp\txscvqpdpo"
    "\txscvqpsdz\txscvqpswz\txscvqpudz\txscvqpuwz\010xscvsdqp\010xscvspdp\tx"
    "scvspdpn\txscvsxddp\txscvsxdsp\010xscvudqp\txscvuxddp\txscvuxdsp\007xsd"
    "ivdp\007xsdivqp\010xsdivqpo\007xsdivsp\010xsiexpdp\010xsiexpqp\txsmadda"
    "dp\txsmaddasp\txsmaddmdp\txsmaddmsp\010xsmaddqp\txsmaddqpo\010xsmaxcdp\007"
    "xsmaxdp\010xsmaxjdp\010xsmincdp\007xsmindp\010xsminjdp\txsmsubadp\txsms"
    "ubasp\txsmsubmdp\txsmsubmsp\010xsmsubqp\txsmsubqpo\007xsmuldp\007xsmulq"
    "p\010xsmulqpo\007xsmulsp\010xsnabsdp\010xsnabsqp\007xsnegdp\007xsnegqp\n"
    "xsnmaddadp\nxsnmaddasp\nxsnmaddmdp\nxsnmaddmsp\txsnmaddqp\nxsnmaddqpo\n"
    "xsnmsubadp\nxsnmsubasp\nxsnmsubmdp\nxsnmsubmsp\txsnmsubqp\nxsnmsubqpo\006"
    "xsrdpi\007xsrdpic\007xsrdpim\007xsrdpip\007xsrdpiz\006xsredp\006xsresp\006"
    "xsrqpi\007xsrqpix\007xsrqpxp\nxsrsqrtedp\nxsrsqrtesp\010xssqrtdp\010xss"
    "qrtqp\txssqrtqpo\010xssqrtsp\007xssubdp\007xssubqp\010xssubqpo\007xssub"
    "sp\010xstdivdp\txstsqrtdp\txststdcdp\txststdcqp\txststdcsp\010xsxexpdp\010"
    "xsxexpqp\010xsxsigdp\010xsxsigqp\007xvabsdp\007xvabssp\007xvadddp\007xv"
    "addsp\txvcmpeqdp\txvcmpeqsp\txvcmpgedp\txvcmpgesp\txvcmpgtdp\txvcmpgtsp"
    "\txvcmpnedp\txvcmpnesp\txvcpsgndp\txvcpsgnsp\010xvcvdpsp\nxvcvdpsxds\nx"
    "vcvdpsxws\nxvcvdpuxds\nxvcvdpuxws\010xvcvhpsp\010xvcvspdp\010xvcvsphp\n"
    "xvcvspsxds\nxvcvspsxws\nxvcvspuxds\nxvcvspuxws\txvcvsxddp\txvcvsxdsp\tx"
    "vcvsxwdp\txvcvsxwsp\txvcvuxddp\txvcvuxdsp\txvcvuxwdp\txvcvuxwsp\007xvdi"
    "vdp\007xvdivsp\010xviexpdp\010xviexpsp\txvmaddadp\txvmaddasp\txvmaddmdp"
    "\txvmaddmsp\007xvmaxdp\007xvmaxsp\007xvmindp\007xvminsp\007xvmovdp\007x"
    "vmovsp\txvmsubadp\txvmsubasp\txvmsubmdp\txvmsubmsp\007xvmuldp\007xvmuls"
    "p\010xvnabsdp\010xvnabssp\007xvnegdp\007xvnegsp\nxvnmaddadp\nxvnmaddasp"
    "\nxvnmaddmdp\nxvnmaddmsp\nxvnmsubadp\nxvnmsubasp\nxvnmsubmdp\nxvnmsubms"
    "p\006xvrdpi\007xvrdpic\007xvrdpim\007xvrdpip\007xvrdpiz\006xvredp\006xv"
    "resp\006xvrspi\007xvrspic\007xvrspim\007xvrspip\007xvrspiz\nxvrsqrtedp\n"
    "xvrsqrtesp\010xvsqrtdp\010xvsqrtsp\007xvsubdp\007xvsubsp\010xvtdivdp\010"
    "xvtdivsp\txvtsqrtdp\txvtsqrtsp\txvtstdcdp\txvtstdcsp\010xvxexpdp\010xvx"
    "expsp\010xvxsigdp\010xvxsigsp\005xxbrd\005xxbrh\005xxbrq\005xxbrw\013xx"
    "extractuw\txxinsertw\006xxland\007xxlandc\006xxleqv\007xxlnand\006xxlno"
    "r\005xxlor\006xxlorc\006xxlxor\007xxmrghd\007xxmrghw\007xxmrgld\007xxmr"
    "glw\006xxperm\010xxpermdi\007xxpermr\005xxsel\007xxsldwi\007xxspltd\010"
    "xxspltib\007xxspltw\007xxswapd";

namespace {
  struct MatchEntry {
    uint16_t Mnemonic;
    uint16_t Opcode;
    uint16_t ConvertFn;
    uint8_t RequiredFeatures;
    uint8_t Classes[6];
    StringRef getMnemonic() const {
      return StringRef(MnemonicTable + Mnemonic + 1,
                       MnemonicTable[Mnemonic]);
    }
  };

  // Predicate for searching for an opcode.
  struct LessOpcode {
    bool operator()(const MatchEntry &LHS, StringRef RHS) {
      return LHS.getMnemonic() < RHS;
    }
    bool operator()(StringRef LHS, const MatchEntry &RHS) {
      return LHS < RHS.getMnemonic();
    }
    bool operator()(const MatchEntry &LHS, const MatchEntry &RHS) {
      return LHS.getMnemonic() < RHS.getMnemonic();
    }
  };
} // end anonymous namespace.

static const MatchEntry MatchTable0[] = {
  { 0 /* add */, PPC::ADD8TLS_, Convert__RegG8RC1_0__RegG8RC1_1__TLSReg1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_TLSReg }, },
  { 0 /* add */, PPC::ADD4, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 0 /* add */, PPC::ADD4o, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4 /* addc */, PPC::ADDC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4 /* addc */, PPC::ADDCo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 9 /* adde */, PPC::ADDE, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 9 /* adde */, PPC::ADDEo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 14 /* addi */, PPC::ADDI, Convert__RegGPRC1_0__RegGPRCNoR01_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRCNoR0, MCK_S16Imm }, },
  { 19 /* addic */, PPC::ADDIC, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 19 /* addic */, PPC::ADDICo, Convert__RegGPRC1_1__RegGPRC1_2__S16Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 25 /* addis */, PPC::ADDIS, Convert__RegGPRC1_0__RegGPRCNoR01_1__S17Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRCNoR0, MCK_S17Imm }, },
  { 31 /* addme */, PPC::ADDME, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 31 /* addme */, PPC::ADDMEo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 37 /* addze */, PPC::ADDZE, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 37 /* addze */, PPC::ADDZEo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 43 /* and */, PPC::AND, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 43 /* and */, PPC::ANDo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 47 /* andc */, PPC::ANDC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 47 /* andc */, PPC::ANDCo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 52 /* andi */, PPC::ANDIo, Convert__RegGPRC1_1__RegGPRC1_2__U16Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 57 /* andis */, PPC::ANDISo, Convert__RegGPRC1_1__RegGPRC1_2__U16Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 63 /* attn */, PPC::ATTN, Convert_NoOperands, 0, {  }, },
  { 68 /* b */, PPC::B, Convert__DirectBr1_0, 0, { MCK_DirectBr }, },
  { 70 /* ba */, PPC::BA, Convert__DirectBr1_0, 0, { MCK_DirectBr }, },
  { 73 /* bc */, PPC::gBC, Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_CondBr }, },
  { 76 /* bca */, PPC::gBCA, Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_CondBr }, },
  { 80 /* bcctr */, PPC::gBCCTR, Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0, 0, { MCK_U5Imm, MCK_RegCRBITRC }, },
  { 80 /* bcctr */, PPC::gBCCTR, Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_Imm }, },
  { 86 /* bcctrl */, PPC::gBCCTRL, Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0, 0, { MCK_U5Imm, MCK_RegCRBITRC }, },
  { 86 /* bcctrl */, PPC::gBCCTRL, Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_Imm }, },
  { 93 /* bcdcfn */, PPC::BCDCFNo, Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 100 /* bcdcfsq */, PPC::BCDCFSQo, Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 108 /* bcdcfz */, PPC::BCDCFZo, Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 115 /* bcdcpsgn */, PPC::BCDCPSGNo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 124 /* bcdctn */, PPC::BCDCTNo, Convert__RegVRRC1_1__RegVRRC1_2, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC }, },
  { 131 /* bcdctsq */, PPC::BCDCTSQo, Convert__RegVRRC1_1__RegVRRC1_2, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC }, },
  { 139 /* bcdctz */, PPC::BCDCTZo, Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 146 /* bcds */, PPC::BCDSo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3__U1Imm1_4, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 151 /* bcdsetsgn */, PPC::BCDSETSGNo, Convert__RegVRRC1_1__RegVRRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 161 /* bcdsr */, PPC::BCDSRo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3__U1Imm1_4, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 167 /* bcdtrunc */, PPC::BCDTRUNCo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3__U1Imm1_4, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm }, },
  { 176 /* bcdus */, PPC::BCDUSo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 182 /* bcdutrunc */, PPC::BCDUTRUNCo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 192 /* bcl */, PPC::gBCL, Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_CondBr }, },
  { 196 /* bcla */, PPC::gBCLA, Convert__U5Imm1_0__RegCRBITRC1_1__CondBr1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_CondBr }, },
  { 201 /* bclr */, PPC::gBCLR, Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0, 0, { MCK_U5Imm, MCK_RegCRBITRC }, },
  { 201 /* bclr */, PPC::gBCLR, Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_Imm }, },
  { 206 /* bclrl */, PPC::gBCLRL, Convert__U5Imm1_0__RegCRBITRC1_1__imm_95_0, 0, { MCK_U5Imm, MCK_RegCRBITRC }, },
  { 206 /* bclrl */, PPC::gBCLRL, Convert__U5Imm1_0__RegCRBITRC1_1__Imm1_2, 0, { MCK_U5Imm, MCK_RegCRBITRC, MCK_Imm }, },
  { 212 /* bctr */, PPC::BCTR, Convert_NoOperands, 0, {  }, },
  { 217 /* bctrl */, PPC::BCTRL, Convert_NoOperands, 0, {  }, },
  { 223 /* bdnz */, PPC::BDNZ, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 228 /* bdnz+ */, PPC::BDNZp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 234 /* bdnz- */, PPC::BDNZm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 240 /* bdnza */, PPC::BDNZA, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 246 /* bdnza+ */, PPC::BDNZAp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 253 /* bdnza- */, PPC::BDNZAm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 260 /* bdnzf */, PPC::gBC, Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 266 /* bdnzfa */, PPC::gBCA, Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 273 /* bdnzfl */, PPC::gBCL, Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 280 /* bdnzfla */, PPC::gBCLA, Convert__imm_95_0__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 288 /* bdnzflr */, PPC::gBCLR, Convert__imm_95_0__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 296 /* bdnzflrl */, PPC::gBCLRL, Convert__imm_95_0__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 305 /* bdnzl */, PPC::BDNZL, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 311 /* bdnzl+ */, PPC::BDNZLp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 318 /* bdnzl- */, PPC::BDNZLm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 325 /* bdnzla */, PPC::BDNZLA, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 332 /* bdnzla+ */, PPC::BDNZLAp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 340 /* bdnzla- */, PPC::BDNZLAm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 348 /* bdnzlr */, PPC::BDNZLR, Convert_NoOperands, 0, {  }, },
  { 355 /* bdnzlr+ */, PPC::BDNZLRp, Convert_NoOperands, 0, {  }, },
  { 363 /* bdnzlr- */, PPC::BDNZLRm, Convert_NoOperands, 0, {  }, },
  { 371 /* bdnzlrl */, PPC::BDNZLRL, Convert_NoOperands, 0, {  }, },
  { 379 /* bdnzlrl+ */, PPC::BDNZLRLp, Convert_NoOperands, 0, {  }, },
  { 388 /* bdnzlrl- */, PPC::BDNZLRLm, Convert_NoOperands, 0, {  }, },
  { 397 /* bdnzt */, PPC::gBC, Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 403 /* bdnzta */, PPC::gBCA, Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 410 /* bdnztl */, PPC::gBCL, Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 417 /* bdnztla */, PPC::gBCLA, Convert__imm_95_8__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 425 /* bdnztlr */, PPC::gBCLR, Convert__imm_95_8__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 433 /* bdnztlrl */, PPC::gBCLRL, Convert__imm_95_8__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 442 /* bdz */, PPC::BDZ, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 446 /* bdz+ */, PPC::BDZp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 451 /* bdz- */, PPC::BDZm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 456 /* bdza */, PPC::BDZA, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 461 /* bdza+ */, PPC::BDZAp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 467 /* bdza- */, PPC::BDZAm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 473 /* bdzf */, PPC::gBC, Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 478 /* bdzfa */, PPC::gBCA, Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 484 /* bdzfl */, PPC::gBCL, Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 490 /* bdzfla */, PPC::gBCLA, Convert__imm_95_2__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 497 /* bdzflr */, PPC::gBCLR, Convert__imm_95_2__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 504 /* bdzflrl */, PPC::gBCLRL, Convert__imm_95_2__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 512 /* bdzl */, PPC::BDZL, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 517 /* bdzl+ */, PPC::BDZLp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 523 /* bdzl- */, PPC::BDZLm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 529 /* bdzla */, PPC::BDZLA, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 535 /* bdzla+ */, PPC::BDZLAp, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 542 /* bdzla- */, PPC::BDZLAm, Convert__CondBr1_0, 0, { MCK_CondBr }, },
  { 549 /* bdzlr */, PPC::BDZLR, Convert_NoOperands, 0, {  }, },
  { 555 /* bdzlr+ */, PPC::BDZLRp, Convert_NoOperands, 0, {  }, },
  { 562 /* bdzlr- */, PPC::BDZLRm, Convert_NoOperands, 0, {  }, },
  { 569 /* bdzlrl */, PPC::BDZLRL, Convert_NoOperands, 0, {  }, },
  { 576 /* bdzlrl+ */, PPC::BDZLRLp, Convert_NoOperands, 0, {  }, },
  { 584 /* bdzlrl- */, PPC::BDZLRLm, Convert_NoOperands, 0, {  }, },
  { 592 /* bdzt */, PPC::gBC, Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 597 /* bdzta */, PPC::gBCA, Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 603 /* bdztl */, PPC::gBCL, Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 609 /* bdztla */, PPC::gBCLA, Convert__imm_95_10__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 616 /* bdztlr */, PPC::gBCLR, Convert__imm_95_10__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 623 /* bdztlrl */, PPC::gBCLRL, Convert__imm_95_10__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 631 /* beq */, PPC::BCC, Convert__imm_95_76__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 631 /* beq */, PPC::BCC, Convert__imm_95_76__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 635 /* beq+ */, PPC::BCC, Convert__imm_95_79__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 635 /* beq+ */, PPC::BCC, Convert__imm_95_79__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 640 /* beq- */, PPC::BCC, Convert__imm_95_78__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 640 /* beq- */, PPC::BCC, Convert__imm_95_78__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 645 /* beqa */, PPC::BCCA, Convert__imm_95_76__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 645 /* beqa */, PPC::BCCA, Convert__imm_95_76__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 650 /* beqa+ */, PPC::BCCA, Convert__imm_95_79__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 650 /* beqa+ */, PPC::BCCA, Convert__imm_95_79__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 656 /* beqa- */, PPC::BCCA, Convert__imm_95_78__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 656 /* beqa- */, PPC::BCCA, Convert__imm_95_78__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 662 /* beqctr */, PPC::BCCCTR, Convert__imm_95_76__regCR0, 0, {  }, },
  { 662 /* beqctr */, PPC::BCCCTR, Convert__imm_95_76__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 669 /* beqctr+ */, PPC::BCCCTR, Convert__imm_95_79__regCR0, 0, {  }, },
  { 669 /* beqctr+ */, PPC::BCCCTR, Convert__imm_95_79__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 677 /* beqctr- */, PPC::BCCCTR, Convert__imm_95_78__regCR0, 0, {  }, },
  { 677 /* beqctr- */, PPC::BCCCTR, Convert__imm_95_78__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 685 /* beqctrl */, PPC::BCCCTRL, Convert__imm_95_76__regCR0, 0, {  }, },
  { 685 /* beqctrl */, PPC::BCCCTRL, Convert__imm_95_76__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 693 /* beqctrl+ */, PPC::BCCCTRL, Convert__imm_95_79__regCR0, 0, {  }, },
  { 693 /* beqctrl+ */, PPC::BCCCTRL, Convert__imm_95_79__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 702 /* beqctrl- */, PPC::BCCCTRL, Convert__imm_95_78__regCR0, 0, {  }, },
  { 702 /* beqctrl- */, PPC::BCCCTRL, Convert__imm_95_78__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 711 /* beql */, PPC::BCCL, Convert__imm_95_76__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 711 /* beql */, PPC::BCCL, Convert__imm_95_76__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 716 /* beql+ */, PPC::BCCL, Convert__imm_95_79__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 716 /* beql+ */, PPC::BCCL, Convert__imm_95_79__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 722 /* beql- */, PPC::BCCL, Convert__imm_95_78__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 722 /* beql- */, PPC::BCCL, Convert__imm_95_78__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 728 /* beqla */, PPC::BCCLA, Convert__imm_95_76__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 728 /* beqla */, PPC::BCCLA, Convert__imm_95_76__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 734 /* beqla+ */, PPC::BCCLA, Convert__imm_95_79__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 734 /* beqla+ */, PPC::BCCLA, Convert__imm_95_79__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 741 /* beqla- */, PPC::BCCLA, Convert__imm_95_78__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 741 /* beqla- */, PPC::BCCLA, Convert__imm_95_78__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 748 /* beqlr */, PPC::BCCLR, Convert__imm_95_76__regCR0, 0, {  }, },
  { 748 /* beqlr */, PPC::BCCLR, Convert__imm_95_76__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 754 /* beqlr+ */, PPC::BCCLR, Convert__imm_95_79__regCR0, 0, {  }, },
  { 754 /* beqlr+ */, PPC::BCCLR, Convert__imm_95_79__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 761 /* beqlr- */, PPC::BCCLR, Convert__imm_95_78__regCR0, 0, {  }, },
  { 761 /* beqlr- */, PPC::BCCLR, Convert__imm_95_78__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 768 /* beqlrl */, PPC::BCCLRL, Convert__imm_95_76__regCR0, 0, {  }, },
  { 768 /* beqlrl */, PPC::BCCLRL, Convert__imm_95_76__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 775 /* beqlrl+ */, PPC::BCCLRL, Convert__imm_95_79__regCR0, 0, {  }, },
  { 775 /* beqlrl+ */, PPC::BCCLRL, Convert__imm_95_79__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 783 /* beqlrl- */, PPC::BCCLRL, Convert__imm_95_78__regCR0, 0, {  }, },
  { 783 /* beqlrl- */, PPC::BCCLRL, Convert__imm_95_78__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 791 /* bf */, PPC::gBC, Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 794 /* bf+ */, PPC::gBC, Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 798 /* bf- */, PPC::gBC, Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 802 /* bfa */, PPC::gBCA, Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 806 /* bfa+ */, PPC::gBCA, Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 811 /* bfa- */, PPC::gBCA, Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 816 /* bfctr */, PPC::gBCCTR, Convert__imm_95_4__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 822 /* bfctr+ */, PPC::gBCCTR, Convert__imm_95_7__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 829 /* bfctr- */, PPC::gBCCTR, Convert__imm_95_6__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 836 /* bfctrl */, PPC::gBCCTRL, Convert__imm_95_4__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 843 /* bfctrl+ */, PPC::gBCCTRL, Convert__imm_95_7__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 851 /* bfctrl- */, PPC::gBCCTRL, Convert__imm_95_6__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 859 /* bfl */, PPC::gBCL, Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 863 /* bfl+ */, PPC::gBCL, Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 868 /* bfl- */, PPC::gBCL, Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 873 /* bfla */, PPC::gBCLA, Convert__imm_95_4__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 878 /* bfla+ */, PPC::gBCLA, Convert__imm_95_7__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 884 /* bfla- */, PPC::gBCLA, Convert__imm_95_6__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 890 /* bflr */, PPC::gBCLR, Convert__imm_95_4__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 895 /* bflr+ */, PPC::gBCLR, Convert__imm_95_7__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 901 /* bflr- */, PPC::gBCLR, Convert__imm_95_6__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 907 /* bflrl */, PPC::gBCLRL, Convert__imm_95_4__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 913 /* bflrl+ */, PPC::gBCLRL, Convert__imm_95_7__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 920 /* bflrl- */, PPC::gBCLRL, Convert__imm_95_6__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 927 /* bge */, PPC::BCC, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 927 /* bge */, PPC::BCC, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 931 /* bge+ */, PPC::BCC, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 931 /* bge+ */, PPC::BCC, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 936 /* bge- */, PPC::BCC, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 936 /* bge- */, PPC::BCC, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 941 /* bgea */, PPC::BCCA, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 941 /* bgea */, PPC::BCCA, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 946 /* bgea+ */, PPC::BCCA, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 946 /* bgea+ */, PPC::BCCA, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 952 /* bgea- */, PPC::BCCA, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 952 /* bgea- */, PPC::BCCA, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 958 /* bgectr */, PPC::BCCCTR, Convert__imm_95_4__regCR0, 0, {  }, },
  { 958 /* bgectr */, PPC::BCCCTR, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 965 /* bgectr+ */, PPC::BCCCTR, Convert__imm_95_7__regCR0, 0, {  }, },
  { 965 /* bgectr+ */, PPC::BCCCTR, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 973 /* bgectr- */, PPC::BCCCTR, Convert__imm_95_6__regCR0, 0, {  }, },
  { 973 /* bgectr- */, PPC::BCCCTR, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 981 /* bgectrl */, PPC::BCCCTRL, Convert__imm_95_4__regCR0, 0, {  }, },
  { 981 /* bgectrl */, PPC::BCCCTRL, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 989 /* bgectrl+ */, PPC::BCCCTRL, Convert__imm_95_7__regCR0, 0, {  }, },
  { 989 /* bgectrl+ */, PPC::BCCCTRL, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 998 /* bgectrl- */, PPC::BCCCTRL, Convert__imm_95_6__regCR0, 0, {  }, },
  { 998 /* bgectrl- */, PPC::BCCCTRL, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1007 /* bgel */, PPC::BCCL, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1007 /* bgel */, PPC::BCCL, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1012 /* bgel+ */, PPC::BCCL, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1012 /* bgel+ */, PPC::BCCL, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1018 /* bgel- */, PPC::BCCL, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1018 /* bgel- */, PPC::BCCL, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1024 /* bgela */, PPC::BCCLA, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1024 /* bgela */, PPC::BCCLA, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1030 /* bgela+ */, PPC::BCCLA, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1030 /* bgela+ */, PPC::BCCLA, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1037 /* bgela- */, PPC::BCCLA, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1037 /* bgela- */, PPC::BCCLA, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1044 /* bgelr */, PPC::BCCLR, Convert__imm_95_4__regCR0, 0, {  }, },
  { 1044 /* bgelr */, PPC::BCCLR, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1050 /* bgelr+ */, PPC::BCCLR, Convert__imm_95_7__regCR0, 0, {  }, },
  { 1050 /* bgelr+ */, PPC::BCCLR, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1057 /* bgelr- */, PPC::BCCLR, Convert__imm_95_6__regCR0, 0, {  }, },
  { 1057 /* bgelr- */, PPC::BCCLR, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1064 /* bgelrl */, PPC::BCCLRL, Convert__imm_95_4__regCR0, 0, {  }, },
  { 1064 /* bgelrl */, PPC::BCCLRL, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1071 /* bgelrl+ */, PPC::BCCLRL, Convert__imm_95_7__regCR0, 0, {  }, },
  { 1071 /* bgelrl+ */, PPC::BCCLRL, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1079 /* bgelrl- */, PPC::BCCLRL, Convert__imm_95_6__regCR0, 0, {  }, },
  { 1079 /* bgelrl- */, PPC::BCCLRL, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1087 /* bgt */, PPC::BCC, Convert__imm_95_44__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1087 /* bgt */, PPC::BCC, Convert__imm_95_44__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1091 /* bgt+ */, PPC::BCC, Convert__imm_95_47__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1091 /* bgt+ */, PPC::BCC, Convert__imm_95_47__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1096 /* bgt- */, PPC::BCC, Convert__imm_95_46__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1096 /* bgt- */, PPC::BCC, Convert__imm_95_46__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1101 /* bgta */, PPC::BCCA, Convert__imm_95_44__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1101 /* bgta */, PPC::BCCA, Convert__imm_95_44__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1106 /* bgta+ */, PPC::BCCA, Convert__imm_95_47__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1106 /* bgta+ */, PPC::BCCA, Convert__imm_95_47__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1112 /* bgta- */, PPC::BCCA, Convert__imm_95_46__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1112 /* bgta- */, PPC::BCCA, Convert__imm_95_46__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1118 /* bgtctr */, PPC::BCCCTR, Convert__imm_95_44__regCR0, 0, {  }, },
  { 1118 /* bgtctr */, PPC::BCCCTR, Convert__imm_95_44__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1125 /* bgtctr+ */, PPC::BCCCTR, Convert__imm_95_47__regCR0, 0, {  }, },
  { 1125 /* bgtctr+ */, PPC::BCCCTR, Convert__imm_95_47__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1133 /* bgtctr- */, PPC::BCCCTR, Convert__imm_95_46__regCR0, 0, {  }, },
  { 1133 /* bgtctr- */, PPC::BCCCTR, Convert__imm_95_46__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1141 /* bgtctrl */, PPC::BCCCTRL, Convert__imm_95_44__regCR0, 0, {  }, },
  { 1141 /* bgtctrl */, PPC::BCCCTRL, Convert__imm_95_44__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1149 /* bgtctrl+ */, PPC::BCCCTRL, Convert__imm_95_47__regCR0, 0, {  }, },
  { 1149 /* bgtctrl+ */, PPC::BCCCTRL, Convert__imm_95_47__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1158 /* bgtctrl- */, PPC::BCCCTRL, Convert__imm_95_46__regCR0, 0, {  }, },
  { 1158 /* bgtctrl- */, PPC::BCCCTRL, Convert__imm_95_46__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1167 /* bgtl */, PPC::BCCL, Convert__imm_95_44__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1167 /* bgtl */, PPC::BCCL, Convert__imm_95_44__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1172 /* bgtl+ */, PPC::BCCL, Convert__imm_95_47__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1172 /* bgtl+ */, PPC::BCCL, Convert__imm_95_47__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1178 /* bgtl- */, PPC::BCCL, Convert__imm_95_46__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1178 /* bgtl- */, PPC::BCCL, Convert__imm_95_46__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1184 /* bgtla */, PPC::BCCLA, Convert__imm_95_44__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1184 /* bgtla */, PPC::BCCLA, Convert__imm_95_44__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1190 /* bgtla+ */, PPC::BCCLA, Convert__imm_95_47__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1190 /* bgtla+ */, PPC::BCCLA, Convert__imm_95_47__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1197 /* bgtla- */, PPC::BCCLA, Convert__imm_95_46__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1197 /* bgtla- */, PPC::BCCLA, Convert__imm_95_46__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1204 /* bgtlr */, PPC::BCCLR, Convert__imm_95_44__regCR0, 0, {  }, },
  { 1204 /* bgtlr */, PPC::BCCLR, Convert__imm_95_44__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1210 /* bgtlr+ */, PPC::BCCLR, Convert__imm_95_47__regCR0, 0, {  }, },
  { 1210 /* bgtlr+ */, PPC::BCCLR, Convert__imm_95_47__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1217 /* bgtlr- */, PPC::BCCLR, Convert__imm_95_46__regCR0, 0, {  }, },
  { 1217 /* bgtlr- */, PPC::BCCLR, Convert__imm_95_46__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1224 /* bgtlrl */, PPC::BCCLRL, Convert__imm_95_44__regCR0, 0, {  }, },
  { 1224 /* bgtlrl */, PPC::BCCLRL, Convert__imm_95_44__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1231 /* bgtlrl+ */, PPC::BCCLRL, Convert__imm_95_47__regCR0, 0, {  }, },
  { 1231 /* bgtlrl+ */, PPC::BCCLRL, Convert__imm_95_47__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1239 /* bgtlrl- */, PPC::BCCLRL, Convert__imm_95_46__regCR0, 0, {  }, },
  { 1239 /* bgtlrl- */, PPC::BCCLRL, Convert__imm_95_46__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1247 /* bl */, PPC::BL, Convert__DirectBr1_0, 0, { MCK_DirectBr }, },
  { 1247 /* bl */, PPC::BL8_TLS_, Convert__DirectBr1_0__Imm1_1, 0, { MCK_DirectBr, MCK_Imm }, },
  { 1250 /* bla */, PPC::BLA, Convert__DirectBr1_0, 0, { MCK_DirectBr }, },
  { 1254 /* ble */, PPC::BCC, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1254 /* ble */, PPC::BCC, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1258 /* ble+ */, PPC::BCC, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1258 /* ble+ */, PPC::BCC, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1263 /* ble- */, PPC::BCC, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1263 /* ble- */, PPC::BCC, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1268 /* blea */, PPC::BCCA, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1268 /* blea */, PPC::BCCA, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1273 /* blea+ */, PPC::BCCA, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1273 /* blea+ */, PPC::BCCA, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1279 /* blea- */, PPC::BCCA, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1279 /* blea- */, PPC::BCCA, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1285 /* blectr */, PPC::BCCCTR, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1285 /* blectr */, PPC::BCCCTR, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1292 /* blectr+ */, PPC::BCCCTR, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1292 /* blectr+ */, PPC::BCCCTR, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1300 /* blectr- */, PPC::BCCCTR, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1300 /* blectr- */, PPC::BCCCTR, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1308 /* blectrl */, PPC::BCCCTRL, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1308 /* blectrl */, PPC::BCCCTRL, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1316 /* blectrl+ */, PPC::BCCCTRL, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1316 /* blectrl+ */, PPC::BCCCTRL, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1325 /* blectrl- */, PPC::BCCCTRL, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1325 /* blectrl- */, PPC::BCCCTRL, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1334 /* blel */, PPC::BCCL, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1334 /* blel */, PPC::BCCL, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1339 /* blel+ */, PPC::BCCL, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1339 /* blel+ */, PPC::BCCL, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1345 /* blel- */, PPC::BCCL, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1345 /* blel- */, PPC::BCCL, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1351 /* blela */, PPC::BCCLA, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1351 /* blela */, PPC::BCCLA, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1357 /* blela+ */, PPC::BCCLA, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1357 /* blela+ */, PPC::BCCLA, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1364 /* blela- */, PPC::BCCLA, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1364 /* blela- */, PPC::BCCLA, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1371 /* blelr */, PPC::BCCLR, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1371 /* blelr */, PPC::BCCLR, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1377 /* blelr+ */, PPC::BCCLR, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1377 /* blelr+ */, PPC::BCCLR, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1384 /* blelr- */, PPC::BCCLR, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1384 /* blelr- */, PPC::BCCLR, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1391 /* blelrl */, PPC::BCCLRL, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1391 /* blelrl */, PPC::BCCLRL, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1398 /* blelrl+ */, PPC::BCCLRL, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1398 /* blelrl+ */, PPC::BCCLRL, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1406 /* blelrl- */, PPC::BCCLRL, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1406 /* blelrl- */, PPC::BCCLRL, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1414 /* blr */, PPC::BLR, Convert_NoOperands, 0, {  }, },
  { 1418 /* blrl */, PPC::BLRL, Convert_NoOperands, 0, {  }, },
  { 1423 /* blt */, PPC::BCC, Convert__imm_95_12__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1423 /* blt */, PPC::BCC, Convert__imm_95_12__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1427 /* blt+ */, PPC::BCC, Convert__imm_95_15__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1427 /* blt+ */, PPC::BCC, Convert__imm_95_15__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1432 /* blt- */, PPC::BCC, Convert__imm_95_14__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1432 /* blt- */, PPC::BCC, Convert__imm_95_14__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1437 /* blta */, PPC::BCCA, Convert__imm_95_12__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1437 /* blta */, PPC::BCCA, Convert__imm_95_12__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1442 /* blta+ */, PPC::BCCA, Convert__imm_95_15__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1442 /* blta+ */, PPC::BCCA, Convert__imm_95_15__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1448 /* blta- */, PPC::BCCA, Convert__imm_95_14__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1448 /* blta- */, PPC::BCCA, Convert__imm_95_14__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1454 /* bltctr */, PPC::BCCCTR, Convert__imm_95_12__regCR0, 0, {  }, },
  { 1454 /* bltctr */, PPC::BCCCTR, Convert__imm_95_12__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1461 /* bltctr+ */, PPC::BCCCTR, Convert__imm_95_15__regCR0, 0, {  }, },
  { 1461 /* bltctr+ */, PPC::BCCCTR, Convert__imm_95_15__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1469 /* bltctr- */, PPC::BCCCTR, Convert__imm_95_14__regCR0, 0, {  }, },
  { 1469 /* bltctr- */, PPC::BCCCTR, Convert__imm_95_14__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1477 /* bltctrl */, PPC::BCCCTRL, Convert__imm_95_12__regCR0, 0, {  }, },
  { 1477 /* bltctrl */, PPC::BCCCTRL, Convert__imm_95_12__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1485 /* bltctrl+ */, PPC::BCCCTRL, Convert__imm_95_15__regCR0, 0, {  }, },
  { 1485 /* bltctrl+ */, PPC::BCCCTRL, Convert__imm_95_15__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1494 /* bltctrl- */, PPC::BCCCTRL, Convert__imm_95_14__regCR0, 0, {  }, },
  { 1494 /* bltctrl- */, PPC::BCCCTRL, Convert__imm_95_14__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1503 /* bltl */, PPC::BCCL, Convert__imm_95_12__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1503 /* bltl */, PPC::BCCL, Convert__imm_95_12__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1508 /* bltl+ */, PPC::BCCL, Convert__imm_95_15__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1508 /* bltl+ */, PPC::BCCL, Convert__imm_95_15__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1514 /* bltl- */, PPC::BCCL, Convert__imm_95_14__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1514 /* bltl- */, PPC::BCCL, Convert__imm_95_14__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1520 /* bltla */, PPC::BCCLA, Convert__imm_95_12__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1520 /* bltla */, PPC::BCCLA, Convert__imm_95_12__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1526 /* bltla+ */, PPC::BCCLA, Convert__imm_95_15__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1526 /* bltla+ */, PPC::BCCLA, Convert__imm_95_15__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1533 /* bltla- */, PPC::BCCLA, Convert__imm_95_14__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1533 /* bltla- */, PPC::BCCLA, Convert__imm_95_14__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1540 /* bltlr */, PPC::BCCLR, Convert__imm_95_12__regCR0, 0, {  }, },
  { 1540 /* bltlr */, PPC::BCCLR, Convert__imm_95_12__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1546 /* bltlr+ */, PPC::BCCLR, Convert__imm_95_15__regCR0, 0, {  }, },
  { 1546 /* bltlr+ */, PPC::BCCLR, Convert__imm_95_15__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1553 /* bltlr- */, PPC::BCCLR, Convert__imm_95_14__regCR0, 0, {  }, },
  { 1553 /* bltlr- */, PPC::BCCLR, Convert__imm_95_14__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1560 /* bltlrl */, PPC::BCCLRL, Convert__imm_95_12__regCR0, 0, {  }, },
  { 1560 /* bltlrl */, PPC::BCCLRL, Convert__imm_95_12__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1567 /* bltlrl+ */, PPC::BCCLRL, Convert__imm_95_15__regCR0, 0, {  }, },
  { 1567 /* bltlrl+ */, PPC::BCCLRL, Convert__imm_95_15__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1575 /* bltlrl- */, PPC::BCCLRL, Convert__imm_95_14__regCR0, 0, {  }, },
  { 1575 /* bltlrl- */, PPC::BCCLRL, Convert__imm_95_14__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1583 /* bne */, PPC::BCC, Convert__imm_95_68__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1583 /* bne */, PPC::BCC, Convert__imm_95_68__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1587 /* bne+ */, PPC::BCC, Convert__imm_95_71__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1587 /* bne+ */, PPC::BCC, Convert__imm_95_71__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1592 /* bne- */, PPC::BCC, Convert__imm_95_70__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1592 /* bne- */, PPC::BCC, Convert__imm_95_70__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1597 /* bnea */, PPC::BCCA, Convert__imm_95_68__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1597 /* bnea */, PPC::BCCA, Convert__imm_95_68__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1602 /* bnea+ */, PPC::BCCA, Convert__imm_95_71__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1602 /* bnea+ */, PPC::BCCA, Convert__imm_95_71__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1608 /* bnea- */, PPC::BCCA, Convert__imm_95_70__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1608 /* bnea- */, PPC::BCCA, Convert__imm_95_70__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1614 /* bnectr */, PPC::BCCCTR, Convert__imm_95_68__regCR0, 0, {  }, },
  { 1614 /* bnectr */, PPC::BCCCTR, Convert__imm_95_68__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1621 /* bnectr+ */, PPC::BCCCTR, Convert__imm_95_71__regCR0, 0, {  }, },
  { 1621 /* bnectr+ */, PPC::BCCCTR, Convert__imm_95_71__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1629 /* bnectr- */, PPC::BCCCTR, Convert__imm_95_70__regCR0, 0, {  }, },
  { 1629 /* bnectr- */, PPC::BCCCTR, Convert__imm_95_70__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1637 /* bnectrl */, PPC::BCCCTRL, Convert__imm_95_68__regCR0, 0, {  }, },
  { 1637 /* bnectrl */, PPC::BCCCTRL, Convert__imm_95_68__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1645 /* bnectrl+ */, PPC::BCCCTRL, Convert__imm_95_71__regCR0, 0, {  }, },
  { 1645 /* bnectrl+ */, PPC::BCCCTRL, Convert__imm_95_71__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1654 /* bnectrl- */, PPC::BCCCTRL, Convert__imm_95_70__regCR0, 0, {  }, },
  { 1654 /* bnectrl- */, PPC::BCCCTRL, Convert__imm_95_70__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1663 /* bnel */, PPC::BCCL, Convert__imm_95_68__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1663 /* bnel */, PPC::BCCL, Convert__imm_95_68__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1668 /* bnel+ */, PPC::BCCL, Convert__imm_95_71__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1668 /* bnel+ */, PPC::BCCL, Convert__imm_95_71__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1674 /* bnel- */, PPC::BCCL, Convert__imm_95_70__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1674 /* bnel- */, PPC::BCCL, Convert__imm_95_70__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1680 /* bnela */, PPC::BCCLA, Convert__imm_95_68__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1680 /* bnela */, PPC::BCCLA, Convert__imm_95_68__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1686 /* bnela+ */, PPC::BCCLA, Convert__imm_95_71__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1686 /* bnela+ */, PPC::BCCLA, Convert__imm_95_71__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1693 /* bnela- */, PPC::BCCLA, Convert__imm_95_70__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1693 /* bnela- */, PPC::BCCLA, Convert__imm_95_70__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1700 /* bnelr */, PPC::BCCLR, Convert__imm_95_68__regCR0, 0, {  }, },
  { 1700 /* bnelr */, PPC::BCCLR, Convert__imm_95_68__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1706 /* bnelr+ */, PPC::BCCLR, Convert__imm_95_71__regCR0, 0, {  }, },
  { 1706 /* bnelr+ */, PPC::BCCLR, Convert__imm_95_71__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1713 /* bnelr- */, PPC::BCCLR, Convert__imm_95_70__regCR0, 0, {  }, },
  { 1713 /* bnelr- */, PPC::BCCLR, Convert__imm_95_70__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1720 /* bnelrl */, PPC::BCCLRL, Convert__imm_95_68__regCR0, 0, {  }, },
  { 1720 /* bnelrl */, PPC::BCCLRL, Convert__imm_95_68__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1727 /* bnelrl+ */, PPC::BCCLRL, Convert__imm_95_71__regCR0, 0, {  }, },
  { 1727 /* bnelrl+ */, PPC::BCCLRL, Convert__imm_95_71__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1735 /* bnelrl- */, PPC::BCCLRL, Convert__imm_95_70__regCR0, 0, {  }, },
  { 1735 /* bnelrl- */, PPC::BCCLRL, Convert__imm_95_70__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1743 /* bng */, PPC::BCC, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1743 /* bng */, PPC::BCC, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1747 /* bng+ */, PPC::BCC, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1747 /* bng+ */, PPC::BCC, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1752 /* bng- */, PPC::BCC, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1752 /* bng- */, PPC::BCC, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1757 /* bnga */, PPC::BCCA, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1757 /* bnga */, PPC::BCCA, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1762 /* bnga+ */, PPC::BCCA, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1762 /* bnga+ */, PPC::BCCA, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1768 /* bnga- */, PPC::BCCA, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1768 /* bnga- */, PPC::BCCA, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1774 /* bngctr */, PPC::BCCCTR, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1774 /* bngctr */, PPC::BCCCTR, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1781 /* bngctr+ */, PPC::BCCCTR, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1781 /* bngctr+ */, PPC::BCCCTR, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1789 /* bngctr- */, PPC::BCCCTR, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1789 /* bngctr- */, PPC::BCCCTR, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1797 /* bngctrl */, PPC::BCCCTRL, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1797 /* bngctrl */, PPC::BCCCTRL, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1805 /* bngctrl+ */, PPC::BCCCTRL, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1805 /* bngctrl+ */, PPC::BCCCTRL, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1814 /* bngctrl- */, PPC::BCCCTRL, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1814 /* bngctrl- */, PPC::BCCCTRL, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1823 /* bngl */, PPC::BCCL, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1823 /* bngl */, PPC::BCCL, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1828 /* bngl+ */, PPC::BCCL, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1828 /* bngl+ */, PPC::BCCL, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1834 /* bngl- */, PPC::BCCL, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1834 /* bngl- */, PPC::BCCL, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1840 /* bngla */, PPC::BCCLA, Convert__imm_95_36__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1840 /* bngla */, PPC::BCCLA, Convert__imm_95_36__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1846 /* bngla+ */, PPC::BCCLA, Convert__imm_95_39__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1846 /* bngla+ */, PPC::BCCLA, Convert__imm_95_39__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1853 /* bngla- */, PPC::BCCLA, Convert__imm_95_38__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1853 /* bngla- */, PPC::BCCLA, Convert__imm_95_38__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1860 /* bnglr */, PPC::BCCLR, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1860 /* bnglr */, PPC::BCCLR, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1866 /* bnglr+ */, PPC::BCCLR, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1866 /* bnglr+ */, PPC::BCCLR, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1873 /* bnglr- */, PPC::BCCLR, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1873 /* bnglr- */, PPC::BCCLR, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1880 /* bnglrl */, PPC::BCCLRL, Convert__imm_95_36__regCR0, 0, {  }, },
  { 1880 /* bnglrl */, PPC::BCCLRL, Convert__imm_95_36__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1887 /* bnglrl+ */, PPC::BCCLRL, Convert__imm_95_39__regCR0, 0, {  }, },
  { 1887 /* bnglrl+ */, PPC::BCCLRL, Convert__imm_95_39__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1895 /* bnglrl- */, PPC::BCCLRL, Convert__imm_95_38__regCR0, 0, {  }, },
  { 1895 /* bnglrl- */, PPC::BCCLRL, Convert__imm_95_38__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1903 /* bnl */, PPC::BCC, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1903 /* bnl */, PPC::BCC, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1907 /* bnl+ */, PPC::BCC, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1907 /* bnl+ */, PPC::BCC, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1912 /* bnl- */, PPC::BCC, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1912 /* bnl- */, PPC::BCC, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1917 /* bnla */, PPC::BCCA, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1917 /* bnla */, PPC::BCCA, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1922 /* bnla+ */, PPC::BCCA, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1922 /* bnla+ */, PPC::BCCA, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1928 /* bnla- */, PPC::BCCA, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1928 /* bnla- */, PPC::BCCA, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1934 /* bnlctr */, PPC::BCCCTR, Convert__imm_95_4__regCR0, 0, {  }, },
  { 1934 /* bnlctr */, PPC::BCCCTR, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1941 /* bnlctr+ */, PPC::BCCCTR, Convert__imm_95_7__regCR0, 0, {  }, },
  { 1941 /* bnlctr+ */, PPC::BCCCTR, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1949 /* bnlctr- */, PPC::BCCCTR, Convert__imm_95_6__regCR0, 0, {  }, },
  { 1949 /* bnlctr- */, PPC::BCCCTR, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1957 /* bnlctrl */, PPC::BCCCTRL, Convert__imm_95_4__regCR0, 0, {  }, },
  { 1957 /* bnlctrl */, PPC::BCCCTRL, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1965 /* bnlctrl+ */, PPC::BCCCTRL, Convert__imm_95_7__regCR0, 0, {  }, },
  { 1965 /* bnlctrl+ */, PPC::BCCCTRL, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1974 /* bnlctrl- */, PPC::BCCCTRL, Convert__imm_95_6__regCR0, 0, {  }, },
  { 1974 /* bnlctrl- */, PPC::BCCCTRL, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 1983 /* bnll */, PPC::BCCL, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1983 /* bnll */, PPC::BCCL, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1988 /* bnll+ */, PPC::BCCL, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1988 /* bnll+ */, PPC::BCCL, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 1994 /* bnll- */, PPC::BCCL, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 1994 /* bnll- */, PPC::BCCL, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2000 /* bnlla */, PPC::BCCLA, Convert__imm_95_4__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2000 /* bnlla */, PPC::BCCLA, Convert__imm_95_4__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2006 /* bnlla+ */, PPC::BCCLA, Convert__imm_95_7__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2006 /* bnlla+ */, PPC::BCCLA, Convert__imm_95_7__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2013 /* bnlla- */, PPC::BCCLA, Convert__imm_95_6__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2013 /* bnlla- */, PPC::BCCLA, Convert__imm_95_6__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2020 /* bnllr */, PPC::BCCLR, Convert__imm_95_4__regCR0, 0, {  }, },
  { 2020 /* bnllr */, PPC::BCCLR, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2026 /* bnllr+ */, PPC::BCCLR, Convert__imm_95_7__regCR0, 0, {  }, },
  { 2026 /* bnllr+ */, PPC::BCCLR, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2033 /* bnllr- */, PPC::BCCLR, Convert__imm_95_6__regCR0, 0, {  }, },
  { 2033 /* bnllr- */, PPC::BCCLR, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2040 /* bnllrl */, PPC::BCCLRL, Convert__imm_95_4__regCR0, 0, {  }, },
  { 2040 /* bnllrl */, PPC::BCCLRL, Convert__imm_95_4__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2047 /* bnllrl+ */, PPC::BCCLRL, Convert__imm_95_7__regCR0, 0, {  }, },
  { 2047 /* bnllrl+ */, PPC::BCCLRL, Convert__imm_95_7__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2055 /* bnllrl- */, PPC::BCCLRL, Convert__imm_95_6__regCR0, 0, {  }, },
  { 2055 /* bnllrl- */, PPC::BCCLRL, Convert__imm_95_6__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2063 /* bns */, PPC::BCC, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2063 /* bns */, PPC::BCC, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2067 /* bns+ */, PPC::BCC, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2067 /* bns+ */, PPC::BCC, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2072 /* bns- */, PPC::BCC, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2072 /* bns- */, PPC::BCC, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2077 /* bnsa */, PPC::BCCA, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2077 /* bnsa */, PPC::BCCA, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2082 /* bnsa+ */, PPC::BCCA, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2082 /* bnsa+ */, PPC::BCCA, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2088 /* bnsa- */, PPC::BCCA, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2088 /* bnsa- */, PPC::BCCA, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2094 /* bnsctr */, PPC::BCCCTR, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2094 /* bnsctr */, PPC::BCCCTR, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2101 /* bnsctr+ */, PPC::BCCCTR, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2101 /* bnsctr+ */, PPC::BCCCTR, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2109 /* bnsctr- */, PPC::BCCCTR, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2109 /* bnsctr- */, PPC::BCCCTR, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2117 /* bnsctrl */, PPC::BCCCTRL, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2117 /* bnsctrl */, PPC::BCCCTRL, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2125 /* bnsctrl+ */, PPC::BCCCTRL, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2125 /* bnsctrl+ */, PPC::BCCCTRL, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2134 /* bnsctrl- */, PPC::BCCCTRL, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2134 /* bnsctrl- */, PPC::BCCCTRL, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2143 /* bnsl */, PPC::BCCL, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2143 /* bnsl */, PPC::BCCL, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2148 /* bnsl+ */, PPC::BCCL, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2148 /* bnsl+ */, PPC::BCCL, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2154 /* bnsl- */, PPC::BCCL, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2154 /* bnsl- */, PPC::BCCL, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2160 /* bnsla */, PPC::BCCLA, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2160 /* bnsla */, PPC::BCCLA, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2166 /* bnsla+ */, PPC::BCCLA, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2166 /* bnsla+ */, PPC::BCCLA, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2173 /* bnsla- */, PPC::BCCLA, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2173 /* bnsla- */, PPC::BCCLA, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2180 /* bnslr */, PPC::BCCLR, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2180 /* bnslr */, PPC::BCCLR, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2186 /* bnslr+ */, PPC::BCCLR, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2186 /* bnslr+ */, PPC::BCCLR, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2193 /* bnslr- */, PPC::BCCLR, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2193 /* bnslr- */, PPC::BCCLR, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2200 /* bnslrl */, PPC::BCCLRL, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2200 /* bnslrl */, PPC::BCCLRL, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2207 /* bnslrl+ */, PPC::BCCLRL, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2207 /* bnslrl+ */, PPC::BCCLRL, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2215 /* bnslrl- */, PPC::BCCLRL, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2215 /* bnslrl- */, PPC::BCCLRL, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2223 /* bnu */, PPC::BCC, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2223 /* bnu */, PPC::BCC, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2227 /* bnu+ */, PPC::BCC, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2227 /* bnu+ */, PPC::BCC, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2232 /* bnu- */, PPC::BCC, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2232 /* bnu- */, PPC::BCC, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2237 /* bnua */, PPC::BCCA, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2237 /* bnua */, PPC::BCCA, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2242 /* bnua+ */, PPC::BCCA, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2242 /* bnua+ */, PPC::BCCA, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2248 /* bnua- */, PPC::BCCA, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2248 /* bnua- */, PPC::BCCA, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2254 /* bnuctr */, PPC::BCCCTR, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2254 /* bnuctr */, PPC::BCCCTR, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2261 /* bnuctr+ */, PPC::BCCCTR, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2261 /* bnuctr+ */, PPC::BCCCTR, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2269 /* bnuctr- */, PPC::BCCCTR, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2269 /* bnuctr- */, PPC::BCCCTR, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2277 /* bnuctrl */, PPC::BCCCTRL, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2277 /* bnuctrl */, PPC::BCCCTRL, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2285 /* bnuctrl+ */, PPC::BCCCTRL, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2285 /* bnuctrl+ */, PPC::BCCCTRL, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2294 /* bnuctrl- */, PPC::BCCCTRL, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2294 /* bnuctrl- */, PPC::BCCCTRL, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2303 /* bnul */, PPC::BCCL, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2303 /* bnul */, PPC::BCCL, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2308 /* bnul+ */, PPC::BCCL, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2308 /* bnul+ */, PPC::BCCL, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2314 /* bnul- */, PPC::BCCL, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2314 /* bnul- */, PPC::BCCL, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2320 /* bnula */, PPC::BCCLA, Convert__imm_95_100__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2320 /* bnula */, PPC::BCCLA, Convert__imm_95_100__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2326 /* bnula+ */, PPC::BCCLA, Convert__imm_95_103__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2326 /* bnula+ */, PPC::BCCLA, Convert__imm_95_103__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2333 /* bnula- */, PPC::BCCLA, Convert__imm_95_102__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2333 /* bnula- */, PPC::BCCLA, Convert__imm_95_102__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2340 /* bnulr */, PPC::BCCLR, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2340 /* bnulr */, PPC::BCCLR, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2346 /* bnulr+ */, PPC::BCCLR, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2346 /* bnulr+ */, PPC::BCCLR, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2353 /* bnulr- */, PPC::BCCLR, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2353 /* bnulr- */, PPC::BCCLR, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2360 /* bnulrl */, PPC::BCCLRL, Convert__imm_95_100__regCR0, 0, {  }, },
  { 2360 /* bnulrl */, PPC::BCCLRL, Convert__imm_95_100__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2367 /* bnulrl+ */, PPC::BCCLRL, Convert__imm_95_103__regCR0, 0, {  }, },
  { 2367 /* bnulrl+ */, PPC::BCCLRL, Convert__imm_95_103__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2375 /* bnulrl- */, PPC::BCCLRL, Convert__imm_95_102__regCR0, 0, {  }, },
  { 2375 /* bnulrl- */, PPC::BCCLRL, Convert__imm_95_102__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2383 /* bpermd */, PPC::BPERMD, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2390 /* brinc */, PPC::BRINC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2396 /* bso */, PPC::BCC, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2396 /* bso */, PPC::BCC, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2400 /* bso+ */, PPC::BCC, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2400 /* bso+ */, PPC::BCC, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2405 /* bso- */, PPC::BCC, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2405 /* bso- */, PPC::BCC, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2410 /* bsoa */, PPC::BCCA, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2410 /* bsoa */, PPC::BCCA, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2415 /* bsoa+ */, PPC::BCCA, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2415 /* bsoa+ */, PPC::BCCA, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2421 /* bsoa- */, PPC::BCCA, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2421 /* bsoa- */, PPC::BCCA, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2427 /* bsoctr */, PPC::BCCCTR, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2427 /* bsoctr */, PPC::BCCCTR, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2434 /* bsoctr+ */, PPC::BCCCTR, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2434 /* bsoctr+ */, PPC::BCCCTR, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2442 /* bsoctr- */, PPC::BCCCTR, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2442 /* bsoctr- */, PPC::BCCCTR, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2450 /* bsoctrl */, PPC::BCCCTRL, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2450 /* bsoctrl */, PPC::BCCCTRL, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2458 /* bsoctrl+ */, PPC::BCCCTRL, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2458 /* bsoctrl+ */, PPC::BCCCTRL, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2467 /* bsoctrl- */, PPC::BCCCTRL, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2467 /* bsoctrl- */, PPC::BCCCTRL, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2476 /* bsol */, PPC::BCCL, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2476 /* bsol */, PPC::BCCL, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2481 /* bsol+ */, PPC::BCCL, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2481 /* bsol+ */, PPC::BCCL, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2487 /* bsol- */, PPC::BCCL, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2487 /* bsol- */, PPC::BCCL, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2493 /* bsola */, PPC::BCCLA, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2493 /* bsola */, PPC::BCCLA, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2499 /* bsola+ */, PPC::BCCLA, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2499 /* bsola+ */, PPC::BCCLA, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2506 /* bsola- */, PPC::BCCLA, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2506 /* bsola- */, PPC::BCCLA, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2513 /* bsolr */, PPC::BCCLR, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2513 /* bsolr */, PPC::BCCLR, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2519 /* bsolr+ */, PPC::BCCLR, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2519 /* bsolr+ */, PPC::BCCLR, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2526 /* bsolr- */, PPC::BCCLR, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2526 /* bsolr- */, PPC::BCCLR, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2533 /* bsolrl */, PPC::BCCLRL, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2533 /* bsolrl */, PPC::BCCLRL, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2540 /* bsolrl+ */, PPC::BCCLRL, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2540 /* bsolrl+ */, PPC::BCCLRL, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2548 /* bsolrl- */, PPC::BCCLRL, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2548 /* bsolrl- */, PPC::BCCLRL, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2556 /* bt */, PPC::gBC, Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2559 /* bt+ */, PPC::gBC, Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2563 /* bt- */, PPC::gBC, Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2567 /* bta */, PPC::gBCA, Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2571 /* bta+ */, PPC::gBCA, Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2576 /* bta- */, PPC::gBCA, Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2581 /* btctr */, PPC::gBCCTR, Convert__imm_95_12__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2587 /* btctr+ */, PPC::gBCCTR, Convert__imm_95_15__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2594 /* btctr- */, PPC::gBCCTR, Convert__imm_95_14__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2601 /* btctrl */, PPC::gBCCTRL, Convert__imm_95_12__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2608 /* btctrl+ */, PPC::gBCCTRL, Convert__imm_95_15__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2616 /* btctrl- */, PPC::gBCCTRL, Convert__imm_95_14__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2624 /* btl */, PPC::gBCL, Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2628 /* btl+ */, PPC::gBCL, Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2633 /* btl- */, PPC::gBCL, Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2638 /* btla */, PPC::gBCLA, Convert__imm_95_12__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2643 /* btla+ */, PPC::gBCLA, Convert__imm_95_15__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2649 /* btla- */, PPC::gBCLA, Convert__imm_95_14__RegCRBITRC1_0__CondBr1_1, 0, { MCK_RegCRBITRC, MCK_CondBr }, },
  { 2655 /* btlr */, PPC::gBCLR, Convert__imm_95_12__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2660 /* btlr+ */, PPC::gBCLR, Convert__imm_95_15__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2666 /* btlr- */, PPC::gBCLR, Convert__imm_95_14__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2672 /* btlrl */, PPC::gBCLRL, Convert__imm_95_12__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2678 /* btlrl+ */, PPC::gBCLRL, Convert__imm_95_15__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2685 /* btlrl- */, PPC::gBCLRL, Convert__imm_95_14__RegCRBITRC1_0__imm_95_0, 0, { MCK_RegCRBITRC }, },
  { 2692 /* bun */, PPC::BCC, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2692 /* bun */, PPC::BCC, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2696 /* bun+ */, PPC::BCC, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2696 /* bun+ */, PPC::BCC, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2701 /* bun- */, PPC::BCC, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2701 /* bun- */, PPC::BCC, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2706 /* buna */, PPC::BCCA, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2706 /* buna */, PPC::BCCA, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2711 /* buna+ */, PPC::BCCA, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2711 /* buna+ */, PPC::BCCA, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2717 /* buna- */, PPC::BCCA, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2717 /* buna- */, PPC::BCCA, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2723 /* bunctr */, PPC::BCCCTR, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2723 /* bunctr */, PPC::BCCCTR, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2730 /* bunctr+ */, PPC::BCCCTR, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2730 /* bunctr+ */, PPC::BCCCTR, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2738 /* bunctr- */, PPC::BCCCTR, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2738 /* bunctr- */, PPC::BCCCTR, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2746 /* bunctrl */, PPC::BCCCTRL, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2746 /* bunctrl */, PPC::BCCCTRL, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2754 /* bunctrl+ */, PPC::BCCCTRL, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2754 /* bunctrl+ */, PPC::BCCCTRL, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2763 /* bunctrl- */, PPC::BCCCTRL, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2763 /* bunctrl- */, PPC::BCCCTRL, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2772 /* bunl */, PPC::BCCL, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2772 /* bunl */, PPC::BCCL, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2777 /* bunl+ */, PPC::BCCL, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2777 /* bunl+ */, PPC::BCCL, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2783 /* bunl- */, PPC::BCCL, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2783 /* bunl- */, PPC::BCCL, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2789 /* bunla */, PPC::BCCLA, Convert__imm_95_108__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2789 /* bunla */, PPC::BCCLA, Convert__imm_95_108__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2795 /* bunla+ */, PPC::BCCLA, Convert__imm_95_111__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2795 /* bunla+ */, PPC::BCCLA, Convert__imm_95_111__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2802 /* bunla- */, PPC::BCCLA, Convert__imm_95_110__regCR0__CondBr1_0, 0, { MCK_CondBr }, },
  { 2802 /* bunla- */, PPC::BCCLA, Convert__imm_95_110__RegCRRC1_0__CondBr1_1, 0, { MCK_RegCRRC, MCK_CondBr }, },
  { 2809 /* bunlr */, PPC::BCCLR, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2809 /* bunlr */, PPC::BCCLR, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2815 /* bunlr+ */, PPC::BCCLR, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2815 /* bunlr+ */, PPC::BCCLR, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2822 /* bunlr- */, PPC::BCCLR, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2822 /* bunlr- */, PPC::BCCLR, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2829 /* bunlrl */, PPC::BCCLRL, Convert__imm_95_108__regCR0, 0, {  }, },
  { 2829 /* bunlrl */, PPC::BCCLRL, Convert__imm_95_108__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2836 /* bunlrl+ */, PPC::BCCLRL, Convert__imm_95_111__regCR0, 0, {  }, },
  { 2836 /* bunlrl+ */, PPC::BCCLRL, Convert__imm_95_111__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2844 /* bunlrl- */, PPC::BCCLRL, Convert__imm_95_110__regCR0, 0, {  }, },
  { 2844 /* bunlrl- */, PPC::BCCLRL, Convert__imm_95_110__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 2852 /* clrbhrb */, PPC::CLRBHRB, Convert_NoOperands, 0, {  }, },
  { 2860 /* clrldi */, PPC::RLDICL, Convert__RegG8RC1_0__RegG8RC1_1__imm_95_0__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 2860 /* clrldi */, PPC::RLDICLo, Convert__RegG8RC1_1__RegG8RC1_2__imm_95_0__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 2867 /* clrlsldi */, PPC::CLRLSLDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 2867 /* clrlsldi */, PPC::CLRLSLDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 2876 /* clrlslwi */, PPC::CLRLSLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 2876 /* clrlslwi */, PPC::CLRLSLWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 2885 /* clrlwi */, PPC::RLWINM, Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0__U5Imm1_2__imm_95_31, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 2885 /* clrlwi */, PPC::RLWINMo, Convert__RegGPRC1_1__RegGPRC1_2__imm_95_0__U5Imm1_3__imm_95_31, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 2892 /* clrrdi */, PPC::CLRRDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 2892 /* clrrdi */, PPC::CLRRDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 2899 /* clrrwi */, PPC::CLRRWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 2899 /* clrrwi */, PPC::CLRRWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 2906 /* cmp */, PPC::CMPW, Convert__RegCRRC1_0__RegGPRC1_2__RegGPRC1_3, 0, { MCK_RegCRRC, MCK_0, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2906 /* cmp */, PPC::CMPD, Convert__RegCRRC1_0__RegG8RC1_2__RegG8RC1_3, 0, { MCK_RegCRRC, MCK_1, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2910 /* cmpb */, PPC::CMPB, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2915 /* cmpd */, PPC::CMPD, Convert__regCR0__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 2915 /* cmpd */, PPC::CMPD, Convert__RegCRRC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegCRRC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2920 /* cmpdi */, PPC::CMPDI, Convert__regCR0__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 2920 /* cmpdi */, PPC::CMPDI, Convert__RegCRRC1_0__RegG8RC1_1__S16Imm1_2, 0, { MCK_RegCRRC, MCK_RegG8RC, MCK_S16Imm }, },
  { 2926 /* cmpeqb */, PPC::CMPEQB, Convert__RegCRBITRC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegCRBITRC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2933 /* cmpi */, PPC::CMPWI, Convert__RegCRRC1_0__RegGPRC1_2__S16Imm1_3, 0, { MCK_RegCRRC, MCK_0, MCK_RegGPRC, MCK_S16Imm }, },
  { 2933 /* cmpi */, PPC::CMPDI, Convert__RegCRRC1_0__RegG8RC1_2__S16Imm1_3, 0, { MCK_RegCRRC, MCK_1, MCK_RegG8RC, MCK_S16Imm }, },
  { 2938 /* cmpl */, PPC::CMPLW, Convert__RegCRRC1_0__RegGPRC1_2__RegGPRC1_3, 0, { MCK_RegCRRC, MCK_0, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2938 /* cmpl */, PPC::CMPLD, Convert__RegCRRC1_0__RegG8RC1_2__RegG8RC1_3, 0, { MCK_RegCRRC, MCK_1, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2943 /* cmpld */, PPC::CMPLD, Convert__regCR0__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 2943 /* cmpld */, PPC::CMPLD, Convert__RegCRRC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegCRRC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2949 /* cmpldi */, PPC::CMPLDI, Convert__regCR0__RegG8RC1_0__U16Imm1_1, 0, { MCK_RegG8RC, MCK_U16Imm }, },
  { 2949 /* cmpldi */, PPC::CMPLDI, Convert__RegCRRC1_0__RegG8RC1_1__U16Imm1_2, 0, { MCK_RegCRRC, MCK_RegG8RC, MCK_U16Imm }, },
  { 2956 /* cmpli */, PPC::CMPLWI, Convert__RegCRRC1_0__RegGPRC1_2__U16Imm1_3, 0, { MCK_RegCRRC, MCK_0, MCK_RegGPRC, MCK_U16Imm }, },
  { 2956 /* cmpli */, PPC::CMPLDI, Convert__RegCRRC1_0__RegG8RC1_2__U16Imm1_3, 0, { MCK_RegCRRC, MCK_1, MCK_RegG8RC, MCK_U16Imm }, },
  { 2962 /* cmplw */, PPC::CMPLW, Convert__regCR0__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 2962 /* cmplw */, PPC::CMPLW, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2968 /* cmplwi */, PPC::CMPLWI, Convert__regCR0__RegGPRC1_0__U16Imm1_1, 0, { MCK_RegGPRC, MCK_U16Imm }, },
  { 2968 /* cmplwi */, PPC::CMPLWI, Convert__RegCRRC1_0__RegGPRC1_1__U16Imm1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 2975 /* cmprb */, PPC::CMPRB, Convert__RegCRBITRC1_0__U1Imm1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK_RegCRBITRC, MCK_U1Imm, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2981 /* cmpw */, PPC::CMPW, Convert__regCR0__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 2981 /* cmpw */, PPC::CMPW, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2986 /* cmpwi */, PPC::CMPWI, Convert__regCR0__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 2986 /* cmpwi */, PPC::CMPWI, Convert__RegCRRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 2992 /* cntlzd */, PPC::CNTLZD, Convert__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 2992 /* cntlzd */, PPC::CNTLZDo, Convert__RegG8RC1_1__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC }, },
  { 2999 /* cntlzw */, PPC::CNTLZW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 2999 /* cntlzw */, PPC::CNTLZW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 2999 /* cntlzw */, PPC::CNTLZWo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 2999 /* cntlzw */, PPC::CNTLZWo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3006 /* cnttzd */, PPC::CNTTZD, Convert__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 3006 /* cnttzd */, PPC::CNTTZDo, Convert__RegG8RC1_1__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3013 /* cnttzw */, PPC::CNTTZW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3013 /* cnttzw */, PPC::CNTTZWo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3020 /* copy */, PPC::CP_COPYx, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3020 /* copy */, PPC::CP_COPY, Convert__RegGPRC1_0__RegGPRC1_1__U1Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U1Imm }, },
  { 3025 /* copy_first */, PPC::CP_COPY_FIRST, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3036 /* cp_abort */, PPC::CP_ABORT, Convert_NoOperands, 0, {  }, },
  { 3045 /* crand */, PPC::CRAND, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3051 /* crandc */, PPC::CRANDC, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3058 /* crclr */, PPC::CRXOR, Convert__RegCRBITRC1_0__RegCRBITRC1_0__RegCRBITRC1_0, 0, { MCK_RegCRBITRC }, },
  { 3064 /* creqv */, PPC::CREQV, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3070 /* crmove */, PPC::CROR, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_1, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3077 /* crnand */, PPC::CRNAND, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3084 /* crnor */, PPC::CRNOR, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3090 /* crnot */, PPC::CRNOR, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_1, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3096 /* cror */, PPC::CROR, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3101 /* crorc */, PPC::CRORC, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3107 /* crset */, PPC::CREQV, Convert__RegCRBITRC1_0__RegCRBITRC1_0__RegCRBITRC1_0, 0, { MCK_RegCRBITRC }, },
  { 3113 /* crxor */, PPC::CRXOR, Convert__RegCRBITRC1_0__RegCRBITRC1_1__RegCRBITRC1_2, 0, { MCK_RegCRBITRC, MCK_RegCRBITRC, MCK_RegCRBITRC }, },
  { 3119 /* dcba */, PPC::DCBA, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3124 /* dcbf */, PPC::DCBF, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3129 /* dcbi */, PPC::DCBI, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3134 /* dcbst */, PPC::DCBST, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3140 /* dcbt */, PPC::DCBTx, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3140 /* dcbt */, PPC::DCBT, Convert__U5Imm1_2__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3145 /* dcbtct */, PPC::DCBTCT, Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3152 /* dcbtds */, PPC::DCBTDS, Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3159 /* dcbtst */, PPC::DCBTSTx, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3159 /* dcbtst */, PPC::DCBTST, Convert__U5Imm1_2__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3166 /* dcbtstct */, PPC::DCBTSTCT, Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3175 /* dcbtstds */, PPC::DCBTSTDS, Convert__RegGxRCNoR01_0__RegGxRC1_1__U5Imm1_2, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_U5Imm }, },
  { 3184 /* dcbtstt */, PPC::DCBTSTT, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3192 /* dcbtt */, PPC::DCBTT, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3198 /* dcbz */, PPC::DCBZ, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3203 /* dcbzl */, PPC::DCBZL, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 3209 /* dccci */, PPC::DCCCI, Convert__regR0__regR0, 0, {  }, },
  { 3209 /* dccci */, PPC::DCCCI, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3215 /* dci */, PPC::DCCCI, Convert__regR0__regR0, 0, { MCK_0 }, },
  { 3219 /* divd */, PPC::DIVD, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3219 /* divd */, PPC::DIVDo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3224 /* divde */, PPC::DIVDE, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3224 /* divde */, PPC::DIVDEo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3230 /* divdeu */, PPC::DIVDEU, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3230 /* divdeu */, PPC::DIVDEUo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3237 /* divdu */, PPC::DIVDU, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3237 /* divdu */, PPC::DIVDUo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 3243 /* divw */, PPC::DIVW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3243 /* divw */, PPC::DIVWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3248 /* divwe */, PPC::DIVWE, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3248 /* divwe */, PPC::DIVWEo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3254 /* divweu */, PPC::DIVWEU, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3254 /* divweu */, PPC::DIVWEUo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3261 /* divwu */, PPC::DIVWU, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3261 /* divwu */, PPC::DIVWUo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3267 /* dss */, PPC::DSS, Convert__U5Imm1_0, 0, { MCK_U5Imm }, },
  { 3271 /* dssall */, PPC::DSSALL, Convert_NoOperands, 0, {  }, },
  { 3278 /* dst */, PPC::DST, Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 3282 /* dstst */, PPC::DSTST, Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 3288 /* dststt */, PPC::DSTSTT, Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 3295 /* dstt */, PPC::DSTT, Convert__U5Imm1_2__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 3300 /* eieio */, PPC::EnforceIEIO, Convert_NoOperands, 0, {  }, },
  { 3306 /* eqv */, PPC::EQV, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3306 /* eqv */, PPC::EQVo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3310 /* evabs */, PPC::EVABS, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3316 /* evaddiw */, PPC::EVADDIW, Convert__RegGPRC1_0__RegGPRC1_2__U5Imm1_1, 0, { MCK_RegGPRC, MCK_U5Imm, MCK_RegGPRC }, },
  { 3324 /* evaddsmiaaw */, PPC::EVADDSMIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3336 /* evaddssiaaw */, PPC::EVADDSSIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3348 /* evaddumiaaw */, PPC::EVADDUMIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3360 /* evaddusiaaw */, PPC::EVADDUSIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3372 /* evaddw */, PPC::EVADDW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3379 /* evand */, PPC::EVAND, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3385 /* evandc */, PPC::EVANDC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3392 /* evcmpeq */, PPC::EVCMPEQ, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3400 /* evcmpgts */, PPC::EVCMPGTS, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3409 /* evcmpgtu */, PPC::EVCMPGTU, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3418 /* evcmplts */, PPC::EVCMPLTS, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3427 /* evcmpltu */, PPC::EVCMPLTU, Convert__RegCRRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegCRRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3436 /* evcntlsw */, PPC::EVCNTLSW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3445 /* evcntlzw */, PPC::EVCNTLZW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3454 /* evdivws */, PPC::EVDIVWS, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3462 /* evdivwu */, PPC::EVDIVWU, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3470 /* eveqv */, PPC::EVEQV, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3476 /* evextsb */, PPC::EVEXTSB, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3484 /* evextsh */, PPC::EVEXTSH, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 3492 /* evldd */, PPC::EVLDD, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 3498 /* evlddx */, PPC::EVLDDX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3505 /* evldh */, PPC::EVLDH, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 3511 /* evldhx */, PPC::EVLDHX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3518 /* evldw */, PPC::EVLDW, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 3524 /* evldwx */, PPC::EVLDWX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3531 /* evlhhesplat */, PPC::EVLHHESPLAT, Convert__RegGPRC1_0__DispSPE21_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE2, MCK_RegGxRCNoR0 }, },
  { 3543 /* evlhhesplatx */, PPC::EVLHHESPLATX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3556 /* evlhhossplat */, PPC::EVLHHOSSPLAT, Convert__RegGPRC1_0__DispSPE21_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE2, MCK_RegGxRCNoR0 }, },
  { 3569 /* evlhhossplatx */, PPC::EVLHHOSSPLATX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3583 /* evlhhousplat */, PPC::EVLHHOUSPLAT, Convert__RegGPRC1_0__DispSPE21_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE2, MCK_RegGxRCNoR0 }, },
  { 3596 /* evlhhousplatx */, PPC::EVLHHOUSPLATX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3610 /* evlwhe */, PPC::EVLWHE, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 3617 /* evlwhex */, PPC::EVLWHEX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3625 /* evlwhos */, PPC::EVLWHOS, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 3633 /* evlwhosx */, PPC::EVLWHOSX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3642 /* evlwhou */, PPC::EVLWHOU, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 3650 /* evlwhoux */, PPC::EVLWHOUX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3659 /* evlwhsplat */, PPC::EVLWHSPLAT, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 3670 /* evlwhsplatx */, PPC::EVLWHSPLATX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3682 /* evlwwsplat */, PPC::EVLWWSPLAT, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 3693 /* evlwwsplatx */, PPC::EVLWWSPLATX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3705 /* evmergehi */, PPC::EVMERGEHI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3715 /* evmergehilo */, PPC::EVMERGEHILO, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3727 /* evmergelo */, PPC::EVMERGELO, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3737 /* evmergelohi */, PPC::EVMERGELOHI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3749 /* evmhegsmfaa */, PPC::EVMHEGSMFAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3761 /* evmhegsmfan */, PPC::EVMHEGSMFAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3773 /* evmhegsmiaa */, PPC::EVMHEGSMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3785 /* evmhegsmian */, PPC::EVMHEGSMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3797 /* evmhegumiaa */, PPC::EVMHEGUMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3809 /* evmhegumian */, PPC::EVMHEGUMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3821 /* evmhesmf */, PPC::EVMHESMF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3830 /* evmhesmfa */, PPC::EVMHESMFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3840 /* evmhesmfaaw */, PPC::EVMHESMFAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3852 /* evmhesmfanw */, PPC::EVMHESMFANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3864 /* evmhesmi */, PPC::EVMHESMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3873 /* evmhesmia */, PPC::EVMHESMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3883 /* evmhesmiaaw */, PPC::EVMHESMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3895 /* evmhesmianw */, PPC::EVMHESMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3907 /* evmhessf */, PPC::EVMHESSF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3916 /* evmhessfa */, PPC::EVMHESSFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3926 /* evmhessfaaw */, PPC::EVMHESSFAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3938 /* evmhessfanw */, PPC::EVMHESSFANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3950 /* evmhessiaaw */, PPC::EVMHESSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3962 /* evmhessianw */, PPC::EVMHESSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3974 /* evmheumi */, PPC::EVMHEUMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3983 /* evmheumia */, PPC::EVMHEUMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 3993 /* evmheumiaaw */, PPC::EVMHEUMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4005 /* evmheumianw */, PPC::EVMHEUMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4017 /* evmheusiaaw */, PPC::EVMHEUSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4029 /* evmheusianw */, PPC::EVMHEUSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4041 /* evmhogsmfaa */, PPC::EVMHOGSMFAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4053 /* evmhogsmfan */, PPC::EVMHOGSMFAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4065 /* evmhogsmiaa */, PPC::EVMHOGSMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4077 /* evmhogsmian */, PPC::EVMHOGSMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4089 /* evmhogumiaa */, PPC::EVMHOGUMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4101 /* evmhogumian */, PPC::EVMHOGUMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4113 /* evmhosmf */, PPC::EVMHOSMF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4122 /* evmhosmfa */, PPC::EVMHOSMFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4132 /* evmhosmfaaw */, PPC::EVMHOSMFAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4144 /* evmhosmfanw */, PPC::EVMHOSMFANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4156 /* evmhosmi */, PPC::EVMHOSMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4165 /* evmhosmia */, PPC::EVMHOSMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4175 /* evmhosmiaaw */, PPC::EVMHOSMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4187 /* evmhosmianw */, PPC::EVMHOSMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4199 /* evmhossf */, PPC::EVMHOSSF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4208 /* evmhossfa */, PPC::EVMHOSSFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4218 /* evmhossfaaw */, PPC::EVMHOSSFAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4230 /* evmhossfanw */, PPC::EVMHOSSFANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4242 /* evmhossiaaw */, PPC::EVMHOSSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4254 /* evmhossianw */, PPC::EVMHOSSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4266 /* evmhoumi */, PPC::EVMHOUMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4275 /* evmhoumia */, PPC::EVMHOUMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4285 /* evmhoumiaaw */, PPC::EVMHOUMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4297 /* evmhoumianw */, PPC::EVMHOUMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4309 /* evmhousiaaw */, PPC::EVMHOUSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4321 /* evmhousianw */, PPC::EVMHOUSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4333 /* evmra */, PPC::EVMRA, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4339 /* evmwhsmf */, PPC::EVMWHSMF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4348 /* evmwhsmfa */, PPC::EVMWHSMFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4358 /* evmwhsmi */, PPC::EVMWHSMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4367 /* evmwhsmia */, PPC::EVMWHSMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4377 /* evmwhssf */, PPC::EVMWHSSF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4386 /* evmwhssfa */, PPC::EVMWHSSFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4396 /* evmwhumi */, PPC::EVMWHUMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4405 /* evmwhumia */, PPC::EVMWHUMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4415 /* evmwlsmiaaw */, PPC::EVMWLSMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4427 /* evmwlsmianw */, PPC::EVMWLSMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4439 /* evmwlssiaaw */, PPC::EVMWLSSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4451 /* evmwlssianw */, PPC::EVMWLSSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4463 /* evmwlumi */, PPC::EVMWLUMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4472 /* evmwlumia */, PPC::EVMWLUMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4482 /* evmwlumiaaw */, PPC::EVMWLUMIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4494 /* evmwlumianw */, PPC::EVMWLUMIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4506 /* evmwlusiaaw */, PPC::EVMWLUSIAAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4518 /* evmwlusianw */, PPC::EVMWLUSIANW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4530 /* evmwsmf */, PPC::EVMWSMF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4538 /* evmwsmfa */, PPC::EVMWSMFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4547 /* evmwsmfaa */, PPC::EVMWSMFAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4557 /* evmwsmfan */, PPC::EVMWSMFAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4567 /* evmwsmi */, PPC::EVMWSMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4575 /* evmwsmia */, PPC::EVMWSMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4584 /* evmwsmiaa */, PPC::EVMWSMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4594 /* evmwsmian */, PPC::EVMWSMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4604 /* evmwssf */, PPC::EVMWSSF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4612 /* evmwssfa */, PPC::EVMWSSFA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4621 /* evmwssfaa */, PPC::EVMWSSFAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4631 /* evmwssfan */, PPC::EVMWSSFAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4641 /* evmwumi */, PPC::EVMWUMI, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4649 /* evmwumia */, PPC::EVMWUMIA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4658 /* evmwumiaa */, PPC::EVMWUMIAA, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4668 /* evmwumian */, PPC::EVMWUMIAN, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4678 /* evnand */, PPC::EVNAND, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4685 /* evneg */, PPC::EVNEG, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4691 /* evnor */, PPC::EVNOR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4697 /* evor */, PPC::EVOR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4702 /* evorc */, PPC::EVORC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4708 /* evrlw */, PPC::EVRLW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4714 /* evrlwi */, PPC::EVRLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 4721 /* evrndw */, PPC::EVRNDW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4728 /* evslw */, PPC::EVSLW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4734 /* evslwi */, PPC::EVSLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 4741 /* evsplatfi */, PPC::EVSPLATFI, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 4751 /* evsplati */, PPC::EVSPLATI, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 4760 /* evsrwis */, PPC::EVSRWIS, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 4768 /* evsrwiu */, PPC::EVSRWIU, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 4776 /* evsrws */, PPC::EVSRWS, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4783 /* evsrwu */, PPC::EVSRWU, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4790 /* evstdd */, PPC::EVSTDD, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 4797 /* evstddx */, PPC::EVSTDDX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4805 /* evstdh */, PPC::EVSTDH, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 4812 /* evstdhx */, PPC::EVSTDHX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4820 /* evstdw */, PPC::EVSTDW, Convert__RegGPRC1_0__DispSPE81_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE8, MCK_RegGxRCNoR0 }, },
  { 4827 /* evstdwx */, PPC::EVSTDWX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4835 /* evstwhe */, PPC::EVSTWHE, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 4843 /* evstwhex */, PPC::EVSTWHEX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4852 /* evstwho */, PPC::EVSTWHO, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 4860 /* evstwhox */, PPC::EVSTWHOX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4869 /* evstwwe */, PPC::EVSTWWE, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 4877 /* evstwwex */, PPC::EVSTWWEX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4886 /* evstwwo */, PPC::EVSTWWO, Convert__RegGPRC1_0__DispSPE41_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispSPE4, MCK_RegGxRCNoR0 }, },
  { 4894 /* evstwwox */, PPC::EVSTWWOX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4903 /* evsubfsmiaaw */, PPC::EVSUBFSMIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4916 /* evsubfssiaaw */, PPC::EVSUBFSSIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4929 /* evsubfumiaaw */, PPC::EVSUBFUMIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4942 /* evsubfusiaaw */, PPC::EVSUBFUSIAAW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 4955 /* evsubfw */, PPC::EVSUBFW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4963 /* evsubifw */, PPC::EVSUBIFW, Convert__RegGPRC1_0__U5Imm1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_U5Imm, MCK_RegGPRC }, },
  { 4972 /* evxor */, PPC::EVXOR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 4978 /* extldi */, PPC::EXTLDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 4978 /* extldi */, PPC::EXTLDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 4985 /* extlwi */, PPC::EXTLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 4985 /* extlwi */, PPC::EXTLWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 4992 /* extrdi */, PPC::EXTRDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 4992 /* extrdi */, PPC::EXTRDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 4999 /* extrwi */, PPC::EXTRWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 4999 /* extrwi */, PPC::EXTRWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 5006 /* extsb */, PPC::EXTSB, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 5006 /* extsb */, PPC::EXTSBo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5012 /* extsh */, PPC::EXTSH, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 5012 /* extsh */, PPC::EXTSHo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5018 /* extsw */, PPC::EXTSW, Convert__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 5018 /* extsw */, PPC::EXTSWo, Convert__RegG8RC1_1__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC }, },
  { 5024 /* fabs */, PPC::FABSS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5024 /* fabs */, PPC::FABSSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5029 /* fadd */, PPC::FADD, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5029 /* fadd */, PPC::FADDo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5034 /* fadds */, PPC::FADDS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5034 /* fadds */, PPC::FADDSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5040 /* fcfid */, PPC::FCFID, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5040 /* fcfid */, PPC::FCFIDo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5046 /* fcfids */, PPC::FCFIDS, Convert__RegF4RC1_0__RegF8RC1_1, 0, { MCK_RegF4RC, MCK_RegF8RC }, },
  { 5046 /* fcfids */, PPC::FCFIDSo, Convert__RegF4RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF8RC }, },
  { 5053 /* fcfidu */, PPC::FCFIDU, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5053 /* fcfidu */, PPC::FCFIDUo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5060 /* fcfidus */, PPC::FCFIDUS, Convert__RegF4RC1_0__RegF8RC1_1, 0, { MCK_RegF4RC, MCK_RegF8RC }, },
  { 5060 /* fcfidus */, PPC::FCFIDUSo, Convert__RegF4RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF8RC }, },
  { 5068 /* fcmpu */, PPC::FCMPUS, Convert__RegCRRC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegCRRC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5074 /* fcpsgn */, PPC::FCPSGNS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5074 /* fcpsgn */, PPC::FCPSGNSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5081 /* fctid */, PPC::FCTID, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5081 /* fctid */, PPC::FCTIDo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5087 /* fctiduz */, PPC::FCTIDUZ, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5087 /* fctiduz */, PPC::FCTIDUZo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5095 /* fctidz */, PPC::FCTIDZ, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5095 /* fctidz */, PPC::FCTIDZo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5102 /* fctiw */, PPC::FCTIW, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5102 /* fctiw */, PPC::FCTIWo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5108 /* fctiwuz */, PPC::FCTIWUZ, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5108 /* fctiwuz */, PPC::FCTIWUZo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5116 /* fctiwz */, PPC::FCTIWZ, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5116 /* fctiwz */, PPC::FCTIWZo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5123 /* fdiv */, PPC::FDIV, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5123 /* fdiv */, PPC::FDIVo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5128 /* fdivs */, PPC::FDIVS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5128 /* fdivs */, PPC::FDIVSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5134 /* fmadd */, PPC::FMADD, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5134 /* fmadd */, PPC::FMADDo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5140 /* fmadds */, PPC::FMADDS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5140 /* fmadds */, PPC::FMADDSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5147 /* fmr */, PPC::FMR, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5147 /* fmr */, PPC::FMRo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5151 /* fmsub */, PPC::FMSUB, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5151 /* fmsub */, PPC::FMSUBo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5157 /* fmsubs */, PPC::FMSUBS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5157 /* fmsubs */, PPC::FMSUBSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5164 /* fmul */, PPC::FMUL, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5164 /* fmul */, PPC::FMULo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5169 /* fmuls */, PPC::FMULS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5169 /* fmuls */, PPC::FMULSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5175 /* fnabs */, PPC::FNABSS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5175 /* fnabs */, PPC::FNABSSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5181 /* fneg */, PPC::FNEGS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5181 /* fneg */, PPC::FNEGSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5186 /* fnmadd */, PPC::FNMADD, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5186 /* fnmadd */, PPC::FNMADDo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5193 /* fnmadds */, PPC::FNMADDS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5193 /* fnmadds */, PPC::FNMADDSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5201 /* fnmsub */, PPC::FNMSUB, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5201 /* fnmsub */, PPC::FNMSUBo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3__RegF8RC1_4, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5208 /* fnmsubs */, PPC::FNMSUBS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5208 /* fnmsubs */, PPC::FNMSUBSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3__RegF4RC1_4, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5216 /* fre */, PPC::FRE, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5216 /* fre */, PPC::FREo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5220 /* fres */, PPC::FRES, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5220 /* fres */, PPC::FRESo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5225 /* frim */, PPC::FRIMS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5225 /* frim */, PPC::FRIMSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5230 /* frin */, PPC::FRINS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5230 /* frin */, PPC::FRINSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5235 /* frip */, PPC::FRIPS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5235 /* frip */, PPC::FRIPSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5240 /* friz */, PPC::FRIZS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5240 /* friz */, PPC::FRIZSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5245 /* frsp */, PPC::FRSP, Convert__RegF4RC1_0__RegF8RC1_1, 0, { MCK_RegF4RC, MCK_RegF8RC }, },
  { 5245 /* frsp */, PPC::FRSPo, Convert__RegF4RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF8RC }, },
  { 5250 /* frsqrte */, PPC::FRSQRTE, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5250 /* frsqrte */, PPC::FRSQRTEo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5258 /* frsqrtes */, PPC::FRSQRTES, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5258 /* frsqrtes */, PPC::FRSQRTESo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5267 /* fsel */, PPC::FSELS, Convert__RegF4RC1_0__RegF8RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK_RegF4RC, MCK_RegF8RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5267 /* fsel */, PPC::FSELSo, Convert__RegF4RC1_1__RegF8RC1_2__RegF4RC1_3__RegF4RC1_4, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF8RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5272 /* fsqrt */, PPC::FSQRT, Convert__RegF8RC1_0__RegF8RC1_1, 0, { MCK_RegF8RC, MCK_RegF8RC }, },
  { 5272 /* fsqrt */, PPC::FSQRTo, Convert__RegF8RC1_1__RegF8RC1_2, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5278 /* fsqrts */, PPC::FSQRTS, Convert__RegF4RC1_0__RegF4RC1_1, 0, { MCK_RegF4RC, MCK_RegF4RC }, },
  { 5278 /* fsqrts */, PPC::FSQRTSo, Convert__RegF4RC1_1__RegF4RC1_2, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5285 /* fsub */, PPC::FSUB, Convert__RegF8RC1_0__RegF8RC1_1__RegF8RC1_2, 0, { MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5285 /* fsub */, PPC::FSUBo, Convert__RegF8RC1_1__RegF8RC1_2__RegF8RC1_3, 0, { MCK__DOT_, MCK_RegF8RC, MCK_RegF8RC, MCK_RegF8RC }, },
  { 5290 /* fsubs */, PPC::FSUBS, Convert__RegF4RC1_0__RegF4RC1_1__RegF4RC1_2, 0, { MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5290 /* fsubs */, PPC::FSUBSo, Convert__RegF4RC1_1__RegF4RC1_2__RegF4RC1_3, 0, { MCK__DOT_, MCK_RegF4RC, MCK_RegF4RC, MCK_RegF4RC }, },
  { 5296 /* icbi */, PPC::ICBI, Convert__RegGxRCNoR01_0__RegGxRC1_1, 0, { MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5301 /* icbt */, PPC::ICBT, Convert__U4Imm1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_U4Imm, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5306 /* iccci */, PPC::ICCCI, Convert__regR0__regR0, 0, {  }, },
  { 5306 /* iccci */, PPC::ICCCI, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 5312 /* ici */, PPC::ICCCI, Convert__regR0__regR0, 0, { MCK_0 }, },
  { 5316 /* inslwi */, PPC::INSLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 5316 /* inslwi */, PPC::INSLWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 5323 /* insrdi */, PPC::INSRDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 5323 /* insrdi */, PPC::INSRDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 5330 /* insrwi */, PPC::INSRWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 5330 /* insrwi */, PPC::INSRWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 5337 /* isel */, PPC::ISEL, Convert__RegGPRC1_0__RegGPRCNoR01_1__RegGPRC1_2__RegCRBITRC1_3, 0, { MCK_RegGPRC, MCK_RegGPRCNoR0, MCK_RegGPRC, MCK_RegCRBITRC }, },
  { 5342 /* isync */, PPC::ISYNC, Convert_NoOperands, 0, {  }, },
  { 5348 /* la */, PPC::LAx, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5351 /* lbarx */, PPC::LBARX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5351 /* lbarx */, PPC::LBARXL, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_1 }, },
  { 5357 /* lbz */, PPC::LBZ, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5361 /* lbzcix */, PPC::LBZCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5368 /* lbzu */, PPC::LBZU, Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5373 /* lbzux */, PPC::LBZUX, Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5379 /* lbzx */, PPC::LBZX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5384 /* ld */, PPC::LD, Convert__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegG8RC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 5387 /* ldarx */, PPC::LDARX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5387 /* ldarx */, PPC::LDARXL, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_1 }, },
  { 5393 /* ldat */, PPC::LDAT, Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm }, },
  { 5398 /* ldbrx */, PPC::LDBRX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5404 /* ldcix */, PPC::LDCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5410 /* ldmx */, PPC::LDMX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5415 /* ldu */, PPC::LDU, Convert__RegG8RC1_0__imm_95_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegG8RC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 5419 /* ldux */, PPC::LDUX, Convert__RegG8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5424 /* ldx */, PPC::LDX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5428 /* lfd */, PPC::LFD, Convert__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF8RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5432 /* lfdu */, PPC::LFDU, Convert__RegF8RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF8RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5437 /* lfdux */, PPC::LFDUX, Convert__RegF8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5443 /* lfdx */, PPC::LFDX, Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5448 /* lfiwax */, PPC::LFIWAX, Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5455 /* lfiwzx */, PPC::LFIWZX, Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5462 /* lfs */, PPC::LFS, Convert__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF4RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5466 /* lfsu */, PPC::LFSU, Convert__RegF4RC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF4RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5471 /* lfsux */, PPC::LFSUX, Convert__RegF4RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF4RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5477 /* lfsx */, PPC::LFSX, Convert__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF4RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5482 /* lha */, PPC::LHA, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5486 /* lharx */, PPC::LHARX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5486 /* lharx */, PPC::LHARXL, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_1 }, },
  { 5492 /* lhau */, PPC::LHAU, Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5497 /* lhaux */, PPC::LHAUX, Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5503 /* lhax */, PPC::LHAX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5508 /* lhbrx */, PPC::LHBRX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5514 /* lhz */, PPC::LHZ, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5518 /* lhzcix */, PPC::LHZCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5525 /* lhzu */, PPC::LHZU, Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5530 /* lhzux */, PPC::LHZUX, Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5536 /* lhzx */, PPC::LHZX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5541 /* li */, PPC::LI, Convert__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 5544 /* lis */, PPC::LIS, Convert__RegGPRC1_0__S17Imm1_1, 0, { MCK_RegGPRC, MCK_S17Imm }, },
  { 5548 /* lmw */, PPC::LMW, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5552 /* lswi */, PPC::LSWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 5557 /* lvebx */, PPC::LVEBX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5563 /* lvehx */, PPC::LVEHX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5569 /* lvewx */, PPC::LVEWX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5575 /* lvsl */, PPC::LVSL, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5580 /* lvsr */, PPC::LVSR, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5585 /* lvx */, PPC::LVX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5589 /* lvxl */, PPC::LVXL, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5594 /* lwa */, PPC::LWA, Convert__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegG8RC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 5598 /* lwarx */, PPC::LWARX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5598 /* lwarx */, PPC::LWARXL, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC, MCK_1 }, },
  { 5604 /* lwat */, PPC::LWAT, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 5609 /* lwaux */, PPC::LWAUX, Convert__RegG8RC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5615 /* lwax */, PPC::LWAX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5620 /* lwbrx */, PPC::LWBRX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5626 /* lwsync */, PPC::SYNC, Convert__imm_95_1, 0, {  }, },
  { 5633 /* lwz */, PPC::LWZ, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5637 /* lwzcix */, PPC::LWZCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 5644 /* lwzu */, PPC::LWZU, Convert__RegGPRC1_0__imm_95_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 5649 /* lwzux */, PPC::LWZUX, Convert__RegGPRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5655 /* lwzx */, PPC::LWZX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5660 /* lxsd */, PPC::LXSD, Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegVRRC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 5665 /* lxsdx */, PPC::LXSDX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5671 /* lxsibzx */, PPC::LXSIBZX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5679 /* lxsihzx */, PPC::LXSIHZX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5687 /* lxsiwax */, PPC::LXSIWAX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5695 /* lxsiwzx */, PPC::LXSIWZX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5703 /* lxssp */, PPC::LXSSP, Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegVRRC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 5709 /* lxsspx */, PPC::LXSSPX, Convert__RegVSSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5716 /* lxv */, PPC::LXV, Convert__RegVSRC1_0__DispRIX161_1__RegGxRCNoR01_2, 0, { MCK_RegVSRC, MCK_DispRIX16, MCK_RegGxRCNoR0 }, },
  { 5720 /* lxvb16x */, PPC::LXVB16X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5728 /* lxvd2x */, PPC::LXVD2X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5735 /* lxvdsx */, PPC::LXVDSX, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5742 /* lxvh8x */, PPC::LXVH8X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5749 /* lxvl */, PPC::LXVL, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5754 /* lxvll */, PPC::LXVLL, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5760 /* lxvw4x */, PPC::LXVW4X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5767 /* lxvwsx */, PPC::LXVWSX, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5774 /* lxvx */, PPC::LXVX, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 5779 /* mbar */, PPC::MBAR, Convert__imm_95_0, 0, {  }, },
  { 5779 /* mbar */, PPC::MBAR, Convert__U5Imm1_0, 0, { MCK_U5Imm }, },
  { 5784 /* mcrf */, PPC::MCRF, Convert__RegCRRC1_0__RegCRRC1_1, 0, { MCK_RegCRRC, MCK_RegCRRC }, },
  { 5789 /* mcrfs */, PPC::MCRFS, Convert__RegCRRC1_0__RegCRRC1_1, 0, { MCK_RegCRRC, MCK_RegCRRC }, },
  { 5795 /* mcrxrx */, PPC::MCRXRX, Convert__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 5802 /* mfamr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_29, 0, { MCK_RegGPRC }, },
  { 5808 /* mfasr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_280, 0, { MCK_RegGPRC }, },
  { 5814 /* mfbhrbe */, PPC::MFBHRBE, Convert__RegGPRC1_0__U10Imm1_1__imm_95_0, 0, { MCK_RegGPRC, MCK_U10Imm }, },
  { 5822 /* mfbr0 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_128, 0, { MCK_RegGPRC }, },
  { 5828 /* mfbr1 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_129, 0, { MCK_RegGPRC }, },
  { 5834 /* mfbr2 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_130, 0, { MCK_RegGPRC }, },
  { 5840 /* mfbr3 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_131, 0, { MCK_RegGPRC }, },
  { 5846 /* mfbr4 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_132, 0, { MCK_RegGPRC }, },
  { 5852 /* mfbr5 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_133, 0, { MCK_RegGPRC }, },
  { 5858 /* mfbr6 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_134, 0, { MCK_RegGPRC }, },
  { 5864 /* mfbr7 */, PPC::MFDCR, Convert__RegGPRC1_0__imm_95_135, 0, { MCK_RegGPRC }, },
  { 5870 /* mfcfar */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_28, 0, { MCK_RegGPRC }, },
  { 5877 /* mfcr */, PPC::MFCR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 5882 /* mfctr */, PPC::MFCTR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 5888 /* mfdar */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_19, 0, { MCK_RegGPRC }, },
  { 5894 /* mfdbatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_537, 0, { MCK_RegGPRC, MCK_0 }, },
  { 5894 /* mfdbatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_539, 0, { MCK_RegGPRC, MCK_1 }, },
  { 5894 /* mfdbatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_541, 0, { MCK_RegGPRC, MCK_2 }, },
  { 5894 /* mfdbatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_543, 0, { MCK_RegGPRC, MCK_3 }, },
  { 5902 /* mfdbatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_536, 0, { MCK_RegGPRC, MCK_0 }, },
  { 5902 /* mfdbatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_538, 0, { MCK_RegGPRC, MCK_1 }, },
  { 5902 /* mfdbatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_540, 0, { MCK_RegGPRC, MCK_2 }, },
  { 5902 /* mfdbatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_542, 0, { MCK_RegGPRC, MCK_3 }, },
  { 5910 /* mfdccr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_1018, 0, { MCK_RegGPRC }, },
  { 5917 /* mfdcr */, PPC::MFDCR, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 5923 /* mfdear */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_981, 0, { MCK_RegGPRC }, },
  { 5930 /* mfdec */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_22, 0, { MCK_RegGPRC }, },
  { 5930 /* mfdec */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_22, 0, { MCK_RegGPRC }, },
  { 5936 /* mfdscr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_17, 0, { MCK_RegGPRC }, },
  { 5943 /* mfdsisr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_18, 0, { MCK_RegGPRC }, },
  { 5951 /* mfesr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_980, 0, { MCK_RegGPRC }, },
  { 5957 /* mffs */, PPC::MFFS, Convert__RegF8RC1_0, 0, { MCK_RegF8RC }, },
  { 5957 /* mffs */, PPC::MFFSo, Convert__RegF8RC1_1, 0, { MCK__DOT_, MCK_RegF8RC }, },
  { 5962 /* mfibatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_529, 0, { MCK_RegGPRC, MCK_0 }, },
  { 5962 /* mfibatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_531, 0, { MCK_RegGPRC, MCK_1 }, },
  { 5962 /* mfibatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_533, 0, { MCK_RegGPRC, MCK_2 }, },
  { 5962 /* mfibatl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_535, 0, { MCK_RegGPRC, MCK_3 }, },
  { 5970 /* mfibatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_528, 0, { MCK_RegGPRC, MCK_0 }, },
  { 5970 /* mfibatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_530, 0, { MCK_RegGPRC, MCK_1 }, },
  { 5970 /* mfibatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_532, 0, { MCK_RegGPRC, MCK_2 }, },
  { 5970 /* mfibatu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_534, 0, { MCK_RegGPRC, MCK_3 }, },
  { 5978 /* mficcr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_1019, 0, { MCK_RegGPRC }, },
  { 5985 /* mflr */, PPC::MFLR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 5990 /* mfmsr */, PPC::MFMSR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 5996 /* mfocrf */, PPC::MFOCRF, Convert__RegGPRC1_0__CRBitMask1_1, 0, { MCK_RegGPRC, MCK_CRBitMask }, },
  { 6003 /* mfpid */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_48, 0, { MCK_RegGPRC }, },
  { 6009 /* mfpvr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_287, 0, { MCK_RegGPRC }, },
  { 6015 /* mfrtcl */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_5, 0, { MCK_RegGPRC }, },
  { 6022 /* mfrtcu */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_4, 0, { MCK_RegGPRC }, },
  { 6029 /* mfsdr1 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_25, 0, { MCK_RegGPRC }, },
  { 6029 /* mfsdr1 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_25, 0, { MCK_RegGPRC }, },
  { 6036 /* mfspefscr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_512, 0, { MCK_RegGPRC }, },
  { 6046 /* mfspr */, PPC::MFSPR, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_272, 0, { MCK_RegGPRC, MCK_0 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_273, 0, { MCK_RegGPRC, MCK_1 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_274, 0, { MCK_RegGPRC, MCK_2 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_275, 0, { MCK_RegGPRC, MCK_3 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_260, 0, { MCK_RegGPRC, MCK_4 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_261, 0, { MCK_RegGPRC, MCK_5 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_262, 0, { MCK_RegGPRC, MCK_6 }, },
  { 6052 /* mfsprg */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_263, 0, { MCK_RegGPRC, MCK_7 }, },
  { 6059 /* mfsprg0 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_272, 0, { MCK_RegGPRC }, },
  { 6067 /* mfsprg1 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_273, 0, { MCK_RegGPRC }, },
  { 6075 /* mfsprg2 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_274, 0, { MCK_RegGPRC }, },
  { 6083 /* mfsprg3 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_275, 0, { MCK_RegGPRC }, },
  { 6091 /* mfsprg4 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_260, 0, { MCK_RegGPRC }, },
  { 6099 /* mfsprg5 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_261, 0, { MCK_RegGPRC }, },
  { 6107 /* mfsprg6 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_262, 0, { MCK_RegGPRC }, },
  { 6115 /* mfsprg7 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_263, 0, { MCK_RegGPRC }, },
  { 6123 /* mfsr */, PPC::MFSR, Convert__RegGPRC1_0__U4Imm1_1, 0, { MCK_RegGPRC, MCK_U4Imm }, },
  { 6128 /* mfsrin */, PPC::MFSRIN, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6135 /* mfsrr0 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_26, 0, { MCK_RegGPRC }, },
  { 6135 /* mfsrr0 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_26, 0, { MCK_RegGPRC }, },
  { 6142 /* mfsrr1 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_27, 0, { MCK_RegGPRC }, },
  { 6142 /* mfsrr1 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_27, 0, { MCK_RegGPRC }, },
  { 6149 /* mfsrr2 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_990, 0, { MCK_RegGPRC }, },
  { 6156 /* mfsrr3 */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_991, 0, { MCK_RegGPRC }, },
  { 6163 /* mftb */, PPC::MFTB, Convert__RegGPRC1_0__imm_95_268, 0, { MCK_RegGPRC }, },
  { 6163 /* mftb */, PPC::MFTB, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 6168 /* mftbhi */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_988, 0, { MCK_RegGPRC }, },
  { 6175 /* mftbl */, PPC::MFTB, Convert__RegGPRC1_0__imm_95_268, 0, { MCK_RegGPRC }, },
  { 6181 /* mftblo */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_989, 0, { MCK_RegGPRC }, },
  { 6188 /* mftbu */, PPC::MFTB, Convert__RegGPRC1_0__imm_95_269, 0, { MCK_RegGPRC }, },
  { 6194 /* mftcr */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_986, 0, { MCK_RegGPRC }, },
  { 6200 /* mfvrsave */, PPC::MFVRSAVE, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6209 /* mfvscr */, PPC::MFVSCR, Convert__RegVRRC1_0, 0, { MCK_RegVRRC }, },
  { 6216 /* mfvsrd */, PPC::MFVSRD, Convert__RegG8RC1_0__RegVSFRC1_1, 0, { MCK_RegG8RC, MCK_RegVSFRC }, },
  { 6223 /* mfvsrld */, PPC::MFVSRLD, Convert__RegG8RC1_0__RegVSRC1_1, 0, { MCK_RegG8RC, MCK_RegVSRC }, },
  { 6231 /* mfvsrwz */, PPC::MFVSRWZ, Convert__RegGPRC1_0__RegVSFRC1_1, 0, { MCK_RegGPRC, MCK_RegVSFRC }, },
  { 6239 /* mfxer */, PPC::MFSPR, Convert__RegGPRC1_0__imm_95_1, 0, { MCK_RegGPRC }, },
  { 6245 /* mr */, PPC::OR8, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 6245 /* mr */, PPC::OR8o, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6248 /* msgsync */, PPC::MSGSYNC, Convert_NoOperands, 0, {  }, },
  { 6256 /* msync */, PPC::SYNC, Convert__imm_95_0, 0, {  }, },
  { 6262 /* mtamr */, PPC::MTSPR, Convert__imm_95_29__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6268 /* mtasr */, PPC::MTSPR, Convert__imm_95_280__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6268 /* mtasr */, PPC::MTSPR, Convert__imm_95_280__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6274 /* mtbr0 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_128, 0, { MCK_RegGPRC }, },
  { 6280 /* mtbr1 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_129, 0, { MCK_RegGPRC }, },
  { 6286 /* mtbr2 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_130, 0, { MCK_RegGPRC }, },
  { 6292 /* mtbr3 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_131, 0, { MCK_RegGPRC }, },
  { 6298 /* mtbr4 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_132, 0, { MCK_RegGPRC }, },
  { 6304 /* mtbr5 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_133, 0, { MCK_RegGPRC }, },
  { 6310 /* mtbr6 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_134, 0, { MCK_RegGPRC }, },
  { 6316 /* mtbr7 */, PPC::MTDCR, Convert__RegGPRC1_0__imm_95_135, 0, { MCK_RegGPRC }, },
  { 6322 /* mtcfar */, PPC::MTSPR, Convert__imm_95_28__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6329 /* mtcr */, PPC::MTCRF8, Convert__imm_95_255__RegG8RC1_0, 0, { MCK_RegG8RC }, },
  { 6334 /* mtcrf */, PPC::MTCRF, Convert__Imm1_0__RegGPRC1_1, 0, { MCK_Imm, MCK_RegGPRC }, },
  { 6340 /* mtctr */, PPC::MTCTR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6346 /* mtdar */, PPC::MTSPR, Convert__imm_95_19__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6352 /* mtdbatl */, PPC::MTSPR, Convert__imm_95_537__RegGPRC1_1, 0, { MCK_0, MCK_RegGPRC }, },
  { 6352 /* mtdbatl */, PPC::MTSPR, Convert__imm_95_539__RegGPRC1_1, 0, { MCK_1, MCK_RegGPRC }, },
  { 6352 /* mtdbatl */, PPC::MTSPR, Convert__imm_95_541__RegGPRC1_1, 0, { MCK_2, MCK_RegGPRC }, },
  { 6352 /* mtdbatl */, PPC::MTSPR, Convert__imm_95_543__RegGPRC1_1, 0, { MCK_3, MCK_RegGPRC }, },
  { 6360 /* mtdbatu */, PPC::MTSPR, Convert__imm_95_536__RegGPRC1_1, 0, { MCK_0, MCK_RegGPRC }, },
  { 6360 /* mtdbatu */, PPC::MTSPR, Convert__imm_95_538__RegGPRC1_1, 0, { MCK_1, MCK_RegGPRC }, },
  { 6360 /* mtdbatu */, PPC::MTSPR, Convert__imm_95_540__RegGPRC1_1, 0, { MCK_2, MCK_RegGPRC }, },
  { 6360 /* mtdbatu */, PPC::MTSPR, Convert__imm_95_542__RegGPRC1_1, 0, { MCK_3, MCK_RegGPRC }, },
  { 6368 /* mtdccr */, PPC::MTSPR, Convert__imm_95_1018__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6375 /* mtdcr */, PPC::MTDCR, Convert__RegGPRC1_1__Imm1_0, 0, { MCK_Imm, MCK_RegGPRC }, },
  { 6381 /* mtdear */, PPC::MTSPR, Convert__imm_95_981__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6388 /* mtdec */, PPC::MTSPR, Convert__imm_95_22__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6388 /* mtdec */, PPC::MTSPR, Convert__imm_95_22__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6394 /* mtdscr */, PPC::MTSPR, Convert__imm_95_17__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6401 /* mtdsisr */, PPC::MTSPR, Convert__imm_95_18__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6409 /* mtesr */, PPC::MTSPR, Convert__imm_95_980__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6415 /* mtfsb0 */, PPC::MTFSB0, Convert__U5Imm1_0, 0, { MCK_U5Imm }, },
  { 6422 /* mtfsb1 */, PPC::MTFSB1, Convert__U5Imm1_0, 0, { MCK_U5Imm }, },
  { 6429 /* mtfsf */, PPC::MTFSF, Convert__Imm1_0__RegF8RC1_1__imm_95_0__imm_95_0, 0, { MCK_Imm, MCK_RegF8RC }, },
  { 6429 /* mtfsf */, PPC::MTFSFo, Convert__Imm1_1__RegF8RC1_2__imm_95_0__imm_95_0, 0, { MCK__DOT_, MCK_Imm, MCK_RegF8RC }, },
  { 6429 /* mtfsf */, PPC::MTFSF, Convert__Imm1_0__RegF8RC1_1__Imm1_2__Imm1_3, 0, { MCK_Imm, MCK_RegF8RC, MCK_Imm, MCK_Imm }, },
  { 6429 /* mtfsf */, PPC::MTFSFo, Convert__Imm1_1__RegF8RC1_2__Imm1_3__Imm1_4, 0, { MCK__DOT_, MCK_Imm, MCK_RegF8RC, MCK_Imm, MCK_Imm }, },
  { 6435 /* mtfsfi */, PPC::MTFSFI, Convert__RegCRRC1_0__Imm1_1__imm_95_0, 0, { MCK_RegCRRC, MCK_Imm }, },
  { 6435 /* mtfsfi */, PPC::MTFSFIo, Convert__RegCRRC1_1__Imm1_2__imm_95_0, 0, { MCK__DOT_, MCK_RegCRRC, MCK_Imm }, },
  { 6435 /* mtfsfi */, PPC::MTFSFI, Convert__RegCRRC1_0__Imm1_1__Imm1_2, 0, { MCK_RegCRRC, MCK_Imm, MCK_Imm }, },
  { 6435 /* mtfsfi */, PPC::MTFSFIo, Convert__RegCRRC1_1__Imm1_2__Imm1_3, 0, { MCK__DOT_, MCK_RegCRRC, MCK_Imm, MCK_Imm }, },
  { 6442 /* mtibatl */, PPC::MTSPR, Convert__imm_95_529__RegGPRC1_1, 0, { MCK_0, MCK_RegGPRC }, },
  { 6442 /* mtibatl */, PPC::MTSPR, Convert__imm_95_531__RegGPRC1_1, 0, { MCK_1, MCK_RegGPRC }, },
  { 6442 /* mtibatl */, PPC::MTSPR, Convert__imm_95_533__RegGPRC1_1, 0, { MCK_2, MCK_RegGPRC }, },
  { 6442 /* mtibatl */, PPC::MTSPR, Convert__imm_95_535__RegGPRC1_1, 0, { MCK_3, MCK_RegGPRC }, },
  { 6450 /* mtibatu */, PPC::MTSPR, Convert__imm_95_528__RegGPRC1_1, 0, { MCK_0, MCK_RegGPRC }, },
  { 6450 /* mtibatu */, PPC::MTSPR, Convert__imm_95_530__RegGPRC1_1, 0, { MCK_1, MCK_RegGPRC }, },
  { 6450 /* mtibatu */, PPC::MTSPR, Convert__imm_95_532__RegGPRC1_1, 0, { MCK_2, MCK_RegGPRC }, },
  { 6450 /* mtibatu */, PPC::MTSPR, Convert__imm_95_534__RegGPRC1_1, 0, { MCK_3, MCK_RegGPRC }, },
  { 6458 /* mticcr */, PPC::MTSPR, Convert__imm_95_1019__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6465 /* mtlr */, PPC::MTLR, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6470 /* mtmsr */, PPC::MTMSR, Convert__RegGPRC1_0__imm_95_0, 0, { MCK_RegGPRC }, },
  { 6470 /* mtmsr */, PPC::MTMSR, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 6476 /* mtmsrd */, PPC::MTMSRD, Convert__RegGPRC1_0__imm_95_0, 0, { MCK_RegGPRC }, },
  { 6476 /* mtmsrd */, PPC::MTMSRD, Convert__RegGPRC1_0__Imm1_1, 0, { MCK_RegGPRC, MCK_Imm }, },
  { 6483 /* mtocrf */, PPC::MTOCRF, Convert__CRBitMask1_0__RegGPRC1_1, 0, { MCK_CRBitMask, MCK_RegGPRC }, },
  { 6490 /* mtpid */, PPC::MTSPR, Convert__imm_95_48__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6496 /* mtsdr1 */, PPC::MTSPR, Convert__imm_95_25__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6496 /* mtsdr1 */, PPC::MTSPR, Convert__imm_95_25__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6503 /* mtspefscr */, PPC::MTSPR, Convert__imm_95_512__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6513 /* mtspr */, PPC::MTSPR, Convert__Imm1_0__RegGPRC1_1, 0, { MCK_Imm, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_272__RegGPRC1_1, 0, { MCK_0, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_273__RegGPRC1_1, 0, { MCK_1, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_274__RegGPRC1_1, 0, { MCK_2, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_275__RegGPRC1_1, 0, { MCK_3, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_260__RegGPRC1_1, 0, { MCK_4, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_261__RegGPRC1_1, 0, { MCK_5, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_262__RegGPRC1_1, 0, { MCK_6, MCK_RegGPRC }, },
  { 6519 /* mtsprg */, PPC::MTSPR, Convert__imm_95_263__RegGPRC1_1, 0, { MCK_7, MCK_RegGPRC }, },
  { 6526 /* mtsprg0 */, PPC::MTSPR, Convert__imm_95_272__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6534 /* mtsprg1 */, PPC::MTSPR, Convert__imm_95_273__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6542 /* mtsprg2 */, PPC::MTSPR, Convert__imm_95_274__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6550 /* mtsprg3 */, PPC::MTSPR, Convert__imm_95_275__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6558 /* mtsprg4 */, PPC::MTSPR, Convert__imm_95_260__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6566 /* mtsprg5 */, PPC::MTSPR, Convert__imm_95_261__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6574 /* mtsprg6 */, PPC::MTSPR, Convert__imm_95_262__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6582 /* mtsprg7 */, PPC::MTSPR, Convert__imm_95_263__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6590 /* mtsr */, PPC::MTSR, Convert__RegGPRC1_1__U4Imm1_0, 0, { MCK_U4Imm, MCK_RegGPRC }, },
  { 6595 /* mtsrin */, PPC::MTSRIN, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6602 /* mtsrr0 */, PPC::MTSPR, Convert__imm_95_26__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6602 /* mtsrr0 */, PPC::MTSPR, Convert__imm_95_26__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6609 /* mtsrr1 */, PPC::MTSPR, Convert__imm_95_27__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6609 /* mtsrr1 */, PPC::MTSPR, Convert__imm_95_27__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6616 /* mtsrr2 */, PPC::MTSPR, Convert__imm_95_990__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6623 /* mtsrr3 */, PPC::MTSPR, Convert__imm_95_991__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6630 /* mttbhi */, PPC::MTSPR, Convert__imm_95_988__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6637 /* mttbl */, PPC::MTSPR, Convert__imm_95_284__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6643 /* mttblo */, PPC::MTSPR, Convert__imm_95_989__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6650 /* mttbu */, PPC::MTSPR, Convert__imm_95_285__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6656 /* mttcr */, PPC::MTSPR, Convert__imm_95_986__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6662 /* mtvrsave */, PPC::MTVRSAVE, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6671 /* mtvscr */, PPC::MTVSCR, Convert__RegVRRC1_0, 0, { MCK_RegVRRC }, },
  { 6678 /* mtvsrd */, PPC::MTVSRD, Convert__RegVSFRC1_0__RegG8RC1_1, 0, { MCK_RegVSFRC, MCK_RegG8RC }, },
  { 6685 /* mtvsrdd */, PPC::MTVSRDD, Convert__RegVSRC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegVSRC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6693 /* mtvsrwa */, PPC::MTVSRWA, Convert__RegVSFRC1_0__RegGPRC1_1, 0, { MCK_RegVSFRC, MCK_RegGPRC }, },
  { 6701 /* mtvsrws */, PPC::MTVSRWS, Convert__RegVSRC1_0__RegGPRC1_1, 0, { MCK_RegVSRC, MCK_RegGPRC }, },
  { 6709 /* mtvsrwz */, PPC::MTVSRWZ, Convert__RegVSFRC1_0__RegGPRC1_1, 0, { MCK_RegVSFRC, MCK_RegGPRC }, },
  { 6717 /* mtxer */, PPC::MTSPR, Convert__imm_95_1__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 6723 /* mulhd */, PPC::MULHD, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6723 /* mulhd */, PPC::MULHDo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6729 /* mulhdu */, PPC::MULHDU, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6729 /* mulhdu */, PPC::MULHDUo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6736 /* mulhw */, PPC::MULHW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6736 /* mulhw */, PPC::MULHWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6742 /* mulhwu */, PPC::MULHWU, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6742 /* mulhwu */, PPC::MULHWUo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6749 /* mulld */, PPC::MULLD, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6749 /* mulld */, PPC::MULLDo, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6755 /* mulli */, PPC::MULLI, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 6761 /* mullw */, PPC::MULLW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6761 /* mullw */, PPC::MULLWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6767 /* nand */, PPC::NAND, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6767 /* nand */, PPC::NANDo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6772 /* neg */, PPC::NEG, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6772 /* neg */, PPC::NEGo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6776 /* nop */, PPC::NOP, Convert_NoOperands, 0, {  }, },
  { 6780 /* nor */, PPC::NOR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6780 /* nor */, PPC::NORo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6784 /* not */, PPC::NOR8, Convert__RegG8RC1_0__RegG8RC1_1__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 6784 /* not */, PPC::NOR8o, Convert__RegG8RC1_1__RegG8RC1_2__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC }, },
  { 6788 /* or */, PPC::OR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6788 /* or */, PPC::ORo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6791 /* orc */, PPC::ORC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6791 /* orc */, PPC::ORCo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 6795 /* ori */, PPC::ORI, Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 6799 /* oris */, PPC::ORIS, Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 6804 /* paste */, PPC::CP_PASTEx, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6804 /* paste */, PPC::CP_PASTE, Convert__RegGPRC1_0__RegGPRC1_1__U1Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U1Imm }, },
  { 6804 /* paste */, PPC::CP_PASTEo, Convert__RegGPRC1_1__RegGPRC1_2__U1Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U1Imm }, },
  { 6810 /* paste_last */, PPC::CP_PASTE_LAST, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6821 /* popcntd */, PPC::POPCNTD, Convert__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 6829 /* popcntw */, PPC::POPCNTW, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 6837 /* ptesync */, PPC::SYNC, Convert__imm_95_2, 0, {  }, },
  { 6845 /* qvaligni */, PPC::QVALIGNI, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__U2Imm1_3, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_U2Imm }, },
  { 6854 /* qvesplati */, PPC::QVESPLATI, Convert__RegQFRC1_0__RegQFRC1_1__U2Imm1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_U2Imm }, },
  { 6864 /* qvfabs */, PPC::QVFABS, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6871 /* qvfadd */, PPC::QVFADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 6878 /* qvfadds */, PPC::QVFADDSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 6886 /* qvfand */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_1, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 6893 /* qvfandc */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_4, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 6901 /* qvfcfid */, PPC::QVFCFID, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6909 /* qvfcfids */, PPC::QVFCFIDS, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6918 /* qvfcfidu */, PPC::QVFCFIDU, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6927 /* qvfcfidus */, PPC::QVFCFIDUS, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6937 /* qvfclr */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_0, 0, { MCK_RegQBRC }, },
  { 6944 /* qvfcmpeq */, PPC::QVFCMPEQb, Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQBRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 6953 /* qvfcmpgt */, PPC::QVFCMPGTb, Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQBRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 6962 /* qvfcmplt */, PPC::QVFCMPLTb, Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQBRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 6971 /* qvfcpsgn */, PPC::QVFCPSGN, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 6980 /* qvfctfb */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_5, 0, { MCK_RegQBRC, MCK_RegQBRC }, },
  { 6988 /* qvfctid */, PPC::QVFCTID, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 6996 /* qvfctidu */, PPC::QVFCTIDU, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7005 /* qvfctiduz */, PPC::QVFCTIDUZ, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7015 /* qvfctidz */, PPC::QVFCTIDZ, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7024 /* qvfctiw */, PPC::QVFCTIW, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7032 /* qvfctiwu */, PPC::QVFCTIWU, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7041 /* qvfctiwuz */, PPC::QVFCTIWUZ, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7051 /* qvfctiwz */, PPC::QVFCTIWZ, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7060 /* qvfequ */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_9, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7067 /* qvflogical */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__U12Imm1_3, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC, MCK_U12Imm }, },
  { 7078 /* qvfmadd */, PPC::QVFMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7086 /* qvfmadds */, PPC::QVFMADDSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7095 /* qvfmr */, PPC::QVFMR, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7101 /* qvfmsub */, PPC::QVFMSUB, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7109 /* qvfmsubs */, PPC::QVFMSUBSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7118 /* qvfmul */, PPC::QVFMUL, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7125 /* qvfmuls */, PPC::QVFMULSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7133 /* qvfnabs */, PPC::QVFNABS, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7141 /* qvfnand */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_14, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7149 /* qvfneg */, PPC::QVFNEG, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7156 /* qvfnmadd */, PPC::QVFNMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7165 /* qvfnmadds */, PPC::QVFNMADDSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7175 /* qvfnmsub */, PPC::QVFNMSUB, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7184 /* qvfnmsubs */, PPC::QVFNMSUBSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_3__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7194 /* qvfnor */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_8, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7201 /* qvfnot */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_1__imm_95_10, 0, { MCK_RegQBRC, MCK_RegQBRC }, },
  { 7208 /* qvfor */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_7, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7214 /* qvforc */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_13, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7221 /* qvfperm */, PPC::QVFPERM, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2__RegQFRC1_3, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7229 /* qvfre */, PPC::QVFRE, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7235 /* qvfres */, PPC::QVFRES, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7242 /* qvfrim */, PPC::QVFRIM, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7249 /* qvfrin */, PPC::QVFRIN, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7256 /* qvfrip */, PPC::QVFRIP, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7263 /* qvfriz */, PPC::QVFRIZ, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7270 /* qvfrsp */, PPC::QVFRSPs, Convert__RegQSRC1_0__RegQFRC1_1, 0, { MCK_RegQSRC, MCK_RegQFRC }, },
  { 7277 /* qvfrsqrte */, PPC::QVFRSQRTE, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7287 /* qvfrsqrtes */, PPC::QVFRSQRTES, Convert__RegQFRC1_0__RegQFRC1_1, 0, { MCK_RegQFRC, MCK_RegQFRC }, },
  { 7298 /* qvfsel */, PPC::QVFSELb, Convert__RegQFRC1_0__RegQBRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQBRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7305 /* qvfset */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_0__RegQBRC1_0__imm_95_15, 0, { MCK_RegQBRC }, },
  { 7312 /* qvfsub */, PPC::QVFSUB, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7319 /* qvfsubs */, PPC::QVFSUBSs, Convert__RegQSRC1_0__RegQSRC1_1__RegQSRC1_2, 0, { MCK_RegQSRC, MCK_RegQSRC, MCK_RegQSRC }, },
  { 7327 /* qvftstnan */, PPC::QVFTSTNANb, Convert__RegQBRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQBRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7337 /* qvfxmadd */, PPC::QVFXMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7346 /* qvfxmadds */, PPC::QVFXMADDS, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7356 /* qvfxmul */, PPC::QVFXMUL, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7364 /* qvfxmuls */, PPC::QVFXMULS, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7373 /* qvfxor */, PPC::QVFLOGICALb, Convert__RegQBRC1_0__RegQBRC1_1__RegQBRC1_2__imm_95_6, 0, { MCK_RegQBRC, MCK_RegQBRC, MCK_RegQBRC }, },
  { 7380 /* qvfxxcpnmadd */, PPC::QVFXXCPNMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7393 /* qvfxxcpnmadds */, PPC::QVFXXCPNMADDS, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7407 /* qvfxxmadd */, PPC::QVFXXMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7417 /* qvfxxmadds */, PPC::QVFXXMADDS, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7428 /* qvfxxnpmadd */, PPC::QVFXXNPMADD, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7440 /* qvfxxnpmadds */, PPC::QVFXXNPMADDS, Convert__RegQFRC1_0__RegQFRC1_1__RegQFRC1_3__RegQFRC1_2, 0, { MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC, MCK_RegQFRC }, },
  { 7453 /* qvgpci */, PPC::QVGPCI, Convert__RegQFRC1_0__U12Imm1_1, 0, { MCK_RegQFRC, MCK_U12Imm }, },
  { 7460 /* qvlfcdux */, PPC::QVLFCDUX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7469 /* qvlfcduxa */, PPC::QVLFCDUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7479 /* qvlfcdx */, PPC::QVLFCDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7487 /* qvlfcdxa */, PPC::QVLFCDXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7496 /* qvlfcsux */, PPC::QVLFCSUX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7505 /* qvlfcsuxa */, PPC::QVLFCSUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7515 /* qvlfcsx */, PPC::QVLFCSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7523 /* qvlfcsxa */, PPC::QVLFCSXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7532 /* qvlfdux */, PPC::QVLFDUX, Convert__RegQFRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7540 /* qvlfduxa */, PPC::QVLFDUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7549 /* qvlfdx */, PPC::QVLFDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7556 /* qvlfdxa */, PPC::QVLFDXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7564 /* qvlfiwax */, PPC::QVLFIWAX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7573 /* qvlfiwaxa */, PPC::QVLFIWAXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7583 /* qvlfiwzx */, PPC::QVLFIWZX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7592 /* qvlfiwzxa */, PPC::QVLFIWZXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7602 /* qvlfsux */, PPC::QVLFSUX, Convert__RegQSRC1_0__imm_95_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7610 /* qvlfsuxa */, PPC::QVLFSUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7619 /* qvlfsx */, PPC::QVLFSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7626 /* qvlfsxa */, PPC::QVLFSXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7634 /* qvlpcldx */, PPC::QVLPCLDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7643 /* qvlpclsx */, PPC::QVLPCLSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7652 /* qvlpcrdx */, PPC::QVLPCRDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7661 /* qvlpcrsx */, PPC::QVLPCRSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7670 /* qvstfcdux */, PPC::QVSTFCDUX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7680 /* qvstfcduxa */, PPC::QVSTFCDUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7691 /* qvstfcduxi */, PPC::QVSTFCDUXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7702 /* qvstfcduxia */, PPC::QVSTFCDUXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7714 /* qvstfcdx */, PPC::QVSTFCDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7723 /* qvstfcdxa */, PPC::QVSTFCDXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7733 /* qvstfcdxi */, PPC::QVSTFCDXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7743 /* qvstfcdxia */, PPC::QVSTFCDXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7754 /* qvstfcsux */, PPC::QVSTFCSUX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7764 /* qvstfcsuxa */, PPC::QVSTFCSUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7775 /* qvstfcsuxi */, PPC::QVSTFCSUXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7786 /* qvstfcsuxia */, PPC::QVSTFCSUXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7798 /* qvstfcsx */, PPC::QVSTFCSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7807 /* qvstfcsxa */, PPC::QVSTFCSXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7817 /* qvstfcsxi */, PPC::QVSTFCSXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7827 /* qvstfcsxia */, PPC::QVSTFCSXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7838 /* qvstfdux */, PPC::QVSTFDUX, Convert__imm_95_0__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7847 /* qvstfduxa */, PPC::QVSTFDUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7857 /* qvstfduxi */, PPC::QVSTFDUXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7867 /* qvstfduxia */, PPC::QVSTFDUXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7878 /* qvstfdx */, PPC::QVSTFDX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7886 /* qvstfdxa */, PPC::QVSTFDXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7895 /* qvstfdxi */, PPC::QVSTFDXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7904 /* qvstfdxia */, PPC::QVSTFDXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7914 /* qvstfiwx */, PPC::QVSTFIWX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7923 /* qvstfiwxa */, PPC::QVSTFIWXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7933 /* qvstfsux */, PPC::QVSTFSUX, Convert__imm_95_0__RegQSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7942 /* qvstfsuxa */, PPC::QVSTFSUXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7952 /* qvstfsuxi */, PPC::QVSTFSUXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7962 /* qvstfsuxia */, PPC::QVSTFSUXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7973 /* qvstfsx */, PPC::QVSTFSX, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7981 /* qvstfsxa */, PPC::QVSTFSXA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7990 /* qvstfsxi */, PPC::QVSTFSXI, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 7999 /* qvstfsxia */, PPC::QVSTFSXIA, Convert__RegQFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegQFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8009 /* rfci */, PPC::RFCI, Convert_NoOperands, 0, {  }, },
  { 8014 /* rfdi */, PPC::RFDI, Convert_NoOperands, 0, {  }, },
  { 8019 /* rfebb */, PPC::RFEBB, Convert__U1Imm1_0, 0, { MCK_U1Imm }, },
  { 8025 /* rfi */, PPC::RFI, Convert_NoOperands, 0, {  }, },
  { 8029 /* rfid */, PPC::RFID, Convert_NoOperands, 0, {  }, },
  { 8034 /* rfmci */, PPC::RFMCI, Convert_NoOperands, 0, {  }, },
  { 8040 /* rldcl */, PPC::RLDCL, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC, MCK_U6Imm }, },
  { 8040 /* rldcl */, PPC::RLDCLo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC, MCK_U6Imm }, },
  { 8046 /* rldcr */, PPC::RLDCR, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC, MCK_U6Imm }, },
  { 8046 /* rldcr */, PPC::RLDCRo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC, MCK_U6Imm }, },
  { 8052 /* rldic */, PPC::RLDIC, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8052 /* rldic */, PPC::RLDICo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8058 /* rldicl */, PPC::RLDICL, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8058 /* rldicl */, PPC::RLDICLo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8065 /* rldicr */, PPC::RLDICR, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8065 /* rldicr */, PPC::RLDICRo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8072 /* rldimi */, PPC::RLDIMI, Convert__RegG8RC1_0__Tie0__RegG8RC1_1__U6Imm1_2__U6Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8072 /* rldimi */, PPC::RLDIMIo, Convert__RegG8RC1_1__Tie0__RegG8RC1_2__U6Imm1_3__U6Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm, MCK_U6Imm }, },
  { 8079 /* rlwimi */, PPC::RLWIMIbm, Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2__Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8079 /* rlwimi */, PPC::RLWIMIobm, Convert__RegG8RC1_1__RegG8RC1_2__U5Imm1_3__Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8079 /* rlwimi */, PPC::RLWIMI, Convert__RegGPRC1_0__Tie0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm, MCK_U5Imm }, },
  { 8079 /* rlwimi */, PPC::RLWIMIo, Convert__RegGPRC1_1__Tie0__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm, MCK_U5Imm }, },
  { 8086 /* rlwinm */, PPC::RLWINMbm, Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2__Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8086 /* rlwinm */, PPC::RLWINMobm, Convert__RegG8RC1_1__RegG8RC1_2__U5Imm1_3__Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8086 /* rlwinm */, PPC::RLWINM, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__U5Imm1_3__U5Imm1_4, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm, MCK_U5Imm }, },
  { 8086 /* rlwinm */, PPC::RLWINMo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4__U5Imm1_5, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm, MCK_U5Imm }, },
  { 8093 /* rlwnm */, PPC::RLWNMbm, Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2__Imm1_3, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8093 /* rlwnm */, PPC::RLWNMobm, Convert__RegG8RC1_1__RegG8RC1_2__U5Imm1_3__Imm1_4, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm, MCK_Imm }, },
  { 8093 /* rlwnm */, PPC::RLWNM, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__U5Imm1_4, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 8093 /* rlwnm */, PPC::RLWNMo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__U5Imm1_4__U5Imm1_5, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm, MCK_U5Imm }, },
  { 8099 /* rotld */, PPC::RLDCL, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2__imm_95_0, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8099 /* rotld */, PPC::RLDCLo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3__imm_95_0, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8105 /* rotldi */, PPC::RLDICL, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2__imm_95_0, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8105 /* rotldi */, PPC::RLDICLo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3__imm_95_0, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8112 /* rotlw */, PPC::RLWNM, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2__imm_95_0__imm_95_31, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8112 /* rotlw */, PPC::RLWNMo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3__imm_95_0__imm_95_31, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8118 /* rotlwi */, PPC::RLWINM, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2__imm_95_0__imm_95_31, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8118 /* rotlwi */, PPC::RLWINMo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3__imm_95_0__imm_95_31, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8125 /* rotrdi */, PPC::ROTRDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8125 /* rotrdi */, PPC::ROTRDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8132 /* rotrwi */, PPC::ROTRWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8132 /* rotrwi */, PPC::ROTRWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8139 /* sc */, PPC::SC, Convert__imm_95_0, 0, {  }, },
  { 8139 /* sc */, PPC::SC, Convert__Imm1_0, 0, { MCK_Imm }, },
  { 8142 /* slbia */, PPC::SLBIA, Convert_NoOperands, 0, {  }, },
  { 8148 /* slbie */, PPC::SLBIE, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 8154 /* slbieg */, PPC::SLBIEG, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8161 /* slbmfee */, PPC::SLBMFEE, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8169 /* slbmte */, PPC::SLBMTE, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8176 /* slbsync */, PPC::SLBSYNC, Convert_NoOperands, 0, {  }, },
  { 8184 /* sld */, PPC::SLD, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8184 /* sld */, PPC::SLDo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8188 /* sldi */, PPC::SLDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8188 /* sldi */, PPC::SLDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8193 /* slw */, PPC::SLW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8193 /* slw */, PPC::SLWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8197 /* slwi */, PPC::SLWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8197 /* slwi */, PPC::SLWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8202 /* srad */, PPC::SRAD, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8202 /* srad */, PPC::SRADo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8207 /* sradi */, PPC::SRADI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8207 /* sradi */, PPC::SRADIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8213 /* sraw */, PPC::SRAW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8213 /* sraw */, PPC::SRAWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8218 /* srawi */, PPC::SRAWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8218 /* srawi */, PPC::SRAWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8224 /* srd */, PPC::SRD, Convert__RegG8RC1_0__RegG8RC1_1__RegGPRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8224 /* srd */, PPC::SRDo, Convert__RegG8RC1_1__RegG8RC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegGPRC }, },
  { 8228 /* srdi */, PPC::SRDI, Convert__RegG8RC1_0__RegG8RC1_1__U6Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8228 /* srdi */, PPC::SRDIo, Convert__RegG8RC1_1__RegG8RC1_2__U6Imm1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_U6Imm }, },
  { 8233 /* srw */, PPC::SRW, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8233 /* srw */, PPC::SRWo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8237 /* srwi */, PPC::SRWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8237 /* srwi */, PPC::SRWIo, Convert__RegGPRC1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8242 /* stb */, PPC::STB, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8246 /* stbcix */, PPC::STBCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8253 /* stbcx */, PPC::STBCX, Convert__RegGPRC1_1__RegGxRCNoR01_2__RegGxRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8259 /* stbu */, PPC::STBU, Convert__imm_95_0__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8264 /* stbux */, PPC::STBUX, Convert__imm_95_0__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8270 /* stbx */, PPC::STBX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8275 /* std */, PPC::STD, Convert__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegG8RC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 8279 /* stdat */, PPC::STDAT, Convert__RegG8RC1_0__RegG8RC1_1__U5Imm1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_U5Imm }, },
  { 8285 /* stdbrx */, PPC::STDBRX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8292 /* stdcix */, PPC::STDCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8299 /* stdcx */, PPC::STDCX, Convert__RegG8RC1_1__RegGxRCNoR01_2__RegGxRC1_3, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8305 /* stdu */, PPC::STDU, Convert__imm_95_0__RegG8RC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegG8RC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 8310 /* stdux */, PPC::STDUX, Convert__imm_95_0__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8316 /* stdx */, PPC::STDX, Convert__RegG8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegG8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8321 /* stfd */, PPC::STFD, Convert__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF8RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8326 /* stfdu */, PPC::STFDU, Convert__imm_95_0__RegF8RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF8RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8332 /* stfdux */, PPC::STFDUX, Convert__imm_95_0__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8339 /* stfdx */, PPC::STFDX, Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8345 /* stfiwx */, PPC::STFIWX, Convert__RegF8RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF8RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8352 /* stfs */, PPC::STFS, Convert__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF4RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8357 /* stfsu */, PPC::STFSU, Convert__imm_95_0__RegF4RC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegF4RC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8363 /* stfsux */, PPC::STFSUX, Convert__imm_95_0__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF4RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8370 /* stfsx */, PPC::STFSX, Convert__RegF4RC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegF4RC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8376 /* sth */, PPC::STH, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8380 /* sthbrx */, PPC::STHBRX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8387 /* sthcix */, PPC::STHCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8394 /* sthcx */, PPC::STHCX, Convert__RegGPRC1_1__RegGxRCNoR01_2__RegGxRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8400 /* sthu */, PPC::STHU, Convert__imm_95_0__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8405 /* sthux */, PPC::STHUX, Convert__imm_95_0__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8411 /* sthx */, PPC::STHX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8416 /* stmw */, PPC::STMW, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8421 /* stop */, PPC::STOP, Convert_NoOperands, 0, {  }, },
  { 8426 /* stswi */, PPC::STSWI, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8432 /* stvebx */, PPC::STVEBX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8439 /* stvehx */, PPC::STVEHX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8446 /* stvewx */, PPC::STVEWX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8453 /* stvx */, PPC::STVX, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8458 /* stvxl */, PPC::STVXL, Convert__RegVRRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVRRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8464 /* stw */, PPC::STW, Convert__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8468 /* stwat */, PPC::STWAT, Convert__RegGPRC1_0__RegGPRC1_1__U5Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U5Imm }, },
  { 8474 /* stwbrx */, PPC::STWBRX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8481 /* stwcix */, PPC::STWCIX, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8488 /* stwcx */, PPC::STWCX, Convert__RegGPRC1_1__RegGxRCNoR01_2__RegGxRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8494 /* stwu */, PPC::STWU, Convert__imm_95_0__RegGPRC1_0__DispRI1_1__RegGxRCNoR01_2, 0, { MCK_RegGPRC, MCK_DispRI, MCK_RegGxRCNoR0 }, },
  { 8499 /* stwux */, PPC::STWUX, Convert__imm_95_0__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8505 /* stwx */, PPC::STWX, Convert__RegGPRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegGPRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8510 /* stxsd */, PPC::STXSD, Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegVRRC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 8516 /* stxsdx */, PPC::STXSDX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8523 /* stxsibx */, PPC::STXSIBX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8531 /* stxsihx */, PPC::STXSIHX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8539 /* stxsiwx */, PPC::STXSIWX, Convert__RegVSFRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSFRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8547 /* stxssp */, PPC::STXSSP, Convert__RegVRRC1_0__DispRIX1_1__RegGxRCNoR01_2, 0, { MCK_RegVRRC, MCK_DispRIX, MCK_RegGxRCNoR0 }, },
  { 8554 /* stxsspx */, PPC::STXSSPX, Convert__RegVSSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8562 /* stxv */, PPC::STXV, Convert__RegVSRC1_0__DispRIX161_1__RegGxRCNoR01_2, 0, { MCK_RegVSRC, MCK_DispRIX16, MCK_RegGxRCNoR0 }, },
  { 8567 /* stxvb16x */, PPC::STXVB16X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8576 /* stxvd2x */, PPC::STXVD2X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8584 /* stxvh8x */, PPC::STXVH8X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8592 /* stxvl */, PPC::STXVL, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8598 /* stxvll */, PPC::STXVLL, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8605 /* stxvw4x */, PPC::STXVW4X, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8613 /* stxvx */, PPC::STXVX, Convert__RegVSRC1_0__RegGxRCNoR01_1__RegGxRC1_2, 0, { MCK_RegVSRC, MCK_RegGxRCNoR0, MCK_RegGxRC }, },
  { 8619 /* sub */, PPC::SUBF8, Convert__RegG8RC1_0__RegG8RC1_2__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 8619 /* sub */, PPC::SUBF8o, Convert__RegG8RC1_1__RegG8RC1_3__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 8623 /* subc */, PPC::SUBFC8, Convert__RegG8RC1_0__RegG8RC1_2__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 8623 /* subc */, PPC::SUBFC8o, Convert__RegG8RC1_1__RegG8RC1_3__RegG8RC1_2, 0, { MCK__DOT_, MCK_RegG8RC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 8628 /* subf */, PPC::SUBF, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8628 /* subf */, PPC::SUBFo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8633 /* subfc */, PPC::SUBFC, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8633 /* subfc */, PPC::SUBFCo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8639 /* subfe */, PPC::SUBFE, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8639 /* subfe */, PPC::SUBFEo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8645 /* subfic */, PPC::SUBFIC, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 8652 /* subfme */, PPC::SUBFME, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8652 /* subfme */, PPC::SUBFMEo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8659 /* subfze */, PPC::SUBFZE, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8659 /* subfze */, PPC::SUBFZEo, Convert__RegGPRC1_1__RegGPRC1_2, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8666 /* subi */, PPC::SUBI, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 8671 /* subic */, PPC::SUBIC, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 8671 /* subic */, PPC::SUBICo, Convert__RegGPRC1_1__RegGPRC1_2__S16Imm1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 8677 /* subis */, PPC::SUBIS, Convert__RegGPRC1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_S16Imm }, },
  { 8683 /* sync */, PPC::SYNC, Convert__imm_95_0, 0, {  }, },
  { 8683 /* sync */, PPC::SYNC, Convert__Imm1_0, 0, { MCK_Imm }, },
  { 8688 /* tabort */, PPC::TABORT, Convert__imm_95_0__RegGPRC1_1, 0, { MCK__DOT_, MCK_RegGPRC }, },
  { 8695 /* tabortdc */, PPC::TABORTDC, Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_U5Imm, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8704 /* tabortdci */, PPC::TABORTDCI, Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_U5Imm, MCK_RegGPRC, MCK_U5Imm }, },
  { 8714 /* tabortwc */, PPC::TABORTWC, Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_U5Imm, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8723 /* tabortwci */, PPC::TABORTWCI, Convert__imm_95_0__U5Imm1_1__RegGPRC1_2__U5Imm1_3, 0, { MCK__DOT_, MCK_U5Imm, MCK_RegGPRC, MCK_U5Imm }, },
  { 8733 /* tbegin */, PPC::TBEGIN, Convert__imm_95_0__U1Imm1_1, 0, { MCK__DOT_, MCK_U1Imm }, },
  { 8740 /* tcheck */, PPC::TCHECK, Convert__RegCRRC1_0, 0, { MCK_RegCRRC }, },
  { 8747 /* td */, PPC::TD, Convert__U5Imm1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_U5Imm, MCK_RegG8RC, MCK_RegG8RC }, },
  { 8750 /* tdeq */, PPC::TD, Convert__imm_95_4__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8755 /* tdeqi */, PPC::TDI, Convert__imm_95_4__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8761 /* tdge */, PPC::TD, Convert__imm_95_12__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8766 /* tdgei */, PPC::TDI, Convert__imm_95_12__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8772 /* tdgt */, PPC::TD, Convert__imm_95_8__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8777 /* tdgti */, PPC::TDI, Convert__imm_95_8__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8783 /* tdi */, PPC::TDI, Convert__U5Imm1_0__RegG8RC1_1__S16Imm1_2, 0, { MCK_U5Imm, MCK_RegG8RC, MCK_S16Imm }, },
  { 8787 /* tdle */, PPC::TD, Convert__imm_95_20__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8792 /* tdlei */, PPC::TDI, Convert__imm_95_20__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8798 /* tdlge */, PPC::TD, Convert__imm_95_5__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8804 /* tdlgei */, PPC::TDI, Convert__imm_95_5__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8811 /* tdlgt */, PPC::TD, Convert__imm_95_1__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8817 /* tdlgti */, PPC::TDI, Convert__imm_95_1__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8824 /* tdlle */, PPC::TD, Convert__imm_95_6__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8830 /* tdllei */, PPC::TDI, Convert__imm_95_6__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8837 /* tdllt */, PPC::TD, Convert__imm_95_2__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8843 /* tdllti */, PPC::TDI, Convert__imm_95_2__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8850 /* tdlng */, PPC::TD, Convert__imm_95_6__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8856 /* tdlngi */, PPC::TDI, Convert__imm_95_6__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8863 /* tdlnl */, PPC::TD, Convert__imm_95_5__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8869 /* tdlnli */, PPC::TDI, Convert__imm_95_5__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8876 /* tdlt */, PPC::TD, Convert__imm_95_16__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8881 /* tdlti */, PPC::TDI, Convert__imm_95_16__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8887 /* tdne */, PPC::TD, Convert__imm_95_24__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8892 /* tdnei */, PPC::TDI, Convert__imm_95_24__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8898 /* tdng */, PPC::TD, Convert__imm_95_20__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8903 /* tdngi */, PPC::TDI, Convert__imm_95_20__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8909 /* tdnl */, PPC::TD, Convert__imm_95_12__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8914 /* tdnli */, PPC::TDI, Convert__imm_95_12__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8920 /* tdu */, PPC::TD, Convert__imm_95_31__RegG8RC1_0__RegG8RC1_1, 0, { MCK_RegG8RC, MCK_RegG8RC }, },
  { 8924 /* tdui */, PPC::TDI, Convert__imm_95_31__RegG8RC1_0__S16Imm1_1, 0, { MCK_RegG8RC, MCK_S16Imm }, },
  { 8929 /* tend */, PPC::TEND, Convert__imm_95_0__U1Imm1_1, 0, { MCK__DOT_, MCK_U1Imm }, },
  { 8934 /* tlbia */, PPC::TLBIA, Convert_NoOperands, 0, {  }, },
  { 8940 /* tlbie */, PPC::TLBIE, Convert__regR0__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 8940 /* tlbie */, PPC::TLBIE, Convert__RegGPRC1_1__RegGPRC1_0, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8946 /* tlbiel */, PPC::TLBIEL, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 8953 /* tlbivax */, PPC::TLBIVAX, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8961 /* tlbld */, PPC::TLBLD, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 8967 /* tlbli */, PPC::TLBLI, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 8973 /* tlbre */, PPC::TLBRE, Convert_NoOperands, 0, {  }, },
  { 8973 /* tlbre */, PPC::TLBRE2, Convert__RegGPRC1_0__RegGPRC1_1__Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_Imm }, },
  { 8979 /* tlbrehi */, PPC::TLBRE2, Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8987 /* tlbrelo */, PPC::TLBRE2, Convert__RegGPRC1_0__RegGPRC1_1__imm_95_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8995 /* tlbsx */, PPC::TLBSX, Convert__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 8995 /* tlbsx */, PPC::TLBSX2, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 8995 /* tlbsx */, PPC::TLBSX2D, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 9001 /* tlbsync */, PPC::TLBSYNC, Convert_NoOperands, 0, {  }, },
  { 9009 /* tlbwe */, PPC::TLBWE, Convert_NoOperands, 0, {  }, },
  { 9009 /* tlbwe */, PPC::TLBWE2, Convert__RegGPRC1_0__RegGPRC1_1__Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_Imm }, },
  { 9015 /* tlbwehi */, PPC::TLBWE2, Convert__RegGPRC1_0__RegGPRC1_1__imm_95_0, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9023 /* tlbwelo */, PPC::TLBWE2, Convert__RegGPRC1_0__RegGPRC1_1__imm_95_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9031 /* trap */, PPC::TRAP, Convert_NoOperands, 0, {  }, },
  { 9036 /* trechkpt */, PPC::TRECHKPT, Convert__imm_95_0, 0, { MCK__DOT_ }, },
  { 9045 /* treclaim */, PPC::TRECLAIM, Convert__imm_95_0__RegGPRC1_1, 0, { MCK__DOT_, MCK_RegGPRC }, },
  { 9054 /* tsr */, PPC::TSR, Convert__imm_95_0__U1Imm1_1, 0, { MCK__DOT_, MCK_U1Imm }, },
  { 9058 /* tw */, PPC::TW, Convert__U5Imm1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_U5Imm, MCK_RegGPRC, MCK_RegGPRC }, },
  { 9061 /* tweq */, PPC::TW, Convert__imm_95_4__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9066 /* tweqi */, PPC::TWI, Convert__imm_95_4__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9072 /* twge */, PPC::TW, Convert__imm_95_12__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9077 /* twgei */, PPC::TWI, Convert__imm_95_12__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9083 /* twgt */, PPC::TW, Convert__imm_95_8__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9088 /* twgti */, PPC::TWI, Convert__imm_95_8__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9094 /* twi */, PPC::TWI, Convert__U5Imm1_0__RegGPRC1_1__S16Imm1_2, 0, { MCK_U5Imm, MCK_RegGPRC, MCK_S16Imm }, },
  { 9098 /* twle */, PPC::TW, Convert__imm_95_20__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9103 /* twlei */, PPC::TWI, Convert__imm_95_20__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9109 /* twlge */, PPC::TW, Convert__imm_95_5__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9115 /* twlgei */, PPC::TWI, Convert__imm_95_5__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9122 /* twlgt */, PPC::TW, Convert__imm_95_1__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9128 /* twlgti */, PPC::TWI, Convert__imm_95_1__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9135 /* twlle */, PPC::TW, Convert__imm_95_6__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9141 /* twllei */, PPC::TWI, Convert__imm_95_6__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9148 /* twllt */, PPC::TW, Convert__imm_95_2__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9154 /* twllti */, PPC::TWI, Convert__imm_95_2__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9161 /* twlng */, PPC::TW, Convert__imm_95_6__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9167 /* twlngi */, PPC::TWI, Convert__imm_95_6__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9174 /* twlnl */, PPC::TW, Convert__imm_95_5__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9180 /* twlnli */, PPC::TWI, Convert__imm_95_5__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9187 /* twlt */, PPC::TW, Convert__imm_95_16__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9192 /* twlti */, PPC::TWI, Convert__imm_95_16__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9198 /* twne */, PPC::TW, Convert__imm_95_24__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9203 /* twnei */, PPC::TWI, Convert__imm_95_24__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9209 /* twng */, PPC::TW, Convert__imm_95_20__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9214 /* twngi */, PPC::TWI, Convert__imm_95_20__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9220 /* twnl */, PPC::TW, Convert__imm_95_12__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9225 /* twnli */, PPC::TWI, Convert__imm_95_12__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9231 /* twu */, PPC::TW, Convert__imm_95_31__RegGPRC1_0__RegGPRC1_1, 0, { MCK_RegGPRC, MCK_RegGPRC }, },
  { 9235 /* twui */, PPC::TWI, Convert__imm_95_31__RegGPRC1_0__S16Imm1_1, 0, { MCK_RegGPRC, MCK_S16Imm }, },
  { 9240 /* vaddcuq */, PPC::VADDCUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9248 /* vaddcuw */, PPC::VADDCUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9256 /* vaddecuq */, PPC::VADDECUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9265 /* vaddeuqm */, PPC::VADDEUQM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9274 /* vaddfp */, PPC::VADDFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9281 /* vaddsbs */, PPC::VADDSBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9289 /* vaddshs */, PPC::VADDSHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9297 /* vaddsws */, PPC::VADDSWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9305 /* vaddubm */, PPC::VADDUBM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9313 /* vaddubs */, PPC::VADDUBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9321 /* vaddudm */, PPC::VADDUDM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9329 /* vadduhm */, PPC::VADDUHM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9337 /* vadduhs */, PPC::VADDUHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9345 /* vadduqm */, PPC::VADDUQM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9353 /* vadduwm */, PPC::VADDUWM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9361 /* vadduws */, PPC::VADDUWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9369 /* vand */, PPC::VAND, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9374 /* vandc */, PPC::VANDC, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9380 /* vavgsb */, PPC::VAVGSB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9387 /* vavgsh */, PPC::VAVGSH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9394 /* vavgsw */, PPC::VAVGSW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9401 /* vavgub */, PPC::VAVGUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9408 /* vavguh */, PPC::VAVGUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9415 /* vavguw */, PPC::VAVGUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9422 /* vbpermd */, PPC::VBPERMD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9430 /* vbpermq */, PPC::VBPERMQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9438 /* vcfsx */, PPC::VCFSX, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 9444 /* vcfux */, PPC::VCFUX, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 9450 /* vcipher */, PPC::VCIPHER, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9458 /* vcipherlast */, PPC::VCIPHERLAST, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9470 /* vclzb */, PPC::VCLZB, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9476 /* vclzd */, PPC::VCLZD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9482 /* vclzh */, PPC::VCLZH, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9488 /* vclzlsbb */, PPC::VCLZLSBB, Convert__RegG8RC1_0__RegVRRC1_1, 0, { MCK_RegG8RC, MCK_RegVRRC }, },
  { 9497 /* vclzw */, PPC::VCLZW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9503 /* vcmpbfp */, PPC::VCMPBFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9503 /* vcmpbfp */, PPC::VCMPBFPo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9511 /* vcmpeqfp */, PPC::VCMPEQFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9511 /* vcmpeqfp */, PPC::VCMPEQFPo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9520 /* vcmpequb */, PPC::VCMPEQUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9520 /* vcmpequb */, PPC::VCMPEQUBo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9529 /* vcmpequd */, PPC::VCMPEQUD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9529 /* vcmpequd */, PPC::VCMPEQUDo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9538 /* vcmpequh */, PPC::VCMPEQUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9538 /* vcmpequh */, PPC::VCMPEQUHo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9547 /* vcmpequw */, PPC::VCMPEQUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9547 /* vcmpequw */, PPC::VCMPEQUWo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9556 /* vcmpgefp */, PPC::VCMPGEFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9556 /* vcmpgefp */, PPC::VCMPGEFPo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9565 /* vcmpgtfp */, PPC::VCMPGTFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9565 /* vcmpgtfp */, PPC::VCMPGTFPo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9574 /* vcmpgtsb */, PPC::VCMPGTSB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9574 /* vcmpgtsb */, PPC::VCMPGTSBo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9583 /* vcmpgtsd */, PPC::VCMPGTSD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9583 /* vcmpgtsd */, PPC::VCMPGTSDo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9592 /* vcmpgtsh */, PPC::VCMPGTSH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9592 /* vcmpgtsh */, PPC::VCMPGTSHo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9601 /* vcmpgtsw */, PPC::VCMPGTSW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9601 /* vcmpgtsw */, PPC::VCMPGTSWo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9610 /* vcmpgtub */, PPC::VCMPGTUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9610 /* vcmpgtub */, PPC::VCMPGTUBo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9619 /* vcmpgtud */, PPC::VCMPGTUD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9619 /* vcmpgtud */, PPC::VCMPGTUDo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9628 /* vcmpgtuh */, PPC::VCMPGTUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9628 /* vcmpgtuh */, PPC::VCMPGTUHo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9637 /* vcmpgtuw */, PPC::VCMPGTUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9637 /* vcmpgtuw */, PPC::VCMPGTUWo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9646 /* vcmpneb */, PPC::VCMPNEB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9646 /* vcmpneb */, PPC::VCMPNEBo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9654 /* vcmpneh */, PPC::VCMPNEH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9654 /* vcmpneh */, PPC::VCMPNEHo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9662 /* vcmpnew */, PPC::VCMPNEW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9662 /* vcmpnew */, PPC::VCMPNEWo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9670 /* vcmpnezb */, PPC::VCMPNEZB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9670 /* vcmpnezb */, PPC::VCMPNEZBo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9679 /* vcmpnezh */, PPC::VCMPNEZH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9679 /* vcmpnezh */, PPC::VCMPNEZHo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9688 /* vcmpnezw */, PPC::VCMPNEZW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9688 /* vcmpnezw */, PPC::VCMPNEZWo, Convert__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK__DOT_, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9697 /* vctsxs */, PPC::VCTSXS, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 9704 /* vctuxs */, PPC::VCTUXS, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 9711 /* vctzb */, PPC::VCTZB, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9717 /* vctzd */, PPC::VCTZD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9723 /* vctzh */, PPC::VCTZH, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9729 /* vctzlsbb */, PPC::VCTZLSBB, Convert__RegG8RC1_0__RegVRRC1_1, 0, { MCK_RegG8RC, MCK_RegVRRC }, },
  { 9738 /* vctzw */, PPC::VCTZW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9744 /* veqv */, PPC::VEQV, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9749 /* vexptefp */, PPC::VEXPTEFP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9758 /* vextractd */, PPC::VEXTRACTD, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9768 /* vextractub */, PPC::VEXTRACTUB, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9779 /* vextractuh */, PPC::VEXTRACTUH, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9790 /* vextractuw */, PPC::VEXTRACTUW, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9801 /* vextsb2d */, PPC::VEXTSB2D, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9810 /* vextsb2w */, PPC::VEXTSB2W, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9819 /* vextsh2d */, PPC::VEXTSH2D, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9828 /* vextsh2w */, PPC::VEXTSH2W, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9837 /* vextsw2d */, PPC::VEXTSW2D, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9846 /* vextublx */, PPC::VEXTUBLX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9855 /* vextubrx */, PPC::VEXTUBRX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9864 /* vextuhlx */, PPC::VEXTUHLX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9873 /* vextuhrx */, PPC::VEXTUHRX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9882 /* vextuwlx */, PPC::VEXTUWLX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9891 /* vextuwrx */, PPC::VEXTUWRX, Convert__RegG8RC1_0__RegG8RC1_1__RegVRRC1_2, 0, { MCK_RegG8RC, MCK_RegG8RC, MCK_RegVRRC }, },
  { 9900 /* vgbbd */, PPC::VGBBD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9906 /* vinsertb */, PPC::VINSERTB, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9915 /* vinsertd */, PPC::VINSERTD, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9924 /* vinserth */, PPC::VINSERTH, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9933 /* vinsertw */, PPC::VINSERTW, Convert__RegVRRC1_0__U4Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U4Imm }, },
  { 9942 /* vlogefp */, PPC::VLOGEFP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 9950 /* vmaddfp */, PPC::VMADDFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9958 /* vmaxfp */, PPC::VMAXFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9965 /* vmaxsb */, PPC::VMAXSB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9972 /* vmaxsd */, PPC::VMAXSD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9979 /* vmaxsh */, PPC::VMAXSH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9986 /* vmaxsw */, PPC::VMAXSW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 9993 /* vmaxub */, PPC::VMAXUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10000 /* vmaxud */, PPC::VMAXUD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10007 /* vmaxuh */, PPC::VMAXUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10014 /* vmaxuw */, PPC::VMAXUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10021 /* vmhaddshs */, PPC::VMHADDSHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10031 /* vmhraddshs */, PPC::VMHRADDSHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10042 /* vminfp */, PPC::VMINFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10049 /* vminsb */, PPC::VMINSB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10056 /* vminsd */, PPC::VMINSD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10063 /* vminsh */, PPC::VMINSH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10070 /* vminsw */, PPC::VMINSW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10077 /* vminub */, PPC::VMINUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10084 /* vminud */, PPC::VMINUD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10091 /* vminuh */, PPC::VMINUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10098 /* vminuw */, PPC::VMINUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10105 /* vmladduhm */, PPC::VMLADDUHM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10115 /* vmrgew */, PPC::VMRGEW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10122 /* vmrghb */, PPC::VMRGHB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10129 /* vmrghh */, PPC::VMRGHH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10136 /* vmrghw */, PPC::VMRGHW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10143 /* vmrglb */, PPC::VMRGLB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10150 /* vmrglh */, PPC::VMRGLH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10157 /* vmrglw */, PPC::VMRGLW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10164 /* vmrgow */, PPC::VMRGOW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10171 /* vmsummbm */, PPC::VMSUMMBM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10180 /* vmsumshm */, PPC::VMSUMSHM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10189 /* vmsumshs */, PPC::VMSUMSHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10198 /* vmsumubm */, PPC::VMSUMUBM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10207 /* vmsumuhm */, PPC::VMSUMUHM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10216 /* vmsumuhs */, PPC::VMSUMUHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10225 /* vmul10cuq */, PPC::VMUL10CUQ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10235 /* vmul10ecuq */, PPC::VMUL10ECUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10246 /* vmul10euq */, PPC::VMUL10EUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10256 /* vmul10uq */, PPC::VMUL10UQ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10265 /* vmulesb */, PPC::VMULESB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10273 /* vmulesh */, PPC::VMULESH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10281 /* vmulesw */, PPC::VMULESW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10289 /* vmuleub */, PPC::VMULEUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10297 /* vmuleuh */, PPC::VMULEUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10305 /* vmuleuw */, PPC::VMULEUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10313 /* vmulosb */, PPC::VMULOSB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10321 /* vmulosh */, PPC::VMULOSH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10329 /* vmulosw */, PPC::VMULOSW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10337 /* vmuloub */, PPC::VMULOUB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10345 /* vmulouh */, PPC::VMULOUH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10353 /* vmulouw */, PPC::VMULOUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10361 /* vmuluwm */, PPC::VMULUWM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10369 /* vnand */, PPC::VNAND, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10375 /* vncipher */, PPC::VNCIPHER, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10384 /* vncipherlast */, PPC::VNCIPHERLAST, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10397 /* vnegd */, PPC::VNEGD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10403 /* vnegw */, PPC::VNEGW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10409 /* vnmsubfp */, PPC::VNMSUBFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10418 /* vnor */, PPC::VNOR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10423 /* vor */, PPC::VOR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10427 /* vorc */, PPC::VORC, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10432 /* vperm */, PPC::VPERM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10438 /* vpermr */, PPC::VPERMR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10445 /* vpermxor */, PPC::VPERMXOR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10454 /* vpkpx */, PPC::VPKPX, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10460 /* vpksdss */, PPC::VPKSDSS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10468 /* vpksdus */, PPC::VPKSDUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10476 /* vpkshss */, PPC::VPKSHSS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10484 /* vpkshus */, PPC::VPKSHUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10492 /* vpkswss */, PPC::VPKSWSS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10500 /* vpkswus */, PPC::VPKSWUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10508 /* vpkudum */, PPC::VPKUDUM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10516 /* vpkudus */, PPC::VPKUDUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10524 /* vpkuhum */, PPC::VPKUHUM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10532 /* vpkuhus */, PPC::VPKUHUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10540 /* vpkuwum */, PPC::VPKUWUM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10548 /* vpkuwus */, PPC::VPKUWUS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10556 /* vpmsumb */, PPC::VPMSUMB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10564 /* vpmsumd */, PPC::VPMSUMD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10572 /* vpmsumh */, PPC::VPMSUMH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10580 /* vpmsumw */, PPC::VPMSUMW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10588 /* vpopcntb */, PPC::VPOPCNTB, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10597 /* vpopcntd */, PPC::VPOPCNTD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10606 /* vpopcnth */, PPC::VPOPCNTH, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10615 /* vpopcntw */, PPC::VPOPCNTW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10624 /* vprtybd */, PPC::VPRTYBD, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10632 /* vprtybq */, PPC::VPRTYBQ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10640 /* vprtybw */, PPC::VPRTYBW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10648 /* vrefp */, PPC::VREFP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10654 /* vrfim */, PPC::VRFIM, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10660 /* vrfin */, PPC::VRFIN, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10666 /* vrfip */, PPC::VRFIP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10672 /* vrfiz */, PPC::VRFIZ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10678 /* vrlb */, PPC::VRLB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10683 /* vrld */, PPC::VRLD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10688 /* vrldmi */, PPC::VRLDMI, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10695 /* vrldnm */, PPC::VRLDNM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10702 /* vrlh */, PPC::VRLH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10707 /* vrlw */, PPC::VRLW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10712 /* vrlwmi */, PPC::VRLWMI, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10719 /* vrlwnm */, PPC::VRLWNM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10726 /* vrsqrtefp */, PPC::VRSQRTEFP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10736 /* vsbox */, PPC::VSBOX, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 10742 /* vsel */, PPC::VSEL, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10747 /* vshasigmad */, PPC::VSHASIGMAD, Convert__RegVRRC1_0__RegVRRC1_1__U1Imm1_2__U4Imm1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm, MCK_U4Imm }, },
  { 10758 /* vshasigmaw */, PPC::VSHASIGMAW, Convert__RegVRRC1_0__RegVRRC1_1__U1Imm1_2__U4Imm1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U1Imm, MCK_U4Imm }, },
  { 10769 /* vsl */, PPC::VSL, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10773 /* vslb */, PPC::VSLB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10778 /* vsld */, PPC::VSLD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10783 /* vsldoi */, PPC::VSLDOI, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__U5Imm1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 10790 /* vslh */, PPC::VSLH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10795 /* vslo */, PPC::VSLO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10800 /* vslv */, PPC::VSLV, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10805 /* vslw */, PPC::VSLW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10810 /* vspltb */, PPC::VSPLTB, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 10817 /* vsplth */, PPC::VSPLTH, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 10824 /* vspltisb */, PPC::VSPLTISB, Convert__RegVRRC1_0__S5Imm1_1, 0, { MCK_RegVRRC, MCK_S5Imm }, },
  { 10833 /* vspltish */, PPC::VSPLTISH, Convert__RegVRRC1_0__S5Imm1_1, 0, { MCK_RegVRRC, MCK_S5Imm }, },
  { 10842 /* vspltisw */, PPC::VSPLTISW, Convert__RegVRRC1_0__S5Imm1_1, 0, { MCK_RegVRRC, MCK_S5Imm }, },
  { 10851 /* vspltw */, PPC::VSPLTW, Convert__RegVRRC1_0__U5Imm1_2__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_U5Imm }, },
  { 10858 /* vsr */, PPC::VSR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10862 /* vsrab */, PPC::VSRAB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10868 /* vsrad */, PPC::VSRAD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10874 /* vsrah */, PPC::VSRAH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10880 /* vsraw */, PPC::VSRAW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10886 /* vsrb */, PPC::VSRB, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10891 /* vsrd */, PPC::VSRD, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10896 /* vsrh */, PPC::VSRH, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10901 /* vsro */, PPC::VSRO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10906 /* vsrv */, PPC::VSRV, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10911 /* vsrw */, PPC::VSRW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10916 /* vsubcuq */, PPC::VSUBCUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10924 /* vsubcuw */, PPC::VSUBCUW, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10932 /* vsubecuq */, PPC::VSUBECUQ, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10941 /* vsubeuqm */, PPC::VSUBEUQM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2__RegVRRC1_3, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10950 /* vsubfp */, PPC::VSUBFP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10957 /* vsubsbs */, PPC::VSUBSBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10965 /* vsubshs */, PPC::VSUBSHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10973 /* vsubsws */, PPC::VSUBSWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10981 /* vsububm */, PPC::VSUBUBM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10989 /* vsububs */, PPC::VSUBUBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 10997 /* vsubudm */, PPC::VSUBUDM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11005 /* vsubuhm */, PPC::VSUBUHM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11013 /* vsubuhs */, PPC::VSUBUHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11021 /* vsubuqm */, PPC::VSUBUQM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11029 /* vsubuwm */, PPC::VSUBUWM, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11037 /* vsubuws */, PPC::VSUBUWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11045 /* vsum2sws */, PPC::VSUM2SWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11054 /* vsum4sbs */, PPC::VSUM4SBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11063 /* vsum4shs */, PPC::VSUM4SHS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11072 /* vsum4ubs */, PPC::VSUM4UBS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11081 /* vsumsws */, PPC::VSUMSWS, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11089 /* vupkhpx */, PPC::VUPKHPX, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11097 /* vupkhsb */, PPC::VUPKHSB, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11105 /* vupkhsh */, PPC::VUPKHSH, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11113 /* vupkhsw */, PPC::VUPKHSW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11121 /* vupklpx */, PPC::VUPKLPX, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11129 /* vupklsb */, PPC::VUPKLSB, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11137 /* vupklsh */, PPC::VUPKLSH, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11145 /* vupklsw */, PPC::VUPKLSW, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11153 /* vxor */, PPC::VXOR, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11158 /* wait */, PPC::WAIT, Convert__imm_95_0, 0, {  }, },
  { 11158 /* wait */, PPC::WAIT, Convert__Imm1_0, 0, { MCK_Imm }, },
  { 11163 /* waitimpl */, PPC::WAIT, Convert__imm_95_2, 0, {  }, },
  { 11172 /* waitrsv */, PPC::WAIT, Convert__imm_95_1, 0, {  }, },
  { 11180 /* wrtee */, PPC::WRTEE, Convert__RegGPRC1_0, 0, { MCK_RegGPRC }, },
  { 11186 /* wrteei */, PPC::WRTEEI, Convert__Imm1_0, 0, { MCK_Imm }, },
  { 11193 /* xnop */, PPC::XORI, Convert__regR0__regR0__imm_95_0, 0, {  }, },
  { 11198 /* xor */, PPC::XOR, Convert__RegGPRC1_0__RegGPRC1_1__RegGPRC1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 11198 /* xor */, PPC::XORo, Convert__RegGPRC1_1__RegGPRC1_2__RegGPRC1_3, 0, { MCK__DOT_, MCK_RegGPRC, MCK_RegGPRC, MCK_RegGPRC }, },
  { 11202 /* xori */, PPC::XORI, Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 11207 /* xoris */, PPC::XORIS, Convert__RegGPRC1_0__RegGPRC1_1__U16Imm1_2, 0, { MCK_RegGPRC, MCK_RegGPRC, MCK_U16Imm }, },
  { 11213 /* xsabsdp */, PPC::XSABSDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11221 /* xsabsqp */, PPC::XSABSQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11229 /* xsadddp */, PPC::XSADDDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11237 /* xsaddqp */, PPC::XSADDQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11245 /* xsaddqpo */, PPC::XSADDQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11254 /* xsaddsp */, PPC::XSADDSP, Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11262 /* xscmpeqdp */, PPC::XSCMPEQDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11272 /* xscmpexpdp */, PPC::XSCMPEXPDP, Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11283 /* xscmpexpqp */, PPC::XSCMPEXPQP, Convert__RegCRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegCRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11294 /* xscmpgedp */, PPC::XSCMPGEDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11304 /* xscmpgtdp */, PPC::XSCMPGTDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11314 /* xscmpnedp */, PPC::XSCMPNEDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11324 /* xscmpodp */, PPC::XSCMPODP, Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11333 /* xscmpoqp */, PPC::XSCMPOQP, Convert__RegCRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegCRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11342 /* xscmpudp */, PPC::XSCMPUDP, Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11351 /* xscmpuqp */, PPC::XSCMPUQP, Convert__RegCRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegCRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11360 /* xscpsgndp */, PPC::XSCPSGNDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11370 /* xscpsgnqp */, PPC::XSCPSGNQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11380 /* xscvdphp */, PPC::XSCVDPHP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11389 /* xscvdpqp */, PPC::XSCVDPQP, Convert__RegVRRC1_0__RegVSFRC1_1, 0, { MCK_RegVRRC, MCK_RegVSFRC }, },
  { 11398 /* xscvdpsp */, PPC::XSCVDPSP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11407 /* xscvdpspn */, PPC::XSCVDPSPN, Convert__RegVSRC1_0__RegVSSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSSRC }, },
  { 11417 /* xscvdpsxds */, PPC::XSCVDPSXDS, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11428 /* xscvdpsxws */, PPC::XSCVDPSXWS, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11439 /* xscvdpuxds */, PPC::XSCVDPUXDS, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11450 /* xscvdpuxws */, PPC::XSCVDPUXWS, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11461 /* xscvhpdp */, PPC::XSCVHPDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11470 /* xscvqpdp */, PPC::XSCVQPDP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11479 /* xscvqpdpo */, PPC::XSCVQPDPO, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11489 /* xscvqpsdz */, PPC::XSCVQPSDZ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11499 /* xscvqpswz */, PPC::XSCVQPSWZ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11509 /* xscvqpudz */, PPC::XSCVQPUDZ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11519 /* xscvqpuwz */, PPC::XSCVQPUWZ, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11529 /* xscvsdqp */, PPC::XSCVSDQP, Convert__RegVRRC1_0__RegVSFRC1_1, 0, { MCK_RegVRRC, MCK_RegVSFRC }, },
  { 11538 /* xscvspdp */, PPC::XSCVSPDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11547 /* xscvspdpn */, PPC::XSCVSPDPN, Convert__RegVSSRC1_0__RegVSRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSRC }, },
  { 11557 /* xscvsxddp */, PPC::XSCVSXDDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11567 /* xscvsxdsp */, PPC::XSCVSXDSP, Convert__RegVSSRC1_0__RegVSFRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSFRC }, },
  { 11577 /* xscvudqp */, PPC::XSCVUDQP, Convert__RegVRRC1_0__RegVSFRC1_1, 0, { MCK_RegVRRC, MCK_RegVSFRC }, },
  { 11586 /* xscvuxddp */, PPC::XSCVUXDDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11596 /* xscvuxdsp */, PPC::XSCVUXDSP, Convert__RegVSSRC1_0__RegVSFRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSFRC }, },
  { 11606 /* xsdivdp */, PPC::XSDIVDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11614 /* xsdivqp */, PPC::XSDIVQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11622 /* xsdivqpo */, PPC::XSDIVQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11631 /* xsdivsp */, PPC::XSDIVSP, Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11639 /* xsiexpdp */, PPC::XSIEXPDP, Convert__RegVSRC1_0__RegG8RC1_1__RegG8RC1_2, 0, { MCK_RegVSRC, MCK_RegG8RC, MCK_RegG8RC }, },
  { 11648 /* xsiexpqp */, PPC::XSIEXPQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVSFRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVSFRC }, },
  { 11657 /* xsmaddadp */, PPC::XSMADDADP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11667 /* xsmaddasp */, PPC::XSMADDASP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11677 /* xsmaddmdp */, PPC::XSMADDMDP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11687 /* xsmaddmsp */, PPC::XSMADDMSP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11697 /* xsmaddqp */, PPC::XSMADDQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11706 /* xsmaddqpo */, PPC::XSMADDQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11716 /* xsmaxcdp */, PPC::XSMAXCDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11725 /* xsmaxdp */, PPC::XSMAXDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11733 /* xsmaxjdp */, PPC::XSMAXJDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11742 /* xsmincdp */, PPC::XSMINCDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11751 /* xsmindp */, PPC::XSMINDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11759 /* xsminjdp */, PPC::XSMINJDP, Convert__RegVSRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11768 /* xsmsubadp */, PPC::XSMSUBADP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11778 /* xsmsubasp */, PPC::XSMSUBASP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11788 /* xsmsubmdp */, PPC::XSMSUBMDP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11798 /* xsmsubmsp */, PPC::XSMSUBMSP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11808 /* xsmsubqp */, PPC::XSMSUBQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11817 /* xsmsubqpo */, PPC::XSMSUBQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11827 /* xsmuldp */, PPC::XSMULDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11835 /* xsmulqp */, PPC::XSMULQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11843 /* xsmulqpo */, PPC::XSMULQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11852 /* xsmulsp */, PPC::XSMULSP, Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11860 /* xsnabsdp */, PPC::XSNABSDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11869 /* xsnabsqp */, PPC::XSNABSQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11878 /* xsnegdp */, PPC::XSNEGDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11886 /* xsnegqp */, PPC::XSNEGQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 11894 /* xsnmaddadp */, PPC::XSNMADDADP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11905 /* xsnmaddasp */, PPC::XSNMADDASP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11916 /* xsnmaddmdp */, PPC::XSNMADDMDP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11927 /* xsnmaddmsp */, PPC::XSNMADDMSP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11938 /* xsnmaddqp */, PPC::XSNMADDQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11948 /* xsnmaddqpo */, PPC::XSNMADDQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 11959 /* xsnmsubadp */, PPC::XSNMSUBADP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11970 /* xsnmsubasp */, PPC::XSNMSUBASP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 11981 /* xsnmsubmdp */, PPC::XSNMSUBMDP, Convert__RegVSFRC1_0__Tie0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 11992 /* xsnmsubmsp */, PPC::XSNMSUBMSP, Convert__RegVSSRC1_0__Tie0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 12003 /* xsnmsubqp */, PPC::XSNMSUBQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 12013 /* xsnmsubqpo */, PPC::XSNMSUBQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 12024 /* xsrdpi */, PPC::XSRDPI, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12031 /* xsrdpic */, PPC::XSRDPIC, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12039 /* xsrdpim */, PPC::XSRDPIM, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12047 /* xsrdpip */, PPC::XSRDPIP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12055 /* xsrdpiz */, PPC::XSRDPIZ, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12063 /* xsredp */, PPC::XSREDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12070 /* xsresp */, PPC::XSRESP, Convert__RegVSSRC1_0__RegVSSRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 12077 /* xsrqpi */, PPC::XSRQPI, Convert__RegVRRC1_1__U1Imm1_0__RegVRRC1_2__U2Imm1_3, 0, { MCK_U1Imm, MCK_RegVRRC, MCK_RegVRRC, MCK_U2Imm }, },
  { 12084 /* xsrqpix */, PPC::XSRQPIX, Convert__RegVRRC1_1__U1Imm1_0__RegVRRC1_2__U2Imm1_3, 0, { MCK_U1Imm, MCK_RegVRRC, MCK_RegVRRC, MCK_U2Imm }, },
  { 12092 /* xsrqpxp */, PPC::XSRQPXP, Convert__RegVRRC1_1__U1Imm1_0__RegVRRC1_2__U2Imm1_3, 0, { MCK_U1Imm, MCK_RegVRRC, MCK_RegVRRC, MCK_U2Imm }, },
  { 12100 /* xsrsqrtedp */, PPC::XSRSQRTEDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12111 /* xsrsqrtesp */, PPC::XSRSQRTESP, Convert__RegVSSRC1_0__RegVSSRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 12122 /* xssqrtdp */, PPC::XSSQRTDP, Convert__RegVSFRC1_0__RegVSFRC1_1, 0, { MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12131 /* xssqrtqp */, PPC::XSSQRTQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 12140 /* xssqrtqpo */, PPC::XSSQRTQPO, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 12150 /* xssqrtsp */, PPC::XSSQRTSP, Convert__RegVSSRC1_0__RegVSSRC1_1, 0, { MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 12159 /* xssubdp */, PPC::XSSUBDP, Convert__RegVSFRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegVSFRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12167 /* xssubqp */, PPC::XSSUBQP, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 12175 /* xssubqpo */, PPC::XSSUBQPO, Convert__RegVRRC1_0__RegVRRC1_1__RegVRRC1_2, 0, { MCK_RegVRRC, MCK_RegVRRC, MCK_RegVRRC }, },
  { 12184 /* xssubsp */, PPC::XSSUBSP, Convert__RegVSSRC1_0__RegVSSRC1_1__RegVSSRC1_2, 0, { MCK_RegVSSRC, MCK_RegVSSRC, MCK_RegVSSRC }, },
  { 12192 /* xstdivdp */, PPC::XSTDIVDP, Convert__RegCRRC1_0__RegVSFRC1_1__RegVSFRC1_2, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_RegVSFRC }, },
  { 12201 /* xstsqrtdp */, PPC::XSTSQRTDP, Convert__RegCRRC1_0__RegVSFRC1_1, 0, { MCK_RegCRRC, MCK_RegVSFRC }, },
  { 12211 /* xststdcdp */, PPC::XSTSTDCDP, Convert__RegCRRC1_0__U7Imm1_2__RegVSFRC1_1, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_U7Imm }, },
  { 12221 /* xststdcqp */, PPC::XSTSTDCQP, Convert__RegCRRC1_0__U7Imm1_2__RegVRRC1_1, 0, { MCK_RegCRRC, MCK_RegVRRC, MCK_U7Imm }, },
  { 12231 /* xststdcsp */, PPC::XSTSTDCSP, Convert__RegCRRC1_0__U7Imm1_2__RegVSFRC1_1, 0, { MCK_RegCRRC, MCK_RegVSFRC, MCK_U7Imm }, },
  { 12241 /* xsxexpdp */, PPC::XSXEXPDP, Convert__RegG8RC1_0__RegVSFRC1_1, 0, { MCK_RegG8RC, MCK_RegVSFRC }, },
  { 12250 /* xsxexpqp */, PPC::XSXEXPQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 12259 /* xsxsigdp */, PPC::XSXSIGDP, Convert__RegG8RC1_0__RegVSFRC1_1, 0, { MCK_RegG8RC, MCK_RegVSFRC }, },
  { 12268 /* xsxsigqp */, PPC::XSXSIGQP, Convert__RegVRRC1_0__RegVRRC1_1, 0, { MCK_RegVRRC, MCK_RegVRRC }, },
  { 12277 /* xvabsdp */, PPC::XVABSDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12285 /* xvabssp */, PPC::XVABSSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12293 /* xvadddp */, PPC::XVADDDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12301 /* xvaddsp */, PPC::XVADDSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12309 /* xvcmpeqdp */, PPC::XVCMPEQDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12309 /* xvcmpeqdp */, PPC::XVCMPEQDPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12319 /* xvcmpeqsp */, PPC::XVCMPEQSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12319 /* xvcmpeqsp */, PPC::XVCMPEQSPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12329 /* xvcmpgedp */, PPC::XVCMPGEDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12329 /* xvcmpgedp */, PPC::XVCMPGEDPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12339 /* xvcmpgesp */, PPC::XVCMPGESP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12339 /* xvcmpgesp */, PPC::XVCMPGESPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12349 /* xvcmpgtdp */, PPC::XVCMPGTDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12349 /* xvcmpgtdp */, PPC::XVCMPGTDPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12359 /* xvcmpgtsp */, PPC::XVCMPGTSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12359 /* xvcmpgtsp */, PPC::XVCMPGTSPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12369 /* xvcmpnedp */, PPC::XVCMPNEDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12369 /* xvcmpnedp */, PPC::XVCMPNEDPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12379 /* xvcmpnesp */, PPC::XVCMPNESP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12379 /* xvcmpnesp */, PPC::XVCMPNESPo, Convert__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK__DOT_, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12389 /* xvcpsgndp */, PPC::XVCPSGNDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12399 /* xvcpsgnsp */, PPC::XVCPSGNSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12409 /* xvcvdpsp */, PPC::XVCVDPSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12418 /* xvcvdpsxds */, PPC::XVCVDPSXDS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12429 /* xvcvdpsxws */, PPC::XVCVDPSXWS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12440 /* xvcvdpuxds */, PPC::XVCVDPUXDS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12451 /* xvcvdpuxws */, PPC::XVCVDPUXWS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12462 /* xvcvhpsp */, PPC::XVCVHPSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12471 /* xvcvspdp */, PPC::XVCVSPDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12480 /* xvcvsphp */, PPC::XVCVSPHP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12489 /* xvcvspsxds */, PPC::XVCVSPSXDS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12500 /* xvcvspsxws */, PPC::XVCVSPSXWS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12511 /* xvcvspuxds */, PPC::XVCVSPUXDS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12522 /* xvcvspuxws */, PPC::XVCVSPUXWS, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12533 /* xvcvsxddp */, PPC::XVCVSXDDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12543 /* xvcvsxdsp */, PPC::XVCVSXDSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12553 /* xvcvsxwdp */, PPC::XVCVSXWDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12563 /* xvcvsxwsp */, PPC::XVCVSXWSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12573 /* xvcvuxddp */, PPC::XVCVUXDDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12583 /* xvcvuxdsp */, PPC::XVCVUXDSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12593 /* xvcvuxwdp */, PPC::XVCVUXWDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12603 /* xvcvuxwsp */, PPC::XVCVUXWSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12613 /* xvdivdp */, PPC::XVDIVDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12621 /* xvdivsp */, PPC::XVDIVSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12629 /* xviexpdp */, PPC::XVIEXPDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12638 /* xviexpsp */, PPC::XVIEXPSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12647 /* xvmaddadp */, PPC::XVMADDADP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12657 /* xvmaddasp */, PPC::XVMADDASP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12667 /* xvmaddmdp */, PPC::XVMADDMDP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12677 /* xvmaddmsp */, PPC::XVMADDMSP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12687 /* xvmaxdp */, PPC::XVMAXDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12695 /* xvmaxsp */, PPC::XVMAXSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12703 /* xvmindp */, PPC::XVMINDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12711 /* xvminsp */, PPC::XVMINSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12719 /* xvmovdp */, PPC::XVCPSGNDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12727 /* xvmovsp */, PPC::XVCPSGNSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12735 /* xvmsubadp */, PPC::XVMSUBADP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12745 /* xvmsubasp */, PPC::XVMSUBASP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12755 /* xvmsubmdp */, PPC::XVMSUBMDP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12765 /* xvmsubmsp */, PPC::XVMSUBMSP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12775 /* xvmuldp */, PPC::XVMULDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12783 /* xvmulsp */, PPC::XVMULSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12791 /* xvnabsdp */, PPC::XVNABSDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12800 /* xvnabssp */, PPC::XVNABSSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12809 /* xvnegdp */, PPC::XVNEGDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12817 /* xvnegsp */, PPC::XVNEGSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12825 /* xvnmaddadp */, PPC::XVNMADDADP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12836 /* xvnmaddasp */, PPC::XVNMADDASP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12847 /* xvnmaddmdp */, PPC::XVNMADDMDP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12858 /* xvnmaddmsp */, PPC::XVNMADDMSP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12869 /* xvnmsubadp */, PPC::XVNMSUBADP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12880 /* xvnmsubasp */, PPC::XVNMSUBASP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12891 /* xvnmsubmdp */, PPC::XVNMSUBMDP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12902 /* xvnmsubmsp */, PPC::XVNMSUBMSP, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 12913 /* xvrdpi */, PPC::XVRDPI, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12920 /* xvrdpic */, PPC::XVRDPIC, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12928 /* xvrdpim */, PPC::XVRDPIM, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12936 /* xvrdpip */, PPC::XVRDPIP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12944 /* xvrdpiz */, PPC::XVRDPIZ, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12952 /* xvredp */, PPC::XVREDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12959 /* xvresp */, PPC::XVRESP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12966 /* xvrspi */, PPC::XVRSPI, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12973 /* xvrspic */, PPC::XVRSPIC, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12981 /* xvrspim */, PPC::XVRSPIM, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12989 /* xvrspip */, PPC::XVRSPIP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 12997 /* xvrspiz */, PPC::XVRSPIZ, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13005 /* xvrsqrtedp */, PPC::XVRSQRTEDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13016 /* xvrsqrtesp */, PPC::XVRSQRTESP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13027 /* xvsqrtdp */, PPC::XVSQRTDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13036 /* xvsqrtsp */, PPC::XVSQRTSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13045 /* xvsubdp */, PPC::XVSUBDP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13053 /* xvsubsp */, PPC::XVSUBSP, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13061 /* xvtdivdp */, PPC::XVTDIVDP, Convert__RegCRRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegCRRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13070 /* xvtdivsp */, PPC::XVTDIVSP, Convert__RegCRRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegCRRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13079 /* xvtsqrtdp */, PPC::XVTSQRTDP, Convert__RegCRRC1_0__RegVSRC1_1, 0, { MCK_RegCRRC, MCK_RegVSRC }, },
  { 13089 /* xvtsqrtsp */, PPC::XVTSQRTSP, Convert__RegCRRC1_0__RegVSRC1_1, 0, { MCK_RegCRRC, MCK_RegVSRC }, },
  { 13099 /* xvtstdcdp */, PPC::XVTSTDCDP, Convert__RegVSRC1_0__U7Imm1_2__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_U7Imm }, },
  { 13109 /* xvtstdcsp */, PPC::XVTSTDCSP, Convert__RegVSRC1_0__U7Imm1_2__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_U7Imm }, },
  { 13119 /* xvxexpdp */, PPC::XVXEXPDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13128 /* xvxexpsp */, PPC::XVXEXPSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13137 /* xvxsigdp */, PPC::XVXSIGDP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13146 /* xvxsigsp */, PPC::XVXSIGSP, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13155 /* xxbrd */, PPC::XXBRD, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13161 /* xxbrh */, PPC::XXBRH, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13167 /* xxbrq */, PPC::XXBRQ, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13173 /* xxbrw */, PPC::XXBRW, Convert__RegVSRC1_0__RegVSRC1_1, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
  { 13179 /* xxextractuw */, PPC::XXEXTRACTUW, Convert__RegVSFRC1_0__RegVSRC1_1__U4Imm1_2, 0, { MCK_RegVSFRC, MCK_RegVSRC, MCK_U4Imm }, },
  { 13191 /* xxinsertw */, PPC::XXINSERTW, Convert__RegVSRC1_0__Tie0__RegVSRC1_1__U4Imm1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_U4Imm }, },
  { 13201 /* xxland */, PPC::XXLAND, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13208 /* xxlandc */, PPC::XXLANDC, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13216 /* xxleqv */, PPC::XXLEQV, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13223 /* xxlnand */, PPC::XXLNAND, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13231 /* xxlnor */, PPC::XXLNOR, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13238 /* xxlor */, PPC::XXLOR, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13244 /* xxlorc */, PPC::XXLORC, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13251 /* xxlxor */, PPC::XXLXOR, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13258 /* xxmrghd */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_0, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13266 /* xxmrghw */, PPC::XXMRGHW, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13274 /* xxmrgld */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__imm_95_3, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13282 /* xxmrglw */, PPC::XXMRGLW, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13290 /* xxperm */, PPC::XXPERM, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13297 /* xxpermdi */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__U2Imm1_3, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC, MCK_U2Imm }, },
  { 13306 /* xxpermr */, PPC::XXPERMR, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13314 /* xxsel */, PPC::XXSEL, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__RegVSRC1_3, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC }, },
  { 13320 /* xxsldwi */, PPC::XXSLDWI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_2__U2Imm1_3, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_RegVSRC, MCK_U2Imm }, },
  { 13328 /* xxspltd */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_0, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_0 }, },
  { 13328 /* xxspltd */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_3, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_1 }, },
  { 13336 /* xxspltib */, PPC::XXSPLTIB, Convert__RegVSRC1_0__U8Imm1_1, 0, { MCK_RegVSRC, MCK_U8Imm }, },
  { 13345 /* xxspltw */, PPC::XXSPLTW, Convert__RegVSRC1_0__RegVSRC1_1__U2Imm1_2, 0, { MCK_RegVSRC, MCK_RegVSRC, MCK_U2Imm }, },
  { 13353 /* xxswapd */, PPC::XXPERMDI, Convert__RegVSRC1_0__RegVSRC1_1__RegVSRC1_1__imm_95_2, 0, { MCK_RegVSRC, MCK_RegVSRC }, },
};

bool PPCAsmParser::
mnemonicIsValid(StringRef Mnemonic, unsigned VariantID) {
  // Find the appropriate table for this asm variant.
  const MatchEntry *Start, *End;
  switch (VariantID) {
  default: llvm_unreachable("invalid variant!");
  case 0: Start = std::begin(MatchTable0); End = std::end(MatchTable0); break;
  }
  // Search the table.
  auto MnemonicRange = std::equal_range(Start, End, Mnemonic, LessOpcode());
  return MnemonicRange.first != MnemonicRange.second;
}

unsigned PPCAsmParser::
MatchInstructionImpl(const OperandVector &Operands,
                     MCInst &Inst, uint64_t &ErrorInfo,
                     bool matchingInlineAsm, unsigned VariantID) {
  // Eliminate obvious mismatches.
  if (Operands.size() > 7) {
    ErrorInfo = 7;
    return Match_InvalidOperand;
  }

  // Get the current feature set.
  uint64_t AvailableFeatures = getAvailableFeatures();

  // Get the instruction mnemonic, which is the first token.
  StringRef Mnemonic = ((PPCOperand&)*Operands[0]).getToken();

  // Process all MnemonicAliases to remap the mnemonic.
  applyMnemonicAliases(Mnemonic, AvailableFeatures, VariantID);

  // Some state to try to produce better error messages.
  bool HadMatchOtherThanFeatures = false;
  bool HadMatchOtherThanPredicate = false;
  unsigned RetCode = Match_InvalidOperand;
  uint64_t MissingFeatures = ~0ULL;
  // Set ErrorInfo to the operand that mismatches if it is
  // wrong for all instances of the instruction.
  ErrorInfo = ~0ULL;
  // Find the appropriate table for this asm variant.
  const MatchEntry *Start, *End;
  switch (VariantID) {
  default: llvm_unreachable("invalid variant!");
  case 0: Start = std::begin(MatchTable0); End = std::end(MatchTable0); break;
  }
  // Search the table.
  auto MnemonicRange = std::equal_range(Start, End, Mnemonic, LessOpcode());

  // Return a more specific error code if no mnemonics match.
  if (MnemonicRange.first == MnemonicRange.second)
    return Match_MnemonicFail;

  for (const MatchEntry *it = MnemonicRange.first, *ie = MnemonicRange.second;
       it != ie; ++it) {
    // equal_range guarantees that instruction mnemonic matches.
    assert(Mnemonic == it->getMnemonic());
    bool OperandsValid = true;
    for (unsigned FormalIdx = 0, ActualIdx = 1; FormalIdx != 6; ++FormalIdx) {
      auto Formal = static_cast<MatchClassKind>(it->Classes[FormalIdx]);
      if (ActualIdx >= Operands.size()) {
        OperandsValid = (Formal == InvalidMatchClass) || isSubclass(Formal, OptionalMatchClass);
        if (!OperandsValid) ErrorInfo = ActualIdx;
        break;
      }
      MCParsedAsmOperand &Actual = *Operands[ActualIdx];
      unsigned Diag = validateOperandClass(Actual, Formal);
      if (Diag == Match_Success) {
        ++ActualIdx;
        continue;
      }
      // If the generic handler indicates an invalid operand
      // failure, check for a special case.
      if (Diag == Match_InvalidOperand) {
        Diag = validateTargetOperandClass(Actual, Formal);
        if (Diag == Match_Success) {
          ++ActualIdx;
          continue;
        }
      }
      // If current formal operand wasn't matched and it is optional
      // then try to match next formal operand
      if (Diag == Match_InvalidOperand && isSubclass(Formal, OptionalMatchClass)) {
        continue;
      }
      // If this operand is broken for all of the instances of this
      // mnemonic, keep track of it so we can report loc info.
      // If we already had a match that only failed due to a
      // target predicate, that diagnostic is preferred.
      if (!HadMatchOtherThanPredicate &&
          (it == MnemonicRange.first || ErrorInfo <= ActualIdx)) {
        ErrorInfo = ActualIdx;
        // InvalidOperand is the default. Prefer specificity.
        if (Diag != Match_InvalidOperand)
          RetCode = Diag;
      }
      // Otherwise, just reject this instance of the mnemonic.
      OperandsValid = false;
      break;
    }

    if (!OperandsValid) continue;
    if ((AvailableFeatures & it->RequiredFeatures) != it->RequiredFeatures) {
      HadMatchOtherThanFeatures = true;
      uint64_t NewMissingFeatures = it->RequiredFeatures & ~AvailableFeatures;
      if (countPopulation(NewMissingFeatures) <=
          countPopulation(MissingFeatures))
        MissingFeatures = NewMissingFeatures;
      continue;
    }

    Inst.clear();

    Inst.setOpcode(it->Opcode);
    // We have a potential match but have not rendered the operands.
    // Check the target predicate to handle any context sensitive
    // constraints.
    // For example, Ties that are referenced multiple times must be
    // checked here to ensure the input is the same for each match
    // constraints. If we leave it any later the ties will have been
    // canonicalized
    unsigned MatchResult;
    if ((MatchResult = checkEarlyTargetMatchPredicate(Inst, Operands)) != Match_Success) {
      Inst.clear();
      RetCode = MatchResult;
      HadMatchOtherThanPredicate = true;
      continue;
    }

    if (matchingInlineAsm) {
      convertToMapAndConstraints(it->ConvertFn, Operands);
      return Match_Success;
    }

    // We have selected a definite instruction, convert the parsed
    // operands into the appropriate MCInst.
    convertToMCInst(it->ConvertFn, Inst, it->Opcode, Operands);

    // We have a potential match. Check the target predicate to
    // handle any context sensitive constraints.
    if ((MatchResult = checkTargetMatchPredicate(Inst)) != Match_Success) {
      Inst.clear();
      RetCode = MatchResult;
      HadMatchOtherThanPredicate = true;
      continue;
    }

    std::string Info;
    if (MII.get(Inst.getOpcode()).getDeprecatedInfo(Inst, getSTI(), Info)) {
      SMLoc Loc = ((PPCOperand&)*Operands[0]).getStartLoc();
      getParser().Warning(Loc, Info, None);
    }
    return Match_Success;
  }

  // Okay, we had no match.  Try to return a useful error code.
  if (HadMatchOtherThanPredicate || !HadMatchOtherThanFeatures)
    return RetCode;

  // Missing feature matches return which features were missing
  ErrorInfo = MissingFeatures;
  return Match_MissingFeature;
}

#endif // GET_MATCHER_IMPLEMENTATION

