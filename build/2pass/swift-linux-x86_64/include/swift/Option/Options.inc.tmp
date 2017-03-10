/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Option Parsing Definitions                                                 *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

/////////
// Prefixes

#ifdef PREFIX
#define COMMA ,
PREFIX(prefix_0, {nullptr})
PREFIX(prefix_1, {"-" COMMA nullptr})
PREFIX(prefix_3, {"-" COMMA "--" COMMA nullptr})
PREFIX(prefix_2, {"--" COMMA nullptr})
#undef COMMA
#endif // PREFIX

/////////
// Groups

#ifdef OPTION
OPTION(nullptr, "<optimization level options>", O_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<code formatting options>", code_formatting_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<automatic crashing options>", debug_crash_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<debug info options>", g_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<swift internal options>", internal_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<swift debug/development internal options>", internal_debug_Group, Group, internal_Group, INVALID, nullptr, 0, 0,
       "DEBUG/DEVELOPMENT OPTIONS", nullptr)
OPTION(nullptr, "<linker-specific options>", linker_option_Group, Group, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(nullptr, "<mode options>", modes_Group, Group, INVALID, INVALID, nullptr, 0, 0,
       "MODES", nullptr)

//////////
// Options

OPTION(prefix_0, "<input>", INPUT, Input, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_0, "<unknown>", UNKNOWN, Unknown, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "###", _HASH_HASH_HASH, Flag, INVALID, driver_print_jobs, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "application-extension", enable_app_extension, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Restrict code to those available for App Extensions", nullptr)
OPTION(prefix_1, "assert-config", AssertConfig, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Specify the assert_configuration replacement. Possible values are Debug, Release, Unchecked, DisableReplacement.", nullptr)
OPTION(prefix_1, "assume-parsing-unqualified-ownership-sil", assume_parsing_unqualified_ownership_sil, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Assume unqualified SIL ownership when parsing SIL", nullptr)
OPTION(prefix_1, "assume-single-threaded", AssumeSingleThreaded, Flag, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Assume that code will be executed in a single-threaded environment", nullptr)
OPTION(prefix_1, "autolink-force-load", autolink_force_load, Flag, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Force ld to link against this module even if no symbols are used", nullptr)
OPTION(prefix_1, "autolink-library", autolink_library, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Add dependent library", nullptr)
OPTION(prefix_1, "code-complete-inits-in-postfix-expr", code_complete_inits_in_postfix_expr, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Include initializers when completing a postfix expression", nullptr)
OPTION(prefix_1, "color-diagnostics", color_diagnostics, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Print diagnostics in color", nullptr)
OPTION(prefix_1, "continue-building-after-errors", continue_building_after_errors, Flag, INVALID, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Continue building, even after errors are encountered", nullptr)
OPTION(prefix_1, "c", c, Flag, modes_Group, emit_object, nullptr, FrontendOption | NoInteractiveOption, 0, nullptr, nullptr)
OPTION(prefix_1, "debug-assert-after-parse", debug_assert_after_parse, Flag, debug_crash_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Force an assertion failure after parsing", nullptr)
OPTION(prefix_1, "debug-assert-immediately", debug_assert_immediately, Flag, debug_crash_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Force an assertion failure immediately", nullptr)
OPTION(prefix_1, "debug-constraints-attempt", debug_constraints_attempt, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Debug the constraint solver at a given attempt", nullptr)
OPTION(prefix_1, "debug-constraints", debug_constraints, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Debug the constraint-based type checker", nullptr)
OPTION(prefix_1, "debug-crash-after-parse", debug_crash_after_parse, Flag, debug_crash_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Force a crash after parsing", nullptr)
OPTION(prefix_1, "debug-crash-immediately", debug_crash_immediately, Flag, debug_crash_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Force a crash immediately", nullptr)
OPTION(prefix_1, "debug-forbid-typecheck-prefix", debug_forbid_typecheck_prefix, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Triggers llvm fatal_error if typechecker tries to typecheck a decl with the provided prefix name", nullptr)
OPTION(prefix_1, "debug-generic-signatures", debug_generic_signatures, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Debug generic signatures", nullptr)
OPTION(prefix_1, "debug-time-compilation", debug_time_compilation, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Prints the time taken by each compilation phase", nullptr)
OPTION(prefix_1, "debug-time-expression-type-checking", debug_time_expression_type_checking, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Dumps the time it takes to type-check each expression", nullptr)
OPTION(prefix_1, "debug-time-function-bodies", debug_time_function_bodies, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Dumps the time it takes to type-check each function body", nullptr)
OPTION(prefix_1, "debugger-support", debugger_support, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Process swift code as if running in the debugger", nullptr)
OPTION(prefix_1, "delayed-function-body-parsing", delayed_function_body_parsing, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Delay function body parsing until the end of all files", nullptr)
OPTION(prefix_1, "deprecated-integrated-repl", deprecated_integrated_repl, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoBatchOption, 0, nullptr, nullptr)
OPTION(prefix_1, "disable-access-control", disable_access_control, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't respect access control restrictions", nullptr)
OPTION(prefix_1, "disable-arc-opts", disable_arc_opts, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run SIL ARC optimization passes.", nullptr)
OPTION(prefix_1, "disable-autolink-framework", disable_autolink_framework, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable autolinking against the provided framework", nullptr)
OPTION(prefix_1, "disable-availability-checking", disable_availability_checking, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable checking for potentially unavailable APIs", nullptr)
OPTION(prefix_1, "disable-bridging-pch", disable_bridging_pch, Flag, INVALID, INVALID, nullptr, HelpHidden, 0,
       "Disable automatic generation of bridging PCH files", nullptr)
OPTION(prefix_1, "disable-diagnostic-passes", disable_diagnostic_passes, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run diagnostic passes", nullptr)
OPTION(prefix_1, "disable-incremental-llvm-codegen", disable_incremental_llvm_codegeneration, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable incremental llvm code generation.", nullptr)
OPTION(prefix_1, "disable-llvm-arc-opts", disable_llvm_arc_opts, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run LLVM ARC optimization passes.", nullptr)
OPTION(prefix_1, "disable-llvm-optzns", disable_llvm_optzns, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run LLVM optimization passes", nullptr)
OPTION(prefix_1, "disable-llvm-slp-vectorizer", disable_llvm_slp_vectorizer, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run LLVM SLP vectorizer", nullptr)
OPTION(prefix_1, "disable-llvm-value-names", disable_llvm_value_names, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't add names to local values in LLVM IR", nullptr)
OPTION(prefix_1, "disable-llvm-verify", disable_llvm_verify, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run the LLVM IR verifier.", nullptr)
OPTION(prefix_1, "disable-modules-validate-system-headers", disable_modules_validate_system_headers, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable validating system headers in the Clang importer", nullptr)
OPTION(prefix_1, "disable-objc-attr-requires-foundation-module", disable_objc_attr_requires_foundation_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Disable requiring uses of @objc to require importing the Foundation module", nullptr)
OPTION(prefix_1, "disable-objc-interop", disable_objc_interop, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Disable Objective-C interop code generation and config directives", nullptr)
OPTION(prefix_1, "disable-playground-transform", disable_playground_transform, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable playground transformation", nullptr)
OPTION(prefix_1, "disable-reflection-metadata", disable_reflection_metadata, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable emission of reflection metadata for nominal types", nullptr)
OPTION(prefix_1, "disable-reflection-names", disable_reflection_names, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable emission of names of stored properties and enum cases inreflection metadata", nullptr)
OPTION(prefix_1, "disable-serialization-nested-type-lookup-table", disable_serialization_nested_type_lookup_table, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Force module merging to use regular lookups to find nested types", nullptr)
OPTION(prefix_1, "disable-sil-linking", disable_sil_linking, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't link SIL functions", nullptr)
OPTION(prefix_1, "disable-sil-partial-apply", disable_sil_partial_apply, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Disable use of partial_apply in SIL generation", nullptr)
OPTION(prefix_1, "disable-sil-perf-optzns", disable_sil_perf_optzns, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Don't run SIL performance optimization passes", nullptr)
OPTION(prefix_1, "disable-swift-bridge-attr", disable_swift_bridge_attr, Flag, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Disable using the swift bridge attribute", nullptr)
OPTION(prefix_1, "disable-target-os-checking", disable_target_os_checking, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Disable checking the target OS of serialized modules", nullptr)
OPTION(prefix_1, "disable-testable-attr-requires-testable-module", disable_testable_attr_requires_testable_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Disable checking of @testable", nullptr)
OPTION(prefix_1, "disable-typo-correction", disable_typo_correction, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Disable typo correction", nullptr)
OPTION(prefix_1, "driver-always-rebuild-dependents", driver_always_rebuild_dependents, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Always rebuild dependents of files that have been modified", nullptr)
OPTION(prefix_2, "driver-mode=", driver_mode, Joined, INVALID, INVALID, nullptr, HelpHidden, 0,
       "Set the driver mode to either 'swift' or 'swiftc'", nullptr)
OPTION(prefix_1, "driver-print-actions", driver_print_actions, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Dump list of actions to perform", nullptr)
OPTION(prefix_1, "driver-print-bindings", driver_print_bindings, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Dump list of job inputs and outputs", nullptr)
OPTION(prefix_1, "driver-print-jobs", driver_print_jobs, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Dump list of jobs to execute", nullptr)
OPTION(prefix_1, "driver-print-output-file-map", driver_print_output_file_map, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Dump the contents of the output file map", nullptr)
OPTION(prefix_1, "driver-show-incremental", driver_show_incremental, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "With -v, dump information about why files are being rebuilt", nullptr)
OPTION(prefix_1, "driver-skip-execution", driver_skip_execution, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Skip execution of subtasks when performing compilation", nullptr)
OPTION(prefix_1, "driver-time-compilation", driver_time_compilation, Flag, INVALID, INVALID, nullptr, NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Prints the total time it took to execute all compilation tasks", nullptr)
OPTION(prefix_1, "driver-use-filelists", driver_use_filelists, Flag, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Pass input files as filelists whenever possible", nullptr)
OPTION(prefix_1, "driver-use-frontend-path", driver_use_frontend_path, Separate, internal_debug_Group, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Use the given executable to perform compilations", nullptr)
OPTION(prefix_1, "dump-api-path", dump_api_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "The path to output swift interface files for the compiled source files", nullptr)
OPTION(prefix_1, "dump-ast", dump_ast, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse and type-check input file(s) and dump AST(s)", nullptr)
OPTION(prefix_1, "dump-clang-diagnostics", dump_clang_diagnostics, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Dump Clang diagnostics to stderr", nullptr)
OPTION(prefix_1, "dump-interface-hash", dump_interface_hash, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Parse input file(s) and dump interface token hash(es)", nullptr)
OPTION(prefix_1, "dump-parse", dump_parse, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse input file(s) and dump AST(s)", nullptr)
OPTION(prefix_1, "dump-scope-maps", dump_scope_maps, Separate, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse and type-check input file(s) and dump the scope map(s)", "<expanded-or-list-of-line:column>")
OPTION(prefix_1, "dump-type-refinement-contexts", dump_type_refinement_contexts, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Type-check input file(s) and dump type refinement contexts(s)", nullptr)
OPTION(prefix_1, "D", D, JoinedOrSeparate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Marks a conditional compilation flag as true", nullptr)
OPTION(prefix_1, "embed-bitcode-marker", embed_bitcode_marker, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Embed placeholder LLVM IR data as a marker", nullptr)
OPTION(prefix_1, "embed-bitcode", embed_bitcode, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Embed LLVM IR bitcode as data", nullptr)
OPTION(prefix_1, "emit-assembly", emit_assembly, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit assembly file(s) (-S)", nullptr)
OPTION(prefix_1, "emit-bc", emit_bc, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit LLVM BC file(s)", nullptr)
OPTION(prefix_1, "emit-dependencies-path", emit_dependencies_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Output basic Make-compatible dependencies file to <path>", "<path>")
OPTION(prefix_1, "emit-dependencies", emit_dependencies, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit basic Make-compatible dependencies files", nullptr)
OPTION(prefix_1, "emit-executable", emit_executable, Flag, modes_Group, INVALID, nullptr, NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit a linked executable", nullptr)
OPTION(prefix_1, "emit-fixits-path", emit_fixits_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Output compiler fixits as source edits to <path>", "<path>")
OPTION(prefix_1, "emit-ir", emit_ir, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit LLVM IR file(s)", nullptr)
OPTION(prefix_1, "emit-library", emit_library, Flag, modes_Group, INVALID, nullptr, NoInteractiveOption, 0,
       "Emit a linked library", nullptr)
OPTION(prefix_1, "emit-module-doc-path", emit_module_doc_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Output module documentation file <path>", "<path>")
OPTION(prefix_1, "emit-module-doc", emit_module_doc, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Emit a module documentation file based on documentation comments", nullptr)
OPTION(prefix_1, "emit-module-path=", emit_module_path_EQ, Joined, INVALID, emit_module_path, nullptr, FrontendOption | NoInteractiveOption, 0, nullptr, nullptr)
OPTION(prefix_1, "emit-module-path", emit_module_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit an importable module to <path>", "<path>")
OPTION(prefix_1, "emit-module", emit_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit an importable module", nullptr)
OPTION(prefix_1, "emit-objc-header-path", emit_objc_header_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit an Objective-C header file to <path>", "<path>")
OPTION(prefix_1, "emit-objc-header", emit_objc_header, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit an Objective-C header file", nullptr)
OPTION(prefix_1, "emit-object", emit_object, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit object file(s) (-c)", nullptr)
OPTION(prefix_1, "emit-pch", emit_pch, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Emit PCH for imported Objective-C header file", nullptr)
OPTION(prefix_1, "emit-reference-dependencies-path", emit_reference_dependencies_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Output Swift-style dependencies file to <path>", "<path>")
OPTION(prefix_1, "emit-reference-dependencies", emit_reference_dependencies, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Emit a Swift-style dependencies file", nullptr)
OPTION(prefix_1, "emit-sibgen", emit_sibgen, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit serialized AST + raw SIL file(s)", nullptr)
OPTION(prefix_1, "emit-sib", emit_sib, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit serialized AST + canonical SIL file(s)", nullptr)
OPTION(prefix_1, "emit-silgen", emit_silgen, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit raw SIL file(s)", nullptr)
OPTION(prefix_1, "emit-sil", emit_sil, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit canonical SIL file(s)", nullptr)
OPTION(prefix_1, "emit-sorted-sil", emit_sorted_sil, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "When printing SIL, print out all sil entities sorted by name to ease diffing", nullptr)
OPTION(prefix_1, "emit-stack-promotion-checks", stack_promotion_checks, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Emit runtime checks for correct stack promotion of objects.", nullptr)
OPTION(prefix_1, "emit-verbose-sil", emit_verbose_sil, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Emit locations during SIL emission", nullptr)
OPTION(prefix_1, "enable-access-control", enable_access_control, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Respect access control restrictions", nullptr)
OPTION(prefix_1, "enable-astscope-lookup", enable_astscope_lookup, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable ASTScope-based unqualified name lookup", nullptr)
OPTION(prefix_1, "enable-bridging-pch", enable_bridging_pch, Flag, INVALID, INVALID, nullptr, HelpHidden, 0,
       "Enable automatic generation of bridging PCH files", nullptr)
OPTION(prefix_1, "enable-class-resilience", enable_class_resilience, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Compile the module to export resilient interfaces for all public classes by default (doesn't work yet)", nullptr)
OPTION(prefix_1, "enable-experimental-property-behaviors", enable_experimental_property_behaviors, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Enable experimental property behaviors", nullptr)
OPTION(prefix_1, "enable-guaranteed-closure-contexts", enable_guaranteed_closure_contexts, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Use @guaranteed convention for closure context", nullptr)
OPTION(prefix_1, "enable-infer-import-as-member", enable_infer_import_as_member, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Infer when a global could be imported as a member", nullptr)
OPTION(prefix_1, "enable-llvm-value-names", enable_llvm_value_names, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Add names to local values in LLVM IR", nullptr)
OPTION(prefix_1, "enable-objc-attr-requires-foundation-module", enable_objc_attr_requires_foundation_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable requiring uses of @objc to require importing the Foundation module", nullptr)
OPTION(prefix_1, "enable-objc-interop", enable_objc_interop, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable Objective-C interop code generation and config directives", nullptr)
OPTION(prefix_1, "enable-resilience", enable_resilience, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Compile the module to export resilient interfaces for all public declarations by default", nullptr)
OPTION(prefix_1, "enable-sil-ownership", enable_sil_ownership, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Enable the SIL Ownership Model", nullptr)
OPTION(prefix_1, "enable-source-import", enable_source_import, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Enable importing of Swift source files", nullptr)
OPTION(prefix_1, "enable-swiftcall", enable_swiftcall, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable the use of LLVM swiftcall support", nullptr)
OPTION(prefix_1, "enable-target-os-checking", enable_target_os_checking, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable checking the target OS of serialized modules", nullptr)
OPTION(prefix_1, "enable-testable-attr-requires-testable-module", enable_testable_attr_requires_testable_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Enable checking of @testable", nullptr)
OPTION(prefix_1, "enable-testing", enable_testing, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | HelpHidden, 0,
       "Allows this module's internal API to be accessed for testing", nullptr)
OPTION(prefix_1, "enable-throw-without-try", enable_throw_without_try, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Allow throwing function calls without 'try'", nullptr)
OPTION(prefix_1, "external-pass-pipeline-filename", external_pass_pipeline_filename, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Use the pass pipeline defined by <pass_pipeline_file>", "<pass_pipeline_file>")
OPTION(prefix_1, "F=", F_EQ, Joined, INVALID, F, nullptr, FrontendOption, 0, nullptr, nullptr)
OPTION(prefix_1, "filelist", filelist, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Specify source inputs in a file rather than on the command line", nullptr)
OPTION(prefix_1, "fixit-all", fixit_all, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Apply all fixits from diagnostics without any filtering", nullptr)
OPTION(prefix_1, "fixit-code", fixit_code, Flag, INVALID, INVALID, nullptr, NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Get compiler fixits as code edits", nullptr)
OPTION(prefix_1, "force-single-frontend-invocation", force_single_frontend_invocation, Flag, INVALID, whole_module_optimization, nullptr, FrontendOption | NoInteractiveOption | HelpHidden, 0, nullptr, nullptr)
OPTION(prefix_1, "framework", framework, Separate, linker_option_Group, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Specifies a framework which should be linked against", nullptr)
OPTION(prefix_1, "F", F, JoinedOrSeparate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Add directory to framework search path", nullptr)
OPTION(prefix_1, "gdwarf-types", gdwarf_types, Flag, g_Group, INVALID, nullptr, FrontendOption, 0,
       "Emit full DWARF type info.", nullptr)
OPTION(prefix_1, "gline-tables-only", gline_tables_only, Flag, g_Group, INVALID, nullptr, FrontendOption, 0,
       "Emit minimal debug info for backtraces only", nullptr)
OPTION(prefix_1, "gnone", gnone, Flag, g_Group, INVALID, nullptr, FrontendOption, 0,
       "Don't emit debug info", nullptr)
OPTION(prefix_1, "group-info-path", group_info_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "The path to collect the group information of the compiled module", nullptr)
OPTION(prefix_1, "gsil", debug_on_sil, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Write the SIL into a file and generate debug-info to debug on SIL  level.", nullptr)
OPTION(prefix_1, "g", g, Flag, g_Group, INVALID, nullptr, FrontendOption, 0,
       "Emit debug info. This is the preferred setting for debugging with LLDB.", nullptr)
OPTION(prefix_3, "help-hidden", help_hidden, Flag, INVALID, INVALID, nullptr, HelpHidden | FrontendOption, 0,
       "Display available options, including hidden options", nullptr)
OPTION(prefix_3, "help", help, Flag, INVALID, INVALID, nullptr, FrontendOption | AutolinkExtractOption | ModuleWrapOption | SwiftFormatOption, 0,
       "Display available options", nullptr)
OPTION(prefix_1, "h", h, Flag, INVALID, help, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "I=", I_EQ, Joined, INVALID, I, nullptr, FrontendOption, 0, nullptr, nullptr)
OPTION(prefix_1, "import-cf-types", import_cf_types, Flag, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Recognize and import CF types as class types", nullptr)
OPTION(prefix_1, "import-module", import_module, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Implicitly import the specified module", nullptr)
OPTION(prefix_1, "import-objc-header", import_objc_header, Separate, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Implicitly imports an Objective-C header file", nullptr)
OPTION(prefix_1, "import-underlying-module", import_underlying_module, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Implicitly imports the Objective-C half of a module", nullptr)
OPTION(prefix_1, "in-place", in_place, Flag, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "Overwrite input file with formatted file.", nullptr)
OPTION(prefix_1, "incremental", incremental, Flag, INVALID, INVALID, nullptr, NoInteractiveOption | HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Perform an incremental build if possible", nullptr)
OPTION(prefix_1, "indent-switch-case", indent_switch_case, Flag, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "Indent cases in switch statements.", nullptr)
OPTION(prefix_1, "indent-width", indent_width, Separate, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "Number of characters to indent.", "<n>")
OPTION(prefix_1, "interpret", interpret, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Immediate mode", nullptr)
OPTION(prefix_1, "iterative-type-checker", iterative_type_checker, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Enable the iterative type checker", nullptr)
OPTION(prefix_1, "I", I, JoinedOrSeparate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Add directory to the import search path", nullptr)
OPTION(prefix_1, "i", i, Flag, modes_Group, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "j", j, JoinedOrSeparate, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0,
       "Number of commands to execute in parallel", "<n>")
OPTION(prefix_1, "L=", L_EQ, Joined, INVALID, L, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "line-range", line_range, Separate, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "<start line>:<end line>. Formats a range of lines (1-based). Can only be used with one input file.", "<n:n>")
OPTION(prefix_1, "link-objc-runtime", link_objc_runtime, Flag, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0, nullptr, nullptr)
OPTION(prefix_1, "lldb-repl", lldb_repl, Flag, modes_Group, INVALID, nullptr, NoBatchOption | HelpHidden, 0,
       "LLDB-enhanced REPL mode", nullptr)
OPTION(prefix_1, "L", L, JoinedOrSeparate, linker_option_Group, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Add directory to library link search path", nullptr)
OPTION(prefix_1, "l", l, Joined, linker_option_Group, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Specifies a library which should be linked against", nullptr)
OPTION(prefix_1, "module-cache-path", module_cache_path, Separate, INVALID, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Specifies the Clang module cache path", nullptr)
OPTION(prefix_1, "module-link-name=", module_link_name_EQ, Joined, INVALID, module_link_name, nullptr, FrontendOption, 0, nullptr, nullptr)
OPTION(prefix_1, "module-link-name", module_link_name, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Library to link against when using this module", nullptr)
OPTION(prefix_1, "module-name=", module_name_EQ, Joined, INVALID, module_name, nullptr, FrontendOption, 0, nullptr, nullptr)
OPTION(prefix_1, "module-name", module_name, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Name of the module to build", nullptr)
OPTION(prefix_1, "no-link-objc-runtime", no_link_objc_runtime, Flag, INVALID, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Don't link in additions to the Objective-C runtime", nullptr)
OPTION(prefix_1, "no-static-executable", no_static_executable, Flag, INVALID, INVALID, nullptr, HelpHidden, 0,
       "Don't statically link the executable", nullptr)
OPTION(prefix_1, "no-static-stdlib", no_static_stdlib, Flag, INVALID, INVALID, nullptr, HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Don't statically link the Swift standard library", nullptr)
OPTION(prefix_1, "nostdimport", nostdimport, Flag, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Don't search the standard library import path for modules", nullptr)
OPTION(prefix_1, "num-threads", num_threads, Separate, INVALID, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0,
       "Enable multi-threading and specify number of threads", "<n>")
OPTION(prefix_1, "Onone", Onone, Flag, O_Group, INVALID, nullptr, FrontendOption, 0,
       "Compile without any optimization", nullptr)
OPTION(prefix_1, "Oplayground", Oplayground, Flag, O_Group, INVALID, nullptr, HelpHidden | FrontendOption, 0,
       "Compile with optimizations appropriate for a playground", nullptr)
OPTION(prefix_1, "Ounchecked", Ounchecked, Flag, O_Group, INVALID, nullptr, FrontendOption, 0,
       "Compile with optimizations and remove runtime safety checks", nullptr)
OPTION(prefix_1, "output-file-map=", output_file_map_EQ, Joined, INVALID, output_file_map, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "output-file-map", output_file_map, Separate, INVALID, INVALID, nullptr, NoInteractiveOption, 0,
       "A file which specifies the location of outputs", "<path>")
OPTION(prefix_1, "output-filelist", output_filelist, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Specify outputs in a file rather than on the command line", nullptr)
OPTION(prefix_1, "O", O, Flag, O_Group, INVALID, nullptr, FrontendOption, 0,
       "Compile with optimizations", nullptr)
OPTION(prefix_1, "o", o, JoinedOrSeparate, INVALID, INVALID, nullptr, FrontendOption | AutolinkExtractOption | ModuleWrapOption | NoInteractiveOption | SwiftFormatOption, 0,
       "Write output to <file>", "<file>")
OPTION(prefix_1, "parse-as-library", parse_as_library, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Parse the input file(s) as libraries, not scripts", nullptr)
OPTION(prefix_1, "parse-sil", parse_sil, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Parse the input file as SIL code, not Swift source", nullptr)
OPTION(prefix_1, "parse-stdlib", parse_stdlib, Flag, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Parse the input file(s) as the Swift standard library", nullptr)
OPTION(prefix_1, "parseable-output", parseable_output, Flag, INVALID, INVALID, nullptr, NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Emit textual output in a parseable format", nullptr)
OPTION(prefix_1, "parse", parse, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse input file(s)", nullptr)
OPTION(prefix_1, "pc-macro", pc_macro, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Apply the 'program counter simulation' macro", nullptr)
OPTION(prefix_1, "playground-high-performance", playground_high_performance, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Omit instrumentation that has a high runtime performance impact", nullptr)
OPTION(prefix_1, "playground", playground, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Apply the playground semantics and transformation", nullptr)
OPTION(prefix_1, "primary-file", primary_file, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Produce output for this file, not the whole module", nullptr)
OPTION(prefix_1, "print-ast", print_ast, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse and type-check input file(s) and pretty print AST(s)", nullptr)
OPTION(prefix_1, "print-clang-stats", print_clang_stats, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Print Clang importer statistics", nullptr)
OPTION(prefix_1, "print-inst-counts", print_inst_counts, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Before IRGen, count all the various SIL instructions. Must be used in conjunction with -print-stats.", nullptr)
OPTION(prefix_1, "print-llvm-inline-tree", print_llvm_inline_tree, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Print the LLVM inline tree.", nullptr)
OPTION(prefix_1, "print-stats", print_stats, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Print various statistics", nullptr)
OPTION(prefix_1, "profile-coverage-mapping", profile_coverage_mapping, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Generate coverage data for use with profiled execution counts", nullptr)
OPTION(prefix_1, "profile-generate", profile_generate, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Generate instrumented code to collect execution counts", nullptr)
OPTION(prefix_1, "remove-runtime-asserts", remove_runtime_asserts, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Remove runtime asserts.", nullptr)
OPTION(prefix_1, "repl", repl, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoBatchOption | HelpHidden, 0,
       "REPL mode (the default if there is no input file)", nullptr)
OPTION(prefix_1, "resource-dir", resource_dir, Separate, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "The directory that holds the compiler resource files", "</usr/lib/swift>")
OPTION(prefix_1, "sanitize-coverage=", sanitize_coverage_EQ, CommaJoined, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Specify the type of coverage instrumentation for Sanitizers and additional options separated by commas", "<type>")
OPTION(prefix_1, "sanitize=", sanitize_EQ, CommaJoined, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Turn on runtime checks for erroneous behavior.", "<check>")
OPTION(prefix_1, "save-temps", save_temps, Flag, INVALID, INVALID, nullptr, NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Save intermediate compilation results", nullptr)
OPTION(prefix_1, "sdk", sdk, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Compile against <sdk>", "<sdk>")
OPTION(prefix_1, "serialize-debugging-options", serialize_debugging_options, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Always serialize options for debugging (default: only for apps)", nullptr)
OPTION(prefix_1, "serialize-diagnostics-path", serialize_diagnostics_path, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Output serialized diagnostics to <path>", "<path>")
OPTION(prefix_1, "serialize-diagnostics", serialize_diagnostics, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Serialize diagnostics in a binary format", nullptr)
OPTION(prefix_1, "show-diagnostics-after-fatal", show_diagnostics_after_fatal, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Keep emitting subsequent diagnostics after a fatal error", nullptr)
OPTION(prefix_1, "sil-debug-serialization", sil_debug_serialization, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Do not eliminate functions in Mandatory Inlining/SILCombine dead functions. (for debugging only)", nullptr)
OPTION(prefix_1, "sil-inline-threshold", sil_inline_threshold, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Controls the aggressiveness of performance inlining", "<50>")
OPTION(prefix_1, "sil-link-all", sil_link_all, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Link all SIL functions", nullptr)
OPTION(prefix_1, "sil-serialize-all", sil_serialize_all, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Serialize all generated SIL", nullptr)
OPTION(prefix_1, "sil-verify-all", sil_verify_all, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Verify SIL after each transform", nullptr)
OPTION(prefix_1, "solver-memory-threshold", solver_memory_threshold, Separate, INVALID, INVALID, nullptr, FrontendOption | HelpHidden | DoesNotAffectIncrementalBuild, 0,
       "Set the upper bound for memory consumption, in bytes, by the constraint solver", nullptr)
OPTION(prefix_1, "stack-promotion-limit", stack_promotion_limit, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Limit the size of stack promoted objects to the provided number of bytes.", nullptr)
OPTION(prefix_1, "static-executable", static_executable, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Statically link the executable", nullptr)
OPTION(prefix_1, "static-stdlib", static_stdlib, Flag, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0,
       "Statically link the Swift standard library", nullptr)
OPTION(prefix_1, "suppress-warnings", suppress_warnings, Flag, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Suppress all warnings", nullptr)
OPTION(prefix_1, "swift-version", swift_version, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Interpret input according to a specific Swift language version number", "<vers>")
OPTION(prefix_1, "S", S, Flag, modes_Group, emit_assembly, nullptr, FrontendOption | NoInteractiveOption, 0, nullptr, nullptr)
OPTION(prefix_1, "tab-width", tab_width, Separate, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "Width of tab character.", "<n>")
OPTION(prefix_1, "target-cpu", target_cpu, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Generate code for a particular CPU variant", nullptr)
OPTION(prefix_2, "target=", target_legacy_spelling, Joined, INVALID, target, nullptr, FrontendOption, 0, nullptr, nullptr)
OPTION(prefix_1, "target", target, Separate, INVALID, INVALID, nullptr, FrontendOption | ModuleWrapOption, 0,
       "Generate code for the given target", nullptr)
OPTION(prefix_1, "tools-directory", tools_directory, Separate, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Look for external executables (ld, clang, binutils) in <directory>", "<directory>")
OPTION(prefix_1, "triple", triple, Separate, INVALID, target, nullptr, FrontendOption | NoDriverOption, 0, nullptr, nullptr)
OPTION(prefix_1, "typecheck", typecheck, Flag, modes_Group, INVALID, nullptr, FrontendOption | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Parse and type-check input file(s)", nullptr)
OPTION(prefix_1, "update-code", update_code, Flag, modes_Group, INVALID, nullptr, HelpHidden | NoInteractiveOption | DoesNotAffectIncrementalBuild, 0,
       "Update Swift code", nullptr)
OPTION(prefix_1, "use-jit", use_jit, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Register Objective-C classes as if the JIT were in use", nullptr)
OPTION(prefix_1, "use-ld=", use_ld, Joined, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0,
       "Specifies the linker to be used", nullptr)
OPTION(prefix_1, "use-malloc", use_malloc, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Allocate internal data structures using malloc (for memory debugging)", nullptr)
OPTION(prefix_1, "use-tabs", use_tabs, Flag, code_formatting_Group, INVALID, nullptr, NoInteractiveOption | NoBatchOption | SwiftFormatOption, 0,
       "Use tabs for indentation.", nullptr)
OPTION(prefix_1, "verify-apply-fixes", verify_apply_fixes, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Like -verify, but updates the original source file", nullptr)
OPTION(prefix_1, "verify-type-layout", verify_type_layout, JoinedOrSeparate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Verify compile-time and runtime type layout information for type", "<type>")
OPTION(prefix_1, "verify", verify, Flag, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption, 0,
       "Verify diagnostics against expected-{error|warning|note} annotations", nullptr)
OPTION(prefix_3, "version", version, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Print version information and exit", nullptr)
OPTION(prefix_1, "v", v, Flag, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0,
       "Show commands to run and use verbose output", nullptr)
OPTION(prefix_1, "warn-long-function-bodies=", warn_long_function_bodies_EQ, Joined, INVALID, warn_long_function_bodies, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0, nullptr, nullptr)
OPTION(prefix_1, "warn-long-function-bodies", warn_long_function_bodies, Separate, INVALID, INVALID, nullptr, FrontendOption | NoDriverOption | HelpHidden, 0,
       "Warns when type-checking a function takes longer than <n> ms", "<n>")
OPTION(prefix_1, "warnings-as-errors", warnings_as_errors, Flag, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Treat warnings as errors", nullptr)
OPTION(prefix_1, "whole-module-optimization", whole_module_optimization, Flag, INVALID, INVALID, nullptr, FrontendOption | NoInteractiveOption, 0,
       "Optimize input files together instead of individually", nullptr)
OPTION(prefix_1, "wmo", wmo, Flag, INVALID, whole_module_optimization, nullptr, FrontendOption | NoInteractiveOption | HelpHidden, 0, nullptr, nullptr)
OPTION(prefix_1, "Xcc", Xcc, Separate, INVALID, INVALID, nullptr, FrontendOption, 0,
       "Pass <arg> to the C/C++/Objective-C compiler", "<arg>")
OPTION(prefix_1, "Xfrontend", Xfrontend, Separate, INVALID, INVALID, nullptr, HelpHidden, 0,
       "Pass <arg> to the Swift frontend", "<arg>")
OPTION(prefix_1, "Xlinker", Xlinker, Separate, INVALID, INVALID, nullptr, DoesNotAffectIncrementalBuild, 0,
       "Specifies an option which should be passed to the linker", nullptr)
OPTION(prefix_1, "Xllvm", Xllvm, Separate, INVALID, INVALID, nullptr, FrontendOption | HelpHidden, 0,
       "Pass <arg> to LLVM.", "<arg>")
OPTION(prefix_2, "", _DASH_DASH, RemainingArgs, INVALID, INVALID, nullptr, FrontendOption | DoesNotAffectIncrementalBuild, 0, nullptr, nullptr)
#endif // OPTION
