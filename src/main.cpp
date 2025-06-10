#include "inc.h"
#include "run.h"
#include "utils.h"
#include "macros.h"
#include "parser.h"

ccodes color_codes;
var_struct var_struct_ref;

parsers parsers_ref;

int main(int argc, char* argv[]) {
	const std::string current_path = std::filesystem::current_path().string();
	std::string argument;
		
	if(argc != 2) {argument = DEFAULT_ARG;}
	else {argument = argv[1];}

	if(argument == "-v" || argument == "--version") {
	    std::cout << VERSION_OUT << VERSION << "\n";
	    return 0;
	}
	
	const std::string file_path = current_path + "/" + FILE_READ_KEY;
				
	if(std::filesystem::exists(file_path) && !(std::filesystem::is_directory(file_path))) {
		// SET SYSTEM AND RUN PARSING
 
		#ifdef _WIN32
			set_ter_color(color_codes);
		#else
			(void)0;
		#endif

		// RUN PARSING
		parsers_ref.main_parser(file_path, argument);
				
		if(var_struct_ref.sys_controller == false) {
			return 1;
		} return 0;
	}else {
		run::error_control(ERROR_FILE_NOT_EXISTS, 0);
		return 1;
	}
}
