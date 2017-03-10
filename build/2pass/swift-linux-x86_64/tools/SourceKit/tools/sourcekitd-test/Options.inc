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
#undef COMMA
#endif // PREFIX

/////////
// Groups

#ifdef OPTION

//////////
// Options

OPTION(prefix_0, "<input>", INPUT, Input, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_0, "<unknown>", UNKNOWN, Unknown, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "async", async, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Perform request asynchronously", nullptr)
OPTION(prefix_1, "cache-path=", cache_path_EQ, Joined, INVALID, cache_path, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "cache-path", cache_path, Separate, INVALID, INVALID, nullptr, 0, 0,
       "cache path", nullptr)
OPTION(prefix_1, "check-interface-ascii", check_interface_is_ascii, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Check that the module interface text is ASCII", nullptr)
OPTION(prefix_1, "cursor-action", cursor_action, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Print available actions on the code element under cursor", nullptr)
OPTION(prefix_1, "dont-print-request", dont_print_request, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Don't print the request", nullptr)
OPTION(prefix_1, "end-pos=", end_pos_EQ, Joined, INVALID, end_pos, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "end-pos", end_pos, Separate, INVALID, INVALID, nullptr, 0, 0,
       "line:col", nullptr)
OPTION(prefix_1, "group-name", group_name, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Module group name to print", nullptr)
OPTION(prefix_1, "header", header, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Header path", nullptr)
OPTION(prefix_1, "interested-usr", interested_usr, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Interested USR to calculate the containing group", nullptr)
OPTION(prefix_1, "json-request-path", json_request_path, Separate, INVALID, INVALID, nullptr, 0, 0,
       "path to read a request in JSON format", nullptr)
OPTION(prefix_1, "length=", length_EQ, Joined, INVALID, length, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "length", length, Separate, INVALID, INVALID, nullptr, 0, 0,
       "length of text referred to by pos / offset", nullptr)
OPTION(prefix_1, "line=", line_EQ, Joined, INVALID, line, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "line", line, Separate, INVALID, INVALID, nullptr, 0, 0,
       "line", nullptr)
OPTION(prefix_1, "module", module, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Module name", nullptr)
OPTION(prefix_1, "offset=", offset_EQ, Joined, INVALID, offset, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "offset", offset, Separate, INVALID, INVALID, nullptr, 0, 0,
       "byte offset", nullptr)
OPTION(prefix_1, "pass-as-sourcetext", pass_as_sourcetext, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Read source file and pass the contents with key.sourcetext", nullptr)
OPTION(prefix_1, "pos=", pos_EQ, Joined, INVALID, pos, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "pos", pos, Separate, INVALID, INVALID, nullptr, 0, 0,
       "line:col", nullptr)
OPTION(prefix_1, "print-raw-response", print_raw_response, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Dump the response to stdout", nullptr)
OPTION(prefix_1, "print-response-as-json", print_response_as_json, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Print the response as JSON output", nullptr)
OPTION(prefix_1, "replace=", replace_EQ, Joined, INVALID, replace, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "replace", replace, Separate, INVALID, INVALID, nullptr, 0, 0,
       "replace text ('text')", nullptr)
OPTION(prefix_1, "req-opts=", req_opts, CommaJoined, INVALID, INVALID, nullptr, 0, 0,
       "Pass the comma separated options in <arg> as request specific options", "<arg>")
OPTION(prefix_1, "req=", req_EQ, Joined, INVALID, req, nullptr, 0, 0, nullptr, nullptr)
OPTION(prefix_1, "req", req, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Request kind", nullptr)
OPTION(prefix_1, "simplified-demangling", simplified_demangling, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Use simplified demangling for the 'demangle' request", nullptr)
OPTION(prefix_1, "synthesized-extension", synthesized_extension, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Print synthesized extensions when generating interface", nullptr)
OPTION(prefix_1, "text-input", text_input, Separate, INVALID, INVALID, nullptr, 0, 0,
       "File to get source text from", nullptr)
OPTION(prefix_1, "usr", usr, Separate, INVALID, INVALID, nullptr, 0, 0,
       "USR", nullptr)
#endif // OPTION
