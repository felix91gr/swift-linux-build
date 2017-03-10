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

  enum OperandMatchResultTy {
    MatchOperand_Success,    // operand matched successfully
    MatchOperand_NoMatch,    // operand did not match
    MatchOperand_ParseFail   // operand matched but had errors
  };
  OperandMatchResultTy MatchOperandParserImpl(
    OperandVector &Operands,
    StringRef Mnemonic);
  OperandMatchResultTy tryCustomParseOperand(
    OperandVector &Operands,
    unsigned MCK);

#endif // GET_ASSEMBLER_HEADER_INFO


#ifdef GET_OPERAND_DIAGNOSTIC_TYPES
#undef GET_OPERAND_DIAGNOSTIC_TYPES

#endif // GET_OPERAND_DIAGNOSTIC_TYPES


#ifdef GET_REGISTER_MATCHER
#undef GET_REGISTER_MATCHER

// Flags for subtarget features that participate in instruction matching.
enum SubtargetFeatureFlag : uint16_t {
  Feature_FeatureDistinctOps = (1ULL << 0),
  Feature_FeatureLoadStoreOnCond = (1ULL << 5),
  Feature_FeatureLoadStoreOnCond2 = (1ULL << 6),
  Feature_FeatureHighWord = (1ULL << 3),
  Feature_FeatureFPExtension = (1ULL << 1),
  Feature_FeaturePopulationCount = (1ULL << 8),
  Feature_FeatureFastSerialization = (1ULL << 2),
  Feature_FeatureInterlockedAccess1 = (1ULL << 4),
  Feature_FeatureMiscellaneousExtensions = (1ULL << 7),
  Feature_FeatureTransactionalExecution = (1ULL << 10),
  Feature_FeatureProcessorAssist = (1ULL << 9),
  Feature_FeatureVector = (1ULL << 11),
  Feature_None = 0
};

#endif // GET_REGISTER_MATCHER


#ifdef GET_SUBTARGET_FEATURE_NAME
#undef GET_SUBTARGET_FEATURE_NAME

// User-level names for subtarget features that participate in
// instruction matching.
static const char *getSubtargetFeatureName(uint64_t Val) {
  switch(Val) {
  case Feature_FeatureDistinctOps: return "distinct-ops";
  case Feature_FeatureLoadStoreOnCond: return "load-store-on-cond";
  case Feature_FeatureLoadStoreOnCond2: return "load-store-on-cond-2";
  case Feature_FeatureHighWord: return "high-word";
  case Feature_FeatureFPExtension: return "fp-extension";
  case Feature_FeaturePopulationCount: return "population-count";
  case Feature_FeatureFastSerialization: return "fast-serialization";
  case Feature_FeatureInterlockedAccess1: return "interlocked-access1";
  case Feature_FeatureMiscellaneousExtensions: return "miscellaneous-extensions";
  case Feature_FeatureTransactionalExecution: return "transactional-execution";
  case Feature_FeatureProcessorAssist: return "processor-assist";
  case Feature_FeatureVector: return "vector";
  default: return "(unknown)";
  }
}

#endif // GET_SUBTARGET_FEATURE_NAME


#ifdef GET_MATCHER_IMPLEMENTATION
#undef GET_MATCHER_IMPLEMENTATION

namespace {
enum OperatorConversionKind {
  CVT_Done,
  CVT_Reg,
  CVT_Tied,
  CVT_95_addRegOperands,
  CVT_95_addBDXAddrOperands,
  CVT_95_addImmOperands,
  CVT_95_addBDAddrOperands,
  CVT_95_addImmTLSOperands,
  CVT_95_addBDLAddrOperands,
  CVT_95_addAccessRegOperands,
  CVT_imm_95_0,
  CVT_95_addBDVAddrOperands,
  CVT_NUM_CONVERTERS
};

enum InstructionConversionKind {
  Convert__GR321_0__Tie0__BDXAddr64Disp123_1,
  Convert__FP641_0__Tie0__BDXAddr64Disp123_1,
  Convert__FP641_0__Tie0__FP641_1,
  Convert__FP321_0__Tie0__BDXAddr64Disp123_1,
  Convert__FP321_0__Tie0__FP321_1,
  Convert__GR321_0__Tie0__S32Imm1_1,
  Convert__GR641_0__Tie0__BDXAddr64Disp203_1,
  Convert__GR641_0__Tie0__S32Imm1_1,
  Convert__GR641_0__Tie0__GR321_1,
  Convert__GR641_0__Tie0__S16Imm1_1,
  Convert__GR641_0__GR641_1__S16Imm1_2,
  Convert__GR641_0__Tie0__GR641_1,
  Convert__GR641_0__GR641_1__GR641_2,
  Convert__BDAddr64Disp202_0__S8Imm1_1,
  Convert__GR321_0__Tie0__S16Imm1_1,
  Convert__GR321_0__GR321_1__S16Imm1_2,
  Convert__GR321_0__Tie0__BDXAddr64Disp203_1,
  Convert__GRH321_0__Tie0__S32Imm1_1,
  Convert__GR321_0__Tie0__GR321_1,
  Convert__GR321_0__Tie0__U32Imm1_1,
  Convert__GR641_0__Tie0__U32Imm1_1,
  Convert__GR321_0__GR321_1__GR321_2,
  Convert__FP1281_0__Tie0__FP1281_1,
  Convert__GR641_0__ADDR641_1,
  Convert__U4Imm1_0__BDXAddr64Disp123_1,
  Convert__U4Imm1_0__GR641_1,
  Convert__ADDR641_0,
  Convert__GR641_0__PCRelTLS162_1,
  Convert__GR641_0__PCRelTLS322_1,
  Convert__U4Imm1_0__PCRel161_1,
  Convert__U4Imm1_0__PCRel321_1,
  Convert__GR321_0__Tie0__PCRel161_1,
  Convert__GR641_0__Tie0__PCRel161_1,
  Convert__GR641_0__Tie0__GR641_1__PCRel161_2,
  Convert__GR321_0__BDXAddr64Disp123_1,
  Convert__FP641_0__BDXAddr64Disp123_1,
  Convert__FP641_0__FP641_1,
  Convert__FP641_0__GR321_1,
  Convert__FP641_0__GR641_1,
  Convert__FP641_0__U4Imm1_1__GR321_2__U4Imm1_3,
  Convert__FP641_0__U4Imm1_1__GR641_2__U4Imm1_3,
  Convert__FP321_0__BDXAddr64Disp123_1,
  Convert__FP321_0__FP321_1,
  Convert__FP321_0__GR321_1,
  Convert__FP321_0__GR641_1,
  Convert__FP321_0__U4Imm1_1__GR321_2__U4Imm1_3,
  Convert__FP321_0__U4Imm1_1__GR641_2__U4Imm1_3,
  Convert__GR321_0__U4Imm1_1__FP641_2,
  Convert__GR321_0__U4Imm1_1__FP321_2,
  Convert__GR321_0__S32Imm1_1,
  Convert__GR321_0__U4Imm1_1__FP1281_2,
  Convert__GR641_0__BDXAddr64Disp203_1,
  Convert__GR641_0__U4Imm1_1__FP641_2,
  Convert__GR641_0__U4Imm1_1__FP321_2,
  Convert__GR641_0__S32Imm1_1,
  Convert__GR641_0__GR321_1,
  Convert__GR641_0__PCRel321_1,
  Convert__GR641_0__S16Imm1_1,
  Convert__BDAddr64Disp122_0__S16Imm1_1,
  Convert__GR641_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2,
  Convert__GR641_0__S8Imm1_1__U4Imm1_2__PCRel161_3,
  Convert__GR641_0__S8Imm1_1__PCRel161_2,
  Convert__GR641_0__S16Imm1_1__U4Imm1_2,
  Convert__GR641_0__GR641_1,
  Convert__GR641_0__GR641_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR641_0__GR641_1__BDAddr64Disp122_2,
  Convert__GR641_0__GR641_1__U4Imm1_2__PCRel161_3,
  Convert__GR641_0__GR641_1__PCRel161_2,
  Convert__GR641_0__GR641_1__U4Imm1_2,
  Convert__GR641_0__U4Imm1_1__FP1281_2,
  Convert__GRH321_0__BDXAddr64Disp203_1,
  Convert__GR321_0__S16Imm1_1,
  Convert__GR321_0__PCRel321_1,
  Convert__GR321_0__BDXAddr64Disp203_1,
  Convert__GR321_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2,
  Convert__GRH321_0__S32Imm1_1,
  Convert__GR321_0__S8Imm1_1__U4Imm1_2__PCRel161_3,
  Convert__GR321_0__S8Imm1_1__PCRel161_2,
  Convert__GR321_0__S16Imm1_1__U4Imm1_2,
  Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1,
  Convert__GR321_0__U4Imm1_1__FP641_2__U4Imm1_3,
  Convert__GR321_0__U4Imm1_1__FP321_2__U4Imm1_3,
  Convert__BDAddr64Disp122_0__U16Imm1_1,
  Convert__GR321_0__U32Imm1_1,
  Convert__GR321_0__U16Imm1_1__U4Imm1_2,
  Convert__GR321_0__U16Imm1_1,
  Convert__GR321_0__U4Imm1_1__FP1281_2__U4Imm1_3,
  Convert__GR641_0__U4Imm1_1__FP641_2__U4Imm1_3,
  Convert__GR641_0__U4Imm1_1__FP321_2__U4Imm1_3,
  Convert__GR641_0__U32Imm1_1,
  Convert__GR641_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2,
  Convert__GR641_0__U8Imm1_1__U4Imm1_2__PCRel161_3,
  Convert__GR641_0__U8Imm1_1__PCRel161_2,
  Convert__GR641_0__U16Imm1_1__U4Imm1_2,
  Convert__GR641_0__U16Imm1_1,
  Convert__GR641_0__U4Imm1_1__FP1281_2__U4Imm1_3,
  Convert__BDAddr64Disp122_0__U8Imm1_1,
  Convert__GR321_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2,
  Convert__GRH321_0__U32Imm1_1,
  Convert__GR321_0__U8Imm1_1__U4Imm1_2__PCRel161_3,
  Convert__GR321_0__U8Imm1_1__PCRel161_2,
  Convert__BDAddr64Disp202_0__U8Imm1_1,
  Convert__GR321_0__GR321_1,
  Convert__GR321_0__GR321_1__U4Imm1_2__BDAddr64Disp122_3,
  Convert__GR321_0__GR321_1__BDAddr64Disp122_2,
  Convert__GR321_0__GR321_1__U4Imm1_2__PCRel161_3,
  Convert__GR321_0__GR321_1__PCRel161_2,
  Convert__GR321_0__GR321_1__U4Imm1_2,
  Convert__GR641_0__GR641_1__Tie0__Tie1,
  Convert__FP641_0__FP641_2__FP641_1,
  Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp122_2,
  Convert__GR641_0__Tie0__GR641_1__BDAddr64Disp202_2,
  Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp202_2,
  Convert__FP1281_0__FP1281_1,
  Convert__FP1281_0__GR321_1,
  Convert__FP1281_0__GR641_1,
  Convert__FP1281_0__U4Imm1_1__GR321_2__U4Imm1_3,
  Convert__FP1281_0__U4Imm1_1__GR641_2__U4Imm1_3,
  Convert__GR1281_0__Tie0__BDXAddr64Disp203_1,
  Convert__GR1281_0__Tie0__GR641_1,
  Convert__GR1281_0__Tie0__GR321_1,
  Convert__GR321_0__AccessReg1_1,
  Convert__BDAddr64Disp122_0__BDAddr64Disp122_1__GR641_2,
  Convert__GR321_0,
  Convert__GR641_0__BDXAddr64Disp123_1,
  Convert__FP641_0__U4Imm1_1__FP641_2,
  Convert__FP641_0__U4Imm1_1__FP641_2__U4Imm1_3,
  Convert__FP321_0__U4Imm1_1__FP321_2,
  Convert__FP321_0__U4Imm1_1__FP321_2__U4Imm1_3,
  Convert__FP1281_0__U4Imm1_1__FP1281_2,
  Convert__FP1281_0__U4Imm1_1__FP1281_2__U4Imm1_3,
  Convert__GR1281_0__GR641_1,
  Convert__GR641_0__Tie0__BDXAddr64Disp123_1,
  Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp122_2,
  Convert__GRH321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2,
  Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2,
  Convert__GRH321_0__Tie0__U16Imm1_1,
  Convert__GR321_0__Tie0__U16Imm1_1,
  Convert__PCRel161_0,
  Convert__PCRel321_0,
  Convert__GR321_0__GR321_1__BDAddr64Disp202_2,
  Convert__GR641_0__GR641_1__BDAddr64Disp202_2,
  Convert__GR321_0__BDXAddr64Disp123_1__U4Imm1_2,
  Convert__FP641_0__FP321_1,
  Convert__FP641_0__BDXAddr64Disp203_1,
  Convert__FP321_0__FP641_1,
  Convert__FP321_0__U4Imm1_1__FP641_2__U4Imm1_3,
  Convert__FP321_0__BDXAddr64Disp203_1,
  Convert__GR641_0__FP641_1,
  Convert__GRH321_0__GRH321_1__BDAddr64Disp202_2,
  Convert__GR321_0__Tie0__BDAddr64Disp202_1__U4Imm1_2,
  Convert__GR321_0__Tie0__BDAddr64Disp202_1,
  Convert__GR641_0__Tie0__BDAddr64Disp202_1__U4Imm1_2,
  Convert__GR641_0__Tie0__BDAddr64Disp202_1,
  Convert__GR641_0__Tie0__S16Imm1_1__U4Imm1_2,
  Convert__GR641_0__Tie0__GR641_1__U4Imm1_2,
  Convert__GR321_0__Tie0__S16Imm1_1__U4Imm1_2,
  Convert__GR321_0__Tie0__GR321_1__U4Imm1_2,
  Convert__FP1281_0__BDXAddr64Disp123_1,
  Convert__FP1281_0__FP641_1,
  Convert__FP1281_0__FP321_1,
  Convert__FP641_0,
  Convert__FP321_0,
  Convert__FP1281_0,
  Convert__FP641_0__Tie0__FP641_1__BDXAddr64Disp123_2,
  Convert__FP641_0__Tie0__FP641_1__FP641_2,
  Convert__FP321_0__Tie0__FP321_1__BDXAddr64Disp123_2,
  Convert__FP321_0__Tie0__FP321_1__FP321_2,
  Convert__FP641_0__Tie0__FP321_1,
  Convert__BDXAddr64Disp123_0__BDAddr64Disp122_1__GR641_2,
  Convert__FP1281_0__Tie0__BDXAddr64Disp123_1,
  Convert__FP1281_0__Tie0__FP641_1,
  Convert__GRH321_0__Tie0__U32Imm1_1,
  Convert__imm_95_0__BDXAddr64Disp123_0,
  Convert__imm_95_0__GR641_0,
  Convert__U4Imm1_0__BDXAddr64Disp203_1,
  Convert_NoOperands,
  Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4,
  Convert__GRH321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4,
  Convert__GR321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4,
  Convert__GR321_0__GR321_1__BDAddr32Disp202_2,
  Convert__GR641_0__GR641_1__BDAddr32Disp202_2,
  Convert__GR321_0__Tie0__BDAddr32Disp122_1,
  Convert__BDAddr64Disp122_0,
  Convert__GR321_0__BDAddr64Disp202_1__U4Imm1_2,
  Convert__GR321_0__BDAddr64Disp202_1,
  Convert__GR641_0__BDAddr64Disp202_1__U4Imm1_2,
  Convert__GR641_0__BDAddr64Disp202_1,
  Convert__BDAddr64Disp122_0__BDAddr64Disp122_1,
  Convert__U8Imm1_0,
  Convert__GRH321_0__U16Imm1_1,
  Convert__VR1281_0__VR1281_1__VR1281_2,
  Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3,
  Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3,
  Convert__VR1281_0__VR1281_1,
  Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3,
  Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2,
  Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0,
  Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3,
  Convert__VR1281_0__VR1281_1__U12Imm1_2,
  Convert__VR1281_0__U16Imm1_1,
  Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U2Imm1_2,
  Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U1Imm1_2,
  Convert__VR1281_0__U8Imm1_1__U8Imm1_2,
  Convert__VR1281_0__BDXAddr64Disp123_1,
  Convert__VR1281_0__BDXAddr64Disp123_1__U4Imm1_2,
  Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U4Imm1_2,
  Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U2Imm1_2,
  Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U1Imm1_2,
  Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U3Imm1_2,
  Convert__VR1281_0__Tie0__S16Imm1_1__U4Imm1_2,
  Convert__VR1281_0__Tie0__S16Imm1_1__U2Imm1_2,
  Convert__VR1281_0__Tie0__S16Imm1_1__U1Imm1_2,
  Convert__VR1281_0__Tie0__S16Imm1_1__U3Imm1_2,
  Convert__GR641_0__VR1281_1__BDAddr32Disp122_2,
  Convert__VR1281_0__GR321_1__BDAddr64Disp122_2,
  Convert__VR1281_0__VR1281_1__BDAddr64Disp122_2,
  Convert__VR1281_0__Tie0__GR321_1__BDAddr32Disp122_2,
  Convert__VR1281_0__Tie0__GR641_1__BDAddr32Disp122_2,
  Convert__VR1281_0__GR641_1__GR641_2,
  Convert__VR1281_0,
  Convert__VR1281_0__VR1281_1__U4Imm1_2,
  Convert__VR1281_0__VR1281_1__U16Imm1_2,
  Convert__VR1281_0__S16Imm1_1,
  Convert__VR1281_0__BDVAddr64Disp123_1__U2Imm1_2,
  Convert__VR1281_0__BDVAddr64Disp123_1__U1Imm1_2,
  Convert__VR1281_0__VR1281_1__VR1281_2__U8Imm1_3,
  Convert__VR1281_0__BDXAddr64Disp123_1__U2Imm1_2,
  Convert__VR1281_0__BDXAddr64Disp123_1__U1Imm1_2,
  Convert__VR1281_0__BDXAddr64Disp123_1__U3Imm1_2,
  Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0,
  Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4,
  Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3,
  Convert__VR641_0__VR641_1__VR641_2,
  Convert__VR641_0__VR641_1,
  Convert__VR641_0__VR641_1__VR641_2__VR641_3,
  Convert__VR641_0__VR641_1__U12Imm1_2,
  Convert__VR641_0__VR321_1,
  Convert__VR321_0__VR641_1__U4Imm1_2__U4Imm1_3,
  CVT_NUM_SIGNATURES
};

} // end anonymous namespace

static const uint8_t ConversionTable[CVT_NUM_SIGNATURES][13] = {
  // Convert__GR321_0__Tie0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP641_0__Tie0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP641_0__Tie0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP321_0__Tie0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP321_0__Tie0__FP321_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__S16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__GR641_1__S16Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__Tie0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__GR641_1__GR641_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__BDAddr64Disp202_0__S8Imm1_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__S16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__GR321_1__S16Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GRH321_0__Tie0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__GR321_1__GR321_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP1281_0__Tie0__FP1281_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__ADDR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__U4Imm1_0__BDXAddr64Disp123_1
  { CVT_95_addImmOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__U4Imm1_0__GR641_1
  { CVT_95_addImmOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__ADDR641_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__GR641_0__PCRelTLS162_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmTLSOperands, 2, CVT_Done },
  // Convert__GR641_0__PCRelTLS322_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmTLSOperands, 2, CVT_Done },
  // Convert__U4Imm1_0__PCRel161_1
  { CVT_95_addImmOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__U4Imm1_0__PCRel321_1
  { CVT_95_addImmOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__PCRel161_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__PCRel161_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__GR641_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP641_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP641_0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP641_0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP641_0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP641_0__U4Imm1_1__GR321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP641_0__U4Imm1_1__GR641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP321_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP321_0__FP321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP321_0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP321_0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP321_0__U4Imm1_1__GR321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP321_0__U4Imm1_1__GR641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP641_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP321_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR321_0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP1281_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR641_0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP641_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP321_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR641_0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__PCRel321_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__S16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__BDAddr64Disp122_0__S16Imm1_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__S8Imm1_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__S8Imm1_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__S16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__GR641_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR641_0__GR641_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__GR641_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP1281_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GRH321_0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR321_0__S16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__PCRel321_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR321_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GRH321_0__S32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__S8Imm1_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR321_0__S8Imm1_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__S16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1
  { CVT_95_addBDLAddrOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__BDAddr64Disp122_0__U16Imm1_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U4Imm1_1__FP1281_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__U8Imm1_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR641_0__U8Imm1_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__U16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR641_0__U4Imm1_1__FP1281_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__BDAddr64Disp122_0__U8Imm1_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GRH321_0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__U8Imm1_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR321_0__U8Imm1_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__BDAddr64Disp202_0__U8Imm1_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR321_0__GR321_1__U4Imm1_2__BDAddr64Disp122_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addBDAddrOperands, 4, CVT_Done },
  // Convert__GR321_0__GR321_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__GR321_1__U4Imm1_2__PCRel161_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR321_0__GR321_1__PCRel161_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__GR321_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1__Tie0__Tie1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Tied, 0, CVT_Tied, 1, CVT_Done },
  // Convert__FP641_0__FP641_2__FP641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 3, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__Tie0__GR641_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__FP1281_0__FP1281_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP1281_0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP1281_0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP1281_0__U4Imm1_1__GR321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP1281_0__U4Imm1_1__GR641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR1281_0__Tie0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR1281_0__Tie0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR1281_0__Tie0__GR321_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR321_0__AccessReg1_1
  { CVT_95_addRegOperands, 1, CVT_95_addAccessRegOperands, 2, CVT_Done },
  // Convert__BDAddr64Disp122_0__BDAddr64Disp122_1__GR641_2
  { CVT_95_addBDAddrOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__GR321_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__GR641_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP641_0__U4Imm1_1__FP641_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP641_0__U4Imm1_1__FP641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP321_0__U4Imm1_1__FP321_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP321_0__U4Imm1_1__FP321_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP1281_0__U4Imm1_1__FP1281_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP1281_0__U4Imm1_1__FP1281_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__GR1281_0__GR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GRH321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GRH321_0__Tie0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__GR321_0__Tie0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__PCRel161_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__PCRel321_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__GR321_0__GR321_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__BDXAddr64Disp123_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__FP641_0__FP321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP641_0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP321_0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP321_0__U4Imm1_1__FP641_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__FP321_0__BDXAddr64Disp203_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GRH321_0__GRH321_1__BDAddr64Disp202_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__BDAddr64Disp202_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__BDAddr64Disp202_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__BDAddr64Disp202_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__Tie0__BDAddr64Disp202_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__Tie0__S16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__Tie0__GR641_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__S16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__GR321_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__FP1281_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP1281_0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP1281_0__FP321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__FP641_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__FP321_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__FP1281_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__FP641_0__Tie0__FP641_1__BDXAddr64Disp123_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDXAddrOperands, 3, CVT_Done },
  // Convert__FP641_0__Tie0__FP641_1__FP641_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP321_0__Tie0__FP321_1__BDXAddr64Disp123_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDXAddrOperands, 3, CVT_Done },
  // Convert__FP321_0__Tie0__FP321_1__FP321_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP641_0__Tie0__FP321_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__BDXAddr64Disp123_0__BDAddr64Disp122_1__GR641_2
  { CVT_95_addBDXAddrOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__FP1281_0__Tie0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__FP1281_0__Tie0__FP641_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__GRH321_0__Tie0__U32Imm1_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__imm_95_0__BDXAddr64Disp123_0
  { CVT_imm_95_0, 0, CVT_95_addBDXAddrOperands, 1, CVT_Done },
  // Convert__imm_95_0__GR641_0
  { CVT_imm_95_0, 0, CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__U4Imm1_0__BDXAddr64Disp203_1
  { CVT_95_addImmOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert_NoOperands
  { CVT_Done },
  // Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__GRH321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__GR321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__GR321_0__GR321_1__BDAddr32Disp202_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR641_0__GR641_1__BDAddr32Disp202_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__GR321_0__Tie0__BDAddr32Disp122_1
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__BDAddr64Disp122_0
  { CVT_95_addBDAddrOperands, 1, CVT_Done },
  // Convert__GR321_0__BDAddr64Disp202_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR321_0__BDAddr64Disp202_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__GR641_0__BDAddr64Disp202_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__BDAddr64Disp202_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__BDAddr64Disp122_0__BDAddr64Disp122_1
  { CVT_95_addBDAddrOperands, 1, CVT_95_addBDAddrOperands, 2, CVT_Done },
  // Convert__U8Imm1_0
  { CVT_95_addImmOperands, 1, CVT_Done },
  // Convert__GRH321_0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addRegOperands, 4, CVT_Done },
  // Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__VR1281_0__VR1281_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_imm_95_0, 0, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__VR1281_0__VR1281_1__U12Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__U16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U2Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDVAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U1Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDVAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__U8Imm1_1__U8Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__BDXAddr64Disp123_1
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_Done },
  // Convert__VR1281_0__BDXAddr64Disp123_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U2Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U1Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U3Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__S16Imm1_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__S16Imm1_1__U2Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__S16Imm1_1__U1Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__S16Imm1_1__U3Imm1_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addImmOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__GR641_0__VR1281_1__BDAddr32Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__GR321_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__BDAddr64Disp122_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__GR321_1__BDAddr32Disp122_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__Tie0__GR641_1__BDAddr32Disp122_2
  { CVT_95_addRegOperands, 1, CVT_Tied, 0, CVT_95_addRegOperands, 2, CVT_95_addBDAddrOperands, 3, CVT_Done },
  // Convert__VR1281_0__GR641_1__GR641_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__VR1281_0
  { CVT_95_addRegOperands, 1, CVT_Done },
  // Convert__VR1281_0__VR1281_1__U4Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__U16Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__S16Imm1_1
  { CVT_95_addRegOperands, 1, CVT_95_addImmOperands, 2, CVT_Done },
  // Convert__VR1281_0__BDVAddr64Disp123_1__U2Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDVAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__BDVAddr64Disp123_1__U1Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDVAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__U8Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__VR1281_0__BDXAddr64Disp123_1__U2Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__BDXAddr64Disp123_1__U1Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__BDXAddr64Disp123_1__U3Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addBDXAddrOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addRegOperands, 4, CVT_imm_95_0, 0, CVT_Done },
  // Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addRegOperands, 4, CVT_95_addImmOperands, 5, CVT_Done },
  // Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
  // Convert__VR641_0__VR641_1__VR641_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_Done },
  // Convert__VR641_0__VR641_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__VR641_0__VR641_1__VR641_2__VR641_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addRegOperands, 3, CVT_95_addRegOperands, 4, CVT_Done },
  // Convert__VR641_0__VR641_1__U12Imm1_2
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_Done },
  // Convert__VR641_0__VR321_1
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_Done },
  // Convert__VR321_0__VR641_1__U4Imm1_2__U4Imm1_3
  { CVT_95_addRegOperands, 1, CVT_95_addRegOperands, 2, CVT_95_addImmOperands, 3, CVT_95_addImmOperands, 4, CVT_Done },
};

void SystemZAsmParser::
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
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addRegOperands(Inst, 1);
      break;
    case CVT_Tied:
      Inst.addOperand(Inst.getOperand(OpIdx));
      break;
    case CVT_95_addRegOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addRegOperands(Inst, 1);
      break;
    case CVT_95_addBDXAddrOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addBDXAddrOperands(Inst, 3);
      break;
    case CVT_95_addImmOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addImmOperands(Inst, 1);
      break;
    case CVT_95_addBDAddrOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addBDAddrOperands(Inst, 2);
      break;
    case CVT_95_addImmTLSOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addImmTLSOperands(Inst, 2);
      break;
    case CVT_95_addBDLAddrOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addBDLAddrOperands(Inst, 3);
      break;
    case CVT_95_addAccessRegOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addAccessRegOperands(Inst, 1);
      break;
    case CVT_imm_95_0:
      Inst.addOperand(MCOperand::createImm(0));
      break;
    case CVT_95_addBDVAddrOperands:
      static_cast<SystemZOperand&>(*Operands[OpIdx]).addBDVAddrOperands(Inst, 3);
      break;
    }
  }
}

void SystemZAsmParser::
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
    case CVT_95_addRegOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addBDXAddrOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 3;
      break;
    case CVT_95_addImmOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_95_addBDAddrOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 2;
      break;
    case CVT_95_addImmTLSOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 2;
      break;
    case CVT_95_addBDLAddrOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 3;
      break;
    case CVT_95_addAccessRegOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 1;
      break;
    case CVT_imm_95_0:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("");
      ++NumMCOperands;
      break;
    case CVT_95_addBDVAddrOperands:
      Operands[*(p + 1)]->setMCOperandNum(NumMCOperands);
      Operands[*(p + 1)]->setConstraint("m");
      NumMCOperands += 3;
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
  MCK_CCRegs, // register class 'CCRegs'
  MCK_ADDR128Bit, // register class 'ADDR128Bit'
  MCK_FP128Bit, // register class 'FP128Bit'
  MCK_GR128Bit, // register class 'GR128Bit'
  MCK_ADDR32Bit, // register class 'ADDR32Bit'
  MCK_ADDR64Bit, // register class 'ADDR64Bit'
  MCK_FP32Bit, // register class 'FP32Bit'
  MCK_FP64Bit, // register class 'FP64Bit'
  MCK_GR32Bit, // register class 'GR32Bit'
  MCK_GR64Bit, // register class 'GR64Bit'
  MCK_GRH32Bit, // register class 'GRH32Bit'
  MCK_VF128Bit, // register class 'VF128Bit'
  MCK_Reg13, // derived register class
  MCK_GRX32Bit, // register class 'GRX32Bit'
  MCK_VR128Bit, // register class 'VR128Bit'
  MCK_VR32Bit, // register class 'VR32Bit'
  MCK_VR64Bit, // register class 'VR64Bit'
  MCK_AnyRegBit, // register class 'AnyRegBit'
  MCK_ADDR128, // user defined class 'ADDR128AsmOperand'
  MCK_ADDR32, // user defined class 'ADDR32AsmOperand'
  MCK_ADDR64, // user defined class 'ADDR64AsmOperand'
  MCK_AccessReg, // user defined class 'AccessReg'
  MCK_AnyReg, // user defined class 'AnyRegAsmOperand'
  MCK_BDAddr32Disp12, // user defined class 'BDAddr32Disp12'
  MCK_BDAddr32Disp20, // user defined class 'BDAddr32Disp20'
  MCK_BDAddr64Disp12, // user defined class 'BDAddr64Disp12'
  MCK_BDAddr64Disp20, // user defined class 'BDAddr64Disp20'
  MCK_BDLAddr64Disp12Len8, // user defined class 'BDLAddr64Disp12Len8'
  MCK_BDVAddr64Disp12, // user defined class 'BDVAddr64Disp12'
  MCK_BDXAddr64Disp12, // user defined class 'BDXAddr64Disp12'
  MCK_BDXAddr64Disp20, // user defined class 'BDXAddr64Disp20'
  MCK_FP128, // user defined class 'FP128AsmOperand'
  MCK_FP32, // user defined class 'FP32AsmOperand'
  MCK_FP64, // user defined class 'FP64AsmOperand'
  MCK_GR128, // user defined class 'GR128AsmOperand'
  MCK_GR32, // user defined class 'GR32AsmOperand'
  MCK_GR64, // user defined class 'GR64AsmOperand'
  MCK_GRH32, // user defined class 'GRH32AsmOperand'
  MCK_GRX32, // user defined class 'GRX32AsmOperand'
  MCK_Imm, // user defined class 'ImmAsmOperand'
  MCK_PCRel16, // user defined class 'PCRel16'
  MCK_PCRel32, // user defined class 'PCRel32'
  MCK_PCRelTLS16, // user defined class 'PCRelTLS16'
  MCK_PCRelTLS32, // user defined class 'PCRelTLS32'
  MCK_S16Imm, // user defined class 'S16Imm'
  MCK_S32Imm, // user defined class 'S32Imm'
  MCK_S8Imm, // user defined class 'S8Imm'
  MCK_U12Imm, // user defined class 'U12Imm'
  MCK_U16Imm, // user defined class 'U16Imm'
  MCK_U1Imm, // user defined class 'U1Imm'
  MCK_U2Imm, // user defined class 'U2Imm'
  MCK_U32Imm, // user defined class 'U32Imm'
  MCK_U3Imm, // user defined class 'U3Imm'
  MCK_U48Imm, // user defined class 'U48Imm'
  MCK_U4Imm, // user defined class 'U4Imm'
  MCK_U6Imm, // user defined class 'U6Imm'
  MCK_U8Imm, // user defined class 'U8Imm'
  MCK_VF128, // user defined class 'VF128AsmOperand'
  MCK_VR128, // user defined class 'VR128AsmOperand'
  MCK_VR32, // user defined class 'VR32AsmOperand'
  MCK_VR64, // user defined class 'VR64AsmOperand'
  NumMatchClassKinds
};

}

static MatchClassKind matchTokenString(StringRef Name) {
  return InvalidMatchClass;
}

/// isSubclass - Compute whether \p A is a subclass of \p B.
static bool isSubclass(MatchClassKind A, MatchClassKind B) {
  if (A == B)
    return true;

  switch (A) {
  default:
    return false;

  case MCK_ADDR128Bit:
    return B == MCK_GR128Bit;

  case MCK_ADDR32Bit:
    switch (B) {
    default: return false;
    case MCK_GR32Bit: return true;
    case MCK_GRX32Bit: return true;
    }

  case MCK_ADDR64Bit:
    switch (B) {
    default: return false;
    case MCK_GR64Bit: return true;
    case MCK_AnyRegBit: return true;
    }

  case MCK_FP32Bit:
    return B == MCK_VR32Bit;

  case MCK_FP64Bit:
    switch (B) {
    default: return false;
    case MCK_Reg13: return true;
    case MCK_VR64Bit: return true;
    case MCK_AnyRegBit: return true;
    }

  case MCK_GR32Bit:
    return B == MCK_GRX32Bit;

  case MCK_GR64Bit:
    return B == MCK_AnyRegBit;

  case MCK_GRH32Bit:
    return B == MCK_GRX32Bit;

  case MCK_VF128Bit:
    switch (B) {
    default: return false;
    case MCK_Reg13: return true;
    case MCK_VR128Bit: return true;
    case MCK_AnyRegBit: return true;
    }

  case MCK_Reg13:
    return B == MCK_AnyRegBit;
  }
}

static unsigned validateOperandClass(MCParsedAsmOperand &GOp, MatchClassKind Kind) {
  SystemZOperand &Operand = (SystemZOperand&)GOp;
  if (Kind == InvalidMatchClass)
    return MCTargetAsmParser::Match_InvalidOperand;

  if (Operand.isToken())
    return isSubclass(matchTokenString(Operand.getToken()), Kind) ?
             MCTargetAsmParser::Match_Success :
             MCTargetAsmParser::Match_InvalidOperand;

  switch (Kind) {
  default: break;
  // 'ADDR128' class
  case MCK_ADDR128:
    if (Operand.isADDR128())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'ADDR32' class
  case MCK_ADDR32:
    if (Operand.isADDR32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'ADDR64' class
  case MCK_ADDR64:
    if (Operand.isADDR64())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'AccessReg' class
  case MCK_AccessReg:
    if (Operand.isAccessReg())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'AnyReg' class
  case MCK_AnyReg:
    if (Operand.isAnyReg())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDAddr32Disp12' class
  case MCK_BDAddr32Disp12:
    if (Operand.isBDAddr32Disp12())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDAddr32Disp20' class
  case MCK_BDAddr32Disp20:
    if (Operand.isBDAddr32Disp20())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDAddr64Disp12' class
  case MCK_BDAddr64Disp12:
    if (Operand.isBDAddr64Disp12())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDAddr64Disp20' class
  case MCK_BDAddr64Disp20:
    if (Operand.isBDAddr64Disp20())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDLAddr64Disp12Len8' class
  case MCK_BDLAddr64Disp12Len8:
    if (Operand.isBDLAddr64Disp12Len8())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDVAddr64Disp12' class
  case MCK_BDVAddr64Disp12:
    if (Operand.isBDVAddr64Disp12())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDXAddr64Disp12' class
  case MCK_BDXAddr64Disp12:
    if (Operand.isBDXAddr64Disp12())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'BDXAddr64Disp20' class
  case MCK_BDXAddr64Disp20:
    if (Operand.isBDXAddr64Disp20())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'FP128' class
  case MCK_FP128:
    if (Operand.isFP128())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'FP32' class
  case MCK_FP32:
    if (Operand.isFP32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'FP64' class
  case MCK_FP64:
    if (Operand.isFP64())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'GR128' class
  case MCK_GR128:
    if (Operand.isGR128())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'GR32' class
  case MCK_GR32:
    if (Operand.isGR32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'GR64' class
  case MCK_GR64:
    if (Operand.isGR64())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'GRH32' class
  case MCK_GRH32:
    if (Operand.isGRH32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'GRX32' class
  case MCK_GRX32:
    if (Operand.isGRX32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'Imm' class
  case MCK_Imm:
    if (Operand.isImm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'PCRel16' class
  case MCK_PCRel16:
    if (Operand.isImm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'PCRel32' class
  case MCK_PCRel32:
    if (Operand.isImm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'PCRelTLS16' class
  case MCK_PCRelTLS16:
    if (Operand.isImmTLS())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'PCRelTLS32' class
  case MCK_PCRelTLS32:
    if (Operand.isImmTLS())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S16Imm' class
  case MCK_S16Imm:
    if (Operand.isS16Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S32Imm' class
  case MCK_S32Imm:
    if (Operand.isS32Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'S8Imm' class
  case MCK_S8Imm:
    if (Operand.isS8Imm())
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
  // 'U32Imm' class
  case MCK_U32Imm:
    if (Operand.isU32Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U3Imm' class
  case MCK_U3Imm:
    if (Operand.isU3Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U48Imm' class
  case MCK_U48Imm:
    if (Operand.isU48Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U4Imm' class
  case MCK_U4Imm:
    if (Operand.isU4Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U6Imm' class
  case MCK_U6Imm:
    if (Operand.isU6Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'U8Imm' class
  case MCK_U8Imm:
    if (Operand.isU8Imm())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'VF128' class
  case MCK_VF128:
    if (Operand.isVF128())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'VR128' class
  case MCK_VR128:
    if (Operand.isVR128())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'VR32' class
  case MCK_VR32:
    if (Operand.isVR32())
      return MCTargetAsmParser::Match_Success;
    break;
  // 'VR64' class
  case MCK_VR64:
    if (Operand.isVR64())
      return MCTargetAsmParser::Match_Success;
    break;
  } // end switch (Kind)

  if (Operand.isReg()) {
    MatchClassKind OpKind;
    switch (Operand.getReg()) {
    default: OpKind = InvalidMatchClass; break;
    case SystemZ::R0L: OpKind = MCK_GR32Bit; break;
    case SystemZ::R1L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R2L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R3L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R4L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R5L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R6L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R7L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R8L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R9L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R10L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R11L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R12L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R13L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R14L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R15L: OpKind = MCK_ADDR32Bit; break;
    case SystemZ::R0H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R1H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R2H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R3H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R4H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R5H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R6H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R7H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R8H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R9H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R10H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R11H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R12H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R13H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R14H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R15H: OpKind = MCK_GRH32Bit; break;
    case SystemZ::R0D: OpKind = MCK_GR64Bit; break;
    case SystemZ::R1D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R2D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R3D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R4D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R5D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R6D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R7D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R8D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R9D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R10D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R11D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R12D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R13D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R14D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R15D: OpKind = MCK_ADDR64Bit; break;
    case SystemZ::R0Q: OpKind = MCK_GR128Bit; break;
    case SystemZ::R2Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R4Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R6Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R8Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R10Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R12Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::R14Q: OpKind = MCK_ADDR128Bit; break;
    case SystemZ::F0S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F1S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F2S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F3S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F4S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F5S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F6S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F7S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F8S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F9S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F10S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F11S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F12S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F13S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F14S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F15S: OpKind = MCK_FP32Bit; break;
    case SystemZ::F0D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F1D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F2D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F3D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F4D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F5D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F6D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F7D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F8D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F9D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F10D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F11D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F12D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F13D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F14D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F15D: OpKind = MCK_FP64Bit; break;
    case SystemZ::F16S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F17S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F18S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F19S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F20S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F21S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F22S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F23S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F24S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F25S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F26S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F27S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F28S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F29S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F30S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F31S: OpKind = MCK_VR32Bit; break;
    case SystemZ::F16D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F17D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F18D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F19D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F20D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F21D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F22D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F23D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F24D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F25D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F26D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F27D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F28D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F29D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F30D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F31D: OpKind = MCK_VR64Bit; break;
    case SystemZ::F0Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F1Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F4Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F5Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F8Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F9Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F12Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::F13Q: OpKind = MCK_FP128Bit; break;
    case SystemZ::V0: OpKind = MCK_VF128Bit; break;
    case SystemZ::V1: OpKind = MCK_VF128Bit; break;
    case SystemZ::V2: OpKind = MCK_VF128Bit; break;
    case SystemZ::V3: OpKind = MCK_VF128Bit; break;
    case SystemZ::V4: OpKind = MCK_VF128Bit; break;
    case SystemZ::V5: OpKind = MCK_VF128Bit; break;
    case SystemZ::V6: OpKind = MCK_VF128Bit; break;
    case SystemZ::V7: OpKind = MCK_VF128Bit; break;
    case SystemZ::V8: OpKind = MCK_VF128Bit; break;
    case SystemZ::V9: OpKind = MCK_VF128Bit; break;
    case SystemZ::V10: OpKind = MCK_VF128Bit; break;
    case SystemZ::V11: OpKind = MCK_VF128Bit; break;
    case SystemZ::V12: OpKind = MCK_VF128Bit; break;
    case SystemZ::V13: OpKind = MCK_VF128Bit; break;
    case SystemZ::V14: OpKind = MCK_VF128Bit; break;
    case SystemZ::V15: OpKind = MCK_VF128Bit; break;
    case SystemZ::V16: OpKind = MCK_VR128Bit; break;
    case SystemZ::V17: OpKind = MCK_VR128Bit; break;
    case SystemZ::V18: OpKind = MCK_VR128Bit; break;
    case SystemZ::V19: OpKind = MCK_VR128Bit; break;
    case SystemZ::V20: OpKind = MCK_VR128Bit; break;
    case SystemZ::V21: OpKind = MCK_VR128Bit; break;
    case SystemZ::V22: OpKind = MCK_VR128Bit; break;
    case SystemZ::V23: OpKind = MCK_VR128Bit; break;
    case SystemZ::V24: OpKind = MCK_VR128Bit; break;
    case SystemZ::V25: OpKind = MCK_VR128Bit; break;
    case SystemZ::V26: OpKind = MCK_VR128Bit; break;
    case SystemZ::V27: OpKind = MCK_VR128Bit; break;
    case SystemZ::V28: OpKind = MCK_VR128Bit; break;
    case SystemZ::V29: OpKind = MCK_VR128Bit; break;
    case SystemZ::V30: OpKind = MCK_VR128Bit; break;
    case SystemZ::V31: OpKind = MCK_VR128Bit; break;
    case SystemZ::CC: OpKind = MCK_CCRegs; break;
    }
    return isSubclass(OpKind, Kind) ? MCTargetAsmParser::Match_Success :
                                      MCTargetAsmParser::Match_InvalidOperand;
  }

  return MCTargetAsmParser::Match_InvalidOperand;
}

uint64_t SystemZAsmParser::
ComputeAvailableFeatures(const FeatureBitset& FB) const {
  uint64_t Features = 0;
  if ((FB[SystemZ::FeatureDistinctOps]))
    Features |= Feature_FeatureDistinctOps;
  if ((FB[SystemZ::FeatureLoadStoreOnCond]))
    Features |= Feature_FeatureLoadStoreOnCond;
  if ((FB[SystemZ::FeatureLoadStoreOnCond2]))
    Features |= Feature_FeatureLoadStoreOnCond2;
  if ((FB[SystemZ::FeatureHighWord]))
    Features |= Feature_FeatureHighWord;
  if ((FB[SystemZ::FeatureFPExtension]))
    Features |= Feature_FeatureFPExtension;
  if ((FB[SystemZ::FeaturePopulationCount]))
    Features |= Feature_FeaturePopulationCount;
  if ((FB[SystemZ::FeatureFastSerialization]))
    Features |= Feature_FeatureFastSerialization;
  if ((FB[SystemZ::FeatureInterlockedAccess1]))
    Features |= Feature_FeatureInterlockedAccess1;
  if ((FB[SystemZ::FeatureMiscellaneousExtensions]))
    Features |= Feature_FeatureMiscellaneousExtensions;
  if ((FB[SystemZ::FeatureTransactionalExecution]))
    Features |= Feature_FeatureTransactionalExecution;
  if ((FB[SystemZ::FeatureProcessorAssist]))
    Features |= Feature_FeatureProcessorAssist;
  if ((FB[SystemZ::FeatureVector]))
    Features |= Feature_FeatureVector;
  return Features;
}

static const char *const MnemonicTable =
    "\001a\003adb\004adbr\003aeb\004aebr\003afi\002ag\003agf\004agfi\004agfr"
    "\004aghi\005aghik\003agr\004agrk\004agsi\002ah\003ahi\004ahik\003ahy\003"
    "aih\002al\003alc\004alcg\005alcgr\004alcr\004alfi\003alg\004algf\005alg"
    "fi\005algfr\007alghsik\004algr\005algrk\006alhsik\003alr\004alrk\003aly"
    "\002ar\003ark\003asi\004axbr\002ay\004basr\002bc\003bcr\003ber\004bher\003"
    "bhr\004bler\004blhr\003blr\003bmr\004bner\005bnher\004bnhr\005bnler\005"
    "bnlhr\004bnlr\004bnmr\004bnor\004bnpr\004bnzr\003bor\003bpr\002br\004br"
    "as\005brasl\003brc\004brcl\004brct\005brctg\004brxh\005brxle\003bzr\001"
    "c\003cdb\004cdbr\005cdfbr\005cdgbr\006cdlfbr\006cdlgbr\003ceb\004cebr\005"
    "cefbr\005cegbr\006celfbr\006celgbr\005cfdbr\005cfebr\003cfi\005cfxbr\002"
    "cg\005cgdbr\005cgebr\003cgf\004cgfi\004cgfr\005cgfrl\003cgh\004cghi\005"
    "cghrl\005cghsi\004cgib\005cgibe\005cgibh\006cgibhe\005cgibl\006cgible\006"
    "cgiblh\006cgibne\006cgibnh\007cgibnhe\006cgibnl\007cgibnle\007cgibnlh\004"
    "cgij\005cgije\005cgijh\006cgijhe\005cgijl\006cgijle\006cgijlh\006cgijne"
    "\006cgijnh\007cgijnhe\006cgijnl\007cgijnle\007cgijnlh\004cgit\005cgite\005"
    "cgith\006cgithe\005cgitl\006cgitle\006cgitlh\006cgitne\006cgitnh\007cgi"
    "tnhe\006cgitnl\007cgitnle\007cgitnlh\003cgr\004cgrb\005cgrbe\005cgrbh\006"
    "cgrbhe\005cgrbl\006cgrble\006cgrblh\006cgrbne\006cgrbnh\007cgrbnhe\006c"
    "grbnl\007cgrbnle\007cgrbnlh\004cgrj\005cgrje\005cgrjh\006cgrjhe\005cgrj"
    "l\006cgrjle\006cgrjlh\006cgrjne\006cgrjnh\007cgrjnhe\006cgrjnl\007cgrjn"
    "le\007cgrjnlh\004cgrl\004cgrt\005cgrte\005cgrth\006cgrthe\005cgrtl\006c"
    "grtle\006cgrtlh\006cgrtne\006cgrtnh\007cgrtnhe\006cgrtnl\007cgrtnle\007"
    "cgrtnlh\005cgxbr\002ch\003chf\005chhsi\003chi\004chrl\004chsi\003chy\003"
    "cib\004cibe\004cibh\005cibhe\004cibl\005cible\005ciblh\005cibne\005cibn"
    "h\006cibnhe\005cibnl\006cibnle\006cibnlh\003cih\003cij\004cije\004cijh\005"
    "cijhe\004cijl\005cijle\005cijlh\005cijne\005cijnh\006cijnhe\005cijnl\006"
    "cijnle\006cijnlh\003cit\004cite\004cith\005cithe\004citl\005citle\005ci"
    "tlh\005citne\005citnh\006citnhe\005citnl\006citnle\006citnlh\002cl\003c"
    "lc\006clfdbr\006clfebr\006clfhsi\004clfi\005clfit\006clfite\006clfith\007"
    "clfithe\006clfitl\007clfitle\007clfitlh\007clfitne\007clfitnh\010clfitn"
    "he\007clfitnl\010clfitnle\010clfitnlh\006clfxbr\003clg\006clgdbr\006clg"
    "ebr\004clgf\005clgfi\005clgfr\006clgfrl\006clghrl\006clghsi\005clgib\006"
    "clgibe\006clgibh\007clgibhe\006clgibl\007clgible\007clgiblh\007clgibne\007"
    "clgibnh\010clgibnhe\007clgibnl\010clgibnle\010clgibnlh\005clgij\006clgi"
    "je\006clgijh\007clgijhe\006clgijl\007clgijle\007clgijlh\007clgijne\007c"
    "lgijnh\010clgijnhe\007clgijnl\010clgijnle\010clgijnlh\005clgit\006clgit"
    "e\006clgith\007clgithe\006clgitl\007clgitle\007clgitlh\007clgitne\007cl"
    "gitnh\010clgitnhe\007clgitnl\010clgitnle\010clgitnlh\004clgr\005clgrb\006"
    "clgrbe\006clgrbh\007clgrbhe\006clgrbl\007clgrble\007clgrblh\007clgrbne\007"
    "clgrbnh\010clgrbnhe\007clgrbnl\010clgrbnle\010clgrbnlh\005clgrj\006clgr"
    "je\006clgrjh\007clgrjhe\006clgrjl\007clgrjle\007clgrjlh\007clgrjne\007c"
    "lgrjnh\010clgrjnhe\007clgrjnl\010clgrjnle\010clgrjnlh\005clgrl\005clgrt"
    "\006clgrte\006clgrth\007clgrthe\006clgrtl\007clgrtle\007clgrtlh\007clgr"
    "tne\007clgrtnh\010clgrtnhe\007clgrtnl\010clgrtnle\010clgrtnlh\006clgxbr"
    "\004clhf\006clhhsi\005clhrl\003cli\004clib\005clibe\005clibh\006clibhe\005"
    "clibl\006clible\006cliblh\006clibne\006clibnh\007clibnhe\006clibnl\007c"
    "libnle\007clibnlh\004clih\004clij\005clije\005clijh\006clijhe\005clijl\006"
    "clijle\006clijlh\006clijne\006clijnh\007clijnhe\006clijnl\007clijnle\007"
    "clijnlh\004cliy\003clr\004clrb\005clrbe\005clrbh\006clrbhe\005clrbl\006"
    "clrble\006clrblh\006clrbne\006clrbnh\007clrbnhe\006clrbnl\007clrbnle\007"
    "clrbnlh\004clrj\005clrje\005clrjh\006clrjhe\005clrjl\006clrjle\006clrjl"
    "h\006clrjne\006clrjnh\007clrjnhe\006clrjnl\007clrjnle\007clrjnlh\004clr"
    "l\004clrt\005clrte\005clrth\006clrthe\005clrtl\006clrtle\006clrtlh\006c"
    "lrtne\006clrtnh\007clrtnhe\006clrtnl\007clrtnle\007clrtnlh\004clst\003c"
    "ly\005cpsdr\002cr\003crb\004crbe\004crbh\005crbhe\004crbl\005crble\005c"
    "rblh\005crbne\005crbnh\006crbnhe\005crbnl\006crbnle\006crbnlh\003crj\004"
    "crje\004crjh\005crjhe\004crjl\005crjle\005crjlh\005crjne\005crjnh\006cr"
    "jnhe\005crjnl\006crjnle\006crjnlh\003crl\003crt\004crte\004crth\005crth"
    "e\004crtl\005crtle\005crtlh\005crtne\005crtnh\006crtnhe\005crtnl\006crt"
    "nle\006crtnlh\002cs\003csg\003csy\004cxbr\005cxfbr\005cxgbr\006cxlfbr\006"
    "cxlgbr\002cy\003ddb\004ddbr\003deb\004debr\002dl\003dlg\004dlgr\003dlr\003"
    "dsg\004dsgf\005dsgfr\004dsgr\004dxbr\003ear\004ectg\004etnd\002ex\004ex"
    "rl\005fidbr\006fidbra\005fiebr\006fiebra\005fixbr\006fixbra\005flogr\002"
    "ic\003icm\004icmh\004icmy\003icy\004iihf\004iihh\004iihl\004iilf\004iil"
    "h\004iill\003ipm\001j\002je\002jg\003jge\003jgh\004jghe\003jgl\004jgle\004"
    "jglh\003jgm\004jgne\004jgnh\005jgnhe\004jgnl\005jgnle\005jgnlh\004jgnm\004"
    "jgno\004jgnp\004jgnz\003jgo\003jgp\003jgz\002jh\003jhe\002jl\003jle\003"
    "jlh\002jm\003jne\003jnh\004jnhe\003jnl\004jnle\004jnlh\003jnm\003jno\003"
    "jnp\003jnz\002jo\002jp\002jz\001l\002la\003laa\004laag\004laal\005laalg"
    "\003lan\004lang\003lao\004laog\004larl\003lax\004laxg\003lay\002lb\003l"
    "bh\003lbr\004lcbb\005lcdbr\005lcdfr\005lcebr\005lcgfr\004lcgr\003lcr\005"
    "lcxbr\002ld\003lde\004ldeb\005ldebr\004ldgr\003ldr\005ldxbr\006ldxbra\003"
    "ldy\002le\005ledbr\006ledbra\003ler\005lexbr\006lexbra\003ley\003lfh\002"
    "lg\003lgb\004lgbr\004lgdr\003lgf\004lgfi\004lgfr\005lgfrl\003lgh\004lgh"
    "i\004lghr\005lghrl\003lgr\004lgrl\002lh\003lhh\003lhi\003lhr\004lhrl\003"
    "lhy\003llc\004llch\004llcr\004llgc\005llgcr\004llgf\005llgfr\006llgfrl\004"
    "llgh\005llghr\006llghrl\003llh\004llhh\004llhr\005llhrl\005llihf\005lli"
    "hh\005llihl\005llilf\005llilh\005llill\002lm\003lmg\003lmh\003lmy\005ln"
    "dbr\005lndfr\005lnebr\005lngfr\004lngr\003lnr\005lnxbr\003loc\004loce\004"
    "locg\005locge\005locgh\006locghe\006locghi\007locghie\007locghih\010loc"
    "ghihe\007locghil\010locghile\010locghilh\007locghim\010locghine\010locg"
    "hinh\tlocghinhe\010locghinl\tlocghinle\tlocghinlh\010locghinm\010locghi"
    "no\010locghinp\010locghinz\007locghio\007locghip\007locghiz\005locgl\006"
    "locgle\006locglh\005locgm\006locgne\006locgnh\007locgnhe\006locgnl\007l"
    "ocgnle\007locgnlh\006locgnm\006locgno\006locgnp\006locgnz\005locgo\005l"
    "ocgp\005locgr\006locgre\006locgrh\007locgrhe\006locgrl\007locgrle\007lo"
    "cgrlh\006locgrm\007locgrne\007locgrnh\010locgrnhe\007locgrnl\010locgrnl"
    "e\010locgrnlh\007locgrnm\007locgrno\007locgrnp\007locgrnz\006locgro\006"
    "locgrp\006locgrz\005locgz\004loch\005loche\005lochi\006lochie\006lochih"
    "\007lochihe\006lochil\007lochile\007lochilh\006lochim\007lochine\007loc"
    "hinh\010lochinhe\007lochinl\010lochinle\010lochinlh\007lochinm\007lochi"
    "no\007lochinp\007lochinz\006lochio\006lochip\006lochiz\004locl\005locle"
    "\005loclh\004locm\005locne\005locnh\006locnhe\005locnl\006locnle\006loc"
    "nlh\005locnm\005locno\005locnp\005locnz\004loco\004locp\004locr\005locr"
    "e\005locrh\006locrhe\005locrl\006locrle\006locrlh\005locrm\006locrne\006"
    "locrnh\007locrnhe\006locrnl\007locrnle\007locrnlh\006locrnm\006locrno\006"
    "locrnp\006locrnz\005locro\005locrp\005locrz\004locz\005lpdbr\005lpdfr\005"
    "lpebr\005lpgfr\004lpgr\003lpr\005lpxbr\002lr\003lrl\003lrv\004lrvg\005l"
    "rvgr\004lrvh\004lrvr\002lt\005ltdbr\005ltebr\003ltg\004ltgf\005ltgfr\004"
    "ltgr\003ltr\005ltxbr\004lxdb\005lxdbr\004lxeb\005lxebr\003lxr\002ly\004"
    "lzdr\004lzer\004lzxr\004madb\005madbr\004maeb\005maebr\003mdb\004mdbr\004"
    "mdeb\005mdebr\004meeb\005meebr\004mghi\002mh\003mhi\003mhy\003mlg\004ml"
    "gr\002ms\004msdb\005msdbr\004mseb\005msebr\004msfi\003msg\004msgf\005ms"
    "gfi\005msgfr\004msgr\003msr\003msy\003mvc\004mvck\005mvghi\005mvhhi\004"
    "mvhi\003mvi\004mviy\004mvst\004mxbr\004mxdb\005mxdbr\001n\002nc\002ng\003"
    "ngr\004ngrk\002ni\004nihf\004nihh\004nihl\004nilf\004nilh\004nill\003ni"
    "y\003nop\004nopr\002nr\003nrk\005ntstg\002ny\001o\002oc\002og\003ogr\004"
    "ogrk\002oi\004oihf\004oihh\004oihl\004oilf\004oilh\004oill\003oiy\002or"
    "\003ork\002oy\003pfd\005pfdrl\006popcnt\003ppa\002pr\005risbg\006risbgn"
    "\006risbhg\006risblg\003rll\004rllg\005rnsbg\005rosbg\005rxsbg\001s\003"
    "sdb\004sdbr\003seb\004sebr\002sg\003sgf\004sgfr\003sgr\004sgrk\002sh\003"
    "shy\002sl\003sla\004slak\003slb\004slbg\005slbgr\004slbr\004slfi\003slg"
    "\004slgf\005slgfi\005slgfr\004slgr\005slgrk\003sll\004sllg\004sllk\003s"
    "lr\004slrk\003sly\004sqdb\005sqdbr\004sqeb\005sqebr\005sqxbr\002sr\003s"
    "ra\004srag\004srak\003srk\003srl\004srlg\004srlk\004srst\002st\003stc\004"
    "stch\004stck\005stcke\005stckf\004stcy\003std\004stdy\003ste\004stey\004"
    "stfh\005stfle\003stg\005stgrl\003sth\004sthh\005sthrl\004sthy\003stm\004"
    "stmg\004stmh\004stmy\004stoc\005stoce\005stocg\006stocge\006stocgh\007s"
    "tocghe\006stocgl\007stocgle\007stocglh\006stocgm\007stocgne\007stocgnh\010"
    "stocgnhe\007stocgnl\010stocgnle\010stocgnlh\007stocgnm\007stocgno\007st"
    "ocgnp\007stocgnz\006stocgo\006stocgp\006stocgz\005stoch\006stoche\005st"
    "ocl\006stocle\006stoclh\005stocm\006stocne\006stocnh\007stocnhe\006stoc"
    "nl\007stocnle\007stocnlh\006stocnm\006stocno\006stocnp\006stocnz\005sto"
    "co\005stocp\005stocz\005strag\004strl\004strv\005strvg\005strvh\003sty\003"
    "svc\004sxbr\002sy\006tabort\006tbegin\007tbeginc\004tcdb\004tceb\004tcx"
    "b\004tend\002tm\003tmh\004tmhh\004tmhl\003tml\004tmlh\004tmll\003tmy\003"
    "vab\005vaccb\006vacccq\005vaccf\005vaccg\005vacch\005vaccq\004vacq\003v"
    "af\003vag\003vah\003vaq\005vavgb\005vavgf\005vavgg\005vavgh\006vavglb\006"
    "vavglf\006vavglg\006vavglh\005vcdgb\006vcdlgb\005vceqb\006vceqbs\005vce"
    "qf\006vceqfs\005vceqg\006vceqgs\005vceqh\006vceqhs\005vcgdb\004vchb\005"
    "vchbs\004vchf\005vchfs\004vchg\005vchgs\004vchh\005vchhs\005vchlb\006vc"
    "hlbs\005vchlf\006vchlfs\005vchlg\006vchlgs\005vchlh\006vchlhs\005vcksm\006"
    "vclgdb\005vclzb\005vclzf\005vclzg\005vclzh\005vctzb\005vctzf\005vctzg\005"
    "vctzh\004vecb\004vecf\004vecg\004vech\005veclb\005veclf\005veclg\005vec"
    "lh\006verimb\006verimf\006verimg\006verimh\006verllb\006verllf\006verll"
    "g\006verllh\007verllvb\007verllvf\007verllvg\007verllvh\005veslb\005ves"
    "lf\005veslg\005veslh\006veslvb\006veslvf\006veslvg\006veslvh\006vesrab\006"
    "vesraf\006vesrag\006vesrah\007vesravb\007vesravf\007vesravg\007vesravh\006"
    "vesrlb\006vesrlf\006vesrlg\006vesrlh\007vesrlvb\007vesrlvf\007vesrlvg\007"
    "vesrlvh\005vfadb\005vfaeb\006vfaebs\005vfaef\006vfaefs\005vfaeh\006vfae"
    "hs\006vfaezb\007vfaezbs\006vfaezf\007vfaezfs\006vfaezh\007vfaezhs\006vf"
    "cedb\007vfcedbs\006vfchdb\007vfchdbs\007vfchedb\010vfchedbs\005vfddb\005"
    "vfeeb\006vfeebs\005vfeef\006vfeefs\005vfeeh\006vfeehs\006vfeezb\007vfee"
    "zbs\006vfeezf\007vfeezfs\006vfeezh\007vfeezhs\006vfeneb\007vfenebs\006v"
    "fenef\007vfenefs\006vfeneh\007vfenehs\007vfenezb\010vfenezbs\007vfenezf"
    "\010vfenezfs\007vfenezh\010vfenezhs\005vfidb\006vflcdb\006vflndb\006vfl"
    "pdb\006vfmadb\005vfmdb\006vfmsdb\005vfsdb\006vfsqdb\007vftcidb\004vgbm\004"
    "vgef\004vgeg\006vgfmab\006vgfmaf\006vgfmag\006vgfmah\005vgfmb\005vgfmf\005"
    "vgfmg\005vgfmh\004vgmb\004vgmf\004vgmg\004vgmh\006vistrb\007vistrbs\006"
    "vistrf\007vistrfs\006vistrh\007vistrhs\002vl\004vlbb\004vlcb\004vlcf\004"
    "vlcg\004vlch\005vldeb\004vleb\005vledb\004vlef\004vleg\004vleh\005vleib"
    "\005vleif\005vleig\005vleih\005vlgvb\005vlgvf\005vlgvg\005vlgvh\003vll\006"
    "vllezb\006vllezf\006vllezg\006vllezh\003vlm\004vlpb\004vlpf\004vlpg\004"
    "vlph\003vlr\006vlrepb\006vlrepf\006vlrepg\006vlreph\005vlvgb\005vlvgf\005"
    "vlvgg\005vlvgh\005vlvgp\005vmaeb\005vmaef\005vmaeh\005vmahb\005vmahf\005"
    "vmahh\005vmalb\006vmaleb\006vmalef\006vmaleh\005vmalf\006vmalhb\006vmal"
    "hf\006vmalhh\006vmalhw\006vmalob\006vmalof\006vmaloh\005vmaob\005vmaof\005"
    "vmaoh\004vmeb\004vmef\004vmeh\004vmhb\004vmhf\004vmhh\004vmlb\005vmleb\005"
    "vmlef\005vmleh\004vmlf\005vmlhb\005vmlhf\005vmlhh\005vmlhw\005vmlob\005"
    "vmlof\005vmloh\004vmnb\004vmnf\004vmng\004vmnh\005vmnlb\005vmnlf\005vmn"
    "lg\005vmnlh\004vmob\004vmof\004vmoh\005vmrhb\005vmrhf\005vmrhg\005vmrhh"
    "\005vmrlb\005vmrlf\005vmrlg\005vmrlh\004vmxb\004vmxf\004vmxg\004vmxh\005"
    "vmxlb\005vmxlf\005vmxlg\005vmxlh\002vn\003vnc\003vno\002vo\004vone\004v"
    "pdi\005vperm\004vpkf\004vpkg\004vpkh\006vpklsf\007vpklsfs\006vpklsg\007"
    "vpklsgs\006vpklsh\007vpklshs\005vpksf\006vpksfs\005vpksg\006vpksgs\005v"
    "pksh\006vpkshs\006vpopct\005vrepb\005vrepf\005vrepg\005vreph\006vrepib\006"
    "vrepif\006vrepig\006vrepih\003vsb\007vsbcbiq\005vsbiq\006vscbib\006vscb"
    "if\006vscbig\006vscbih\006vscbiq\005vscef\005vsceg\005vsegb\005vsegf\005"
    "vsegh\004vsel\003vsf\003vsg\003vsh\003vsl\004vslb\005vsldb\003vsq\004vs"
    "ra\005vsrab\004vsrl\005vsrlb\003vst\005vsteb\005vstef\005vsteg\005vsteh"
    "\004vstl\004vstm\006vstrcb\007vstrcbs\006vstrcf\007vstrcfs\006vstrch\007"
    "vstrchs\007vstrczb\010vstrczbs\007vstrczf\010vstrczfs\007vstrczh\010vst"
    "rczhs\005vsumb\006vsumgf\006vsumgh\005vsumh\006vsumqf\006vsumqg\003vtm\005"
    "vuphb\005vuphf\005vuphh\005vuplb\005vuplf\006vuplhb\006vuplhf\006vuplhh"
    "\006vuplhw\006vupllb\006vupllf\006vupllh\002vx\005vzero\005wcdgb\006wcd"
    "lgb\005wcgdb\006wclgdb\005wfadb\005wfcdb\006wfcedb\007wfcedbs\006wfchdb"
    "\007wfchdbs\007wfchedb\010wfchedbs\005wfddb\005wfidb\005wfkdb\006wflcdb"
    "\006wflndb\006wflpdb\006wfmadb\005wfmdb\006wfmsdb\005wfsdb\006wfsqdb\007"
    "wftcidb\005wldeb\005wledb\001x\002xc\002xg\003xgr\004xgrk\002xi\004xihf"
    "\004xilf\003xiy\002xr\003xrk\002xy";

namespace {
  struct MatchEntry {
    uint16_t Mnemonic;
    uint16_t Opcode;
    uint16_t ConvertFn;
    uint16_t RequiredFeatures;
    uint8_t Classes[5];
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
  { 0 /* a */, SystemZ::A, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 2 /* adb */, SystemZ::ADB, Convert__FP641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 6 /* adbr */, SystemZ::ADBR, Convert__FP641_0__Tie0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 11 /* aeb */, SystemZ::AEB, Convert__FP321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 15 /* aebr */, SystemZ::AEBR, Convert__FP321_0__Tie0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 20 /* afi */, SystemZ::AFI, Convert__GR321_0__Tie0__S32Imm1_1, 0, { MCK_GR32, MCK_S32Imm }, },
  { 24 /* ag */, SystemZ::AG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 27 /* agf */, SystemZ::AGF, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 31 /* agfi */, SystemZ::AGFI, Convert__GR641_0__Tie0__S32Imm1_1, 0, { MCK_GR64, MCK_S32Imm }, },
  { 36 /* agfr */, SystemZ::AGFR, Convert__GR641_0__Tie0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 41 /* aghi */, SystemZ::AGHI, Convert__GR641_0__Tie0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 46 /* aghik */, SystemZ::AGHIK, Convert__GR641_0__GR641_1__S16Imm1_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_S16Imm }, },
  { 52 /* agr */, SystemZ::AGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 56 /* agrk */, SystemZ::AGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 61 /* agsi */, SystemZ::AGSI, Convert__BDAddr64Disp202_0__S8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_S8Imm }, },
  { 66 /* ah */, SystemZ::AH, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 69 /* ahi */, SystemZ::AHI, Convert__GR321_0__Tie0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 73 /* ahik */, SystemZ::AHIK, Convert__GR321_0__GR321_1__S16Imm1_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_S16Imm }, },
  { 78 /* ahy */, SystemZ::AHY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 82 /* aih */, SystemZ::AIH, Convert__GRH321_0__Tie0__S32Imm1_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_S32Imm }, },
  { 86 /* al */, SystemZ::AL, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 89 /* alc */, SystemZ::ALC, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 93 /* alcg */, SystemZ::ALCG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 98 /* alcgr */, SystemZ::ALCGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 104 /* alcr */, SystemZ::ALCR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 109 /* alfi */, SystemZ::ALFI, Convert__GR321_0__Tie0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 114 /* alg */, SystemZ::ALG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 118 /* algf */, SystemZ::ALGF, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 123 /* algfi */, SystemZ::ALGFI, Convert__GR641_0__Tie0__U32Imm1_1, 0, { MCK_GR64, MCK_U32Imm }, },
  { 129 /* algfr */, SystemZ::ALGFR, Convert__GR641_0__Tie0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 135 /* alghsik */, SystemZ::ALGHSIK, Convert__GR641_0__GR641_1__S16Imm1_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_S16Imm }, },
  { 143 /* algr */, SystemZ::ALGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 148 /* algrk */, SystemZ::ALGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 154 /* alhsik */, SystemZ::ALHSIK, Convert__GR321_0__GR321_1__S16Imm1_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_S16Imm }, },
  { 161 /* alr */, SystemZ::ALR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 165 /* alrk */, SystemZ::ALRK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 170 /* aly */, SystemZ::ALY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 174 /* ar */, SystemZ::AR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 177 /* ark */, SystemZ::ARK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 181 /* asi */, SystemZ::ASI, Convert__BDAddr64Disp202_0__S8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_S8Imm }, },
  { 185 /* axbr */, SystemZ::AXBR, Convert__FP1281_0__Tie0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 190 /* ay */, SystemZ::AY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 193 /* basr */, SystemZ::BASR, Convert__GR641_0__ADDR641_1, 0, { MCK_GR64, MCK_ADDR64 }, },
  { 198 /* bc */, SystemZ::AsmBC, Convert__U4Imm1_0__BDXAddr64Disp123_1, 0, { MCK_U4Imm, MCK_BDXAddr64Disp12 }, },
  { 201 /* bcr */, SystemZ::AsmBCR, Convert__U4Imm1_0__GR641_1, 0, { MCK_U4Imm, MCK_GR64 }, },
  { 205 /* ber */, SystemZ::AsmEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 209 /* bher */, SystemZ::AsmHEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 214 /* bhr */, SystemZ::AsmHBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 218 /* bler */, SystemZ::AsmLEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 223 /* blhr */, SystemZ::AsmLHBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 228 /* blr */, SystemZ::AsmLBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 232 /* bmr */, SystemZ::AsmLAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 236 /* bner */, SystemZ::AsmNEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 241 /* bnher */, SystemZ::AsmNHEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 247 /* bnhr */, SystemZ::AsmNHBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 252 /* bnler */, SystemZ::AsmNLEBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 258 /* bnlhr */, SystemZ::AsmNLHBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 264 /* bnlr */, SystemZ::AsmNLBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 269 /* bnmr */, SystemZ::AsmNLAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 274 /* bnor */, SystemZ::AsmNOBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 279 /* bnpr */, SystemZ::AsmNHAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 284 /* bnzr */, SystemZ::AsmNEAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 289 /* bor */, SystemZ::AsmOBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 293 /* bpr */, SystemZ::AsmHAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 297 /* br */, SystemZ::BR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 300 /* bras */, SystemZ::BRAS, Convert__GR641_0__PCRelTLS162_1, 0, { MCK_GR64, MCK_PCRelTLS16 }, },
  { 305 /* brasl */, SystemZ::BRASL, Convert__GR641_0__PCRelTLS322_1, 0, { MCK_GR64, MCK_PCRelTLS32 }, },
  { 311 /* brc */, SystemZ::AsmBRC, Convert__U4Imm1_0__PCRel161_1, 0, { MCK_U4Imm, MCK_PCRel16 }, },
  { 315 /* brcl */, SystemZ::AsmBRCL, Convert__U4Imm1_0__PCRel321_1, 0, { MCK_U4Imm, MCK_PCRel32 }, },
  { 320 /* brct */, SystemZ::BRCT, Convert__GR321_0__Tie0__PCRel161_1, 0, { MCK_GR32, MCK_PCRel16 }, },
  { 325 /* brctg */, SystemZ::BRCTG, Convert__GR641_0__Tie0__PCRel161_1, 0, { MCK_GR64, MCK_PCRel16 }, },
  { 331 /* brxh */, SystemZ::BRXH, Convert__GR641_0__Tie0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 336 /* brxle */, SystemZ::BRXLE, Convert__GR641_0__Tie0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 342 /* bzr */, SystemZ::AsmEAltBR, Convert__ADDR641_0, 0, { MCK_ADDR64 }, },
  { 346 /* c */, SystemZ::C, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 348 /* cdb */, SystemZ::CDB, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 352 /* cdbr */, SystemZ::CDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 357 /* cdfbr */, SystemZ::CDFBR, Convert__FP641_0__GR321_1, 0, { MCK_FP64, MCK_GR32 }, },
  { 363 /* cdgbr */, SystemZ::CDGBR, Convert__FP641_0__GR641_1, 0, { MCK_FP64, MCK_GR64 }, },
  { 369 /* cdlfbr */, SystemZ::CDLFBR, Convert__FP641_0__U4Imm1_1__GR321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP64, MCK_U4Imm, MCK_GR32, MCK_U4Imm }, },
  { 376 /* cdlgbr */, SystemZ::CDLGBR, Convert__FP641_0__U4Imm1_1__GR641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP64, MCK_U4Imm, MCK_GR64, MCK_U4Imm }, },
  { 383 /* ceb */, SystemZ::CEB, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 387 /* cebr */, SystemZ::CEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 392 /* cefbr */, SystemZ::CEFBR, Convert__FP321_0__GR321_1, 0, { MCK_FP32, MCK_GR32 }, },
  { 398 /* cegbr */, SystemZ::CEGBR, Convert__FP321_0__GR641_1, 0, { MCK_FP32, MCK_GR64 }, },
  { 404 /* celfbr */, SystemZ::CELFBR, Convert__FP321_0__U4Imm1_1__GR321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP32, MCK_U4Imm, MCK_GR32, MCK_U4Imm }, },
  { 411 /* celgbr */, SystemZ::CELGBR, Convert__FP321_0__U4Imm1_1__GR641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP32, MCK_U4Imm, MCK_GR64, MCK_U4Imm }, },
  { 418 /* cfdbr */, SystemZ::CFDBR, Convert__GR321_0__U4Imm1_1__FP641_2, 0, { MCK_GR32, MCK_U4Imm, MCK_FP64 }, },
  { 424 /* cfebr */, SystemZ::CFEBR, Convert__GR321_0__U4Imm1_1__FP321_2, 0, { MCK_GR32, MCK_U4Imm, MCK_FP32 }, },
  { 430 /* cfi */, SystemZ::CFI, Convert__GR321_0__S32Imm1_1, 0, { MCK_GR32, MCK_S32Imm }, },
  { 434 /* cfxbr */, SystemZ::CFXBR, Convert__GR321_0__U4Imm1_1__FP1281_2, 0, { MCK_GR32, MCK_U4Imm, MCK_FP128 }, },
  { 440 /* cg */, SystemZ::CG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 443 /* cgdbr */, SystemZ::CGDBR, Convert__GR641_0__U4Imm1_1__FP641_2, 0, { MCK_GR64, MCK_U4Imm, MCK_FP64 }, },
  { 449 /* cgebr */, SystemZ::CGEBR, Convert__GR641_0__U4Imm1_1__FP321_2, 0, { MCK_GR64, MCK_U4Imm, MCK_FP32 }, },
  { 455 /* cgf */, SystemZ::CGF, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 459 /* cgfi */, SystemZ::CGFI, Convert__GR641_0__S32Imm1_1, 0, { MCK_GR64, MCK_S32Imm }, },
  { 464 /* cgfr */, SystemZ::CGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 469 /* cgfrl */, SystemZ::CGFRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 475 /* cgh */, SystemZ::CGH, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 479 /* cghi */, SystemZ::CGHI, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 484 /* cghrl */, SystemZ::CGHRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 490 /* cghsi */, SystemZ::CGHSI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 496 /* cgib */, SystemZ::AsmCGIB, Convert__GR641_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR64, MCK_S8Imm, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 501 /* cgibe */, SystemZ::AsmJECGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 507 /* cgibh */, SystemZ::AsmJHCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 513 /* cgibhe */, SystemZ::AsmJHECGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 520 /* cgibl */, SystemZ::AsmJLCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 526 /* cgible */, SystemZ::AsmJLECGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 533 /* cgiblh */, SystemZ::AsmJLHCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 540 /* cgibne */, SystemZ::AsmJLHAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 547 /* cgibnh */, SystemZ::AsmJLEAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 554 /* cgibnhe */, SystemZ::AsmJLAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 562 /* cgibnl */, SystemZ::AsmJHEAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 569 /* cgibnle */, SystemZ::AsmJHAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 577 /* cgibnlh */, SystemZ::AsmJEAltCGIB, Convert__GR641_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 585 /* cgij */, SystemZ::AsmCGIJ, Convert__GR641_0__S8Imm1_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR64, MCK_S8Imm, MCK_U4Imm, MCK_PCRel16 }, },
  { 590 /* cgije */, SystemZ::AsmJECGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 596 /* cgijh */, SystemZ::AsmJHCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 602 /* cgijhe */, SystemZ::AsmJHECGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 609 /* cgijl */, SystemZ::AsmJLCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 615 /* cgijle */, SystemZ::AsmJLECGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 622 /* cgijlh */, SystemZ::AsmJLHCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 629 /* cgijne */, SystemZ::AsmJLHAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 636 /* cgijnh */, SystemZ::AsmJLEAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 643 /* cgijnhe */, SystemZ::AsmJLAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 651 /* cgijnl */, SystemZ::AsmJHEAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 658 /* cgijnle */, SystemZ::AsmJHAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 666 /* cgijnlh */, SystemZ::AsmJEAltCGIJ, Convert__GR641_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_S8Imm, MCK_PCRel16 }, },
  { 674 /* cgit */, SystemZ::AsmCGIT, Convert__GR641_0__S16Imm1_1__U4Imm1_2, 0, { MCK_GR64, MCK_S16Imm, MCK_U4Imm }, },
  { 679 /* cgite */, SystemZ::AsmJECGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 685 /* cgith */, SystemZ::AsmJHCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 691 /* cgithe */, SystemZ::AsmJHECGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 698 /* cgitl */, SystemZ::AsmJLCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 704 /* cgitle */, SystemZ::AsmJLECGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 711 /* cgitlh */, SystemZ::AsmJLHCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 718 /* cgitne */, SystemZ::AsmJLHAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 725 /* cgitnh */, SystemZ::AsmJLEAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 732 /* cgitnhe */, SystemZ::AsmJLAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 740 /* cgitnl */, SystemZ::AsmJHEAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 747 /* cgitnle */, SystemZ::AsmJHAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 755 /* cgitnlh */, SystemZ::AsmJEAltCGIT, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 763 /* cgr */, SystemZ::CGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 767 /* cgrb */, SystemZ::AsmCGRB, Convert__GR641_0__GR641_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 772 /* cgrbe */, SystemZ::AsmJECGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 778 /* cgrbh */, SystemZ::AsmJHCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 784 /* cgrbhe */, SystemZ::AsmJHECGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 791 /* cgrbl */, SystemZ::AsmJLCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 797 /* cgrble */, SystemZ::AsmJLECGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 804 /* cgrblh */, SystemZ::AsmJLHCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 811 /* cgrbne */, SystemZ::AsmJLHAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 818 /* cgrbnh */, SystemZ::AsmJLEAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 825 /* cgrbnhe */, SystemZ::AsmJLAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 833 /* cgrbnl */, SystemZ::AsmJHEAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 840 /* cgrbnle */, SystemZ::AsmJHAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 848 /* cgrbnlh */, SystemZ::AsmJEAltCGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 856 /* cgrj */, SystemZ::AsmCGRJ, Convert__GR641_0__GR641_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm, MCK_PCRel16 }, },
  { 861 /* cgrje */, SystemZ::AsmJECGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 867 /* cgrjh */, SystemZ::AsmJHCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 873 /* cgrjhe */, SystemZ::AsmJHECGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 880 /* cgrjl */, SystemZ::AsmJLCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 886 /* cgrjle */, SystemZ::AsmJLECGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 893 /* cgrjlh */, SystemZ::AsmJLHCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 900 /* cgrjne */, SystemZ::AsmJLHAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 907 /* cgrjnh */, SystemZ::AsmJLEAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 914 /* cgrjnhe */, SystemZ::AsmJLAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 922 /* cgrjnl */, SystemZ::AsmJHEAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 929 /* cgrjnle */, SystemZ::AsmJHAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 937 /* cgrjnlh */, SystemZ::AsmJEAltCGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 945 /* cgrl */, SystemZ::CGRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 950 /* cgrt */, SystemZ::AsmCGRT, Convert__GR641_0__GR641_1__U4Imm1_2, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm }, },
  { 955 /* cgrte */, SystemZ::AsmJECGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 961 /* cgrth */, SystemZ::AsmJHCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 967 /* cgrthe */, SystemZ::AsmJHECGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 974 /* cgrtl */, SystemZ::AsmJLCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 980 /* cgrtle */, SystemZ::AsmJLECGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 987 /* cgrtlh */, SystemZ::AsmJLHCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 994 /* cgrtne */, SystemZ::AsmJLHAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1001 /* cgrtnh */, SystemZ::AsmJLEAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1008 /* cgrtnhe */, SystemZ::AsmJLAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1016 /* cgrtnl */, SystemZ::AsmJHEAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1023 /* cgrtnle */, SystemZ::AsmJHAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1031 /* cgrtnlh */, SystemZ::AsmJEAltCGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1039 /* cgxbr */, SystemZ::CGXBR, Convert__GR641_0__U4Imm1_1__FP1281_2, 0, { MCK_GR64, MCK_U4Imm, MCK_FP128 }, },
  { 1045 /* ch */, SystemZ::CH, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 1048 /* chf */, SystemZ::CHF, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 1052 /* chhsi */, SystemZ::CHHSI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 1058 /* chi */, SystemZ::CHI, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1062 /* chrl */, SystemZ::CHRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 1067 /* chsi */, SystemZ::CHSI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 1072 /* chy */, SystemZ::CHY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 1076 /* cib */, SystemZ::AsmCIB, Convert__GR321_0__S8Imm1_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR32, MCK_S8Imm, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 1080 /* cibe */, SystemZ::AsmJECIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1085 /* cibh */, SystemZ::AsmJHCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1090 /* cibhe */, SystemZ::AsmJHECIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1096 /* cibl */, SystemZ::AsmJLCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1101 /* cible */, SystemZ::AsmJLECIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1107 /* ciblh */, SystemZ::AsmJLHCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1113 /* cibne */, SystemZ::AsmJLHAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1119 /* cibnh */, SystemZ::AsmJLEAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1125 /* cibnhe */, SystemZ::AsmJLAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1132 /* cibnl */, SystemZ::AsmJHEAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1138 /* cibnle */, SystemZ::AsmJHAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1145 /* cibnlh */, SystemZ::AsmJEAltCIB, Convert__GR321_0__S8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_S8Imm, MCK_BDAddr64Disp12 }, },
  { 1152 /* cih */, SystemZ::CIH, Convert__GRH321_0__S32Imm1_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_S32Imm }, },
  { 1156 /* cij */, SystemZ::AsmCIJ, Convert__GR321_0__S8Imm1_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR32, MCK_S8Imm, MCK_U4Imm, MCK_PCRel16 }, },
  { 1160 /* cije */, SystemZ::AsmJECIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1165 /* cijh */, SystemZ::AsmJHCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1170 /* cijhe */, SystemZ::AsmJHECIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1176 /* cijl */, SystemZ::AsmJLCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1181 /* cijle */, SystemZ::AsmJLECIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1187 /* cijlh */, SystemZ::AsmJLHCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1193 /* cijne */, SystemZ::AsmJLHAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1199 /* cijnh */, SystemZ::AsmJLEAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1205 /* cijnhe */, SystemZ::AsmJLAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1212 /* cijnl */, SystemZ::AsmJHEAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1218 /* cijnle */, SystemZ::AsmJHAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1225 /* cijnlh */, SystemZ::AsmJEAltCIJ, Convert__GR321_0__S8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_S8Imm, MCK_PCRel16 }, },
  { 1232 /* cit */, SystemZ::AsmCIT, Convert__GR321_0__S16Imm1_1__U4Imm1_2, 0, { MCK_GR32, MCK_S16Imm, MCK_U4Imm }, },
  { 1236 /* cite */, SystemZ::AsmJECIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1241 /* cith */, SystemZ::AsmJHCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1246 /* cithe */, SystemZ::AsmJHECIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1252 /* citl */, SystemZ::AsmJLCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1257 /* citle */, SystemZ::AsmJLECIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1263 /* citlh */, SystemZ::AsmJLHCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1269 /* citne */, SystemZ::AsmJLHAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1275 /* citnh */, SystemZ::AsmJLEAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1281 /* citnhe */, SystemZ::AsmJLAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1288 /* citnl */, SystemZ::AsmJHEAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1294 /* citnle */, SystemZ::AsmJHAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1301 /* citnlh */, SystemZ::AsmJEAltCIT, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 1308 /* cl */, SystemZ::CL, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 1311 /* clc */, SystemZ::CLC, Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1, 0, { MCK_BDLAddr64Disp12Len8, MCK_BDAddr64Disp12 }, },
  { 1315 /* clfdbr */, SystemZ::CLFDBR, Convert__GR321_0__U4Imm1_1__FP641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR32, MCK_U4Imm, MCK_FP64, MCK_U4Imm }, },
  { 1322 /* clfebr */, SystemZ::CLFEBR, Convert__GR321_0__U4Imm1_1__FP321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR32, MCK_U4Imm, MCK_FP32, MCK_U4Imm }, },
  { 1329 /* clfhsi */, SystemZ::CLFHSI, Convert__BDAddr64Disp122_0__U16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U16Imm }, },
  { 1336 /* clfi */, SystemZ::CLFI, Convert__GR321_0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 1341 /* clfit */, SystemZ::AsmCLFIT, Convert__GR321_0__U16Imm1_1__U4Imm1_2, 0, { MCK_GR32, MCK_U16Imm, MCK_U4Imm }, },
  { 1347 /* clfite */, SystemZ::AsmJECLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1354 /* clfith */, SystemZ::AsmJHCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1361 /* clfithe */, SystemZ::AsmJHECLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1369 /* clfitl */, SystemZ::AsmJLCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1376 /* clfitle */, SystemZ::AsmJLECLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1384 /* clfitlh */, SystemZ::AsmJLHCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1392 /* clfitne */, SystemZ::AsmJLHAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1400 /* clfitnh */, SystemZ::AsmJLEAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1408 /* clfitnhe */, SystemZ::AsmJLAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1417 /* clfitnl */, SystemZ::AsmJHEAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1425 /* clfitnle */, SystemZ::AsmJHAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1434 /* clfitnlh */, SystemZ::AsmJEAltCLFIT, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 1443 /* clfxbr */, SystemZ::CLFXBR, Convert__GR321_0__U4Imm1_1__FP1281_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR32, MCK_U4Imm, MCK_FP128, MCK_U4Imm }, },
  { 1450 /* clg */, SystemZ::CLG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 1454 /* clgdbr */, SystemZ::CLGDBR, Convert__GR641_0__U4Imm1_1__FP641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR64, MCK_U4Imm, MCK_FP64, MCK_U4Imm }, },
  { 1461 /* clgebr */, SystemZ::CLGEBR, Convert__GR641_0__U4Imm1_1__FP321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR64, MCK_U4Imm, MCK_FP32, MCK_U4Imm }, },
  { 1468 /* clgf */, SystemZ::CLGF, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 1473 /* clgfi */, SystemZ::CLGFI, Convert__GR641_0__U32Imm1_1, 0, { MCK_GR64, MCK_U32Imm }, },
  { 1479 /* clgfr */, SystemZ::CLGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 1485 /* clgfrl */, SystemZ::CLGFRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 1492 /* clghrl */, SystemZ::CLGHRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 1499 /* clghsi */, SystemZ::CLGHSI, Convert__BDAddr64Disp122_0__U16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U16Imm }, },
  { 1506 /* clgib */, SystemZ::AsmCLGIB, Convert__GR641_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR64, MCK_U8Imm, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 1512 /* clgibe */, SystemZ::AsmJECLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1519 /* clgibh */, SystemZ::AsmJHCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1526 /* clgibhe */, SystemZ::AsmJHECLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1534 /* clgibl */, SystemZ::AsmJLCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1541 /* clgible */, SystemZ::AsmJLECLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1549 /* clgiblh */, SystemZ::AsmJLHCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1557 /* clgibne */, SystemZ::AsmJLHAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1565 /* clgibnh */, SystemZ::AsmJLEAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1573 /* clgibnhe */, SystemZ::AsmJLAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1582 /* clgibnl */, SystemZ::AsmJHEAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1590 /* clgibnle */, SystemZ::AsmJHAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1599 /* clgibnlh */, SystemZ::AsmJEAltCLGIB, Convert__GR641_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 1608 /* clgij */, SystemZ::AsmCLGIJ, Convert__GR641_0__U8Imm1_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR64, MCK_U8Imm, MCK_U4Imm, MCK_PCRel16 }, },
  { 1614 /* clgije */, SystemZ::AsmJECLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1621 /* clgijh */, SystemZ::AsmJHCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1628 /* clgijhe */, SystemZ::AsmJHECLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1636 /* clgijl */, SystemZ::AsmJLCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1643 /* clgijle */, SystemZ::AsmJLECLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1651 /* clgijlh */, SystemZ::AsmJLHCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1659 /* clgijne */, SystemZ::AsmJLHAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1667 /* clgijnh */, SystemZ::AsmJLEAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1675 /* clgijnhe */, SystemZ::AsmJLAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1684 /* clgijnl */, SystemZ::AsmJHEAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1692 /* clgijnle */, SystemZ::AsmJHAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1701 /* clgijnlh */, SystemZ::AsmJEAltCLGIJ, Convert__GR641_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR64, MCK_U8Imm, MCK_PCRel16 }, },
  { 1710 /* clgit */, SystemZ::AsmCLGIT, Convert__GR641_0__U16Imm1_1__U4Imm1_2, 0, { MCK_GR64, MCK_U16Imm, MCK_U4Imm }, },
  { 1716 /* clgite */, SystemZ::AsmJECLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1723 /* clgith */, SystemZ::AsmJHCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1730 /* clgithe */, SystemZ::AsmJHECLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1738 /* clgitl */, SystemZ::AsmJLCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1745 /* clgitle */, SystemZ::AsmJLECLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1753 /* clgitlh */, SystemZ::AsmJLHCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1761 /* clgitne */, SystemZ::AsmJLHAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1769 /* clgitnh */, SystemZ::AsmJLEAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1777 /* clgitnhe */, SystemZ::AsmJLAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1786 /* clgitnl */, SystemZ::AsmJHEAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1794 /* clgitnle */, SystemZ::AsmJHAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1803 /* clgitnlh */, SystemZ::AsmJEAltCLGIT, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 1812 /* clgr */, SystemZ::CLGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 1817 /* clgrb */, SystemZ::AsmCLGRB, Convert__GR641_0__GR641_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 1823 /* clgrbe */, SystemZ::AsmJECLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1830 /* clgrbh */, SystemZ::AsmJHCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1837 /* clgrbhe */, SystemZ::AsmJHECLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1845 /* clgrbl */, SystemZ::AsmJLCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1852 /* clgrble */, SystemZ::AsmJLECLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1860 /* clgrblh */, SystemZ::AsmJLHCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1868 /* clgrbne */, SystemZ::AsmJLHAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1876 /* clgrbnh */, SystemZ::AsmJLEAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1884 /* clgrbnhe */, SystemZ::AsmJLAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1893 /* clgrbnl */, SystemZ::AsmJHEAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1901 /* clgrbnle */, SystemZ::AsmJHAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1910 /* clgrbnlh */, SystemZ::AsmJEAltCLGRB, Convert__GR641_0__GR641_1__BDAddr64Disp122_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp12 }, },
  { 1919 /* clgrj */, SystemZ::AsmCLGRJ, Convert__GR641_0__GR641_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm, MCK_PCRel16 }, },
  { 1925 /* clgrje */, SystemZ::AsmJECLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1932 /* clgrjh */, SystemZ::AsmJHCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1939 /* clgrjhe */, SystemZ::AsmJHECLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1947 /* clgrjl */, SystemZ::AsmJLCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1954 /* clgrjle */, SystemZ::AsmJLECLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1962 /* clgrjlh */, SystemZ::AsmJLHCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1970 /* clgrjne */, SystemZ::AsmJLHAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1978 /* clgrjnh */, SystemZ::AsmJLEAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1986 /* clgrjnhe */, SystemZ::AsmJLAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 1995 /* clgrjnl */, SystemZ::AsmJHEAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 2003 /* clgrjnle */, SystemZ::AsmJHAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 2012 /* clgrjnlh */, SystemZ::AsmJEAltCLGRJ, Convert__GR641_0__GR641_1__PCRel161_2, 0, { MCK_GR64, MCK_GR64, MCK_PCRel16 }, },
  { 2021 /* clgrl */, SystemZ::CLGRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 2027 /* clgrt */, SystemZ::AsmCLGRT, Convert__GR641_0__GR641_1__U4Imm1_2, 0, { MCK_GR64, MCK_GR64, MCK_U4Imm }, },
  { 2033 /* clgrte */, SystemZ::AsmJECLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2040 /* clgrth */, SystemZ::AsmJHCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2047 /* clgrthe */, SystemZ::AsmJHECLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2055 /* clgrtl */, SystemZ::AsmJLCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2062 /* clgrtle */, SystemZ::AsmJLECLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2070 /* clgrtlh */, SystemZ::AsmJLHCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2078 /* clgrtne */, SystemZ::AsmJLHAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2086 /* clgrtnh */, SystemZ::AsmJLEAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2094 /* clgrtnhe */, SystemZ::AsmJLAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2103 /* clgrtnl */, SystemZ::AsmJHEAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2111 /* clgrtnle */, SystemZ::AsmJHAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2120 /* clgrtnlh */, SystemZ::AsmJEAltCLGRT, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2129 /* clgxbr */, SystemZ::CLGXBR, Convert__GR641_0__U4Imm1_1__FP1281_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_GR64, MCK_U4Imm, MCK_FP128, MCK_U4Imm }, },
  { 2136 /* clhf */, SystemZ::CLHF, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 2141 /* clhhsi */, SystemZ::CLHHSI, Convert__BDAddr64Disp122_0__U16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U16Imm }, },
  { 2148 /* clhrl */, SystemZ::CLHRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 2154 /* cli */, SystemZ::CLI, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 2158 /* clib */, SystemZ::AsmCLIB, Convert__GR321_0__U8Imm1_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR32, MCK_U8Imm, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 2163 /* clibe */, SystemZ::AsmJECLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2169 /* clibh */, SystemZ::AsmJHCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2175 /* clibhe */, SystemZ::AsmJHECLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2182 /* clibl */, SystemZ::AsmJLCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2188 /* clible */, SystemZ::AsmJLECLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2195 /* cliblh */, SystemZ::AsmJLHCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2202 /* clibne */, SystemZ::AsmJLHAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2209 /* clibnh */, SystemZ::AsmJLEAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2216 /* clibnhe */, SystemZ::AsmJLAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2224 /* clibnl */, SystemZ::AsmJHEAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2231 /* clibnle */, SystemZ::AsmJHAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2239 /* clibnlh */, SystemZ::AsmJEAltCLIB, Convert__GR321_0__U8Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U8Imm, MCK_BDAddr64Disp12 }, },
  { 2247 /* clih */, SystemZ::CLIH, Convert__GRH321_0__U32Imm1_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_U32Imm }, },
  { 2252 /* clij */, SystemZ::AsmCLIJ, Convert__GR321_0__U8Imm1_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR32, MCK_U8Imm, MCK_U4Imm, MCK_PCRel16 }, },
  { 2257 /* clije */, SystemZ::AsmJECLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2263 /* clijh */, SystemZ::AsmJHCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2269 /* clijhe */, SystemZ::AsmJHECLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2276 /* clijl */, SystemZ::AsmJLCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2282 /* clijle */, SystemZ::AsmJLECLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2289 /* clijlh */, SystemZ::AsmJLHCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2296 /* clijne */, SystemZ::AsmJLHAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2303 /* clijnh */, SystemZ::AsmJLEAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2310 /* clijnhe */, SystemZ::AsmJLAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2318 /* clijnl */, SystemZ::AsmJHEAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2325 /* clijnle */, SystemZ::AsmJHAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2333 /* clijnlh */, SystemZ::AsmJEAltCLIJ, Convert__GR321_0__U8Imm1_1__PCRel161_2, 0, { MCK_GR32, MCK_U8Imm, MCK_PCRel16 }, },
  { 2341 /* cliy */, SystemZ::CLIY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 2346 /* clr */, SystemZ::CLR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2350 /* clrb */, SystemZ::AsmCLRB, Convert__GR321_0__GR321_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 2355 /* clrbe */, SystemZ::AsmJECLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2361 /* clrbh */, SystemZ::AsmJHCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2367 /* clrbhe */, SystemZ::AsmJHECLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2374 /* clrbl */, SystemZ::AsmJLCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2380 /* clrble */, SystemZ::AsmJLECLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2387 /* clrblh */, SystemZ::AsmJLHCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2394 /* clrbne */, SystemZ::AsmJLHAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2401 /* clrbnh */, SystemZ::AsmJLEAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2408 /* clrbnhe */, SystemZ::AsmJLAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2416 /* clrbnl */, SystemZ::AsmJHEAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2423 /* clrbnle */, SystemZ::AsmJHAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2431 /* clrbnlh */, SystemZ::AsmJEAltCLRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2439 /* clrj */, SystemZ::AsmCLRJ, Convert__GR321_0__GR321_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm, MCK_PCRel16 }, },
  { 2444 /* clrje */, SystemZ::AsmJECLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2450 /* clrjh */, SystemZ::AsmJHCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2456 /* clrjhe */, SystemZ::AsmJHECLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2463 /* clrjl */, SystemZ::AsmJLCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2469 /* clrjle */, SystemZ::AsmJLECLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2476 /* clrjlh */, SystemZ::AsmJLHCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2483 /* clrjne */, SystemZ::AsmJLHAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2490 /* clrjnh */, SystemZ::AsmJLEAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2497 /* clrjnhe */, SystemZ::AsmJLAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2505 /* clrjnl */, SystemZ::AsmJHEAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2512 /* clrjnle */, SystemZ::AsmJHAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2520 /* clrjnlh */, SystemZ::AsmJEAltCLRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2528 /* clrl */, SystemZ::CLRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 2533 /* clrt */, SystemZ::AsmCLRT, Convert__GR321_0__GR321_1__U4Imm1_2, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm }, },
  { 2538 /* clrte */, SystemZ::AsmJECLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2544 /* clrth */, SystemZ::AsmJHCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2550 /* clrthe */, SystemZ::AsmJHECLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2557 /* clrtl */, SystemZ::AsmJLCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2563 /* clrtle */, SystemZ::AsmJLECLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2570 /* clrtlh */, SystemZ::AsmJLHCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2577 /* clrtne */, SystemZ::AsmJLHAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2584 /* clrtnh */, SystemZ::AsmJLEAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2591 /* clrtnhe */, SystemZ::AsmJLAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2599 /* clrtnl */, SystemZ::AsmJHEAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2606 /* clrtnle */, SystemZ::AsmJHAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2614 /* clrtnlh */, SystemZ::AsmJEAltCLRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2622 /* clst */, SystemZ::CLST, Convert__GR641_0__GR641_1__Tie0__Tie1, 0, { MCK_GR64, MCK_GR64 }, },
  { 2627 /* cly */, SystemZ::CLY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 2631 /* cpsdr */, SystemZ::CPSDRdd, Convert__FP641_0__FP641_2__FP641_1, 0, { MCK_FP64, MCK_FP64, MCK_FP64 }, },
  { 2637 /* cr */, SystemZ::CR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2640 /* crb */, SystemZ::AsmCRB, Convert__GR321_0__GR321_1__U4Imm1_2__BDAddr64Disp122_3, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 2644 /* crbe */, SystemZ::AsmJECRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2649 /* crbh */, SystemZ::AsmJHCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2654 /* crbhe */, SystemZ::AsmJHECRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2660 /* crbl */, SystemZ::AsmJLCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2665 /* crble */, SystemZ::AsmJLECRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2671 /* crblh */, SystemZ::AsmJLHCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2677 /* crbne */, SystemZ::AsmJLHAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2683 /* crbnh */, SystemZ::AsmJLEAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2689 /* crbnhe */, SystemZ::AsmJLAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2696 /* crbnl */, SystemZ::AsmJHEAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2702 /* crbnle */, SystemZ::AsmJHAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2709 /* crbnlh */, SystemZ::AsmJEAltCRB, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2716 /* crj */, SystemZ::AsmCRJ, Convert__GR321_0__GR321_1__U4Imm1_2__PCRel161_3, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm, MCK_PCRel16 }, },
  { 2720 /* crje */, SystemZ::AsmJECRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2725 /* crjh */, SystemZ::AsmJHCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2730 /* crjhe */, SystemZ::AsmJHECRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2736 /* crjl */, SystemZ::AsmJLCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2741 /* crjle */, SystemZ::AsmJLECRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2747 /* crjlh */, SystemZ::AsmJLHCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2753 /* crjne */, SystemZ::AsmJLHAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2759 /* crjnh */, SystemZ::AsmJLEAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2765 /* crjnhe */, SystemZ::AsmJLAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2772 /* crjnl */, SystemZ::AsmJHEAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2778 /* crjnle */, SystemZ::AsmJHAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2785 /* crjnlh */, SystemZ::AsmJEAltCRJ, Convert__GR321_0__GR321_1__PCRel161_2, 0, { MCK_GR32, MCK_GR32, MCK_PCRel16 }, },
  { 2792 /* crl */, SystemZ::CRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 2796 /* crt */, SystemZ::AsmCRT, Convert__GR321_0__GR321_1__U4Imm1_2, 0, { MCK_GR32, MCK_GR32, MCK_U4Imm }, },
  { 2800 /* crte */, SystemZ::AsmJECRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2805 /* crth */, SystemZ::AsmJHCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2810 /* crthe */, SystemZ::AsmJHECRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2816 /* crtl */, SystemZ::AsmJLCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2821 /* crtle */, SystemZ::AsmJLECRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2827 /* crtlh */, SystemZ::AsmJLHCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2833 /* crtne */, SystemZ::AsmJLHAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2839 /* crtnh */, SystemZ::AsmJLEAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2845 /* crtnhe */, SystemZ::AsmJLAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2852 /* crtnl */, SystemZ::AsmJHEAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2858 /* crtnle */, SystemZ::AsmJHAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2865 /* crtnlh */, SystemZ::AsmJEAltCRT, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 2872 /* cs */, SystemZ::CS, Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 2875 /* csg */, SystemZ::CSG, Convert__GR641_0__Tie0__GR641_1__BDAddr64Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 2879 /* csy */, SystemZ::CSY, Convert__GR321_0__Tie0__GR321_1__BDAddr64Disp202_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 2883 /* cxbr */, SystemZ::CXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 2888 /* cxfbr */, SystemZ::CXFBR, Convert__FP1281_0__GR321_1, 0, { MCK_FP128, MCK_GR32 }, },
  { 2894 /* cxgbr */, SystemZ::CXGBR, Convert__FP1281_0__GR641_1, 0, { MCK_FP128, MCK_GR64 }, },
  { 2900 /* cxlfbr */, SystemZ::CXLFBR, Convert__FP1281_0__U4Imm1_1__GR321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP128, MCK_U4Imm, MCK_GR32, MCK_U4Imm }, },
  { 2907 /* cxlgbr */, SystemZ::CXLGBR, Convert__FP1281_0__U4Imm1_1__GR641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP128, MCK_U4Imm, MCK_GR64, MCK_U4Imm }, },
  { 2914 /* cy */, SystemZ::CY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 2917 /* ddb */, SystemZ::DDB, Convert__FP641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 2921 /* ddbr */, SystemZ::DDBR, Convert__FP641_0__Tie0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 2926 /* deb */, SystemZ::DEB, Convert__FP321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 2930 /* debr */, SystemZ::DEBR, Convert__FP321_0__Tie0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 2935 /* dl */, SystemZ::DL, Convert__GR1281_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR128, MCK_BDXAddr64Disp20 }, },
  { 2938 /* dlg */, SystemZ::DLG, Convert__GR1281_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR128, MCK_BDXAddr64Disp20 }, },
  { 2942 /* dlgr */, SystemZ::DLGR, Convert__GR1281_0__Tie0__GR641_1, 0, { MCK_GR128, MCK_GR64 }, },
  { 2947 /* dlr */, SystemZ::DLR, Convert__GR1281_0__Tie0__GR321_1, 0, { MCK_GR128, MCK_GR32 }, },
  { 2951 /* dsg */, SystemZ::DSG, Convert__GR1281_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR128, MCK_BDXAddr64Disp20 }, },
  { 2955 /* dsgf */, SystemZ::DSGF, Convert__GR1281_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR128, MCK_BDXAddr64Disp20 }, },
  { 2960 /* dsgfr */, SystemZ::DSGFR, Convert__GR1281_0__Tie0__GR321_1, 0, { MCK_GR128, MCK_GR32 }, },
  { 2966 /* dsgr */, SystemZ::DSGR, Convert__GR1281_0__Tie0__GR641_1, 0, { MCK_GR128, MCK_GR64 }, },
  { 2971 /* dxbr */, SystemZ::DXBR, Convert__FP1281_0__Tie0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 2976 /* ear */, SystemZ::EAR, Convert__GR321_0__AccessReg1_1, 0, { MCK_GR32, MCK_AccessReg }, },
  { 2980 /* ectg */, SystemZ::ECTG, Convert__BDAddr64Disp122_0__BDAddr64Disp122_1__GR641_2, 0, { MCK_BDAddr64Disp12, MCK_BDAddr64Disp12, MCK_GR64 }, },
  { 2985 /* etnd */, SystemZ::ETND, Convert__GR321_0, Feature_FeatureTransactionalExecution, { MCK_GR32 }, },
  { 2990 /* ex */, SystemZ::EX, Convert__GR641_0__BDXAddr64Disp123_1, 0, { MCK_GR64, MCK_BDXAddr64Disp12 }, },
  { 2993 /* exrl */, SystemZ::EXRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 2998 /* fidbr */, SystemZ::FIDBR, Convert__FP641_0__U4Imm1_1__FP641_2, 0, { MCK_FP64, MCK_U4Imm, MCK_FP64 }, },
  { 3004 /* fidbra */, SystemZ::FIDBRA, Convert__FP641_0__U4Imm1_1__FP641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP64, MCK_U4Imm, MCK_FP64, MCK_U4Imm }, },
  { 3011 /* fiebr */, SystemZ::FIEBR, Convert__FP321_0__U4Imm1_1__FP321_2, 0, { MCK_FP32, MCK_U4Imm, MCK_FP32 }, },
  { 3017 /* fiebra */, SystemZ::FIEBRA, Convert__FP321_0__U4Imm1_1__FP321_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP32, MCK_U4Imm, MCK_FP32, MCK_U4Imm }, },
  { 3024 /* fixbr */, SystemZ::FIXBR, Convert__FP1281_0__U4Imm1_1__FP1281_2, 0, { MCK_FP128, MCK_U4Imm, MCK_FP128 }, },
  { 3030 /* fixbra */, SystemZ::FIXBRA, Convert__FP1281_0__U4Imm1_1__FP1281_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP128, MCK_U4Imm, MCK_FP128, MCK_U4Imm }, },
  { 3037 /* flogr */, SystemZ::FLOGR, Convert__GR1281_0__GR641_1, 0, { MCK_GR128, MCK_GR64 }, },
  { 3043 /* ic */, SystemZ::IC, Convert__GR641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR64, MCK_BDXAddr64Disp12 }, },
  { 3046 /* icm */, SystemZ::ICM, Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_U4Imm, MCK_BDAddr64Disp12 }, },
  { 3050 /* icmh */, SystemZ::ICMH, Convert__GRH321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2, 0, { MCK_GRH32, MCK_U4Imm, MCK_BDAddr64Disp20 }, },
  { 3055 /* icmy */, SystemZ::ICMY, Convert__GR321_0__Tie0__U4Imm1_1__BDAddr64Disp202_2, 0, { MCK_GR32, MCK_U4Imm, MCK_BDAddr64Disp20 }, },
  { 3060 /* icy */, SystemZ::ICY, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3064 /* iihf */, SystemZ::IIHF, Convert__GRH321_0__U32Imm1_1, 0, { MCK_GRH32, MCK_U32Imm }, },
  { 3069 /* iihh */, SystemZ::IIHH, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 3074 /* iihl */, SystemZ::IIHL, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 3079 /* iilf */, SystemZ::IILF, Convert__GR321_0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 3084 /* iilh */, SystemZ::IILH, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 3089 /* iill */, SystemZ::IILL, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 3094 /* ipm */, SystemZ::IPM, Convert__GR321_0, 0, { MCK_GR32 }, },
  { 3098 /* j */, SystemZ::J, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3100 /* je */, SystemZ::AsmEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3103 /* jg */, SystemZ::JG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3106 /* jge */, SystemZ::AsmEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3110 /* jgh */, SystemZ::AsmHJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3114 /* jghe */, SystemZ::AsmHEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3119 /* jgl */, SystemZ::AsmLJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3123 /* jgle */, SystemZ::AsmLEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3128 /* jglh */, SystemZ::AsmLHJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3133 /* jgm */, SystemZ::AsmLAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3137 /* jgne */, SystemZ::AsmNEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3142 /* jgnh */, SystemZ::AsmNHJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3147 /* jgnhe */, SystemZ::AsmNHEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3153 /* jgnl */, SystemZ::AsmNLJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3158 /* jgnle */, SystemZ::AsmNLEJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3164 /* jgnlh */, SystemZ::AsmNLHJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3170 /* jgnm */, SystemZ::AsmNLAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3175 /* jgno */, SystemZ::AsmNOJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3180 /* jgnp */, SystemZ::AsmNHAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3185 /* jgnz */, SystemZ::AsmNEAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3190 /* jgo */, SystemZ::AsmOJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3194 /* jgp */, SystemZ::AsmHAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3198 /* jgz */, SystemZ::AsmEAltJG, Convert__PCRel321_0, 0, { MCK_PCRel32 }, },
  { 3202 /* jh */, SystemZ::AsmHJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3205 /* jhe */, SystemZ::AsmHEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3209 /* jl */, SystemZ::AsmLJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3212 /* jle */, SystemZ::AsmLEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3216 /* jlh */, SystemZ::AsmLHJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3220 /* jm */, SystemZ::AsmLAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3223 /* jne */, SystemZ::AsmNEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3227 /* jnh */, SystemZ::AsmNHJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3231 /* jnhe */, SystemZ::AsmNHEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3236 /* jnl */, SystemZ::AsmNLJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3240 /* jnle */, SystemZ::AsmNLEJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3245 /* jnlh */, SystemZ::AsmNLHJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3250 /* jnm */, SystemZ::AsmNLAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3254 /* jno */, SystemZ::AsmNOJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3258 /* jnp */, SystemZ::AsmNHAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3262 /* jnz */, SystemZ::AsmNEAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3266 /* jo */, SystemZ::AsmOJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3269 /* jp */, SystemZ::AsmHAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3272 /* jz */, SystemZ::AsmEAltJ, Convert__PCRel161_0, 0, { MCK_PCRel16 }, },
  { 3275 /* l */, SystemZ::L, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 3277 /* la */, SystemZ::LA, Convert__GR641_0__BDXAddr64Disp123_1, 0, { MCK_GR64, MCK_BDXAddr64Disp12 }, },
  { 3280 /* laa */, SystemZ::LAA, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3284 /* laag */, SystemZ::LAAG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3289 /* laal */, SystemZ::LAAL, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3294 /* laalg */, SystemZ::LAALG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3300 /* lan */, SystemZ::LAN, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3304 /* lang */, SystemZ::LANG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3309 /* lao */, SystemZ::LAO, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3313 /* laog */, SystemZ::LAOG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3318 /* larl */, SystemZ::LARL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3323 /* lax */, SystemZ::LAX, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3327 /* laxg */, SystemZ::LAXG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, Feature_FeatureInterlockedAccess1, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3332 /* lay */, SystemZ::LAY, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3336 /* lb */, SystemZ::LB, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 3339 /* lbh */, SystemZ::LBH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 3343 /* lbr */, SystemZ::LBR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3347 /* lcbb */, SystemZ::LCBB, Convert__GR321_0__BDXAddr64Disp123_1__U4Imm1_2, Feature_FeatureVector, { MCK_GR32, MCK_BDXAddr64Disp12, MCK_U4Imm }, },
  { 3352 /* lcdbr */, SystemZ::LCDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 3358 /* lcdfr */, SystemZ::LCDFR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 3364 /* lcebr */, SystemZ::LCEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 3370 /* lcgfr */, SystemZ::LCGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 3376 /* lcgr */, SystemZ::LCGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3381 /* lcr */, SystemZ::LCR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3385 /* lcxbr */, SystemZ::LCXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 3391 /* ld */, SystemZ::LD, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 3394 /* lde */, SystemZ::LDE32, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 3398 /* ldeb */, SystemZ::LDEB, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 3403 /* ldebr */, SystemZ::LDEBR, Convert__FP641_0__FP321_1, 0, { MCK_FP64, MCK_FP32 }, },
  { 3409 /* ldgr */, SystemZ::LDGR, Convert__FP641_0__GR641_1, 0, { MCK_FP64, MCK_GR64 }, },
  { 3414 /* ldr */, SystemZ::LDR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 3418 /* ldxbr */, SystemZ::LDXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 3424 /* ldxbra */, SystemZ::LDXBRA, Convert__FP1281_0__U4Imm1_1__FP1281_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP128, MCK_U4Imm, MCK_FP128, MCK_U4Imm }, },
  { 3431 /* ldy */, SystemZ::LDY, Convert__FP641_0__BDXAddr64Disp203_1, 0, { MCK_FP64, MCK_BDXAddr64Disp20 }, },
  { 3435 /* le */, SystemZ::LE, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 3438 /* ledbr */, SystemZ::LEDBR, Convert__FP321_0__FP641_1, 0, { MCK_FP32, MCK_FP64 }, },
  { 3444 /* ledbra */, SystemZ::LEDBRA, Convert__FP321_0__U4Imm1_1__FP641_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP32, MCK_U4Imm, MCK_FP64, MCK_U4Imm }, },
  { 3451 /* ler */, SystemZ::LER, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 3455 /* lexbr */, SystemZ::LEXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 3461 /* lexbra */, SystemZ::LEXBRA, Convert__FP1281_0__U4Imm1_1__FP1281_2__U4Imm1_3, Feature_FeatureFPExtension, { MCK_FP128, MCK_U4Imm, MCK_FP128, MCK_U4Imm }, },
  { 3468 /* ley */, SystemZ::LEY, Convert__FP321_0__BDXAddr64Disp203_1, 0, { MCK_FP32, MCK_BDXAddr64Disp20 }, },
  { 3472 /* lfh */, SystemZ::LFH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 3476 /* lg */, SystemZ::LG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3479 /* lgb */, SystemZ::LGB, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3483 /* lgbr */, SystemZ::LGBR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3488 /* lgdr */, SystemZ::LGDR, Convert__GR641_0__FP641_1, 0, { MCK_GR64, MCK_FP64 }, },
  { 3493 /* lgf */, SystemZ::LGF, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3497 /* lgfi */, SystemZ::LGFI, Convert__GR641_0__S32Imm1_1, 0, { MCK_GR64, MCK_S32Imm }, },
  { 3502 /* lgfr */, SystemZ::LGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 3507 /* lgfrl */, SystemZ::LGFRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3513 /* lgh */, SystemZ::LGH, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3517 /* lghi */, SystemZ::LGHI, Convert__GR641_0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 3522 /* lghr */, SystemZ::LGHR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3527 /* lghrl */, SystemZ::LGHRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3533 /* lgr */, SystemZ::LGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3537 /* lgrl */, SystemZ::LGRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3542 /* lh */, SystemZ::LH, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 3545 /* lhh */, SystemZ::LHH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 3549 /* lhi */, SystemZ::LHI, Convert__GR321_0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 3553 /* lhr */, SystemZ::LHR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3557 /* lhrl */, SystemZ::LHRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 3562 /* lhy */, SystemZ::LHY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 3566 /* llc */, SystemZ::LLC, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 3570 /* llch */, SystemZ::LLCH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 3575 /* llcr */, SystemZ::LLCR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3580 /* llgc */, SystemZ::LLGC, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3585 /* llgcr */, SystemZ::LLGCR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3591 /* llgf */, SystemZ::LLGF, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3596 /* llgfr */, SystemZ::LLGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 3602 /* llgfrl */, SystemZ::LLGFRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3609 /* llgh */, SystemZ::LLGH, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 3614 /* llghr */, SystemZ::LLGHR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3620 /* llghrl */, SystemZ::LLGHRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 3627 /* llh */, SystemZ::LLH, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 3631 /* llhh */, SystemZ::LLHH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 3636 /* llhr */, SystemZ::LLHR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3641 /* llhrl */, SystemZ::LLHRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 3647 /* llihf */, SystemZ::LLIHF, Convert__GR641_0__U32Imm1_1, 0, { MCK_GR64, MCK_U32Imm }, },
  { 3653 /* llihh */, SystemZ::LLIHH, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 3659 /* llihl */, SystemZ::LLIHL, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 3665 /* llilf */, SystemZ::LLILF, Convert__GR641_0__U32Imm1_1, 0, { MCK_GR64, MCK_U32Imm }, },
  { 3671 /* llilh */, SystemZ::LLILH, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 3677 /* llill */, SystemZ::LLILL, Convert__GR641_0__U16Imm1_1, 0, { MCK_GR64, MCK_U16Imm }, },
  { 3683 /* lm */, SystemZ::LM, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 3686 /* lmg */, SystemZ::LMG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3690 /* lmh */, SystemZ::LMH, Convert__GRH321_0__GRH321_1__BDAddr64Disp202_2, 0, { MCK_GRH32, MCK_GRH32, MCK_BDAddr64Disp20 }, },
  { 3694 /* lmy */, SystemZ::LMY, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3698 /* lndbr */, SystemZ::LNDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 3704 /* lndfr */, SystemZ::LNDFR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 3710 /* lnebr */, SystemZ::LNEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 3716 /* lngfr */, SystemZ::LNGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 3722 /* lngr */, SystemZ::LNGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 3727 /* lnr */, SystemZ::LNR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 3731 /* lnxbr */, SystemZ::LNXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 3737 /* loc */, SystemZ::AsmLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20, MCK_U4Imm }, },
  { 3741 /* loce */, SystemZ::AsmELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 3746 /* locg */, SystemZ::AsmLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20, MCK_U4Imm }, },
  { 3751 /* locge */, SystemZ::AsmELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3757 /* locgh */, SystemZ::AsmHLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3763 /* locghe */, SystemZ::AsmHELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3770 /* locghi */, SystemZ::AsmLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm, MCK_U4Imm }, },
  { 3777 /* locghie */, SystemZ::AsmELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3785 /* locghih */, SystemZ::AsmHLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3793 /* locghihe */, SystemZ::AsmHELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3802 /* locghil */, SystemZ::AsmLLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3810 /* locghile */, SystemZ::AsmLELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3819 /* locghilh */, SystemZ::AsmLHLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3828 /* locghim */, SystemZ::AsmLAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3836 /* locghine */, SystemZ::AsmNELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3845 /* locghinh */, SystemZ::AsmNHLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3854 /* locghinhe */, SystemZ::AsmNHELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3864 /* locghinl */, SystemZ::AsmNLLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3873 /* locghinle */, SystemZ::AsmNLELOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3883 /* locghinlh */, SystemZ::AsmNLHLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3893 /* locghinm */, SystemZ::AsmNLAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3902 /* locghino */, SystemZ::AsmNOLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3911 /* locghinp */, SystemZ::AsmNHAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3920 /* locghinz */, SystemZ::AsmNEAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3929 /* locghio */, SystemZ::AsmOLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3937 /* locghip */, SystemZ::AsmHAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3945 /* locghiz */, SystemZ::AsmEAltLOCGHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 3953 /* locgl */, SystemZ::AsmLLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3959 /* locgle */, SystemZ::AsmLELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3966 /* locglh */, SystemZ::AsmLHLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3973 /* locgm */, SystemZ::AsmLAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3979 /* locgne */, SystemZ::AsmNELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3986 /* locgnh */, SystemZ::AsmNHLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 3993 /* locgnhe */, SystemZ::AsmNHELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4001 /* locgnl */, SystemZ::AsmNLLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4008 /* locgnle */, SystemZ::AsmNLELOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4016 /* locgnlh */, SystemZ::AsmNLHLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4024 /* locgnm */, SystemZ::AsmNLAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4031 /* locgno */, SystemZ::AsmNOLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4038 /* locgnp */, SystemZ::AsmNHAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4045 /* locgnz */, SystemZ::AsmNEAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4052 /* locgo */, SystemZ::AsmOLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4058 /* locgp */, SystemZ::AsmHAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4064 /* locgr */, SystemZ::AsmLOCGR, Convert__GR641_0__Tie0__GR641_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64, MCK_U4Imm }, },
  { 4070 /* locgre */, SystemZ::AsmELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4077 /* locgrh */, SystemZ::AsmHLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4084 /* locgrhe */, SystemZ::AsmHELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4092 /* locgrl */, SystemZ::AsmLLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4099 /* locgrle */, SystemZ::AsmLELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4107 /* locgrlh */, SystemZ::AsmLHLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4115 /* locgrm */, SystemZ::AsmLAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4122 /* locgrne */, SystemZ::AsmNELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4130 /* locgrnh */, SystemZ::AsmNHLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4138 /* locgrnhe */, SystemZ::AsmNHELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4147 /* locgrnl */, SystemZ::AsmNLLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4155 /* locgrnle */, SystemZ::AsmNLELOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4164 /* locgrnlh */, SystemZ::AsmNLHLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4173 /* locgrnm */, SystemZ::AsmNLAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4181 /* locgrno */, SystemZ::AsmNOLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4189 /* locgrnp */, SystemZ::AsmNHAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4197 /* locgrnz */, SystemZ::AsmNEAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4205 /* locgro */, SystemZ::AsmOLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4212 /* locgrp */, SystemZ::AsmHAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4219 /* locgrz */, SystemZ::AsmEAltLOCGR, Convert__GR641_0__Tie0__GR641_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_GR64 }, },
  { 4226 /* locgz */, SystemZ::AsmEAltLOCG, Convert__GR641_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 4232 /* loch */, SystemZ::AsmHLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4237 /* loche */, SystemZ::AsmHELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4243 /* lochi */, SystemZ::AsmLOCHI, Convert__GR321_0__Tie0__S16Imm1_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond2, { MCK_GR32, MCK_S16Imm, MCK_U4Imm }, },
  { 4249 /* lochie */, SystemZ::AsmELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4256 /* lochih */, SystemZ::AsmHLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4263 /* lochihe */, SystemZ::AsmHELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4271 /* lochil */, SystemZ::AsmLLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4278 /* lochile */, SystemZ::AsmLELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4286 /* lochilh */, SystemZ::AsmLHLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4294 /* lochim */, SystemZ::AsmLAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4301 /* lochine */, SystemZ::AsmNELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4309 /* lochinh */, SystemZ::AsmNHLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4317 /* lochinhe */, SystemZ::AsmNHELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4326 /* lochinl */, SystemZ::AsmNLLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4334 /* lochinle */, SystemZ::AsmNLELOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4343 /* lochinlh */, SystemZ::AsmNLHLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4352 /* lochinm */, SystemZ::AsmNLAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4360 /* lochino */, SystemZ::AsmNOLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4368 /* lochinp */, SystemZ::AsmNHAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4376 /* lochinz */, SystemZ::AsmNEAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4384 /* lochio */, SystemZ::AsmOLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4391 /* lochip */, SystemZ::AsmHAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4398 /* lochiz */, SystemZ::AsmEAltLOCHI, Convert__GR641_0__Tie0__S16Imm1_1, Feature_FeatureLoadStoreOnCond2, { MCK_GR64, MCK_S16Imm }, },
  { 4405 /* locl */, SystemZ::AsmLLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4410 /* locle */, SystemZ::AsmLELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4416 /* loclh */, SystemZ::AsmLHLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4422 /* locm */, SystemZ::AsmLAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4427 /* locne */, SystemZ::AsmNELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4433 /* locnh */, SystemZ::AsmNHLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4439 /* locnhe */, SystemZ::AsmNHELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4446 /* locnl */, SystemZ::AsmNLLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4452 /* locnle */, SystemZ::AsmNLELOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4459 /* locnlh */, SystemZ::AsmNLHLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4466 /* locnm */, SystemZ::AsmNLAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4472 /* locno */, SystemZ::AsmNOLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4478 /* locnp */, SystemZ::AsmNHAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4484 /* locnz */, SystemZ::AsmNEAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4490 /* loco */, SystemZ::AsmOLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4495 /* locp */, SystemZ::AsmHAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4500 /* locr */, SystemZ::AsmLOCR, Convert__GR321_0__Tie0__GR321_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32, MCK_U4Imm }, },
  { 4505 /* locre */, SystemZ::AsmELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4511 /* locrh */, SystemZ::AsmHLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4517 /* locrhe */, SystemZ::AsmHELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4524 /* locrl */, SystemZ::AsmLLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4530 /* locrle */, SystemZ::AsmLELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4537 /* locrlh */, SystemZ::AsmLHLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4544 /* locrm */, SystemZ::AsmLAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4550 /* locrne */, SystemZ::AsmNELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4557 /* locrnh */, SystemZ::AsmNHLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4564 /* locrnhe */, SystemZ::AsmNHELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4572 /* locrnl */, SystemZ::AsmNLLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4579 /* locrnle */, SystemZ::AsmNLELOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4587 /* locrnlh */, SystemZ::AsmNLHLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4595 /* locrnm */, SystemZ::AsmNLAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4602 /* locrno */, SystemZ::AsmNOLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4609 /* locrnp */, SystemZ::AsmNHAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4616 /* locrnz */, SystemZ::AsmNEAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4623 /* locro */, SystemZ::AsmOLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4629 /* locrp */, SystemZ::AsmHAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4635 /* locrz */, SystemZ::AsmEAltLOCR, Convert__GR321_0__Tie0__GR321_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_GR32 }, },
  { 4641 /* locz */, SystemZ::AsmEAltLOC, Convert__GR321_0__Tie0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 4646 /* lpdbr */, SystemZ::LPDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 4652 /* lpdfr */, SystemZ::LPDFR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 4658 /* lpebr */, SystemZ::LPEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 4664 /* lpgfr */, SystemZ::LPGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 4670 /* lpgr */, SystemZ::LPGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 4675 /* lpr */, SystemZ::LPR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 4679 /* lpxbr */, SystemZ::LPXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 4685 /* lr */, SystemZ::LR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 4688 /* lrl */, SystemZ::LRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 4692 /* lrv */, SystemZ::LRV, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4696 /* lrvg */, SystemZ::LRVG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 4701 /* lrvgr */, SystemZ::LRVGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 4707 /* lrvh */, SystemZ::LRVH, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4712 /* lrvr */, SystemZ::LRVR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 4717 /* lt */, SystemZ::LT, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4720 /* ltdbr */, SystemZ::LTDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 4726 /* ltebr */, SystemZ::LTEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 4732 /* ltg */, SystemZ::LTG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 4736 /* ltgf */, SystemZ::LTGF, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 4741 /* ltgfr */, SystemZ::LTGFR, Convert__GR641_0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 4747 /* ltgr */, SystemZ::LTGR, Convert__GR641_0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 4752 /* ltr */, SystemZ::LTR, Convert__GR321_0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 4756 /* ltxbr */, SystemZ::LTXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 4762 /* lxdb */, SystemZ::LXDB, Convert__FP1281_0__BDXAddr64Disp123_1, 0, { MCK_FP128, MCK_BDXAddr64Disp12 }, },
  { 4767 /* lxdbr */, SystemZ::LXDBR, Convert__FP1281_0__FP641_1, 0, { MCK_FP128, MCK_FP64 }, },
  { 4773 /* lxeb */, SystemZ::LXEB, Convert__FP1281_0__BDXAddr64Disp123_1, 0, { MCK_FP128, MCK_BDXAddr64Disp12 }, },
  { 4778 /* lxebr */, SystemZ::LXEBR, Convert__FP1281_0__FP321_1, 0, { MCK_FP128, MCK_FP32 }, },
  { 4784 /* lxr */, SystemZ::LXR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 4788 /* ly */, SystemZ::LY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4791 /* lzdr */, SystemZ::LZDR, Convert__FP641_0, 0, { MCK_FP64 }, },
  { 4796 /* lzer */, SystemZ::LZER, Convert__FP321_0, 0, { MCK_FP32 }, },
  { 4801 /* lzxr */, SystemZ::LZXR, Convert__FP1281_0, 0, { MCK_FP128 }, },
  { 4806 /* madb */, SystemZ::MADB, Convert__FP641_0__Tie0__FP641_1__BDXAddr64Disp123_2, 0, { MCK_FP64, MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 4811 /* madbr */, SystemZ::MADBR, Convert__FP641_0__Tie0__FP641_1__FP641_2, 0, { MCK_FP64, MCK_FP64, MCK_FP64 }, },
  { 4817 /* maeb */, SystemZ::MAEB, Convert__FP321_0__Tie0__FP321_1__BDXAddr64Disp123_2, 0, { MCK_FP32, MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 4822 /* maebr */, SystemZ::MAEBR, Convert__FP321_0__Tie0__FP321_1__FP321_2, 0, { MCK_FP32, MCK_FP32, MCK_FP32 }, },
  { 4828 /* mdb */, SystemZ::MDB, Convert__FP641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 4832 /* mdbr */, SystemZ::MDBR, Convert__FP641_0__Tie0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 4837 /* mdeb */, SystemZ::MDEB, Convert__FP641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 4842 /* mdebr */, SystemZ::MDEBR, Convert__FP641_0__Tie0__FP321_1, 0, { MCK_FP64, MCK_FP32 }, },
  { 4848 /* meeb */, SystemZ::MEEB, Convert__FP321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 4853 /* meebr */, SystemZ::MEEBR, Convert__FP321_0__Tie0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 4859 /* mghi */, SystemZ::MGHI, Convert__GR641_0__Tie0__S16Imm1_1, 0, { MCK_GR64, MCK_S16Imm }, },
  { 4864 /* mh */, SystemZ::MH, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 4867 /* mhi */, SystemZ::MHI, Convert__GR321_0__Tie0__S16Imm1_1, 0, { MCK_GR32, MCK_S16Imm }, },
  { 4871 /* mhy */, SystemZ::MHY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4875 /* mlg */, SystemZ::MLG, Convert__GR1281_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR128, MCK_BDXAddr64Disp20 }, },
  { 4879 /* mlgr */, SystemZ::MLGR, Convert__GR1281_0__Tie0__GR641_1, 0, { MCK_GR128, MCK_GR64 }, },
  { 4884 /* ms */, SystemZ::MS, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 4887 /* msdb */, SystemZ::MSDB, Convert__FP641_0__Tie0__FP641_1__BDXAddr64Disp123_2, 0, { MCK_FP64, MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 4892 /* msdbr */, SystemZ::MSDBR, Convert__FP641_0__Tie0__FP641_1__FP641_2, 0, { MCK_FP64, MCK_FP64, MCK_FP64 }, },
  { 4898 /* mseb */, SystemZ::MSEB, Convert__FP321_0__Tie0__FP321_1__BDXAddr64Disp123_2, 0, { MCK_FP32, MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 4903 /* msebr */, SystemZ::MSEBR, Convert__FP321_0__Tie0__FP321_1__FP321_2, 0, { MCK_FP32, MCK_FP32, MCK_FP32 }, },
  { 4909 /* msfi */, SystemZ::MSFI, Convert__GR321_0__Tie0__S32Imm1_1, 0, { MCK_GR32, MCK_S32Imm }, },
  { 4914 /* msg */, SystemZ::MSG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 4918 /* msgf */, SystemZ::MSGF, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 4923 /* msgfi */, SystemZ::MSGFI, Convert__GR641_0__Tie0__S32Imm1_1, 0, { MCK_GR64, MCK_S32Imm }, },
  { 4929 /* msgfr */, SystemZ::MSGFR, Convert__GR641_0__Tie0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 4935 /* msgr */, SystemZ::MSGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 4940 /* msr */, SystemZ::MSR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 4944 /* msy */, SystemZ::MSY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 4948 /* mvc */, SystemZ::MVC, Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1, 0, { MCK_BDLAddr64Disp12Len8, MCK_BDAddr64Disp12 }, },
  { 4952 /* mvck */, SystemZ::MVCK, Convert__BDXAddr64Disp123_0__BDAddr64Disp122_1__GR641_2, 0, { MCK_BDXAddr64Disp12, MCK_BDAddr64Disp12, MCK_GR64 }, },
  { 4957 /* mvghi */, SystemZ::MVGHI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 4963 /* mvhhi */, SystemZ::MVHHI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 4969 /* mvhi */, SystemZ::MVHI, Convert__BDAddr64Disp122_0__S16Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_S16Imm }, },
  { 4974 /* mvi */, SystemZ::MVI, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 4978 /* mviy */, SystemZ::MVIY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 4983 /* mvst */, SystemZ::MVST, Convert__GR641_0__GR641_1__Tie0__Tie1, 0, { MCK_GR64, MCK_GR64 }, },
  { 4988 /* mxbr */, SystemZ::MXBR, Convert__FP1281_0__Tie0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 4993 /* mxdb */, SystemZ::MXDB, Convert__FP1281_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP128, MCK_BDXAddr64Disp12 }, },
  { 4998 /* mxdbr */, SystemZ::MXDBR, Convert__FP1281_0__Tie0__FP641_1, 0, { MCK_FP128, MCK_FP64 }, },
  { 5004 /* n */, SystemZ::N, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5006 /* nc */, SystemZ::NC, Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1, 0, { MCK_BDLAddr64Disp12Len8, MCK_BDAddr64Disp12 }, },
  { 5009 /* ng */, SystemZ::NG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5012 /* ngr */, SystemZ::NGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5016 /* ngrk */, SystemZ::NGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 5021 /* ni */, SystemZ::NI, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 5024 /* nihf */, SystemZ::NIHF, Convert__GRH321_0__Tie0__U32Imm1_1, 0, { MCK_GRH32, MCK_U32Imm }, },
  { 5029 /* nihh */, SystemZ::NIHH, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5034 /* nihl */, SystemZ::NIHL, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5039 /* nilf */, SystemZ::NILF, Convert__GR321_0__Tie0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 5044 /* nilh */, SystemZ::NILH, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5049 /* nill */, SystemZ::NILL, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5054 /* niy */, SystemZ::NIY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 5058 /* nop */, SystemZ::AsmBC, Convert__imm_95_0__BDXAddr64Disp123_0, 0, { MCK_BDXAddr64Disp12 }, },
  { 5062 /* nopr */, SystemZ::AsmBCR, Convert__imm_95_0__GR641_0, 0, { MCK_GR64 }, },
  { 5067 /* nr */, SystemZ::NR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 5070 /* nrk */, SystemZ::NRK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 5074 /* ntstg */, SystemZ::NTSTG, Convert__GR641_0__BDXAddr64Disp203_1, Feature_FeatureTransactionalExecution, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5080 /* ny */, SystemZ::NY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5083 /* o */, SystemZ::O, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5085 /* oc */, SystemZ::OC, Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1, 0, { MCK_BDLAddr64Disp12Len8, MCK_BDAddr64Disp12 }, },
  { 5088 /* og */, SystemZ::OG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5091 /* ogr */, SystemZ::OGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5095 /* ogrk */, SystemZ::OGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 5100 /* oi */, SystemZ::OI, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 5103 /* oihf */, SystemZ::OIHF, Convert__GRH321_0__Tie0__U32Imm1_1, 0, { MCK_GRH32, MCK_U32Imm }, },
  { 5108 /* oihh */, SystemZ::OIHH, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5113 /* oihl */, SystemZ::OIHL, Convert__GRH321_0__Tie0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5118 /* oilf */, SystemZ::OILF, Convert__GR321_0__Tie0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 5123 /* oilh */, SystemZ::OILH, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5128 /* oill */, SystemZ::OILL, Convert__GR321_0__Tie0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5133 /* oiy */, SystemZ::OIY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 5137 /* or */, SystemZ::OR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 5140 /* ork */, SystemZ::ORK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 5144 /* oy */, SystemZ::OY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5147 /* pfd */, SystemZ::PFD, Convert__U4Imm1_0__BDXAddr64Disp203_1, 0, { MCK_U4Imm, MCK_BDXAddr64Disp20 }, },
  { 5151 /* pfdrl */, SystemZ::PFDRL, Convert__U4Imm1_0__PCRel321_1, 0, { MCK_U4Imm, MCK_PCRel32 }, },
  { 5157 /* popcnt */, SystemZ::POPCNT, Convert__GR641_0__GR641_1, Feature_FeaturePopulationCount, { MCK_GR64, MCK_GR64 }, },
  { 5164 /* ppa */, SystemZ::PPA, Convert__GR641_0__GR641_1__U4Imm1_2, Feature_FeatureProcessorAssist, { MCK_GR64, MCK_GR64, MCK_U4Imm }, },
  { 5168 /* pr */, SystemZ::PR, Convert_NoOperands, 0, {  }, },
  { 5171 /* risbg */, SystemZ::RISBG, Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, 0, { MCK_GR64, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5177 /* risbgn */, SystemZ::RISBGN, Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, Feature_FeatureMiscellaneousExtensions, { MCK_GR64, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5184 /* risbhg */, SystemZ::RISBHG, Convert__GRH321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, Feature_FeatureHighWord, { MCK_GRH32, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5191 /* risblg */, SystemZ::RISBLG, Convert__GR321_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, Feature_FeatureHighWord, { MCK_GR32, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5198 /* rll */, SystemZ::RLL, Convert__GR321_0__GR321_1__BDAddr32Disp202_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr32Disp20 }, },
  { 5202 /* rllg */, SystemZ::RLLG, Convert__GR641_0__GR641_1__BDAddr32Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr32Disp20 }, },
  { 5207 /* rnsbg */, SystemZ::RNSBG, Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, 0, { MCK_GR64, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5213 /* rosbg */, SystemZ::ROSBG, Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, 0, { MCK_GR64, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5219 /* rxsbg */, SystemZ::RXSBG, Convert__GR641_0__Tie0__GR641_1__U8Imm1_2__U8Imm1_3__U6Imm1_4, 0, { MCK_GR64, MCK_GR64, MCK_U8Imm, MCK_U8Imm, MCK_U6Imm }, },
  { 5225 /* s */, SystemZ::S, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5227 /* sdb */, SystemZ::SDB, Convert__FP641_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 5231 /* sdbr */, SystemZ::SDBR, Convert__FP641_0__Tie0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 5236 /* seb */, SystemZ::SEB, Convert__FP321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 5240 /* sebr */, SystemZ::SEBR, Convert__FP321_0__Tie0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 5245 /* sg */, SystemZ::SG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5248 /* sgf */, SystemZ::SGF, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5252 /* sgfr */, SystemZ::SGFR, Convert__GR641_0__Tie0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 5257 /* sgr */, SystemZ::SGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5261 /* sgrk */, SystemZ::SGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 5266 /* sh */, SystemZ::SH, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5269 /* shy */, SystemZ::SHY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5273 /* sl */, SystemZ::SL, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5276 /* sla */, SystemZ::SLA, Convert__GR321_0__Tie0__BDAddr32Disp122_1, 0, { MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 5280 /* slak */, SystemZ::SLAK, Convert__GR321_0__GR321_1__BDAddr32Disp202_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_BDAddr32Disp20 }, },
  { 5285 /* slb */, SystemZ::SLB, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5289 /* slbg */, SystemZ::SLBG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5294 /* slbgr */, SystemZ::SLBGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5300 /* slbr */, SystemZ::SLBR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 5305 /* slfi */, SystemZ::SLFI, Convert__GR321_0__Tie0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 5310 /* slg */, SystemZ::SLG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5314 /* slgf */, SystemZ::SLGF, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5319 /* slgfi */, SystemZ::SLGFI, Convert__GR641_0__Tie0__U32Imm1_1, 0, { MCK_GR64, MCK_U32Imm }, },
  { 5325 /* slgfr */, SystemZ::SLGFR, Convert__GR641_0__Tie0__GR321_1, 0, { MCK_GR64, MCK_GR32 }, },
  { 5331 /* slgr */, SystemZ::SLGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5336 /* slgrk */, SystemZ::SLGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 5342 /* sll */, SystemZ::SLL, Convert__GR321_0__Tie0__BDAddr32Disp122_1, 0, { MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 5346 /* sllg */, SystemZ::SLLG, Convert__GR641_0__GR641_1__BDAddr32Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr32Disp20 }, },
  { 5351 /* sllk */, SystemZ::SLLK, Convert__GR321_0__GR321_1__BDAddr32Disp202_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_BDAddr32Disp20 }, },
  { 5356 /* slr */, SystemZ::SLR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 5360 /* slrk */, SystemZ::SLRK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 5365 /* sly */, SystemZ::SLY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5369 /* sqdb */, SystemZ::SQDB, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 5374 /* sqdbr */, SystemZ::SQDBR, Convert__FP641_0__FP641_1, 0, { MCK_FP64, MCK_FP64 }, },
  { 5380 /* sqeb */, SystemZ::SQEB, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 5385 /* sqebr */, SystemZ::SQEBR, Convert__FP321_0__FP321_1, 0, { MCK_FP32, MCK_FP32 }, },
  { 5391 /* sqxbr */, SystemZ::SQXBR, Convert__FP1281_0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 5397 /* sr */, SystemZ::SR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 5400 /* sra */, SystemZ::SRA, Convert__GR321_0__Tie0__BDAddr32Disp122_1, 0, { MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 5404 /* srag */, SystemZ::SRAG, Convert__GR641_0__GR641_1__BDAddr32Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr32Disp20 }, },
  { 5409 /* srak */, SystemZ::SRAK, Convert__GR321_0__GR321_1__BDAddr32Disp202_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_BDAddr32Disp20 }, },
  { 5414 /* srk */, SystemZ::SRK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 5418 /* srl */, SystemZ::SRL, Convert__GR321_0__Tie0__BDAddr32Disp122_1, 0, { MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 5422 /* srlg */, SystemZ::SRLG, Convert__GR641_0__GR641_1__BDAddr32Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr32Disp20 }, },
  { 5427 /* srlk */, SystemZ::SRLK, Convert__GR321_0__GR321_1__BDAddr32Disp202_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_BDAddr32Disp20 }, },
  { 5432 /* srst */, SystemZ::SRST, Convert__GR641_0__GR641_1__Tie0__Tie1, 0, { MCK_GR64, MCK_GR64 }, },
  { 5437 /* st */, SystemZ::ST, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5440 /* stc */, SystemZ::STC, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5444 /* stch */, SystemZ::STCH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 5449 /* stck */, SystemZ::STCK, Convert__BDAddr64Disp122_0, 0, { MCK_BDAddr64Disp12 }, },
  { 5454 /* stcke */, SystemZ::STCKE, Convert__BDAddr64Disp122_0, 0, { MCK_BDAddr64Disp12 }, },
  { 5460 /* stckf */, SystemZ::STCKF, Convert__BDAddr64Disp122_0, 0, { MCK_BDAddr64Disp12 }, },
  { 5466 /* stcy */, SystemZ::STCY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5471 /* std */, SystemZ::STD, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 5475 /* stdy */, SystemZ::STDY, Convert__FP641_0__BDXAddr64Disp203_1, 0, { MCK_FP64, MCK_BDXAddr64Disp20 }, },
  { 5480 /* ste */, SystemZ::STE, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 5484 /* stey */, SystemZ::STEY, Convert__FP321_0__BDXAddr64Disp203_1, 0, { MCK_FP32, MCK_BDXAddr64Disp20 }, },
  { 5489 /* stfh */, SystemZ::STFH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 5494 /* stfle */, SystemZ::STFLE, Convert__BDAddr64Disp122_0, 0, { MCK_BDAddr64Disp12 }, },
  { 5500 /* stg */, SystemZ::STG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5504 /* stgrl */, SystemZ::STGRL, Convert__GR641_0__PCRel321_1, 0, { MCK_GR64, MCK_PCRel32 }, },
  { 5510 /* sth */, SystemZ::STH, Convert__GR321_0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 5514 /* sthh */, SystemZ::STHH, Convert__GRH321_0__BDXAddr64Disp203_1, Feature_FeatureHighWord, { MCK_GRH32, MCK_BDXAddr64Disp20 }, },
  { 5519 /* sthrl */, SystemZ::STHRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 5525 /* sthy */, SystemZ::STHY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5530 /* stm */, SystemZ::STM, Convert__GR321_0__GR321_1__BDAddr64Disp122_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 5534 /* stmg */, SystemZ::STMG, Convert__GR641_0__GR641_1__BDAddr64Disp202_2, 0, { MCK_GR64, MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5539 /* stmh */, SystemZ::STMH, Convert__GRH321_0__GRH321_1__BDAddr64Disp202_2, 0, { MCK_GRH32, MCK_GRH32, MCK_BDAddr64Disp20 }, },
  { 5544 /* stmy */, SystemZ::STMY, Convert__GR321_0__GR321_1__BDAddr64Disp202_2, 0, { MCK_GR32, MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5549 /* stoc */, SystemZ::AsmSTOC, Convert__GR321_0__BDAddr64Disp202_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20, MCK_U4Imm }, },
  { 5554 /* stoce */, SystemZ::AsmESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5560 /* stocg */, SystemZ::AsmSTOCG, Convert__GR641_0__BDAddr64Disp202_1__U4Imm1_2, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20, MCK_U4Imm }, },
  { 5566 /* stocge */, SystemZ::AsmESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5573 /* stocgh */, SystemZ::AsmHSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5580 /* stocghe */, SystemZ::AsmHESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5588 /* stocgl */, SystemZ::AsmLSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5595 /* stocgle */, SystemZ::AsmLESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5603 /* stocglh */, SystemZ::AsmLHSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5611 /* stocgm */, SystemZ::AsmLAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5618 /* stocgne */, SystemZ::AsmNESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5626 /* stocgnh */, SystemZ::AsmNHSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5634 /* stocgnhe */, SystemZ::AsmNHESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5643 /* stocgnl */, SystemZ::AsmNLSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5651 /* stocgnle */, SystemZ::AsmNLESTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5660 /* stocgnlh */, SystemZ::AsmNLHSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5669 /* stocgnm */, SystemZ::AsmNLAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5677 /* stocgno */, SystemZ::AsmNOSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5685 /* stocgnp */, SystemZ::AsmNHAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5693 /* stocgnz */, SystemZ::AsmNEAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5701 /* stocgo */, SystemZ::AsmOSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5708 /* stocgp */, SystemZ::AsmHAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5715 /* stocgz */, SystemZ::AsmEAltSTOCG, Convert__GR641_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR64, MCK_BDAddr64Disp20 }, },
  { 5722 /* stoch */, SystemZ::AsmHSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5728 /* stoche */, SystemZ::AsmHESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5735 /* stocl */, SystemZ::AsmLSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5741 /* stocle */, SystemZ::AsmLESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5748 /* stoclh */, SystemZ::AsmLHSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5755 /* stocm */, SystemZ::AsmLAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5761 /* stocne */, SystemZ::AsmNESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5768 /* stocnh */, SystemZ::AsmNHSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5775 /* stocnhe */, SystemZ::AsmNHESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5783 /* stocnl */, SystemZ::AsmNLSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5790 /* stocnle */, SystemZ::AsmNLESTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5798 /* stocnlh */, SystemZ::AsmNLHSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5806 /* stocnm */, SystemZ::AsmNLAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5813 /* stocno */, SystemZ::AsmNOSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5820 /* stocnp */, SystemZ::AsmNHAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5827 /* stocnz */, SystemZ::AsmNEAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5834 /* stoco */, SystemZ::AsmOSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5840 /* stocp */, SystemZ::AsmHAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5846 /* stocz */, SystemZ::AsmEAltSTOC, Convert__GR321_0__BDAddr64Disp202_1, Feature_FeatureLoadStoreOnCond, { MCK_GR32, MCK_BDAddr64Disp20 }, },
  { 5852 /* strag */, SystemZ::STRAG, Convert__BDAddr64Disp122_0__BDAddr64Disp122_1, 0, { MCK_BDAddr64Disp12, MCK_BDAddr64Disp12 }, },
  { 5858 /* strl */, SystemZ::STRL, Convert__GR321_0__PCRel321_1, 0, { MCK_GR32, MCK_PCRel32 }, },
  { 5863 /* strv */, SystemZ::STRV, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5868 /* strvg */, SystemZ::STRVG, Convert__GR641_0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 5874 /* strvh */, SystemZ::STRVH, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5880 /* sty */, SystemZ::STY, Convert__GR321_0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5884 /* svc */, SystemZ::SVC, Convert__U8Imm1_0, 0, { MCK_U8Imm }, },
  { 5888 /* sxbr */, SystemZ::SXBR, Convert__FP1281_0__Tie0__FP1281_1, 0, { MCK_FP128, MCK_FP128 }, },
  { 5893 /* sy */, SystemZ::SY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
  { 5896 /* tabort */, SystemZ::TABORT, Convert__BDAddr64Disp122_0, Feature_FeatureTransactionalExecution, { MCK_BDAddr64Disp12 }, },
  { 5903 /* tbegin */, SystemZ::TBEGIN, Convert__BDAddr64Disp122_0__U16Imm1_1, Feature_FeatureTransactionalExecution, { MCK_BDAddr64Disp12, MCK_U16Imm }, },
  { 5910 /* tbeginc */, SystemZ::TBEGINC, Convert__BDAddr64Disp122_0__U16Imm1_1, Feature_FeatureTransactionalExecution, { MCK_BDAddr64Disp12, MCK_U16Imm }, },
  { 5918 /* tcdb */, SystemZ::TCDB, Convert__FP641_0__BDXAddr64Disp123_1, 0, { MCK_FP64, MCK_BDXAddr64Disp12 }, },
  { 5923 /* tceb */, SystemZ::TCEB, Convert__FP321_0__BDXAddr64Disp123_1, 0, { MCK_FP32, MCK_BDXAddr64Disp12 }, },
  { 5928 /* tcxb */, SystemZ::TCXB, Convert__FP1281_0__BDXAddr64Disp123_1, 0, { MCK_FP128, MCK_BDXAddr64Disp12 }, },
  { 5933 /* tend */, SystemZ::TEND, Convert_NoOperands, Feature_FeatureTransactionalExecution, {  }, },
  { 5938 /* tm */, SystemZ::TM, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 5941 /* tmh */, SystemZ::TMLH, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5945 /* tmhh */, SystemZ::TMHH, Convert__GRH321_0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5950 /* tmhl */, SystemZ::TMHL, Convert__GRH321_0__U16Imm1_1, 0, { MCK_GRH32, MCK_U16Imm }, },
  { 5955 /* tml */, SystemZ::TMLL, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5959 /* tmlh */, SystemZ::TMLH, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5964 /* tmll */, SystemZ::TMLL, Convert__GR321_0__U16Imm1_1, 0, { MCK_GR32, MCK_U16Imm }, },
  { 5969 /* tmy */, SystemZ::TMY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 5973 /* vab */, SystemZ::VAB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 5977 /* vaccb */, SystemZ::VACCB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 5983 /* vacccq */, SystemZ::VACCCQ, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 5990 /* vaccf */, SystemZ::VACCF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 5996 /* vaccg */, SystemZ::VACCG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6002 /* vacch */, SystemZ::VACCH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6008 /* vaccq */, SystemZ::VACCQ, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6014 /* vacq */, SystemZ::VACQ, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6019 /* vaf */, SystemZ::VAF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6023 /* vag */, SystemZ::VAG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6027 /* vah */, SystemZ::VAH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6031 /* vaq */, SystemZ::VAQ, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6035 /* vavgb */, SystemZ::VAVGB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6041 /* vavgf */, SystemZ::VAVGF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6047 /* vavgg */, SystemZ::VAVGG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6053 /* vavgh */, SystemZ::VAVGH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6059 /* vavglb */, SystemZ::VAVGLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6066 /* vavglf */, SystemZ::VAVGLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6073 /* vavglg */, SystemZ::VAVGLG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6080 /* vavglh */, SystemZ::VAVGLH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6087 /* vcdgb */, SystemZ::VCDGB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 6093 /* vcdlgb */, SystemZ::VCDLGB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 6100 /* vceqb */, SystemZ::VCEQB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6106 /* vceqbs */, SystemZ::VCEQBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6113 /* vceqf */, SystemZ::VCEQF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6119 /* vceqfs */, SystemZ::VCEQFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6126 /* vceqg */, SystemZ::VCEQG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6132 /* vceqgs */, SystemZ::VCEQGS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6139 /* vceqh */, SystemZ::VCEQH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6145 /* vceqhs */, SystemZ::VCEQHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6152 /* vcgdb */, SystemZ::VCGDB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 6158 /* vchb */, SystemZ::VCHB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6163 /* vchbs */, SystemZ::VCHBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6169 /* vchf */, SystemZ::VCHF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6174 /* vchfs */, SystemZ::VCHFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6180 /* vchg */, SystemZ::VCHG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6185 /* vchgs */, SystemZ::VCHGS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6191 /* vchh */, SystemZ::VCHH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6196 /* vchhs */, SystemZ::VCHHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6202 /* vchlb */, SystemZ::VCHLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6208 /* vchlbs */, SystemZ::VCHLBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6215 /* vchlf */, SystemZ::VCHLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6221 /* vchlfs */, SystemZ::VCHLFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6228 /* vchlg */, SystemZ::VCHLG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6234 /* vchlgs */, SystemZ::VCHLGS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6241 /* vchlh */, SystemZ::VCHLH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6247 /* vchlhs */, SystemZ::VCHLHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6254 /* vcksm */, SystemZ::VCKSM, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6260 /* vclgdb */, SystemZ::VCLGDB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 6267 /* vclzb */, SystemZ::VCLZB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6273 /* vclzf */, SystemZ::VCLZF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6279 /* vclzg */, SystemZ::VCLZG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6285 /* vclzh */, SystemZ::VCLZH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6291 /* vctzb */, SystemZ::VCTZB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6297 /* vctzf */, SystemZ::VCTZF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6303 /* vctzg */, SystemZ::VCTZG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6309 /* vctzh */, SystemZ::VCTZH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6315 /* vecb */, SystemZ::VECB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6320 /* vecf */, SystemZ::VECF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6325 /* vecg */, SystemZ::VECG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6330 /* vech */, SystemZ::VECH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6335 /* veclb */, SystemZ::VECLB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6341 /* veclf */, SystemZ::VECLF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6347 /* veclg */, SystemZ::VECLG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6353 /* veclh */, SystemZ::VECLH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6359 /* verimb */, SystemZ::VERIMB, Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U8Imm }, },
  { 6366 /* verimf */, SystemZ::VERIMF, Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U8Imm }, },
  { 6373 /* verimg */, SystemZ::VERIMG, Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U8Imm }, },
  { 6380 /* verimh */, SystemZ::VERIMH, Convert__VR1281_0__Tie0__VR1281_1__VR1281_2__U8Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U8Imm }, },
  { 6387 /* verllb */, SystemZ::VERLLB, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6394 /* verllf */, SystemZ::VERLLF, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6401 /* verllg */, SystemZ::VERLLG, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6408 /* verllh */, SystemZ::VERLLH, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6415 /* verllvb */, SystemZ::VERLLVB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6423 /* verllvf */, SystemZ::VERLLVF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6431 /* verllvg */, SystemZ::VERLLVG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6439 /* verllvh */, SystemZ::VERLLVH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6447 /* veslb */, SystemZ::VESLB, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6453 /* veslf */, SystemZ::VESLF, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6459 /* veslg */, SystemZ::VESLG, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6465 /* veslh */, SystemZ::VESLH, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6471 /* veslvb */, SystemZ::VESLVB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6478 /* veslvf */, SystemZ::VESLVF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6485 /* veslvg */, SystemZ::VESLVG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6492 /* veslvh */, SystemZ::VESLVH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6499 /* vesrab */, SystemZ::VESRAB, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6506 /* vesraf */, SystemZ::VESRAF, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6513 /* vesrag */, SystemZ::VESRAG, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6520 /* vesrah */, SystemZ::VESRAH, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6527 /* vesravb */, SystemZ::VESRAVB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6535 /* vesravf */, SystemZ::VESRAVF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6543 /* vesravg */, SystemZ::VESRAVG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6551 /* vesravh */, SystemZ::VESRAVH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6559 /* vesrlb */, SystemZ::VESRLB, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6566 /* vesrlf */, SystemZ::VESRLF, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6573 /* vesrlg */, SystemZ::VESRLG, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6580 /* vesrlh */, SystemZ::VESRLH, Convert__VR1281_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 6587 /* vesrlvb */, SystemZ::VESRLVB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6595 /* vesrlvf */, SystemZ::VESRLVF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6603 /* vesrlvg */, SystemZ::VESRLVG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6611 /* vesrlvh */, SystemZ::VESRLVH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6619 /* vfadb */, SystemZ::VFADB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6625 /* vfaeb */, SystemZ::VFAEB, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6625 /* vfaeb */, SystemZ::VFAEB, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6631 /* vfaebs */, SystemZ::VFAEBS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6631 /* vfaebs */, SystemZ::VFAEBS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6638 /* vfaef */, SystemZ::VFAEF, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6638 /* vfaef */, SystemZ::VFAEF, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6644 /* vfaefs */, SystemZ::VFAEFS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6644 /* vfaefs */, SystemZ::VFAEFS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6651 /* vfaeh */, SystemZ::VFAEH, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6651 /* vfaeh */, SystemZ::VFAEH, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6657 /* vfaehs */, SystemZ::VFAEHS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6657 /* vfaehs */, SystemZ::VFAEHS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6664 /* vfaezb */, SystemZ::VFAEZB, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6664 /* vfaezb */, SystemZ::VFAEZB, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6671 /* vfaezbs */, SystemZ::VFAEZBS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6671 /* vfaezbs */, SystemZ::VFAEZBS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6679 /* vfaezf */, SystemZ::VFAEZF, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6679 /* vfaezf */, SystemZ::VFAEZF, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6686 /* vfaezfs */, SystemZ::VFAEZFS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6686 /* vfaezfs */, SystemZ::VFAEZFS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6694 /* vfaezh */, SystemZ::VFAEZH, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6694 /* vfaezh */, SystemZ::VFAEZH, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6701 /* vfaezhs */, SystemZ::VFAEZHS, Convert__VR1281_0__VR1281_1__VR1281_2__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6701 /* vfaezhs */, SystemZ::VFAEZHS, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 6709 /* vfcedb */, SystemZ::VFCEDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6716 /* vfcedbs */, SystemZ::VFCEDBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6724 /* vfchdb */, SystemZ::VFCHDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6731 /* vfchdbs */, SystemZ::VFCHDBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6739 /* vfchedb */, SystemZ::VFCHEDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6747 /* vfchedbs */, SystemZ::VFCHEDBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6756 /* vfddb */, SystemZ::VFDDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6762 /* vfeeb */, SystemZ::VFEEB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6768 /* vfeebs */, SystemZ::VFEEBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6775 /* vfeef */, SystemZ::VFEEF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6781 /* vfeefs */, SystemZ::VFEEFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6788 /* vfeeh */, SystemZ::VFEEH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6794 /* vfeehs */, SystemZ::VFEEHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6801 /* vfeezb */, SystemZ::VFEEZB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6808 /* vfeezbs */, SystemZ::VFEEZBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6816 /* vfeezf */, SystemZ::VFEEZF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6823 /* vfeezfs */, SystemZ::VFEEZFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6831 /* vfeezh */, SystemZ::VFEEZH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6838 /* vfeezhs */, SystemZ::VFEEZHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6846 /* vfeneb */, SystemZ::VFENEB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6853 /* vfenebs */, SystemZ::VFENEBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6861 /* vfenef */, SystemZ::VFENEF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6868 /* vfenefs */, SystemZ::VFENEFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6876 /* vfeneh */, SystemZ::VFENEH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6883 /* vfenehs */, SystemZ::VFENEHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6891 /* vfenezb */, SystemZ::VFENEZB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6899 /* vfenezbs */, SystemZ::VFENEZBS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6908 /* vfenezf */, SystemZ::VFENEZF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6916 /* vfenezfs */, SystemZ::VFENEZFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6925 /* vfenezh */, SystemZ::VFENEZH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6933 /* vfenezhs */, SystemZ::VFENEZHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6942 /* vfidb */, SystemZ::VFIDB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 6948 /* vflcdb */, SystemZ::VFLCDB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6955 /* vflndb */, SystemZ::VFLNDB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6962 /* vflpdb */, SystemZ::VFLPDB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 6969 /* vfmadb */, SystemZ::VFMADB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6976 /* vfmdb */, SystemZ::VFMDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6982 /* vfmsdb */, SystemZ::VFMSDB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6989 /* vfsdb */, SystemZ::VFSDB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 6995 /* vfsqdb */, SystemZ::VFSQDB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7002 /* vftcidb */, SystemZ::VFTCIDB, Convert__VR1281_0__VR1281_1__U12Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U12Imm }, },
  { 7010 /* vgbm */, SystemZ::VGBM, Convert__VR1281_0__U16Imm1_1, Feature_FeatureVector, { MCK_VR128, MCK_U16Imm }, },
  { 7015 /* vgef */, SystemZ::VGEF, Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U2Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDVAddr64Disp12, MCK_U2Imm }, },
  { 7020 /* vgeg */, SystemZ::VGEG, Convert__VR1281_0__Tie0__BDVAddr64Disp123_1__U1Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDVAddr64Disp12, MCK_U1Imm }, },
  { 7025 /* vgfmab */, SystemZ::VGFMAB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7032 /* vgfmaf */, SystemZ::VGFMAF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7039 /* vgfmag */, SystemZ::VGFMAG, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7046 /* vgfmah */, SystemZ::VGFMAH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7053 /* vgfmb */, SystemZ::VGFMB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7059 /* vgfmf */, SystemZ::VGFMF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7065 /* vgfmg */, SystemZ::VGFMG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7071 /* vgfmh */, SystemZ::VGFMH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7077 /* vgmb */, SystemZ::VGMB, Convert__VR1281_0__U8Imm1_1__U8Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_U8Imm, MCK_U8Imm }, },
  { 7082 /* vgmf */, SystemZ::VGMF, Convert__VR1281_0__U8Imm1_1__U8Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_U8Imm, MCK_U8Imm }, },
  { 7087 /* vgmg */, SystemZ::VGMG, Convert__VR1281_0__U8Imm1_1__U8Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_U8Imm, MCK_U8Imm }, },
  { 7092 /* vgmh */, SystemZ::VGMH, Convert__VR1281_0__U8Imm1_1__U8Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_U8Imm, MCK_U8Imm }, },
  { 7097 /* vistrb */, SystemZ::VISTRB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7104 /* vistrbs */, SystemZ::VISTRBS, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7112 /* vistrf */, SystemZ::VISTRF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7119 /* vistrfs */, SystemZ::VISTRFS, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7127 /* vistrh */, SystemZ::VISTRH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7134 /* vistrhs */, SystemZ::VISTRHS, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7142 /* vl */, SystemZ::VL, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7145 /* vlbb */, SystemZ::VLBB, Convert__VR1281_0__BDXAddr64Disp123_1__U4Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U4Imm }, },
  { 7150 /* vlcb */, SystemZ::VLCB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7155 /* vlcf */, SystemZ::VLCF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7160 /* vlcg */, SystemZ::VLCG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7165 /* vlch */, SystemZ::VLCH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7170 /* vldeb */, SystemZ::VLDEB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7176 /* vleb */, SystemZ::VLEB, Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U4Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U4Imm }, },
  { 7181 /* vledb */, SystemZ::VLEDB, Convert__VR1281_0__VR1281_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm, MCK_U4Imm }, },
  { 7187 /* vlef */, SystemZ::VLEF, Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U2Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U2Imm }, },
  { 7192 /* vleg */, SystemZ::VLEG, Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U1Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U1Imm }, },
  { 7197 /* vleh */, SystemZ::VLEH, Convert__VR1281_0__Tie0__BDXAddr64Disp123_1__U3Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U3Imm }, },
  { 7202 /* vleib */, SystemZ::VLEIB, Convert__VR1281_0__Tie0__S16Imm1_1__U4Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm, MCK_U4Imm }, },
  { 7208 /* vleif */, SystemZ::VLEIF, Convert__VR1281_0__Tie0__S16Imm1_1__U2Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm, MCK_U2Imm }, },
  { 7214 /* vleig */, SystemZ::VLEIG, Convert__VR1281_0__Tie0__S16Imm1_1__U1Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm, MCK_U1Imm }, },
  { 7220 /* vleih */, SystemZ::VLEIH, Convert__VR1281_0__Tie0__S16Imm1_1__U3Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm, MCK_U3Imm }, },
  { 7226 /* vlgvb */, SystemZ::VLGVB, Convert__GR641_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_GR64, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 7232 /* vlgvf */, SystemZ::VLGVF, Convert__GR641_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_GR64, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 7238 /* vlgvg */, SystemZ::VLGVG, Convert__GR641_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_GR64, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 7244 /* vlgvh */, SystemZ::VLGVH, Convert__GR641_0__VR1281_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_GR64, MCK_VR128, MCK_BDAddr32Disp12 }, },
  { 7250 /* vll */, SystemZ::VLL, Convert__VR1281_0__GR321_1__BDAddr64Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 7254 /* vllezb */, SystemZ::VLLEZB, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7261 /* vllezf */, SystemZ::VLLEZF, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7268 /* vllezg */, SystemZ::VLLEZG, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7275 /* vllezh */, SystemZ::VLLEZH, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7282 /* vlm */, SystemZ::VLM, Convert__VR1281_0__VR1281_1__BDAddr64Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr64Disp12 }, },
  { 7286 /* vlpb */, SystemZ::VLPB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7291 /* vlpf */, SystemZ::VLPF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7296 /* vlpg */, SystemZ::VLPG, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7301 /* vlph */, SystemZ::VLPH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7306 /* vlr */, SystemZ::VLR, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 7310 /* vlrepb */, SystemZ::VLREPB, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7317 /* vlrepf */, SystemZ::VLREPF, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7324 /* vlrepg */, SystemZ::VLREPG, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7331 /* vlreph */, SystemZ::VLREPH, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 7338 /* vlvgb */, SystemZ::VLVGB, Convert__VR1281_0__Tie0__GR321_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 7344 /* vlvgf */, SystemZ::VLVGF, Convert__VR1281_0__Tie0__GR321_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 7350 /* vlvgg */, SystemZ::VLVGG, Convert__VR1281_0__Tie0__GR641_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR64, MCK_BDAddr32Disp12 }, },
  { 7356 /* vlvgh */, SystemZ::VLVGH, Convert__VR1281_0__Tie0__GR321_1__BDAddr32Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR32, MCK_BDAddr32Disp12 }, },
  { 7362 /* vlvgp */, SystemZ::VLVGP, Convert__VR1281_0__GR641_1__GR641_2, Feature_FeatureVector, { MCK_VR128, MCK_GR64, MCK_GR64 }, },
  { 7368 /* vmaeb */, SystemZ::VMAEB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7374 /* vmaef */, SystemZ::VMAEF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7380 /* vmaeh */, SystemZ::VMAEH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7386 /* vmahb */, SystemZ::VMAHB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7392 /* vmahf */, SystemZ::VMAHF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7398 /* vmahh */, SystemZ::VMAHH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7404 /* vmalb */, SystemZ::VMALB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7410 /* vmaleb */, SystemZ::VMALEB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7417 /* vmalef */, SystemZ::VMALEF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7424 /* vmaleh */, SystemZ::VMALEH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7431 /* vmalf */, SystemZ::VMALF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7437 /* vmalhb */, SystemZ::VMALHB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7444 /* vmalhf */, SystemZ::VMALHF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7451 /* vmalhh */, SystemZ::VMALHH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7458 /* vmalhw */, SystemZ::VMALHW, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7465 /* vmalob */, SystemZ::VMALOB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7472 /* vmalof */, SystemZ::VMALOF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7479 /* vmaloh */, SystemZ::VMALOH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7486 /* vmaob */, SystemZ::VMAOB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7492 /* vmaof */, SystemZ::VMAOF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7498 /* vmaoh */, SystemZ::VMAOH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7504 /* vmeb */, SystemZ::VMEB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7509 /* vmef */, SystemZ::VMEF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7514 /* vmeh */, SystemZ::VMEH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7519 /* vmhb */, SystemZ::VMHB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7524 /* vmhf */, SystemZ::VMHF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7529 /* vmhh */, SystemZ::VMHH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7534 /* vmlb */, SystemZ::VMLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7539 /* vmleb */, SystemZ::VMLEB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7545 /* vmlef */, SystemZ::VMLEF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7551 /* vmleh */, SystemZ::VMLEH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7557 /* vmlf */, SystemZ::VMLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7562 /* vmlhb */, SystemZ::VMLHB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7568 /* vmlhf */, SystemZ::VMLHF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7574 /* vmlhh */, SystemZ::VMLHH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7580 /* vmlhw */, SystemZ::VMLHW, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7586 /* vmlob */, SystemZ::VMLOB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7592 /* vmlof */, SystemZ::VMLOF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7598 /* vmloh */, SystemZ::VMLOH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7604 /* vmnb */, SystemZ::VMNB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7609 /* vmnf */, SystemZ::VMNF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7614 /* vmng */, SystemZ::VMNG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7619 /* vmnh */, SystemZ::VMNH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7624 /* vmnlb */, SystemZ::VMNLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7630 /* vmnlf */, SystemZ::VMNLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7636 /* vmnlg */, SystemZ::VMNLG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7642 /* vmnlh */, SystemZ::VMNLH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7648 /* vmob */, SystemZ::VMOB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7653 /* vmof */, SystemZ::VMOF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7658 /* vmoh */, SystemZ::VMOH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7663 /* vmrhb */, SystemZ::VMRHB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7669 /* vmrhf */, SystemZ::VMRHF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7675 /* vmrhg */, SystemZ::VMRHG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7681 /* vmrhh */, SystemZ::VMRHH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7687 /* vmrlb */, SystemZ::VMRLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7693 /* vmrlf */, SystemZ::VMRLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7699 /* vmrlg */, SystemZ::VMRLG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7705 /* vmrlh */, SystemZ::VMRLH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7711 /* vmxb */, SystemZ::VMXB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7716 /* vmxf */, SystemZ::VMXF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7721 /* vmxg */, SystemZ::VMXG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7726 /* vmxh */, SystemZ::VMXH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7731 /* vmxlb */, SystemZ::VMXLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7737 /* vmxlf */, SystemZ::VMXLF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7743 /* vmxlg */, SystemZ::VMXLG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7749 /* vmxlh */, SystemZ::VMXLH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7755 /* vn */, SystemZ::VN, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7758 /* vnc */, SystemZ::VNC, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7762 /* vno */, SystemZ::VNO, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7766 /* vo */, SystemZ::VO, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7769 /* vone */, SystemZ::VONE, Convert__VR1281_0, Feature_FeatureVector, { MCK_VR128 }, },
  { 7774 /* vpdi */, SystemZ::VPDI, Convert__VR1281_0__VR1281_1__VR1281_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 7779 /* vperm */, SystemZ::VPERM, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7785 /* vpkf */, SystemZ::VPKF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7790 /* vpkg */, SystemZ::VPKG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7795 /* vpkh */, SystemZ::VPKH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7800 /* vpklsf */, SystemZ::VPKLSF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7807 /* vpklsfs */, SystemZ::VPKLSFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7815 /* vpklsg */, SystemZ::VPKLSG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7822 /* vpklsgs */, SystemZ::VPKLSGS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7830 /* vpklsh */, SystemZ::VPKLSH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7837 /* vpklshs */, SystemZ::VPKLSHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7845 /* vpksf */, SystemZ::VPKSF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7851 /* vpksfs */, SystemZ::VPKSFS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7858 /* vpksg */, SystemZ::VPKSG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7864 /* vpksgs */, SystemZ::VPKSGS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7871 /* vpksh */, SystemZ::VPKSH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7877 /* vpkshs */, SystemZ::VPKSHS, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7884 /* vpopct */, SystemZ::VPOPCT, Convert__VR1281_0__VR1281_1__U4Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 7891 /* vrepb */, SystemZ::VREPB, Convert__VR1281_0__VR1281_1__U16Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U16Imm }, },
  { 7897 /* vrepf */, SystemZ::VREPF, Convert__VR1281_0__VR1281_1__U16Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U16Imm }, },
  { 7903 /* vrepg */, SystemZ::VREPG, Convert__VR1281_0__VR1281_1__U16Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U16Imm }, },
  { 7909 /* vreph */, SystemZ::VREPH, Convert__VR1281_0__VR1281_1__U16Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_U16Imm }, },
  { 7915 /* vrepib */, SystemZ::VREPIB, Convert__VR1281_0__S16Imm1_1, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm }, },
  { 7922 /* vrepif */, SystemZ::VREPIF, Convert__VR1281_0__S16Imm1_1, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm }, },
  { 7929 /* vrepig */, SystemZ::VREPIG, Convert__VR1281_0__S16Imm1_1, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm }, },
  { 7936 /* vrepih */, SystemZ::VREPIH, Convert__VR1281_0__S16Imm1_1, Feature_FeatureVector, { MCK_VR128, MCK_S16Imm }, },
  { 7943 /* vsb */, SystemZ::VSB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7947 /* vsbcbiq */, SystemZ::VSBCBIQ, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7955 /* vsbiq */, SystemZ::VSBIQ, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7961 /* vscbib */, SystemZ::VSCBIB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7968 /* vscbif */, SystemZ::VSCBIF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7975 /* vscbig */, SystemZ::VSCBIG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7982 /* vscbih */, SystemZ::VSCBIH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7989 /* vscbiq */, SystemZ::VSCBIQ, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 7996 /* vscef */, SystemZ::VSCEF, Convert__VR1281_0__BDVAddr64Disp123_1__U2Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDVAddr64Disp12, MCK_U2Imm }, },
  { 8002 /* vsceg */, SystemZ::VSCEG, Convert__VR1281_0__BDVAddr64Disp123_1__U1Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDVAddr64Disp12, MCK_U1Imm }, },
  { 8008 /* vsegb */, SystemZ::VSEGB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8014 /* vsegf */, SystemZ::VSEGF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8020 /* vsegh */, SystemZ::VSEGH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8026 /* vsel */, SystemZ::VSEL, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8031 /* vsf */, SystemZ::VSF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8035 /* vsg */, SystemZ::VSG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8039 /* vsh */, SystemZ::VSH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8043 /* vsl */, SystemZ::VSL, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8047 /* vslb */, SystemZ::VSLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8052 /* vsldb */, SystemZ::VSLDB, Convert__VR1281_0__VR1281_1__VR1281_2__U8Imm1_3, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_U8Imm }, },
  { 8058 /* vsq */, SystemZ::VSQ, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8062 /* vsra */, SystemZ::VSRA, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8067 /* vsrab */, SystemZ::VSRAB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8073 /* vsrl */, SystemZ::VSRL, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8078 /* vsrlb */, SystemZ::VSRLB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8084 /* vst */, SystemZ::VST, Convert__VR1281_0__BDXAddr64Disp123_1, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12 }, },
  { 8088 /* vsteb */, SystemZ::VSTEB, Convert__VR1281_0__BDXAddr64Disp123_1__U4Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U4Imm }, },
  { 8094 /* vstef */, SystemZ::VSTEF, Convert__VR1281_0__BDXAddr64Disp123_1__U2Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U2Imm }, },
  { 8100 /* vsteg */, SystemZ::VSTEG, Convert__VR1281_0__BDXAddr64Disp123_1__U1Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U1Imm }, },
  { 8106 /* vsteh */, SystemZ::VSTEH, Convert__VR1281_0__BDXAddr64Disp123_1__U3Imm1_2, Feature_FeatureVector, { MCK_VR128, MCK_BDXAddr64Disp12, MCK_U3Imm }, },
  { 8112 /* vstl */, SystemZ::VSTL, Convert__VR1281_0__GR321_1__BDAddr64Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_GR32, MCK_BDAddr64Disp12 }, },
  { 8117 /* vstm */, SystemZ::VSTM, Convert__VR1281_0__VR1281_1__BDAddr64Disp122_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_BDAddr64Disp12 }, },
  { 8122 /* vstrcb */, SystemZ::VSTRCB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8122 /* vstrcb */, SystemZ::VSTRCB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8129 /* vstrcbs */, SystemZ::VSTRCBS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8129 /* vstrcbs */, SystemZ::VSTRCBS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8137 /* vstrcf */, SystemZ::VSTRCF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8137 /* vstrcf */, SystemZ::VSTRCF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8144 /* vstrcfs */, SystemZ::VSTRCFS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8144 /* vstrcfs */, SystemZ::VSTRCFS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8152 /* vstrch */, SystemZ::VSTRCH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8152 /* vstrch */, SystemZ::VSTRCH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8159 /* vstrchs */, SystemZ::VSTRCHS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8159 /* vstrchs */, SystemZ::VSTRCHS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8167 /* vstrczb */, SystemZ::VSTRCZB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8167 /* vstrczb */, SystemZ::VSTRCZB, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8175 /* vstrczbs */, SystemZ::VSTRCZBS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8175 /* vstrczbs */, SystemZ::VSTRCZBS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8184 /* vstrczf */, SystemZ::VSTRCZF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8184 /* vstrczf */, SystemZ::VSTRCZF, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8192 /* vstrczfs */, SystemZ::VSTRCZFS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8192 /* vstrczfs */, SystemZ::VSTRCZFS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8201 /* vstrczh */, SystemZ::VSTRCZH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8201 /* vstrczh */, SystemZ::VSTRCZH, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8209 /* vstrczhs */, SystemZ::VSTRCZHS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__imm_95_0, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8209 /* vstrczhs */, SystemZ::VSTRCZHS, Convert__VR1281_0__VR1281_1__VR1281_2__VR1281_3__U4Imm1_4, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128, MCK_VR128, MCK_U4Imm }, },
  { 8218 /* vsumb */, SystemZ::VSUMB, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8224 /* vsumgf */, SystemZ::VSUMGF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8231 /* vsumgh */, SystemZ::VSUMGH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8238 /* vsumh */, SystemZ::VSUMH, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8244 /* vsumqf */, SystemZ::VSUMQF, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8251 /* vsumqg */, SystemZ::VSUMQG, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8258 /* vtm */, SystemZ::VTM, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8262 /* vuphb */, SystemZ::VUPHB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8268 /* vuphf */, SystemZ::VUPHF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8274 /* vuphh */, SystemZ::VUPHH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8280 /* vuplb */, SystemZ::VUPLB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8286 /* vuplf */, SystemZ::VUPLF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8292 /* vuplhb */, SystemZ::VUPLHB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8299 /* vuplhf */, SystemZ::VUPLHF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8306 /* vuplhh */, SystemZ::VUPLHH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8313 /* vuplhw */, SystemZ::VUPLHW, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8320 /* vupllb */, SystemZ::VUPLLB, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8327 /* vupllf */, SystemZ::VUPLLF, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8334 /* vupllh */, SystemZ::VUPLLH, Convert__VR1281_0__VR1281_1, Feature_FeatureVector, { MCK_VR128, MCK_VR128 }, },
  { 8341 /* vx */, SystemZ::VX, Convert__VR1281_0__VR1281_1__VR1281_2, Feature_FeatureVector, { MCK_VR128, MCK_VR128, MCK_VR128 }, },
  { 8344 /* vzero */, SystemZ::VZERO, Convert__VR1281_0, Feature_FeatureVector, { MCK_VR128 }, },
  { 8350 /* wcdgb */, SystemZ::WCDGB, Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8356 /* wcdlgb */, SystemZ::WCDLGB, Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8363 /* wcgdb */, SystemZ::WCGDB, Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8369 /* wclgdb */, SystemZ::WCLGDB, Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8376 /* wfadb */, SystemZ::WFADB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8382 /* wfcdb */, SystemZ::WFCDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8388 /* wfcedb */, SystemZ::WFCEDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8395 /* wfcedbs */, SystemZ::WFCEDBS, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8403 /* wfchdb */, SystemZ::WFCHDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8410 /* wfchdbs */, SystemZ::WFCHDBS, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8418 /* wfchedb */, SystemZ::WFCHEDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8426 /* wfchedbs */, SystemZ::WFCHEDBS, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8435 /* wfddb */, SystemZ::WFDDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8441 /* wfidb */, SystemZ::WFIDB, Convert__VR641_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8447 /* wfkdb */, SystemZ::WFKDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8453 /* wflcdb */, SystemZ::WFLCDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8460 /* wflndb */, SystemZ::WFLNDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8467 /* wflpdb */, SystemZ::WFLPDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8474 /* wfmadb */, SystemZ::WFMADB, Convert__VR641_0__VR641_1__VR641_2__VR641_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8481 /* wfmdb */, SystemZ::WFMDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8487 /* wfmsdb */, SystemZ::WFMSDB, Convert__VR641_0__VR641_1__VR641_2__VR641_3, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8494 /* wfsdb */, SystemZ::WFSDB, Convert__VR641_0__VR641_1__VR641_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_VR64 }, },
  { 8500 /* wfsqdb */, SystemZ::WFSQDB, Convert__VR641_0__VR641_1, Feature_FeatureVector, { MCK_VR64, MCK_VR64 }, },
  { 8507 /* wftcidb */, SystemZ::WFTCIDB, Convert__VR641_0__VR641_1__U12Imm1_2, Feature_FeatureVector, { MCK_VR64, MCK_VR64, MCK_U12Imm }, },
  { 8515 /* wldeb */, SystemZ::WLDEB, Convert__VR641_0__VR321_1, Feature_FeatureVector, { MCK_VR64, MCK_VR32 }, },
  { 8521 /* wledb */, SystemZ::WLEDB, Convert__VR321_0__VR641_1__U4Imm1_2__U4Imm1_3, Feature_FeatureVector, { MCK_VR32, MCK_VR64, MCK_U4Imm, MCK_U4Imm }, },
  { 8527 /* x */, SystemZ::X, Convert__GR321_0__Tie0__BDXAddr64Disp123_1, 0, { MCK_GR32, MCK_BDXAddr64Disp12 }, },
  { 8529 /* xc */, SystemZ::XC, Convert__BDLAddr64Disp12Len83_0__BDAddr64Disp122_1, 0, { MCK_BDLAddr64Disp12Len8, MCK_BDAddr64Disp12 }, },
  { 8532 /* xg */, SystemZ::XG, Convert__GR641_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR64, MCK_BDXAddr64Disp20 }, },
  { 8535 /* xgr */, SystemZ::XGR, Convert__GR641_0__Tie0__GR641_1, 0, { MCK_GR64, MCK_GR64 }, },
  { 8539 /* xgrk */, SystemZ::XGRK, Convert__GR641_0__GR641_1__GR641_2, Feature_FeatureDistinctOps, { MCK_GR64, MCK_GR64, MCK_GR64 }, },
  { 8544 /* xi */, SystemZ::XI, Convert__BDAddr64Disp122_0__U8Imm1_1, 0, { MCK_BDAddr64Disp12, MCK_U8Imm }, },
  { 8547 /* xihf */, SystemZ::XIHF, Convert__GRH321_0__Tie0__U32Imm1_1, 0, { MCK_GRH32, MCK_U32Imm }, },
  { 8552 /* xilf */, SystemZ::XILF, Convert__GR321_0__Tie0__U32Imm1_1, 0, { MCK_GR32, MCK_U32Imm }, },
  { 8557 /* xiy */, SystemZ::XIY, Convert__BDAddr64Disp202_0__U8Imm1_1, 0, { MCK_BDAddr64Disp20, MCK_U8Imm }, },
  { 8561 /* xr */, SystemZ::XR, Convert__GR321_0__Tie0__GR321_1, 0, { MCK_GR32, MCK_GR32 }, },
  { 8564 /* xrk */, SystemZ::XRK, Convert__GR321_0__GR321_1__GR321_2, Feature_FeatureDistinctOps, { MCK_GR32, MCK_GR32, MCK_GR32 }, },
  { 8568 /* xy */, SystemZ::XY, Convert__GR321_0__Tie0__BDXAddr64Disp203_1, 0, { MCK_GR32, MCK_BDXAddr64Disp20 }, },
};

bool SystemZAsmParser::
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

unsigned SystemZAsmParser::
MatchInstructionImpl(const OperandVector &Operands,
                     MCInst &Inst, uint64_t &ErrorInfo,
                     bool matchingInlineAsm, unsigned VariantID) {
  // Eliminate obvious mismatches.
  if (Operands.size() > 6) {
    ErrorInfo = 6;
    return Match_InvalidOperand;
  }

  // Get the current feature set.
  uint64_t AvailableFeatures = getAvailableFeatures();

  // Get the instruction mnemonic, which is the first token.
  StringRef Mnemonic = ((SystemZOperand&)*Operands[0]).getToken();

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
    for (unsigned FormalIdx = 0, ActualIdx = 1; FormalIdx != 5; ++FormalIdx) {
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

    return Match_Success;
  }

  // Okay, we had no match.  Try to return a useful error code.
  if (HadMatchOtherThanPredicate || !HadMatchOtherThanFeatures)
    return RetCode;

  // Missing feature matches return which features were missing
  ErrorInfo = MissingFeatures;
  return Match_MissingFeature;
}

namespace {
  struct OperandMatchEntry {
    uint16_t RequiredFeatures;
    uint16_t Mnemonic;
    uint8_t Class;
    uint8_t OperandMask;

    StringRef getMnemonic() const {
      return StringRef(MnemonicTable + Mnemonic + 1,
                       MnemonicTable[Mnemonic]);
    }
  };

  // Predicate for searching for an opcode.
  struct LessOpcodeOperand {
    bool operator()(const OperandMatchEntry &LHS, StringRef RHS) {
      return LHS.getMnemonic()  < RHS;
    }
    bool operator()(StringRef LHS, const OperandMatchEntry &RHS) {
      return LHS < RHS.getMnemonic();
    }
    bool operator()(const OperandMatchEntry &LHS, const OperandMatchEntry &RHS) {
      return LHS.getMnemonic() < RHS.getMnemonic();
    }
  };
} // end anonymous namespace.

static const OperandMatchEntry OperandMatchTable[2079] = {
  /* Operand List Mask, Mnemonic, Operand Class, Features */
  { 0, 0 /* a */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 0 /* a */, MCK_GR32, 1 /* 0 */ },
  { 0, 2 /* adb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 2 /* adb */, MCK_FP64, 1 /* 0 */ },
  { 0, 6 /* adbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 11 /* aeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 11 /* aeb */, MCK_FP32, 1 /* 0 */ },
  { 0, 15 /* aebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 20 /* afi */, MCK_GR32, 1 /* 0 */ },
  { 0, 24 /* ag */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 24 /* ag */, MCK_GR64, 1 /* 0 */ },
  { 0, 27 /* agf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 27 /* agf */, MCK_GR64, 1 /* 0 */ },
  { 0, 31 /* agfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 36 /* agfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 36 /* agfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 41 /* aghi */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureDistinctOps, 46 /* aghik */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 52 /* agr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 56 /* agrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 61 /* agsi */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 66 /* ah */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 66 /* ah */, MCK_GR32, 1 /* 0 */ },
  { 0, 69 /* ahi */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureDistinctOps, 73 /* ahik */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 78 /* ahy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 78 /* ahy */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 82 /* aih */, MCK_GRH32, 1 /* 0 */ },
  { 0, 86 /* al */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 86 /* al */, MCK_GR32, 1 /* 0 */ },
  { 0, 89 /* alc */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 89 /* alc */, MCK_GR32, 1 /* 0 */ },
  { 0, 93 /* alcg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 93 /* alcg */, MCK_GR64, 1 /* 0 */ },
  { 0, 98 /* alcgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 104 /* alcr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 109 /* alfi */, MCK_GR32, 1 /* 0 */ },
  { 0, 114 /* alg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 114 /* alg */, MCK_GR64, 1 /* 0 */ },
  { 0, 118 /* algf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 118 /* algf */, MCK_GR64, 1 /* 0 */ },
  { 0, 123 /* algfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 129 /* algfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 129 /* algfr */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureDistinctOps, 135 /* alghsik */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 143 /* algr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 148 /* algrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureDistinctOps, 154 /* alhsik */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 161 /* alr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 165 /* alrk */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 170 /* aly */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 170 /* aly */, MCK_GR32, 1 /* 0 */ },
  { 0, 174 /* ar */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 177 /* ark */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 181 /* asi */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 185 /* axbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 190 /* ay */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 190 /* ay */, MCK_GR32, 1 /* 0 */ },
  { 0, 193 /* basr */, MCK_ADDR64, 2 /* 1 */ },
  { 0, 193 /* basr */, MCK_GR64, 1 /* 0 */ },
  { 0, 198 /* bc */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 201 /* bcr */, MCK_GR64, 2 /* 1 */ },
  { 0, 205 /* ber */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 209 /* bher */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 214 /* bhr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 218 /* bler */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 223 /* blhr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 228 /* blr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 232 /* bmr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 236 /* bner */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 241 /* bnher */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 247 /* bnhr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 252 /* bnler */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 258 /* bnlhr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 264 /* bnlr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 269 /* bnmr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 274 /* bnor */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 279 /* bnpr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 284 /* bnzr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 289 /* bor */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 293 /* bpr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 297 /* br */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 300 /* bras */, MCK_GR64, 1 /* 0 */ },
  { 0, 300 /* bras */, MCK_PCRelTLS16, 2 /* 1 */ },
  { 0, 305 /* brasl */, MCK_GR64, 1 /* 0 */ },
  { 0, 305 /* brasl */, MCK_PCRelTLS32, 2 /* 1 */ },
  { 0, 311 /* brc */, MCK_PCRel16, 2 /* 1 */ },
  { 0, 315 /* brcl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 320 /* brct */, MCK_GR32, 1 /* 0 */ },
  { 0, 320 /* brct */, MCK_PCRel16, 2 /* 1 */ },
  { 0, 325 /* brctg */, MCK_GR64, 1 /* 0 */ },
  { 0, 325 /* brctg */, MCK_PCRel16, 2 /* 1 */ },
  { 0, 331 /* brxh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 331 /* brxh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 336 /* brxle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 336 /* brxle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 342 /* bzr */, MCK_ADDR64, 1 /* 0 */ },
  { 0, 346 /* c */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 346 /* c */, MCK_GR32, 1 /* 0 */ },
  { 0, 348 /* cdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 348 /* cdb */, MCK_FP64, 1 /* 0 */ },
  { 0, 352 /* cdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 357 /* cdfbr */, MCK_FP64, 1 /* 0 */ },
  { 0, 357 /* cdfbr */, MCK_GR32, 2 /* 1 */ },
  { 0, 363 /* cdgbr */, MCK_FP64, 1 /* 0 */ },
  { 0, 363 /* cdgbr */, MCK_GR64, 2 /* 1 */ },
  { Feature_FeatureFPExtension, 369 /* cdlfbr */, MCK_FP64, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 369 /* cdlfbr */, MCK_GR32, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 376 /* cdlgbr */, MCK_FP64, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 376 /* cdlgbr */, MCK_GR64, 4 /* 2 */ },
  { 0, 383 /* ceb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 383 /* ceb */, MCK_FP32, 1 /* 0 */ },
  { 0, 387 /* cebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 392 /* cefbr */, MCK_FP32, 1 /* 0 */ },
  { 0, 392 /* cefbr */, MCK_GR32, 2 /* 1 */ },
  { 0, 398 /* cegbr */, MCK_FP32, 1 /* 0 */ },
  { 0, 398 /* cegbr */, MCK_GR64, 2 /* 1 */ },
  { Feature_FeatureFPExtension, 404 /* celfbr */, MCK_FP32, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 404 /* celfbr */, MCK_GR32, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 411 /* celgbr */, MCK_FP32, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 411 /* celgbr */, MCK_GR64, 4 /* 2 */ },
  { 0, 418 /* cfdbr */, MCK_FP64, 4 /* 2 */ },
  { 0, 418 /* cfdbr */, MCK_GR32, 1 /* 0 */ },
  { 0, 424 /* cfebr */, MCK_FP32, 4 /* 2 */ },
  { 0, 424 /* cfebr */, MCK_GR32, 1 /* 0 */ },
  { 0, 430 /* cfi */, MCK_GR32, 1 /* 0 */ },
  { 0, 434 /* cfxbr */, MCK_FP128, 4 /* 2 */ },
  { 0, 434 /* cfxbr */, MCK_GR32, 1 /* 0 */ },
  { 0, 440 /* cg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 440 /* cg */, MCK_GR64, 1 /* 0 */ },
  { 0, 443 /* cgdbr */, MCK_FP64, 4 /* 2 */ },
  { 0, 443 /* cgdbr */, MCK_GR64, 1 /* 0 */ },
  { 0, 449 /* cgebr */, MCK_FP32, 4 /* 2 */ },
  { 0, 449 /* cgebr */, MCK_GR64, 1 /* 0 */ },
  { 0, 455 /* cgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 455 /* cgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 459 /* cgfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 464 /* cgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 464 /* cgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 469 /* cgfrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 469 /* cgfrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 475 /* cgh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 475 /* cgh */, MCK_GR64, 1 /* 0 */ },
  { 0, 479 /* cghi */, MCK_GR64, 1 /* 0 */ },
  { 0, 484 /* cghrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 484 /* cghrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 490 /* cghsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 496 /* cgib */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 496 /* cgib */, MCK_GR64, 1 /* 0 */ },
  { 0, 501 /* cgibe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 501 /* cgibe */, MCK_GR64, 1 /* 0 */ },
  { 0, 507 /* cgibh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 507 /* cgibh */, MCK_GR64, 1 /* 0 */ },
  { 0, 513 /* cgibhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 513 /* cgibhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 520 /* cgibl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 520 /* cgibl */, MCK_GR64, 1 /* 0 */ },
  { 0, 526 /* cgible */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 526 /* cgible */, MCK_GR64, 1 /* 0 */ },
  { 0, 533 /* cgiblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 533 /* cgiblh */, MCK_GR64, 1 /* 0 */ },
  { 0, 540 /* cgibne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 540 /* cgibne */, MCK_GR64, 1 /* 0 */ },
  { 0, 547 /* cgibnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 547 /* cgibnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 554 /* cgibnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 554 /* cgibnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 562 /* cgibnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 562 /* cgibnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 569 /* cgibnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 569 /* cgibnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 577 /* cgibnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 577 /* cgibnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 585 /* cgij */, MCK_GR64, 1 /* 0 */ },
  { 0, 585 /* cgij */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 590 /* cgije */, MCK_GR64, 1 /* 0 */ },
  { 0, 590 /* cgije */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 596 /* cgijh */, MCK_GR64, 1 /* 0 */ },
  { 0, 596 /* cgijh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 602 /* cgijhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 602 /* cgijhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 609 /* cgijl */, MCK_GR64, 1 /* 0 */ },
  { 0, 609 /* cgijl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 615 /* cgijle */, MCK_GR64, 1 /* 0 */ },
  { 0, 615 /* cgijle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 622 /* cgijlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 622 /* cgijlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 629 /* cgijne */, MCK_GR64, 1 /* 0 */ },
  { 0, 629 /* cgijne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 636 /* cgijnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 636 /* cgijnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 643 /* cgijnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 643 /* cgijnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 651 /* cgijnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 651 /* cgijnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 658 /* cgijnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 658 /* cgijnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 666 /* cgijnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 666 /* cgijnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 674 /* cgit */, MCK_GR64, 1 /* 0 */ },
  { 0, 679 /* cgite */, MCK_GR64, 1 /* 0 */ },
  { 0, 685 /* cgith */, MCK_GR64, 1 /* 0 */ },
  { 0, 691 /* cgithe */, MCK_GR64, 1 /* 0 */ },
  { 0, 698 /* cgitl */, MCK_GR64, 1 /* 0 */ },
  { 0, 704 /* cgitle */, MCK_GR64, 1 /* 0 */ },
  { 0, 711 /* cgitlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 718 /* cgitne */, MCK_GR64, 1 /* 0 */ },
  { 0, 725 /* cgitnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 732 /* cgitnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 740 /* cgitnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 747 /* cgitnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 755 /* cgitnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 763 /* cgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 767 /* cgrb */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 767 /* cgrb */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 772 /* cgrbe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 772 /* cgrbe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 778 /* cgrbh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 778 /* cgrbh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 784 /* cgrbhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 784 /* cgrbhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 791 /* cgrbl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 791 /* cgrbl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 797 /* cgrble */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 797 /* cgrble */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 804 /* cgrblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 804 /* cgrblh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 811 /* cgrbne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 811 /* cgrbne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 818 /* cgrbnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 818 /* cgrbnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 825 /* cgrbnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 825 /* cgrbnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 833 /* cgrbnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 833 /* cgrbnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 840 /* cgrbnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 840 /* cgrbnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 848 /* cgrbnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 848 /* cgrbnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 856 /* cgrj */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 856 /* cgrj */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 861 /* cgrje */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 861 /* cgrje */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 867 /* cgrjh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 867 /* cgrjh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 873 /* cgrjhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 873 /* cgrjhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 880 /* cgrjl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 880 /* cgrjl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 886 /* cgrjle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 886 /* cgrjle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 893 /* cgrjlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 893 /* cgrjlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 900 /* cgrjne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 900 /* cgrjne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 907 /* cgrjnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 907 /* cgrjnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 914 /* cgrjnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 914 /* cgrjnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 922 /* cgrjnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 922 /* cgrjnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 929 /* cgrjnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 929 /* cgrjnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 937 /* cgrjnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 937 /* cgrjnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 945 /* cgrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 945 /* cgrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 950 /* cgrt */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 955 /* cgrte */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 961 /* cgrth */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 967 /* cgrthe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 974 /* cgrtl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 980 /* cgrtle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 987 /* cgrtlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 994 /* cgrtne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1001 /* cgrtnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1008 /* cgrtnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1016 /* cgrtnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1023 /* cgrtnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1031 /* cgrtnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1039 /* cgxbr */, MCK_FP128, 4 /* 2 */ },
  { 0, 1039 /* cgxbr */, MCK_GR64, 1 /* 0 */ },
  { 0, 1045 /* ch */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 1045 /* ch */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 1048 /* chf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 1048 /* chf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 1052 /* chhsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 1058 /* chi */, MCK_GR32, 1 /* 0 */ },
  { 0, 1062 /* chrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1062 /* chrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 1067 /* chsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 1072 /* chy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 1072 /* chy */, MCK_GR32, 1 /* 0 */ },
  { 0, 1076 /* cib */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 1076 /* cib */, MCK_GR32, 1 /* 0 */ },
  { 0, 1080 /* cibe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1080 /* cibe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1085 /* cibh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1085 /* cibh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1090 /* cibhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1090 /* cibhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1096 /* cibl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1096 /* cibl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1101 /* cible */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1101 /* cible */, MCK_GR32, 1 /* 0 */ },
  { 0, 1107 /* ciblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1107 /* ciblh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1113 /* cibne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1113 /* cibne */, MCK_GR32, 1 /* 0 */ },
  { 0, 1119 /* cibnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1119 /* cibnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1125 /* cibnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1125 /* cibnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1132 /* cibnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1132 /* cibnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1138 /* cibnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1138 /* cibnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1145 /* cibnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1145 /* cibnlh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 1152 /* cih */, MCK_GRH32, 1 /* 0 */ },
  { 0, 1156 /* cij */, MCK_GR32, 1 /* 0 */ },
  { 0, 1156 /* cij */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 1160 /* cije */, MCK_GR32, 1 /* 0 */ },
  { 0, 1160 /* cije */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1165 /* cijh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1165 /* cijh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1170 /* cijhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1170 /* cijhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1176 /* cijl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1176 /* cijl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1181 /* cijle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1181 /* cijle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1187 /* cijlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1187 /* cijlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1193 /* cijne */, MCK_GR32, 1 /* 0 */ },
  { 0, 1193 /* cijne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1199 /* cijnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1199 /* cijnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1205 /* cijnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1205 /* cijnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1212 /* cijnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1212 /* cijnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1218 /* cijnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1218 /* cijnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1225 /* cijnlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1225 /* cijnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1232 /* cit */, MCK_GR32, 1 /* 0 */ },
  { 0, 1236 /* cite */, MCK_GR32, 1 /* 0 */ },
  { 0, 1241 /* cith */, MCK_GR32, 1 /* 0 */ },
  { 0, 1246 /* cithe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1252 /* citl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1257 /* citle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1263 /* citlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1269 /* citne */, MCK_GR32, 1 /* 0 */ },
  { 0, 1275 /* citnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1281 /* citnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1288 /* citnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1294 /* citnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1301 /* citnlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1308 /* cl */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 1308 /* cl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1311 /* clc */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 1311 /* clc */, MCK_BDLAddr64Disp12Len8, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 1315 /* clfdbr */, MCK_FP64, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 1315 /* clfdbr */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 1322 /* clfebr */, MCK_FP32, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 1322 /* clfebr */, MCK_GR32, 1 /* 0 */ },
  { 0, 1329 /* clfhsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 1336 /* clfi */, MCK_GR32, 1 /* 0 */ },
  { 0, 1341 /* clfit */, MCK_GR32, 1 /* 0 */ },
  { 0, 1347 /* clfite */, MCK_GR32, 1 /* 0 */ },
  { 0, 1354 /* clfith */, MCK_GR32, 1 /* 0 */ },
  { 0, 1361 /* clfithe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1369 /* clfitl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1376 /* clfitle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1384 /* clfitlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1392 /* clfitne */, MCK_GR32, 1 /* 0 */ },
  { 0, 1400 /* clfitnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 1408 /* clfitnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 1417 /* clfitnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 1425 /* clfitnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 1434 /* clfitnlh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 1443 /* clfxbr */, MCK_FP128, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 1443 /* clfxbr */, MCK_GR32, 1 /* 0 */ },
  { 0, 1450 /* clg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 1450 /* clg */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 1454 /* clgdbr */, MCK_FP64, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 1454 /* clgdbr */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 1461 /* clgebr */, MCK_FP32, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 1461 /* clgebr */, MCK_GR64, 1 /* 0 */ },
  { 0, 1468 /* clgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 1468 /* clgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 1473 /* clgfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 1479 /* clgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 1479 /* clgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 1485 /* clgfrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1485 /* clgfrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 1492 /* clghrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1492 /* clghrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 1499 /* clghsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 1506 /* clgib */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 1506 /* clgib */, MCK_GR64, 1 /* 0 */ },
  { 0, 1512 /* clgibe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1512 /* clgibe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1519 /* clgibh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1519 /* clgibh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1526 /* clgibhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1526 /* clgibhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1534 /* clgibl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1534 /* clgibl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1541 /* clgible */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1541 /* clgible */, MCK_GR64, 1 /* 0 */ },
  { 0, 1549 /* clgiblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1549 /* clgiblh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1557 /* clgibne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1557 /* clgibne */, MCK_GR64, 1 /* 0 */ },
  { 0, 1565 /* clgibnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1565 /* clgibnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1573 /* clgibnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1573 /* clgibnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1582 /* clgibnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1582 /* clgibnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1590 /* clgibnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1590 /* clgibnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 1599 /* clgibnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1599 /* clgibnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1608 /* clgij */, MCK_GR64, 1 /* 0 */ },
  { 0, 1608 /* clgij */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 1614 /* clgije */, MCK_GR64, 1 /* 0 */ },
  { 0, 1614 /* clgije */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1621 /* clgijh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1621 /* clgijh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1628 /* clgijhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1628 /* clgijhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1636 /* clgijl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1636 /* clgijl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1643 /* clgijle */, MCK_GR64, 1 /* 0 */ },
  { 0, 1643 /* clgijle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1651 /* clgijlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1651 /* clgijlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1659 /* clgijne */, MCK_GR64, 1 /* 0 */ },
  { 0, 1659 /* clgijne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1667 /* clgijnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1667 /* clgijnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1675 /* clgijnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1675 /* clgijnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1684 /* clgijnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1684 /* clgijnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1692 /* clgijnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 1692 /* clgijnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1701 /* clgijnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1701 /* clgijnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1710 /* clgit */, MCK_GR64, 1 /* 0 */ },
  { 0, 1716 /* clgite */, MCK_GR64, 1 /* 0 */ },
  { 0, 1723 /* clgith */, MCK_GR64, 1 /* 0 */ },
  { 0, 1730 /* clgithe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1738 /* clgitl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1745 /* clgitle */, MCK_GR64, 1 /* 0 */ },
  { 0, 1753 /* clgitlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1761 /* clgitne */, MCK_GR64, 1 /* 0 */ },
  { 0, 1769 /* clgitnh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1777 /* clgitnhe */, MCK_GR64, 1 /* 0 */ },
  { 0, 1786 /* clgitnl */, MCK_GR64, 1 /* 0 */ },
  { 0, 1794 /* clgitnle */, MCK_GR64, 1 /* 0 */ },
  { 0, 1803 /* clgitnlh */, MCK_GR64, 1 /* 0 */ },
  { 0, 1812 /* clgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1817 /* clgrb */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 1817 /* clgrb */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1823 /* clgrbe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1823 /* clgrbe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1830 /* clgrbh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1830 /* clgrbh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1837 /* clgrbhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1837 /* clgrbhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1845 /* clgrbl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1845 /* clgrbl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1852 /* clgrble */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1852 /* clgrble */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1860 /* clgrblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1860 /* clgrblh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1868 /* clgrbne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1868 /* clgrbne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1876 /* clgrbnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1876 /* clgrbnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1884 /* clgrbnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1884 /* clgrbnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1893 /* clgrbnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1893 /* clgrbnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1901 /* clgrbnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1901 /* clgrbnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1910 /* clgrbnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 1910 /* clgrbnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1919 /* clgrj */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1919 /* clgrj */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 1925 /* clgrje */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1925 /* clgrje */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1932 /* clgrjh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1932 /* clgrjh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1939 /* clgrjhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1939 /* clgrjhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1947 /* clgrjl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1947 /* clgrjl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1954 /* clgrjle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1954 /* clgrjle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1962 /* clgrjlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1962 /* clgrjlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1970 /* clgrjne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1970 /* clgrjne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1978 /* clgrjnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1978 /* clgrjnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1986 /* clgrjnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1986 /* clgrjnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 1995 /* clgrjnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 1995 /* clgrjnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2003 /* clgrjnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2003 /* clgrjnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2012 /* clgrjnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2012 /* clgrjnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2021 /* clgrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 2021 /* clgrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 2027 /* clgrt */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2033 /* clgrte */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2040 /* clgrth */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2047 /* clgrthe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2055 /* clgrtl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2062 /* clgrtle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2070 /* clgrtlh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2078 /* clgrtne */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2086 /* clgrtnh */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2094 /* clgrtnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2103 /* clgrtnl */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2111 /* clgrtnle */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2120 /* clgrtnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureFPExtension, 2129 /* clgxbr */, MCK_FP128, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 2129 /* clgxbr */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureHighWord, 2136 /* clhf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 2136 /* clhf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 2141 /* clhhsi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 2148 /* clhrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2148 /* clhrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 2154 /* cli */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 2158 /* clib */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 2158 /* clib */, MCK_GR32, 1 /* 0 */ },
  { 0, 2163 /* clibe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2163 /* clibe */, MCK_GR32, 1 /* 0 */ },
  { 0, 2169 /* clibh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2169 /* clibh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2175 /* clibhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2175 /* clibhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 2182 /* clibl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2182 /* clibl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2188 /* clible */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2188 /* clible */, MCK_GR32, 1 /* 0 */ },
  { 0, 2195 /* cliblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2195 /* cliblh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2202 /* clibne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2202 /* clibne */, MCK_GR32, 1 /* 0 */ },
  { 0, 2209 /* clibnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2209 /* clibnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2216 /* clibnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2216 /* clibnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 2224 /* clibnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2224 /* clibnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2231 /* clibnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2231 /* clibnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 2239 /* clibnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2239 /* clibnlh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 2247 /* clih */, MCK_GRH32, 1 /* 0 */ },
  { 0, 2252 /* clij */, MCK_GR32, 1 /* 0 */ },
  { 0, 2252 /* clij */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 2257 /* clije */, MCK_GR32, 1 /* 0 */ },
  { 0, 2257 /* clije */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2263 /* clijh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2263 /* clijh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2269 /* clijhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 2269 /* clijhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2276 /* clijl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2276 /* clijl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2282 /* clijle */, MCK_GR32, 1 /* 0 */ },
  { 0, 2282 /* clijle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2289 /* clijlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2289 /* clijlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2296 /* clijne */, MCK_GR32, 1 /* 0 */ },
  { 0, 2296 /* clijne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2303 /* clijnh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2303 /* clijnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2310 /* clijnhe */, MCK_GR32, 1 /* 0 */ },
  { 0, 2310 /* clijnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2318 /* clijnl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2318 /* clijnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2325 /* clijnle */, MCK_GR32, 1 /* 0 */ },
  { 0, 2325 /* clijnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2333 /* clijnlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 2333 /* clijnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2341 /* cliy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 2346 /* clr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2350 /* clrb */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 2350 /* clrb */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2355 /* clrbe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2355 /* clrbe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2361 /* clrbh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2361 /* clrbh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2367 /* clrbhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2367 /* clrbhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2374 /* clrbl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2374 /* clrbl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2380 /* clrble */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2380 /* clrble */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2387 /* clrblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2387 /* clrblh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2394 /* clrbne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2394 /* clrbne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2401 /* clrbnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2401 /* clrbnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2408 /* clrbnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2408 /* clrbnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2416 /* clrbnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2416 /* clrbnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2423 /* clrbnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2423 /* clrbnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2431 /* clrbnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2431 /* clrbnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2439 /* clrj */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2439 /* clrj */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 2444 /* clrje */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2444 /* clrje */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2450 /* clrjh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2450 /* clrjh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2456 /* clrjhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2456 /* clrjhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2463 /* clrjl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2463 /* clrjl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2469 /* clrjle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2469 /* clrjle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2476 /* clrjlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2476 /* clrjlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2483 /* clrjne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2483 /* clrjne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2490 /* clrjnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2490 /* clrjnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2497 /* clrjnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2497 /* clrjnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2505 /* clrjnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2505 /* clrjnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2512 /* clrjnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2512 /* clrjnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2520 /* clrjnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2520 /* clrjnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2528 /* clrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2528 /* clrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 2533 /* clrt */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2538 /* clrte */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2544 /* clrth */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2550 /* clrthe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2557 /* clrtl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2563 /* clrtle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2570 /* clrtlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2577 /* clrtne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2584 /* clrtnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2591 /* clrtnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2599 /* clrtnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2606 /* clrtnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2614 /* clrtnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2622 /* clst */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2627 /* cly */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2627 /* cly */, MCK_GR32, 1 /* 0 */ },
  { 0, 2631 /* cpsdr */, MCK_FP64, 7 /* 0, 1, 2 */ },
  { 0, 2637 /* cr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2640 /* crb */, MCK_BDAddr64Disp12, 8 /* 3 */ },
  { 0, 2640 /* crb */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2644 /* crbe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2644 /* crbe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2649 /* crbh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2649 /* crbh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2654 /* crbhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2654 /* crbhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2660 /* crbl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2660 /* crbl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2665 /* crble */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2665 /* crble */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2671 /* crblh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2671 /* crblh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2677 /* crbne */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2677 /* crbne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2683 /* crbnh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2683 /* crbnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2689 /* crbnhe */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2689 /* crbnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2696 /* crbnl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2696 /* crbnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2702 /* crbnle */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2702 /* crbnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2709 /* crbnlh */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2709 /* crbnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2716 /* crj */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2716 /* crj */, MCK_PCRel16, 8 /* 3 */ },
  { 0, 2720 /* crje */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2720 /* crje */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2725 /* crjh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2725 /* crjh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2730 /* crjhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2730 /* crjhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2736 /* crjl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2736 /* crjl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2741 /* crjle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2741 /* crjle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2747 /* crjlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2747 /* crjlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2753 /* crjne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2753 /* crjne */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2759 /* crjnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2759 /* crjnh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2765 /* crjnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2765 /* crjnhe */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2772 /* crjnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2772 /* crjnl */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2778 /* crjnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2778 /* crjnle */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2785 /* crjnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2785 /* crjnlh */, MCK_PCRel16, 4 /* 2 */ },
  { 0, 2792 /* crl */, MCK_GR32, 1 /* 0 */ },
  { 0, 2792 /* crl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 2796 /* crt */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2800 /* crte */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2805 /* crth */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2810 /* crthe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2816 /* crtl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2821 /* crtle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2827 /* crtlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2833 /* crtne */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2839 /* crtnh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2845 /* crtnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2852 /* crtnl */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2858 /* crtnle */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2865 /* crtnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2872 /* cs */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 2872 /* cs */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2875 /* csg */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 2875 /* csg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 2879 /* csy */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 2879 /* csy */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 2883 /* cxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 2888 /* cxfbr */, MCK_FP128, 1 /* 0 */ },
  { 0, 2888 /* cxfbr */, MCK_GR32, 2 /* 1 */ },
  { 0, 2894 /* cxgbr */, MCK_FP128, 1 /* 0 */ },
  { 0, 2894 /* cxgbr */, MCK_GR64, 2 /* 1 */ },
  { Feature_FeatureFPExtension, 2900 /* cxlfbr */, MCK_FP128, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 2900 /* cxlfbr */, MCK_GR32, 4 /* 2 */ },
  { Feature_FeatureFPExtension, 2907 /* cxlgbr */, MCK_FP128, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 2907 /* cxlgbr */, MCK_GR64, 4 /* 2 */ },
  { 0, 2914 /* cy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2914 /* cy */, MCK_GR32, 1 /* 0 */ },
  { 0, 2917 /* ddb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 2917 /* ddb */, MCK_FP64, 1 /* 0 */ },
  { 0, 2921 /* ddbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 2926 /* deb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 2926 /* deb */, MCK_FP32, 1 /* 0 */ },
  { 0, 2930 /* debr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 2935 /* dl */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2935 /* dl */, MCK_GR128, 1 /* 0 */ },
  { 0, 2938 /* dlg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2938 /* dlg */, MCK_GR128, 1 /* 0 */ },
  { 0, 2942 /* dlgr */, MCK_GR128, 1 /* 0 */ },
  { 0, 2942 /* dlgr */, MCK_GR64, 2 /* 1 */ },
  { 0, 2947 /* dlr */, MCK_GR128, 1 /* 0 */ },
  { 0, 2947 /* dlr */, MCK_GR32, 2 /* 1 */ },
  { 0, 2951 /* dsg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2951 /* dsg */, MCK_GR128, 1 /* 0 */ },
  { 0, 2955 /* dsgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 2955 /* dsgf */, MCK_GR128, 1 /* 0 */ },
  { 0, 2960 /* dsgfr */, MCK_GR128, 1 /* 0 */ },
  { 0, 2960 /* dsgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 2966 /* dsgr */, MCK_GR128, 1 /* 0 */ },
  { 0, 2966 /* dsgr */, MCK_GR64, 2 /* 1 */ },
  { 0, 2971 /* dxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 2976 /* ear */, MCK_AccessReg, 2 /* 1 */ },
  { 0, 2976 /* ear */, MCK_GR32, 1 /* 0 */ },
  { 0, 2980 /* ectg */, MCK_BDAddr64Disp12, 3 /* 0, 1 */ },
  { 0, 2980 /* ectg */, MCK_GR64, 4 /* 2 */ },
  { Feature_FeatureTransactionalExecution, 2985 /* etnd */, MCK_GR32, 1 /* 0 */ },
  { 0, 2990 /* ex */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 2990 /* ex */, MCK_GR64, 1 /* 0 */ },
  { 0, 2993 /* exrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 2993 /* exrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 2998 /* fidbr */, MCK_FP64, 5 /* 0, 2 */ },
  { Feature_FeatureFPExtension, 3004 /* fidbra */, MCK_FP64, 5 /* 0, 2 */ },
  { 0, 3011 /* fiebr */, MCK_FP32, 5 /* 0, 2 */ },
  { Feature_FeatureFPExtension, 3017 /* fiebra */, MCK_FP32, 5 /* 0, 2 */ },
  { 0, 3024 /* fixbr */, MCK_FP128, 5 /* 0, 2 */ },
  { Feature_FeatureFPExtension, 3030 /* fixbra */, MCK_FP128, 5 /* 0, 2 */ },
  { 0, 3037 /* flogr */, MCK_GR128, 1 /* 0 */ },
  { 0, 3037 /* flogr */, MCK_GR64, 2 /* 1 */ },
  { 0, 3043 /* ic */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3043 /* ic */, MCK_GR64, 1 /* 0 */ },
  { 0, 3046 /* icm */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 3046 /* icm */, MCK_GR32, 1 /* 0 */ },
  { 0, 3050 /* icmh */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 3050 /* icmh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3055 /* icmy */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 3055 /* icmy */, MCK_GR32, 1 /* 0 */ },
  { 0, 3060 /* icy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3060 /* icy */, MCK_GR64, 1 /* 0 */ },
  { 0, 3064 /* iihf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3069 /* iihh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3074 /* iihl */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3079 /* iilf */, MCK_GR32, 1 /* 0 */ },
  { 0, 3084 /* iilh */, MCK_GR32, 1 /* 0 */ },
  { 0, 3089 /* iill */, MCK_GR32, 1 /* 0 */ },
  { 0, 3094 /* ipm */, MCK_GR32, 1 /* 0 */ },
  { 0, 3098 /* j */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3100 /* je */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3103 /* jg */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3106 /* jge */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3110 /* jgh */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3114 /* jghe */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3119 /* jgl */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3123 /* jgle */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3128 /* jglh */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3133 /* jgm */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3137 /* jgne */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3142 /* jgnh */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3147 /* jgnhe */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3153 /* jgnl */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3158 /* jgnle */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3164 /* jgnlh */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3170 /* jgnm */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3175 /* jgno */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3180 /* jgnp */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3185 /* jgnz */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3190 /* jgo */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3194 /* jgp */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3198 /* jgz */, MCK_PCRel32, 1 /* 0 */ },
  { 0, 3202 /* jh */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3205 /* jhe */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3209 /* jl */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3212 /* jle */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3216 /* jlh */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3220 /* jm */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3223 /* jne */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3227 /* jnh */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3231 /* jnhe */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3236 /* jnl */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3240 /* jnle */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3245 /* jnlh */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3250 /* jnm */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3254 /* jno */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3258 /* jnp */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3262 /* jnz */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3266 /* jo */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3269 /* jp */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3272 /* jz */, MCK_PCRel16, 1 /* 0 */ },
  { 0, 3275 /* l */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3275 /* l */, MCK_GR32, 1 /* 0 */ },
  { 0, 3277 /* la */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3277 /* la */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureInterlockedAccess1, 3280 /* laa */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3280 /* laa */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3284 /* laag */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3284 /* laag */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3289 /* laal */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3289 /* laal */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3294 /* laalg */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3294 /* laalg */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3300 /* lan */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3300 /* lan */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3304 /* lang */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3304 /* lang */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3309 /* lao */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3309 /* lao */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3313 /* laog */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3313 /* laog */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3318 /* larl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3318 /* larl */, MCK_PCRel32, 2 /* 1 */ },
  { Feature_FeatureInterlockedAccess1, 3323 /* lax */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3323 /* lax */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureInterlockedAccess1, 3327 /* laxg */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { Feature_FeatureInterlockedAccess1, 3327 /* laxg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3332 /* lay */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3332 /* lay */, MCK_GR64, 1 /* 0 */ },
  { 0, 3336 /* lb */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3336 /* lb */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 3339 /* lbh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 3339 /* lbh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3343 /* lbr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 3347 /* lcbb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 3347 /* lcbb */, MCK_GR32, 1 /* 0 */ },
  { 0, 3352 /* lcdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 3358 /* lcdfr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 3364 /* lcebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 3370 /* lcgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 3370 /* lcgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 3376 /* lcgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3381 /* lcr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3385 /* lcxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 3391 /* ld */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3391 /* ld */, MCK_FP64, 1 /* 0 */ },
  { 0, 3394 /* lde */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3394 /* lde */, MCK_FP32, 1 /* 0 */ },
  { 0, 3398 /* ldeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3398 /* ldeb */, MCK_FP64, 1 /* 0 */ },
  { 0, 3403 /* ldebr */, MCK_FP32, 2 /* 1 */ },
  { 0, 3403 /* ldebr */, MCK_FP64, 1 /* 0 */ },
  { 0, 3409 /* ldgr */, MCK_FP64, 1 /* 0 */ },
  { 0, 3409 /* ldgr */, MCK_GR64, 2 /* 1 */ },
  { 0, 3414 /* ldr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 3418 /* ldxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { Feature_FeatureFPExtension, 3424 /* ldxbra */, MCK_FP128, 5 /* 0, 2 */ },
  { 0, 3431 /* ldy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3431 /* ldy */, MCK_FP64, 1 /* 0 */ },
  { 0, 3435 /* le */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3435 /* le */, MCK_FP32, 1 /* 0 */ },
  { 0, 3438 /* ledbr */, MCK_FP32, 1 /* 0 */ },
  { 0, 3438 /* ledbr */, MCK_FP64, 2 /* 1 */ },
  { Feature_FeatureFPExtension, 3444 /* ledbra */, MCK_FP32, 1 /* 0 */ },
  { Feature_FeatureFPExtension, 3444 /* ledbra */, MCK_FP64, 4 /* 2 */ },
  { 0, 3451 /* ler */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 3455 /* lexbr */, MCK_FP128, 3 /* 0, 1 */ },
  { Feature_FeatureFPExtension, 3461 /* lexbra */, MCK_FP128, 5 /* 0, 2 */ },
  { 0, 3468 /* ley */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3468 /* ley */, MCK_FP32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 3472 /* lfh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 3472 /* lfh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3476 /* lg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3476 /* lg */, MCK_GR64, 1 /* 0 */ },
  { 0, 3479 /* lgb */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3479 /* lgb */, MCK_GR64, 1 /* 0 */ },
  { 0, 3483 /* lgbr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3488 /* lgdr */, MCK_FP64, 2 /* 1 */ },
  { 0, 3488 /* lgdr */, MCK_GR64, 1 /* 0 */ },
  { 0, 3493 /* lgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3493 /* lgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 3497 /* lgfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 3502 /* lgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 3502 /* lgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 3507 /* lgfrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3507 /* lgfrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3513 /* lgh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3513 /* lgh */, MCK_GR64, 1 /* 0 */ },
  { 0, 3517 /* lghi */, MCK_GR64, 1 /* 0 */ },
  { 0, 3522 /* lghr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3527 /* lghrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3527 /* lghrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3533 /* lgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3537 /* lgrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3537 /* lgrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3542 /* lh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 3542 /* lh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 3545 /* lhh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 3545 /* lhh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3549 /* lhi */, MCK_GR32, 1 /* 0 */ },
  { 0, 3553 /* lhr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3557 /* lhrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 3557 /* lhrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3562 /* lhy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3562 /* lhy */, MCK_GR32, 1 /* 0 */ },
  { 0, 3566 /* llc */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3566 /* llc */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 3570 /* llch */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 3570 /* llch */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3575 /* llcr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3580 /* llgc */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3580 /* llgc */, MCK_GR64, 1 /* 0 */ },
  { 0, 3585 /* llgcr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3591 /* llgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3591 /* llgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 3596 /* llgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 3596 /* llgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 3602 /* llgfrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3602 /* llgfrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3609 /* llgh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3609 /* llgh */, MCK_GR64, 1 /* 0 */ },
  { 0, 3614 /* llghr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3620 /* llghrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3620 /* llghrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3627 /* llh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 3627 /* llh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 3631 /* llhh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 3631 /* llhh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 3636 /* llhr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3641 /* llhrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 3641 /* llhrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 3647 /* llihf */, MCK_GR64, 1 /* 0 */ },
  { 0, 3653 /* llihh */, MCK_GR64, 1 /* 0 */ },
  { 0, 3659 /* llihl */, MCK_GR64, 1 /* 0 */ },
  { 0, 3665 /* llilf */, MCK_GR64, 1 /* 0 */ },
  { 0, 3671 /* llilh */, MCK_GR64, 1 /* 0 */ },
  { 0, 3677 /* llill */, MCK_GR64, 1 /* 0 */ },
  { 0, 3683 /* lm */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 3683 /* lm */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3686 /* lmg */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 3686 /* lmg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3690 /* lmh */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 3690 /* lmh */, MCK_GRH32, 3 /* 0, 1 */ },
  { 0, 3694 /* lmy */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 3694 /* lmy */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3698 /* lndbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 3704 /* lndfr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 3710 /* lnebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 3716 /* lngfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 3716 /* lngfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 3722 /* lngr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 3727 /* lnr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 3731 /* lnxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3737 /* loc */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3737 /* loc */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3741 /* loce */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3741 /* loce */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3746 /* locg */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3746 /* locg */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3751 /* locge */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3751 /* locge */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3757 /* locgh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3757 /* locgh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3763 /* locghe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3763 /* locghe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3770 /* locghi */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3777 /* locghie */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3785 /* locghih */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3793 /* locghihe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3802 /* locghil */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3810 /* locghile */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3819 /* locghilh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3828 /* locghim */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3836 /* locghine */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3845 /* locghinh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3854 /* locghinhe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3864 /* locghinl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3873 /* locghinle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3883 /* locghinlh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3893 /* locghinm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3902 /* locghino */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3911 /* locghinp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3920 /* locghinz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3929 /* locghio */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3937 /* locghip */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 3945 /* locghiz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3953 /* locgl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3953 /* locgl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3959 /* locgle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3959 /* locgle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3966 /* locglh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3966 /* locglh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3973 /* locgm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3973 /* locgm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3979 /* locgne */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3979 /* locgne */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3986 /* locgnh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3986 /* locgnh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 3993 /* locgnhe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 3993 /* locgnhe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4001 /* locgnl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4001 /* locgnl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4008 /* locgnle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4008 /* locgnle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4016 /* locgnlh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4016 /* locgnlh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4024 /* locgnm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4024 /* locgnm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4031 /* locgno */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4031 /* locgno */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4038 /* locgnp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4038 /* locgnp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4045 /* locgnz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4045 /* locgnz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4052 /* locgo */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4052 /* locgo */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4058 /* locgp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4058 /* locgp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4064 /* locgr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4070 /* locgre */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4077 /* locgrh */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4084 /* locgrhe */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4092 /* locgrl */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4099 /* locgrle */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4107 /* locgrlh */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4115 /* locgrm */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4122 /* locgrne */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4130 /* locgrnh */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4138 /* locgrnhe */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4147 /* locgrnl */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4155 /* locgrnle */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4164 /* locgrnlh */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4173 /* locgrnm */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4181 /* locgrno */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4189 /* locgrnp */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4197 /* locgrnz */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4205 /* locgro */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4212 /* locgrp */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4219 /* locgrz */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4226 /* locgz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4226 /* locgz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4232 /* loch */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4232 /* loch */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4237 /* loche */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4237 /* loche */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4243 /* lochi */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4249 /* lochie */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4256 /* lochih */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4263 /* lochihe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4271 /* lochil */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4278 /* lochile */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4286 /* lochilh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4294 /* lochim */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4301 /* lochine */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4309 /* lochinh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4317 /* lochinhe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4326 /* lochinl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4334 /* lochinle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4343 /* lochinlh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4352 /* lochinm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4360 /* lochino */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4368 /* lochinp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4376 /* lochinz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4384 /* lochio */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4391 /* lochip */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond2, 4398 /* lochiz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4405 /* locl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4405 /* locl */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4410 /* locle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4410 /* locle */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4416 /* loclh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4416 /* loclh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4422 /* locm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4422 /* locm */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4427 /* locne */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4427 /* locne */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4433 /* locnh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4433 /* locnh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4439 /* locnhe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4439 /* locnhe */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4446 /* locnl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4446 /* locnl */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4452 /* locnle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4452 /* locnle */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4459 /* locnlh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4459 /* locnlh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4466 /* locnm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4466 /* locnm */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4472 /* locno */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4472 /* locno */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4478 /* locnp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4478 /* locnp */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4484 /* locnz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4484 /* locnz */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4490 /* loco */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4490 /* loco */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4495 /* locp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4495 /* locp */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 4500 /* locr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4505 /* locre */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4511 /* locrh */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4517 /* locrhe */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4524 /* locrl */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4530 /* locrle */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4537 /* locrlh */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4544 /* locrm */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4550 /* locrne */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4557 /* locrnh */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4564 /* locrnhe */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4572 /* locrnl */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4579 /* locrnle */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4587 /* locrnlh */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4595 /* locrnm */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4602 /* locrno */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4609 /* locrnp */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4616 /* locrnz */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4623 /* locro */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4629 /* locrp */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4635 /* locrz */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4641 /* locz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 4641 /* locz */, MCK_GR32, 1 /* 0 */ },
  { 0, 4646 /* lpdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4652 /* lpdfr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4658 /* lpebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 4664 /* lpgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 4664 /* lpgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 4670 /* lpgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 4675 /* lpr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 4679 /* lpxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 4685 /* lr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 4688 /* lrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 4688 /* lrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 4692 /* lrv */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4692 /* lrv */, MCK_GR32, 1 /* 0 */ },
  { 0, 4696 /* lrvg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4696 /* lrvg */, MCK_GR64, 1 /* 0 */ },
  { 0, 4701 /* lrvgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 4707 /* lrvh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4707 /* lrvh */, MCK_GR32, 1 /* 0 */ },
  { 0, 4712 /* lrvr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 4717 /* lt */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4717 /* lt */, MCK_GR32, 1 /* 0 */ },
  { 0, 4720 /* ltdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4726 /* ltebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 4732 /* ltg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4732 /* ltg */, MCK_GR64, 1 /* 0 */ },
  { 0, 4736 /* ltgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4736 /* ltgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 4741 /* ltgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 4741 /* ltgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 4747 /* ltgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 4752 /* ltr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 4756 /* ltxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 4762 /* lxdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4762 /* lxdb */, MCK_FP128, 1 /* 0 */ },
  { 0, 4767 /* lxdbr */, MCK_FP128, 1 /* 0 */ },
  { 0, 4767 /* lxdbr */, MCK_FP64, 2 /* 1 */ },
  { 0, 4773 /* lxeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4773 /* lxeb */, MCK_FP128, 1 /* 0 */ },
  { 0, 4778 /* lxebr */, MCK_FP128, 1 /* 0 */ },
  { 0, 4778 /* lxebr */, MCK_FP32, 2 /* 1 */ },
  { 0, 4784 /* lxr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 4788 /* ly */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4788 /* ly */, MCK_GR32, 1 /* 0 */ },
  { 0, 4791 /* lzdr */, MCK_FP64, 1 /* 0 */ },
  { 0, 4796 /* lzer */, MCK_FP32, 1 /* 0 */ },
  { 0, 4801 /* lzxr */, MCK_FP128, 1 /* 0 */ },
  { 0, 4806 /* madb */, MCK_BDXAddr64Disp12, 4 /* 2 */ },
  { 0, 4806 /* madb */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4811 /* madbr */, MCK_FP64, 7 /* 0, 1, 2 */ },
  { 0, 4817 /* maeb */, MCK_BDXAddr64Disp12, 4 /* 2 */ },
  { 0, 4817 /* maeb */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 4822 /* maebr */, MCK_FP32, 7 /* 0, 1, 2 */ },
  { 0, 4828 /* mdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4828 /* mdb */, MCK_FP64, 1 /* 0 */ },
  { 0, 4832 /* mdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4837 /* mdeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4837 /* mdeb */, MCK_FP64, 1 /* 0 */ },
  { 0, 4842 /* mdebr */, MCK_FP32, 2 /* 1 */ },
  { 0, 4842 /* mdebr */, MCK_FP64, 1 /* 0 */ },
  { 0, 4848 /* meeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4848 /* meeb */, MCK_FP32, 1 /* 0 */ },
  { 0, 4853 /* meebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 4859 /* mghi */, MCK_GR64, 1 /* 0 */ },
  { 0, 4864 /* mh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4864 /* mh */, MCK_GR32, 1 /* 0 */ },
  { 0, 4867 /* mhi */, MCK_GR32, 1 /* 0 */ },
  { 0, 4871 /* mhy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4871 /* mhy */, MCK_GR32, 1 /* 0 */ },
  { 0, 4875 /* mlg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4875 /* mlg */, MCK_GR128, 1 /* 0 */ },
  { 0, 4879 /* mlgr */, MCK_GR128, 1 /* 0 */ },
  { 0, 4879 /* mlgr */, MCK_GR64, 2 /* 1 */ },
  { 0, 4884 /* ms */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4884 /* ms */, MCK_GR32, 1 /* 0 */ },
  { 0, 4887 /* msdb */, MCK_BDXAddr64Disp12, 4 /* 2 */ },
  { 0, 4887 /* msdb */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 4892 /* msdbr */, MCK_FP64, 7 /* 0, 1, 2 */ },
  { 0, 4898 /* mseb */, MCK_BDXAddr64Disp12, 4 /* 2 */ },
  { 0, 4898 /* mseb */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 4903 /* msebr */, MCK_FP32, 7 /* 0, 1, 2 */ },
  { 0, 4909 /* msfi */, MCK_GR32, 1 /* 0 */ },
  { 0, 4914 /* msg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4914 /* msg */, MCK_GR64, 1 /* 0 */ },
  { 0, 4918 /* msgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4918 /* msgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 4923 /* msgfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 4929 /* msgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 4929 /* msgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 4935 /* msgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 4940 /* msr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 4944 /* msy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 4944 /* msy */, MCK_GR32, 1 /* 0 */ },
  { 0, 4948 /* mvc */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 4948 /* mvc */, MCK_BDLAddr64Disp12Len8, 1 /* 0 */ },
  { 0, 4952 /* mvck */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 4952 /* mvck */, MCK_BDXAddr64Disp12, 1 /* 0 */ },
  { 0, 4952 /* mvck */, MCK_GR64, 4 /* 2 */ },
  { 0, 4957 /* mvghi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 4963 /* mvhhi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 4969 /* mvhi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 4974 /* mvi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 4978 /* mviy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 4983 /* mvst */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 4988 /* mxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 4993 /* mxdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 4993 /* mxdb */, MCK_FP128, 1 /* 0 */ },
  { 0, 4998 /* mxdbr */, MCK_FP128, 1 /* 0 */ },
  { 0, 4998 /* mxdbr */, MCK_FP64, 2 /* 1 */ },
  { 0, 5004 /* n */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5004 /* n */, MCK_GR32, 1 /* 0 */ },
  { 0, 5006 /* nc */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 5006 /* nc */, MCK_BDLAddr64Disp12Len8, 1 /* 0 */ },
  { 0, 5009 /* ng */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5009 /* ng */, MCK_GR64, 1 /* 0 */ },
  { 0, 5012 /* ngr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5016 /* ngrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 5021 /* ni */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5024 /* nihf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5029 /* nihh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5034 /* nihl */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5039 /* nilf */, MCK_GR32, 1 /* 0 */ },
  { 0, 5044 /* nilh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5049 /* nill */, MCK_GR32, 1 /* 0 */ },
  { 0, 5054 /* niy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 5058 /* nop */, MCK_BDXAddr64Disp12, 1 /* 0 */ },
  { 0, 5062 /* nopr */, MCK_GR64, 1 /* 0 */ },
  { 0, 5067 /* nr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5070 /* nrk */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { Feature_FeatureTransactionalExecution, 5074 /* ntstg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureTransactionalExecution, 5074 /* ntstg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5080 /* ny */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5080 /* ny */, MCK_GR32, 1 /* 0 */ },
  { 0, 5083 /* o */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5083 /* o */, MCK_GR32, 1 /* 0 */ },
  { 0, 5085 /* oc */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 5085 /* oc */, MCK_BDLAddr64Disp12Len8, 1 /* 0 */ },
  { 0, 5088 /* og */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5088 /* og */, MCK_GR64, 1 /* 0 */ },
  { 0, 5091 /* ogr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5095 /* ogrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 5100 /* oi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5103 /* oihf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5108 /* oihh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5113 /* oihl */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5118 /* oilf */, MCK_GR32, 1 /* 0 */ },
  { 0, 5123 /* oilh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5128 /* oill */, MCK_GR32, 1 /* 0 */ },
  { 0, 5133 /* oiy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 5137 /* or */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5140 /* ork */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 5144 /* oy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5144 /* oy */, MCK_GR32, 1 /* 0 */ },
  { 0, 5147 /* pfd */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5151 /* pfdrl */, MCK_PCRel32, 2 /* 1 */ },
  { Feature_FeaturePopulationCount, 5157 /* popcnt */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureProcessorAssist, 5164 /* ppa */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5171 /* risbg */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureMiscellaneousExtensions, 5177 /* risbgn */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureHighWord, 5184 /* risbhg */, MCK_GR64, 2 /* 1 */ },
  { Feature_FeatureHighWord, 5184 /* risbhg */, MCK_GRH32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 5191 /* risblg */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 5191 /* risblg */, MCK_GR64, 2 /* 1 */ },
  { 0, 5198 /* rll */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { 0, 5198 /* rll */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5202 /* rllg */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { 0, 5202 /* rllg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5207 /* rnsbg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5213 /* rosbg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5219 /* rxsbg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5225 /* s */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5225 /* s */, MCK_GR32, 1 /* 0 */ },
  { 0, 5227 /* sdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5227 /* sdb */, MCK_FP64, 1 /* 0 */ },
  { 0, 5231 /* sdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 5236 /* seb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5236 /* seb */, MCK_FP32, 1 /* 0 */ },
  { 0, 5240 /* sebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 5245 /* sg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5245 /* sg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5248 /* sgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5248 /* sgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 5252 /* sgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 5252 /* sgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 5257 /* sgr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5261 /* sgrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 5266 /* sh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5266 /* sh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5269 /* shy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5269 /* shy */, MCK_GR32, 1 /* 0 */ },
  { 0, 5273 /* sl */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5273 /* sl */, MCK_GR32, 1 /* 0 */ },
  { 0, 5276 /* sla */, MCK_BDAddr32Disp12, 2 /* 1 */ },
  { 0, 5276 /* sla */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureDistinctOps, 5280 /* slak */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { Feature_FeatureDistinctOps, 5280 /* slak */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5285 /* slb */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5285 /* slb */, MCK_GR32, 1 /* 0 */ },
  { 0, 5289 /* slbg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5289 /* slbg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5294 /* slbgr */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5300 /* slbr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5305 /* slfi */, MCK_GR32, 1 /* 0 */ },
  { 0, 5310 /* slg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5310 /* slg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5314 /* slgf */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5314 /* slgf */, MCK_GR64, 1 /* 0 */ },
  { 0, 5319 /* slgfi */, MCK_GR64, 1 /* 0 */ },
  { 0, 5325 /* slgfr */, MCK_GR32, 2 /* 1 */ },
  { 0, 5325 /* slgfr */, MCK_GR64, 1 /* 0 */ },
  { 0, 5331 /* slgr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5336 /* slgrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 5342 /* sll */, MCK_BDAddr32Disp12, 2 /* 1 */ },
  { 0, 5342 /* sll */, MCK_GR32, 1 /* 0 */ },
  { 0, 5346 /* sllg */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { 0, 5346 /* sllg */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5351 /* sllk */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { Feature_FeatureDistinctOps, 5351 /* sllk */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5356 /* slr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5360 /* slrk */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 5365 /* sly */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5365 /* sly */, MCK_GR32, 1 /* 0 */ },
  { 0, 5369 /* sqdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5369 /* sqdb */, MCK_FP64, 1 /* 0 */ },
  { 0, 5374 /* sqdbr */, MCK_FP64, 3 /* 0, 1 */ },
  { 0, 5380 /* sqeb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5380 /* sqeb */, MCK_FP32, 1 /* 0 */ },
  { 0, 5385 /* sqebr */, MCK_FP32, 3 /* 0, 1 */ },
  { 0, 5391 /* sqxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 5397 /* sr */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5400 /* sra */, MCK_BDAddr32Disp12, 2 /* 1 */ },
  { 0, 5400 /* sra */, MCK_GR32, 1 /* 0 */ },
  { 0, 5404 /* srag */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { 0, 5404 /* srag */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5409 /* srak */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { Feature_FeatureDistinctOps, 5409 /* srak */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5414 /* srk */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 5418 /* srl */, MCK_BDAddr32Disp12, 2 /* 1 */ },
  { 0, 5418 /* srl */, MCK_GR32, 1 /* 0 */ },
  { 0, 5422 /* srlg */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { 0, 5422 /* srlg */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 5427 /* srlk */, MCK_BDAddr32Disp20, 4 /* 2 */ },
  { Feature_FeatureDistinctOps, 5427 /* srlk */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5432 /* srst */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5437 /* st */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5437 /* st */, MCK_GR32, 1 /* 0 */ },
  { 0, 5440 /* stc */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5440 /* stc */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 5444 /* stch */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 5444 /* stch */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5449 /* stck */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5454 /* stcke */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5460 /* stckf */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5466 /* stcy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5466 /* stcy */, MCK_GR32, 1 /* 0 */ },
  { 0, 5471 /* std */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5471 /* std */, MCK_FP64, 1 /* 0 */ },
  { 0, 5475 /* stdy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5475 /* stdy */, MCK_FP64, 1 /* 0 */ },
  { 0, 5480 /* ste */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5480 /* ste */, MCK_FP32, 1 /* 0 */ },
  { 0, 5484 /* stey */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5484 /* stey */, MCK_FP32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 5489 /* stfh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 5489 /* stfh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5494 /* stfle */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5500 /* stg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5500 /* stg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5504 /* stgrl */, MCK_GR64, 1 /* 0 */ },
  { 0, 5504 /* stgrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 5510 /* sth */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5510 /* sth */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureHighWord, 5514 /* sthh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureHighWord, 5514 /* sthh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5519 /* sthrl */, MCK_GR32, 1 /* 0 */ },
  { 0, 5519 /* sthrl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 5525 /* sthy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5525 /* sthy */, MCK_GR32, 1 /* 0 */ },
  { 0, 5530 /* stm */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { 0, 5530 /* stm */, MCK_GR32, 3 /* 0, 1 */ },
  { 0, 5534 /* stmg */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 5534 /* stmg */, MCK_GR64, 3 /* 0, 1 */ },
  { 0, 5539 /* stmh */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 5539 /* stmh */, MCK_GRH32, 3 /* 0, 1 */ },
  { 0, 5544 /* stmy */, MCK_BDAddr64Disp20, 4 /* 2 */ },
  { 0, 5544 /* stmy */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5549 /* stoc */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5549 /* stoc */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5554 /* stoce */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5554 /* stoce */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5560 /* stocg */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5560 /* stocg */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5566 /* stocge */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5566 /* stocge */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5573 /* stocgh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5573 /* stocgh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5580 /* stocghe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5580 /* stocghe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5588 /* stocgl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5588 /* stocgl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5595 /* stocgle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5595 /* stocgle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5603 /* stocglh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5603 /* stocglh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5611 /* stocgm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5611 /* stocgm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5618 /* stocgne */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5618 /* stocgne */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5626 /* stocgnh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5626 /* stocgnh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5634 /* stocgnhe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5634 /* stocgnhe */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5643 /* stocgnl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5643 /* stocgnl */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5651 /* stocgnle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5651 /* stocgnle */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5660 /* stocgnlh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5660 /* stocgnlh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5669 /* stocgnm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5669 /* stocgnm */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5677 /* stocgno */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5677 /* stocgno */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5685 /* stocgnp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5685 /* stocgnp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5693 /* stocgnz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5693 /* stocgnz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5701 /* stocgo */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5701 /* stocgo */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5708 /* stocgp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5708 /* stocgp */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5715 /* stocgz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5715 /* stocgz */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5722 /* stoch */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5722 /* stoch */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5728 /* stoche */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5728 /* stoche */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5735 /* stocl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5735 /* stocl */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5741 /* stocle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5741 /* stocle */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5748 /* stoclh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5748 /* stoclh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5755 /* stocm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5755 /* stocm */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5761 /* stocne */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5761 /* stocne */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5768 /* stocnh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5768 /* stocnh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5775 /* stocnhe */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5775 /* stocnhe */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5783 /* stocnl */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5783 /* stocnl */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5790 /* stocnle */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5790 /* stocnle */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5798 /* stocnlh */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5798 /* stocnlh */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5806 /* stocnm */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5806 /* stocnm */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5813 /* stocno */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5813 /* stocno */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5820 /* stocnp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5820 /* stocnp */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5827 /* stocnz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5827 /* stocnz */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5834 /* stoco */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5834 /* stoco */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5840 /* stocp */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5840 /* stocp */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureLoadStoreOnCond, 5846 /* stocz */, MCK_BDAddr64Disp20, 2 /* 1 */ },
  { Feature_FeatureLoadStoreOnCond, 5846 /* stocz */, MCK_GR32, 1 /* 0 */ },
  { 0, 5852 /* strag */, MCK_BDAddr64Disp12, 3 /* 0, 1 */ },
  { 0, 5858 /* strl */, MCK_GR32, 1 /* 0 */ },
  { 0, 5858 /* strl */, MCK_PCRel32, 2 /* 1 */ },
  { 0, 5863 /* strv */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5863 /* strv */, MCK_GR32, 1 /* 0 */ },
  { 0, 5868 /* strvg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5868 /* strvg */, MCK_GR64, 1 /* 0 */ },
  { 0, 5874 /* strvh */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5874 /* strvh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5880 /* sty */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5880 /* sty */, MCK_GR32, 1 /* 0 */ },
  { 0, 5888 /* sxbr */, MCK_FP128, 3 /* 0, 1 */ },
  { 0, 5893 /* sy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 5893 /* sy */, MCK_GR32, 1 /* 0 */ },
  { Feature_FeatureTransactionalExecution, 5896 /* tabort */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { Feature_FeatureTransactionalExecution, 5903 /* tbegin */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { Feature_FeatureTransactionalExecution, 5910 /* tbeginc */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5918 /* tcdb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5918 /* tcdb */, MCK_FP64, 1 /* 0 */ },
  { 0, 5923 /* tceb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5923 /* tceb */, MCK_FP32, 1 /* 0 */ },
  { 0, 5928 /* tcxb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 5928 /* tcxb */, MCK_FP128, 1 /* 0 */ },
  { 0, 5938 /* tm */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 5941 /* tmh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5945 /* tmhh */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5950 /* tmhl */, MCK_GRH32, 1 /* 0 */ },
  { 0, 5955 /* tml */, MCK_GR32, 1 /* 0 */ },
  { 0, 5959 /* tmlh */, MCK_GR32, 1 /* 0 */ },
  { 0, 5964 /* tmll */, MCK_GR32, 1 /* 0 */ },
  { 0, 5969 /* tmy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { Feature_FeatureVector, 5973 /* vab */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 5977 /* vaccb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 5983 /* vacccq */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 5990 /* vaccf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 5996 /* vaccg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6002 /* vacch */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6008 /* vaccq */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6014 /* vacq */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 6019 /* vaf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6023 /* vag */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6027 /* vah */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6031 /* vaq */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6035 /* vavgb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6041 /* vavgf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6047 /* vavgg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6053 /* vavgh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6059 /* vavglb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6066 /* vavglf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6073 /* vavglg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6080 /* vavglh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6087 /* vcdgb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6093 /* vcdlgb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6100 /* vceqb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6106 /* vceqbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6113 /* vceqf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6119 /* vceqfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6126 /* vceqg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6132 /* vceqgs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6139 /* vceqh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6145 /* vceqhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6152 /* vcgdb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6158 /* vchb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6163 /* vchbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6169 /* vchf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6174 /* vchfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6180 /* vchg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6185 /* vchgs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6191 /* vchh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6196 /* vchhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6202 /* vchlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6208 /* vchlbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6215 /* vchlf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6221 /* vchlfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6228 /* vchlg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6234 /* vchlgs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6241 /* vchlh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6247 /* vchlhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6254 /* vcksm */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6260 /* vclgdb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6267 /* vclzb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6273 /* vclzf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6279 /* vclzg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6285 /* vclzh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6291 /* vctzb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6297 /* vctzf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6303 /* vctzg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6309 /* vctzh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6315 /* vecb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6320 /* vecf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6325 /* vecg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6330 /* vech */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6335 /* veclb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6341 /* veclf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6347 /* veclg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6353 /* veclh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6359 /* verimb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6366 /* verimf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6373 /* verimg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6380 /* verimh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6387 /* verllb */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6387 /* verllb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6394 /* verllf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6394 /* verllf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6401 /* verllg */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6401 /* verllg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6408 /* verllh */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6408 /* verllh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6415 /* verllvb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6423 /* verllvf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6431 /* verllvg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6439 /* verllvh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6447 /* veslb */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6447 /* veslb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6453 /* veslf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6453 /* veslf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6459 /* veslg */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6459 /* veslg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6465 /* veslh */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6465 /* veslh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6471 /* veslvb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6478 /* veslvf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6485 /* veslvg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6492 /* veslvh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6499 /* vesrab */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6499 /* vesrab */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6506 /* vesraf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6506 /* vesraf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6513 /* vesrag */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6513 /* vesrag */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6520 /* vesrah */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6520 /* vesrah */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6527 /* vesravb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6535 /* vesravf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6543 /* vesravg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6551 /* vesravh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6559 /* vesrlb */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6559 /* vesrlb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6566 /* vesrlf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6566 /* vesrlf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6573 /* vesrlg */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6573 /* vesrlg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6580 /* vesrlh */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 6580 /* vesrlh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6587 /* vesrlvb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6595 /* vesrlvf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6603 /* vesrlvg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6611 /* vesrlvh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6619 /* vfadb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6625 /* vfaeb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6625 /* vfaeb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6631 /* vfaebs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6631 /* vfaebs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6638 /* vfaef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6638 /* vfaef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6644 /* vfaefs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6644 /* vfaefs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6651 /* vfaeh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6651 /* vfaeh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6657 /* vfaehs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6657 /* vfaehs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6664 /* vfaezb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6664 /* vfaezb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6671 /* vfaezbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6671 /* vfaezbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6679 /* vfaezf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6679 /* vfaezf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6686 /* vfaezfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6686 /* vfaezfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6694 /* vfaezh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6694 /* vfaezh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6701 /* vfaezhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6701 /* vfaezhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6709 /* vfcedb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6716 /* vfcedbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6724 /* vfchdb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6731 /* vfchdbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6739 /* vfchedb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6747 /* vfchedbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6756 /* vfddb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6762 /* vfeeb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6768 /* vfeebs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6775 /* vfeef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6781 /* vfeefs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6788 /* vfeeh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6794 /* vfeehs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6801 /* vfeezb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6808 /* vfeezbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6816 /* vfeezf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6823 /* vfeezfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6831 /* vfeezh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6838 /* vfeezhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6846 /* vfeneb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6853 /* vfenebs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6861 /* vfenef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6868 /* vfenefs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6876 /* vfeneh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6883 /* vfenehs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6891 /* vfenezb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6899 /* vfenezbs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6908 /* vfenezf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6916 /* vfenezfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6925 /* vfenezh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6933 /* vfenezhs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6942 /* vfidb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6948 /* vflcdb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6955 /* vflndb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6962 /* vflpdb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 6969 /* vfmadb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 6976 /* vfmdb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6982 /* vfmsdb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 6989 /* vfsdb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 6995 /* vfsqdb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7002 /* vftcidb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7010 /* vgbm */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7015 /* vgef */, MCK_BDVAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7015 /* vgef */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7020 /* vgeg */, MCK_BDVAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7020 /* vgeg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7025 /* vgfmab */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7032 /* vgfmaf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7039 /* vgfmag */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7046 /* vgfmah */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7053 /* vgfmb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7059 /* vgfmf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7065 /* vgfmg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7071 /* vgfmh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7077 /* vgmb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7082 /* vgmf */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7087 /* vgmg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7092 /* vgmh */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7097 /* vistrb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7104 /* vistrbs */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7112 /* vistrf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7119 /* vistrfs */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7127 /* vistrh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7134 /* vistrhs */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7142 /* vl */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7142 /* vl */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7145 /* vlbb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7145 /* vlbb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7150 /* vlcb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7155 /* vlcf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7160 /* vlcg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7165 /* vlch */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7170 /* vldeb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7176 /* vleb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7176 /* vleb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7181 /* vledb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7187 /* vlef */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7187 /* vlef */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7192 /* vleg */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7192 /* vleg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7197 /* vleh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7197 /* vleh */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7202 /* vleib */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7208 /* vleif */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7214 /* vleig */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7220 /* vleih */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7226 /* vlgvb */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7226 /* vlgvb */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureVector, 7226 /* vlgvb */, MCK_VR128, 2 /* 1 */ },
  { Feature_FeatureVector, 7232 /* vlgvf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7232 /* vlgvf */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureVector, 7232 /* vlgvf */, MCK_VR128, 2 /* 1 */ },
  { Feature_FeatureVector, 7238 /* vlgvg */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7238 /* vlgvg */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureVector, 7238 /* vlgvg */, MCK_VR128, 2 /* 1 */ },
  { Feature_FeatureVector, 7244 /* vlgvh */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7244 /* vlgvh */, MCK_GR64, 1 /* 0 */ },
  { Feature_FeatureVector, 7244 /* vlgvh */, MCK_VR128, 2 /* 1 */ },
  { Feature_FeatureVector, 7250 /* vll */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7250 /* vll */, MCK_GR32, 2 /* 1 */ },
  { Feature_FeatureVector, 7250 /* vll */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7254 /* vllezb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7254 /* vllezb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7261 /* vllezf */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7261 /* vllezf */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7268 /* vllezg */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7268 /* vllezg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7275 /* vllezh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7275 /* vllezh */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7282 /* vlm */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7282 /* vlm */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7286 /* vlpb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7291 /* vlpf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7296 /* vlpg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7301 /* vlph */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7306 /* vlr */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7310 /* vlrepb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7310 /* vlrepb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7317 /* vlrepf */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7317 /* vlrepf */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7324 /* vlrepg */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7324 /* vlrepg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7331 /* vlreph */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7331 /* vlreph */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7338 /* vlvgb */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7338 /* vlvgb */, MCK_GR32, 2 /* 1 */ },
  { Feature_FeatureVector, 7338 /* vlvgb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7344 /* vlvgf */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7344 /* vlvgf */, MCK_GR32, 2 /* 1 */ },
  { Feature_FeatureVector, 7344 /* vlvgf */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7350 /* vlvgg */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7350 /* vlvgg */, MCK_GR64, 2 /* 1 */ },
  { Feature_FeatureVector, 7350 /* vlvgg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7356 /* vlvgh */, MCK_BDAddr32Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 7356 /* vlvgh */, MCK_GR32, 2 /* 1 */ },
  { Feature_FeatureVector, 7356 /* vlvgh */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7362 /* vlvgp */, MCK_GR64, 6 /* 1, 2 */ },
  { Feature_FeatureVector, 7362 /* vlvgp */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7368 /* vmaeb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7374 /* vmaef */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7380 /* vmaeh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7386 /* vmahb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7392 /* vmahf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7398 /* vmahh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7404 /* vmalb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7410 /* vmaleb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7417 /* vmalef */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7424 /* vmaleh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7431 /* vmalf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7437 /* vmalhb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7444 /* vmalhf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7451 /* vmalhh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7458 /* vmalhw */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7465 /* vmalob */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7472 /* vmalof */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7479 /* vmaloh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7486 /* vmaob */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7492 /* vmaof */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7498 /* vmaoh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7504 /* vmeb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7509 /* vmef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7514 /* vmeh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7519 /* vmhb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7524 /* vmhf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7529 /* vmhh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7534 /* vmlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7539 /* vmleb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7545 /* vmlef */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7551 /* vmleh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7557 /* vmlf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7562 /* vmlhb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7568 /* vmlhf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7574 /* vmlhh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7580 /* vmlhw */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7586 /* vmlob */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7592 /* vmlof */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7598 /* vmloh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7604 /* vmnb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7609 /* vmnf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7614 /* vmng */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7619 /* vmnh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7624 /* vmnlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7630 /* vmnlf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7636 /* vmnlg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7642 /* vmnlh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7648 /* vmob */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7653 /* vmof */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7658 /* vmoh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7663 /* vmrhb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7669 /* vmrhf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7675 /* vmrhg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7681 /* vmrhh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7687 /* vmrlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7693 /* vmrlf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7699 /* vmrlg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7705 /* vmrlh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7711 /* vmxb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7716 /* vmxf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7721 /* vmxg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7726 /* vmxh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7731 /* vmxlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7737 /* vmxlf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7743 /* vmxlg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7749 /* vmxlh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7755 /* vn */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7758 /* vnc */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7762 /* vno */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7766 /* vo */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7769 /* vone */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7774 /* vpdi */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7779 /* vperm */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7785 /* vpkf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7790 /* vpkg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7795 /* vpkh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7800 /* vpklsf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7807 /* vpklsfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7815 /* vpklsg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7822 /* vpklsgs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7830 /* vpklsh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7837 /* vpklshs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7845 /* vpksf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7851 /* vpksfs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7858 /* vpksg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7864 /* vpksgs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7871 /* vpksh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7877 /* vpkshs */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7884 /* vpopct */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7891 /* vrepb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7897 /* vrepf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7903 /* vrepg */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7909 /* vreph */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 7915 /* vrepib */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7922 /* vrepif */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7929 /* vrepig */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7936 /* vrepih */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 7943 /* vsb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7947 /* vsbcbiq */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7955 /* vsbiq */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 7961 /* vscbib */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7968 /* vscbif */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7975 /* vscbig */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7982 /* vscbih */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7989 /* vscbiq */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 7996 /* vscef */, MCK_BDVAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 7996 /* vscef */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8002 /* vsceg */, MCK_BDVAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8002 /* vsceg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8008 /* vsegb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8014 /* vsegf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8020 /* vsegh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8026 /* vsel */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8031 /* vsf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8035 /* vsg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8039 /* vsh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8043 /* vsl */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8047 /* vslb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8052 /* vsldb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8058 /* vsq */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8062 /* vsra */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8067 /* vsrab */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8073 /* vsrl */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8078 /* vsrlb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8084 /* vst */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8084 /* vst */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8088 /* vsteb */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8088 /* vsteb */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8094 /* vstef */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8094 /* vstef */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8100 /* vsteg */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8100 /* vsteg */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8106 /* vsteh */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { Feature_FeatureVector, 8106 /* vsteh */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8112 /* vstl */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 8112 /* vstl */, MCK_GR32, 2 /* 1 */ },
  { Feature_FeatureVector, 8112 /* vstl */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8117 /* vstm */, MCK_BDAddr64Disp12, 4 /* 2 */ },
  { Feature_FeatureVector, 8117 /* vstm */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8122 /* vstrcb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8122 /* vstrcb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8129 /* vstrcbs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8129 /* vstrcbs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8137 /* vstrcf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8137 /* vstrcf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8144 /* vstrcfs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8144 /* vstrcfs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8152 /* vstrch */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8152 /* vstrch */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8159 /* vstrchs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8159 /* vstrchs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8167 /* vstrczb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8167 /* vstrczb */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8175 /* vstrczbs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8175 /* vstrczbs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8184 /* vstrczf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8184 /* vstrczf */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8192 /* vstrczfs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8192 /* vstrczfs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8201 /* vstrczh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8201 /* vstrczh */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8209 /* vstrczhs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8209 /* vstrczhs */, MCK_VR128, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8218 /* vsumb */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8224 /* vsumgf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8231 /* vsumgh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8238 /* vsumh */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8244 /* vsumqf */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8251 /* vsumqg */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8258 /* vtm */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8262 /* vuphb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8268 /* vuphf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8274 /* vuphh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8280 /* vuplb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8286 /* vuplf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8292 /* vuplhb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8299 /* vuplhf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8306 /* vuplhh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8313 /* vuplhw */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8320 /* vupllb */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8327 /* vupllf */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8334 /* vupllh */, MCK_VR128, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8341 /* vx */, MCK_VR128, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8344 /* vzero */, MCK_VR128, 1 /* 0 */ },
  { Feature_FeatureVector, 8350 /* wcdgb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8356 /* wcdlgb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8363 /* wcgdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8369 /* wclgdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8376 /* wfadb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8382 /* wfcdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8388 /* wfcedb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8395 /* wfcedbs */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8403 /* wfchdb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8410 /* wfchdbs */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8418 /* wfchedb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8426 /* wfchedbs */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8435 /* wfddb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8441 /* wfidb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8447 /* wfkdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8453 /* wflcdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8460 /* wflndb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8467 /* wflpdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8474 /* wfmadb */, MCK_VR64, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8481 /* wfmdb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8487 /* wfmsdb */, MCK_VR64, 15 /* 0, 1, 2, 3 */ },
  { Feature_FeatureVector, 8494 /* wfsdb */, MCK_VR64, 7 /* 0, 1, 2 */ },
  { Feature_FeatureVector, 8500 /* wfsqdb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8507 /* wftcidb */, MCK_VR64, 3 /* 0, 1 */ },
  { Feature_FeatureVector, 8515 /* wldeb */, MCK_VR32, 2 /* 1 */ },
  { Feature_FeatureVector, 8515 /* wldeb */, MCK_VR64, 1 /* 0 */ },
  { Feature_FeatureVector, 8521 /* wledb */, MCK_VR32, 1 /* 0 */ },
  { Feature_FeatureVector, 8521 /* wledb */, MCK_VR64, 2 /* 1 */ },
  { 0, 8527 /* x */, MCK_BDXAddr64Disp12, 2 /* 1 */ },
  { 0, 8527 /* x */, MCK_GR32, 1 /* 0 */ },
  { 0, 8529 /* xc */, MCK_BDAddr64Disp12, 2 /* 1 */ },
  { 0, 8529 /* xc */, MCK_BDLAddr64Disp12Len8, 1 /* 0 */ },
  { 0, 8532 /* xg */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 8532 /* xg */, MCK_GR64, 1 /* 0 */ },
  { 0, 8535 /* xgr */, MCK_GR64, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 8539 /* xgrk */, MCK_GR64, 7 /* 0, 1, 2 */ },
  { 0, 8544 /* xi */, MCK_BDAddr64Disp12, 1 /* 0 */ },
  { 0, 8547 /* xihf */, MCK_GRH32, 1 /* 0 */ },
  { 0, 8552 /* xilf */, MCK_GR32, 1 /* 0 */ },
  { 0, 8557 /* xiy */, MCK_BDAddr64Disp20, 1 /* 0 */ },
  { 0, 8561 /* xr */, MCK_GR32, 3 /* 0, 1 */ },
  { Feature_FeatureDistinctOps, 8564 /* xrk */, MCK_GR32, 7 /* 0, 1, 2 */ },
  { 0, 8568 /* xy */, MCK_BDXAddr64Disp20, 2 /* 1 */ },
  { 0, 8568 /* xy */, MCK_GR32, 1 /* 0 */ },
};

SystemZAsmParser::OperandMatchResultTy SystemZAsmParser::
tryCustomParseOperand(OperandVector &Operands,
                      unsigned MCK) {

  switch(MCK) {
  case MCK_ADDR128:
    return parseADDR128(Operands);
  case MCK_ADDR32:
    return parseADDR32(Operands);
  case MCK_ADDR64:
    return parseADDR64(Operands);
  case MCK_AccessReg:
    return parseAccessReg(Operands);
  case MCK_AnyReg:
    return parseAnyReg(Operands);
  case MCK_BDAddr32Disp12:
    return parseBDAddr32(Operands);
  case MCK_BDAddr32Disp20:
    return parseBDAddr32(Operands);
  case MCK_BDAddr64Disp12:
    return parseBDAddr64(Operands);
  case MCK_BDAddr64Disp20:
    return parseBDAddr64(Operands);
  case MCK_BDLAddr64Disp12Len8:
    return parseBDLAddr64(Operands);
  case MCK_BDVAddr64Disp12:
    return parseBDVAddr64(Operands);
  case MCK_BDXAddr64Disp12:
    return parseBDXAddr64(Operands);
  case MCK_BDXAddr64Disp20:
    return parseBDXAddr64(Operands);
  case MCK_FP128:
    return parseFP128(Operands);
  case MCK_FP32:
    return parseFP32(Operands);
  case MCK_FP64:
    return parseFP64(Operands);
  case MCK_GR128:
    return parseGR128(Operands);
  case MCK_GR32:
    return parseGR32(Operands);
  case MCK_GR64:
    return parseGR64(Operands);
  case MCK_GRH32:
    return parseGRH32(Operands);
  case MCK_GRX32:
    return parseGRX32(Operands);
  case MCK_PCRel16:
    return parsePCRel16(Operands);
  case MCK_PCRel32:
    return parsePCRel32(Operands);
  case MCK_PCRelTLS16:
    return parsePCRelTLS16(Operands);
  case MCK_PCRelTLS32:
    return parsePCRelTLS32(Operands);
  case MCK_VF128:
    return parseVF128(Operands);
  case MCK_VR128:
    return parseVR128(Operands);
  case MCK_VR32:
    return parseVR32(Operands);
  case MCK_VR64:
    return parseVR64(Operands);
  default:
    return MatchOperand_NoMatch;
  }
  return MatchOperand_NoMatch;
}

SystemZAsmParser::OperandMatchResultTy SystemZAsmParser::
MatchOperandParserImpl(OperandVector &Operands,
                       StringRef Mnemonic) {
  // Get the current feature set.
  uint64_t AvailableFeatures = getAvailableFeatures();

  // Get the next operand index.
  unsigned NextOpNum = Operands.size() - 1;
  // Search the table.
  auto MnemonicRange =
    std::equal_range(std::begin(OperandMatchTable), std::end(OperandMatchTable),
                     Mnemonic, LessOpcodeOperand());

  if (MnemonicRange.first == MnemonicRange.second)
    return MatchOperand_NoMatch;

  for (const OperandMatchEntry *it = MnemonicRange.first,
       *ie = MnemonicRange.second; it != ie; ++it) {
    // equal_range guarantees that instruction mnemonic matches.
    assert(Mnemonic == it->getMnemonic());

    // check if the available features match
    if ((AvailableFeatures & it->RequiredFeatures) != it->RequiredFeatures) {
      continue;
    }

    // check if the operand in question has a custom parser.
    if (!(it->OperandMask & (1 << NextOpNum)))
      continue;

    // call custom parse method to handle the operand
    OperandMatchResultTy Result = tryCustomParseOperand(Operands, it->Class);
    if (Result != MatchOperand_NoMatch)
      return Result;
  }

  // Okay, we had no match.
  return MatchOperand_NoMatch;
}

#endif // GET_MATCHER_IMPLEMENTATION

