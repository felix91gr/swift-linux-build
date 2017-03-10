//===- llvm-build generated file --------------------------------*- C++ -*-===//
//
// Component Library Depenedency Table
//
// Automatically generated file, do not edit!
//
//===----------------------------------------------------------------------===//

struct AvailableComponent {
  /// The name of the component.
  const char *Name;

  /// The name of the library for this component (or NULL).
  const char *Library;

  /// Whether the component is installed.
  bool IsInstalled;

  /// The list of libraries required when linking this component.
  const char *RequiredLibraries[17];
} AvailableComponents[89] = {
  { "aarch64", nullptr, true, { "aarch64utils", "aarch64asmprinter", "aarch64info", "aarch64desc", "aarch64asmparser", "aarch64codegen", "aarch64disassembler" } },
  { "aarch64asmparser", "LLVMAArch64AsmParser", true, { "aarch64desc", "aarch64info", "aarch64utils", "mc", "mcparser", "support" } },
  { "aarch64asmprinter", "LLVMAArch64AsmPrinter", true, { "aarch64utils", "mc", "support" } },
  { "aarch64codegen", "LLVMAArch64CodeGen", true, { "aarch64asmprinter", "aarch64desc", "aarch64info", "aarch64utils", "analysis", "asmprinter", "codegen", "core", "mc", "scalaropts", "selectiondag", "support", "target", "globalisel" } },
  { "aarch64desc", "LLVMAArch64Desc", true, { "aarch64asmprinter", "aarch64info", "mc", "support" } },
  { "aarch64disassembler", "LLVMAArch64Disassembler", true, { "aarch64desc", "aarch64info", "aarch64utils", "mc", "mcdisassembler", "support" } },
  { "aarch64info", "LLVMAArch64Info", true, { "support" } },
  { "aarch64utils", "LLVMAArch64Utils", true, { "support" } },
  { "all", nullptr, true, { "interpreter", "gtest_main", "libdriver", "objectyaml", "all-targets", "tablegen", "mirparser", "symbolize", "lto", "coroutines", "engine", "orcjit", "lineeditor", "nativecodegen", "coverage" } },
  { "all-targets", nullptr, true, { "x86", "arm", "aarch64", "powerpc", "systemz" } },
  { "analysis", "LLVMAnalysis", true, { "core", "support", "profiledata", "object" } },
  { "arm", nullptr, true, { "armasmprinter", "arminfo", "armdesc", "armasmparser", "armcodegen", "armdisassembler" } },
  { "armasmparser", "LLVMARMAsmParser", true, { "armdesc", "arminfo", "mc", "mcparser", "support" } },
  { "armasmprinter", "LLVMARMAsmPrinter", true, { "mc", "support" } },
  { "armcodegen", "LLVMARMCodeGen", true, { "armasmprinter", "armdesc", "arminfo", "analysis", "asmprinter", "codegen", "core", "mc", "scalaropts", "selectiondag", "support", "target" } },
  { "armdesc", "LLVMARMDesc", true, { "armasmprinter", "arminfo", "mc", "mcdisassembler", "support" } },
  { "armdisassembler", "LLVMARMDisassembler", true, { "armdesc", "arminfo", "mcdisassembler", "support" } },
  { "arminfo", "LLVMARMInfo", true, { "support" } },
  { "asmparser", "LLVMAsmParser", true, { "core", "support" } },
  { "asmprinter", "LLVMAsmPrinter", true, { "analysis", "codegen", "core", "debuginfocodeview", "debuginfomsf", "mc", "mcparser", "support", "target", "transformutils" } },
  { "bitreader", "LLVMBitReader", true, { "core", "support" } },
  { "bitwriter", "LLVMBitWriter", true, { "analysis", "core", "support" } },
  { "codegen", "LLVMCodeGen", true, { "analysis", "bitreader", "bitwriter", "core", "instrumentation", "mc", "profiledata", "scalaropts", "support", "target", "transformutils" } },
  { "core", "LLVMCore", true, { "support" } },
  { "coroutines", "LLVMCoroutines", true, { "analysis", "core", "ipo", "scalaropts", "support", "transformutils" } },
  { "coverage", "LLVMCoverage", true, { "core", "object", "profiledata", "support" } },
  { "debuginfocodeview", "LLVMDebugInfoCodeView", true, { "support", "debuginfomsf" } },
  { "debuginfodwarf", "LLVMDebugInfoDWARF", true, { "object", "support" } },
  { "debuginfomsf", "LLVMDebugInfoMSF", true, { "support" } },
  { "debuginfopdb", "LLVMDebugInfoPDB", true, { "object", "support", "debuginfocodeview", "debuginfomsf" } },
  { "engine", nullptr, true, { "mcjit", "native" } },
  { "executionengine", "LLVMExecutionEngine", true, { "core", "mc", "object", "runtimedyld", "support", "target" } },
  { "globalisel", "LLVMGlobalISel", true, { "analysis", "codegen", "core", "mc", "support", "target", "transformutils" } },
  { "gtest", "gtest", false, { "support" } },
  { "gtest_main", "gtest_main", false, { "gtest" } },
  { "instcombine", "LLVMInstCombine", true, { "analysis", "core", "support", "transformutils" } },
  { "instrumentation", "LLVMInstrumentation", true, { "analysis", "core", "mc", "support", "transformutils", "profiledata" } },
  { "interpreter", "LLVMInterpreter", true, { "codegen", "core", "executionengine", "support" } },
  { "ipo", "LLVMipo", true, { "analysis", "core", "instcombine", "irreader", "linker", "object", "profiledata", "scalaropts", "support", "transformutils", "vectorize", "instrumentation" } },
  { "irreader", "LLVMIRReader", true, { "asmparser", "bitreader", "core", "support" } },
  { "libdriver", "LLVMLibDriver", true, { "object", "option", "support" } },
  { "lineeditor", "LLVMLineEditor", true, { "support" } },
  { "linker", "LLVMLinker", true, { "core", "support", "transformutils" } },
  { "lto", "LLVMLTO", true, { "analysis", "bitreader", "bitwriter", "codegen", "core", "ipo", "instcombine", "linker", "mc", "objcarcopts", "object", "passes", "scalaropts", "support", "target", "transformutils" } },
  { "mc", "LLVMMC", true, { "support" } },
  { "mcdisassembler", "LLVMMCDisassembler", true, { "mc", "support" } },
  { "mcjit", "LLVMMCJIT", true, { "core", "executionengine", "object", "runtimedyld", "support", "target" } },
  { "mcparser", "LLVMMCParser", true, { "mc", "support" } },
  { "mirparser", "LLVMMIRParser", true, { "asmparser", "codegen", "core", "mc", "support", "target" } },
  { "native", nullptr, true, { "x86" } },
  { "nativecodegen", nullptr, true, { "x86codegen" } },
  { "objcarcopts", "LLVMObjCARCOpts", true, { "analysis", "core", "support", "transformutils" } },
  { "object", "LLVMObject", true, { "bitreader", "core", "mc", "mcparser", "support" } },
  { "objectyaml", "LLVMObjectYAML", true, { "support" } },
  { "option", "LLVMOption", true, { "support" } },
  { "orcjit", "LLVMOrcJIT", true, { "core", "executionengine", "object", "runtimedyld", "support", "transformutils" } },
  { "passes", "LLVMPasses", true, { "analysis", "codegen", "core", "ipo", "instcombine", "scalaropts", "support", "transformutils", "vectorize", "instrumentation" } },
  { "powerpc", nullptr, true, { "powerpcasmprinter", "powerpcinfo", "powerpcdesc", "powerpcasmparser", "powerpccodegen", "powerpcdisassembler" } },
  { "powerpcasmparser", "LLVMPowerPCAsmParser", true, { "mc", "mcparser", "powerpcdesc", "powerpcinfo", "support" } },
  { "powerpcasmprinter", "LLVMPowerPCAsmPrinter", true, { "mc", "support" } },
  { "powerpccodegen", "LLVMPowerPCCodeGen", true, { "analysis", "asmprinter", "codegen", "core", "mc", "powerpcasmprinter", "powerpcdesc", "powerpcinfo", "scalaropts", "selectiondag", "support", "target", "transformutils" } },
  { "powerpcdesc", "LLVMPowerPCDesc", true, { "mc", "powerpcasmprinter", "powerpcinfo", "support" } },
  { "powerpcdisassembler", "LLVMPowerPCDisassembler", true, { "mcdisassembler", "powerpcinfo", "support" } },
  { "powerpcinfo", "LLVMPowerPCInfo", true, { "support" } },
  { "profiledata", "LLVMProfileData", true, { "core", "support" } },
  { "runtimedyld", "LLVMRuntimeDyld", true, { "mc", "object", "support" } },
  { "scalaropts", "LLVMScalarOpts", true, { "analysis", "core", "instcombine", "support", "transformutils" } },
  { "selectiondag", "LLVMSelectionDAG", true, { "analysis", "codegen", "core", "mc", "support", "target", "transformutils" } },
  { "support", "LLVMSupport", true, {  } },
  { "symbolize", "LLVMSymbolize", true, { "debuginfodwarf", "debuginfopdb", "object", "support" } },
  { "systemz", nullptr, true, { "systemzasmprinter", "systemzinfo", "systemzdesc", "systemzasmparser", "systemzcodegen", "systemzdisassembler" } },
  { "systemzasmparser", "LLVMSystemZAsmParser", true, { "mc", "mcparser", "support", "systemzdesc", "systemzinfo" } },
  { "systemzasmprinter", "LLVMSystemZAsmPrinter", true, { "mc", "support" } },
  { "systemzcodegen", "LLVMSystemZCodeGen", true, { "analysis", "asmprinter", "codegen", "core", "mc", "selectiondag", "support", "systemzasmprinter", "systemzdesc", "systemzinfo", "target" } },
  { "systemzdesc", "LLVMSystemZDesc", true, { "mc", "support", "systemzasmprinter", "systemzinfo" } },
  { "systemzdisassembler", "LLVMSystemZDisassembler", true, { "mc", "mcdisassembler", "support", "systemzdesc", "systemzinfo" } },
  { "systemzinfo", "LLVMSystemZInfo", true, { "support" } },
  { "tablegen", "LLVMTableGen", true, { "support" } },
  { "target", "LLVMTarget", true, { "analysis", "core", "mc", "support" } },
  { "transformutils", "LLVMTransformUtils", true, { "analysis", "core", "support" } },
  { "vectorize", "LLVMVectorize", true, { "analysis", "core", "support", "transformutils" } },
  { "x86", nullptr, true, { "x86utils", "x86asmprinter", "x86info", "x86desc", "x86codegen", "x86asmparser", "x86disassembler" } },
  { "x86asmparser", "LLVMX86AsmParser", true, { "mc", "mcparser", "support", "x86desc", "x86info" } },
  { "x86asmprinter", "LLVMX86AsmPrinter", true, { "mc", "support", "x86utils" } },
  { "x86codegen", "LLVMX86CodeGen", true, { "analysis", "asmprinter", "codegen", "core", "mc", "selectiondag", "support", "target", "x86asmprinter", "x86desc", "x86info", "x86utils" } },
  { "x86desc", "LLVMX86Desc", true, { "mc", "mcdisassembler", "object", "support", "x86asmprinter", "x86info" } },
  { "x86disassembler", "LLVMX86Disassembler", true, { "mcdisassembler", "support", "x86info" } },
  { "x86info", "LLVMX86Info", true, { "support" } },
  { "x86utils", "LLVMX86Utils", true, { "core", "support" } },
};
