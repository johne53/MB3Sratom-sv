#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'NEWS'

require "../local-paths.lib";

$package_string = "\"sratom 0.4\"";
$version_string = "\"0.4.7\"";
$sratom_version = "0.4.7";
$major = 0;
$minor = 4;
$micro = 7;
$binary_age = 407;
$interface_age = 0;
$current_minus_age = 0;
$gettext_package = "sratom";
$exec_prefix = "lib";

# Currently, the following two are guesses:-
$pkg_serd = "serd-0";
$pkg_sord = "sord-0";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$version_string/g;
	    s/\@PACKAGE_VERSION@/$version_string/g;
	    s/\@PACKAGE_STRING@/$package_string/g;
	    s/\@SRATOM_VERSION@/$sratom_version/g;
	    s/\@SRATOM_API_VERSION@/$sratom_api_version/g;
	    s/\@SRATOM_MAJOR_VERSION\@/$major/g;
	    s/\@SRATOM_MINOR_VERSION\@/$minor/g;
	    s/\@SRATOM_MICRO_VERSION\@/$micro/g;
	    s/\@SRATOM_INTERFACE_AGE\@/$interface_age/g;
	    s/\@SRATOM_BINARY_AGE\@/$binary_age/g;
	    s/\@LIB_SRATOM@/$gettext_package/g;
	    s/\@DLL_NAME\@/$gettext_package/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@GETTEXT_PACKAGE\@/$gettext_package/g;
	    s/\@PKG_serd_0\@/$pkg_serd/g;
	    s/\@PKG_sord_0\@/$pkg_sord/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@PangoBuildProjectFolder@/$pango_build_project_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@PREFIX@/$prefix/g;
	    s/\@EXEC_PREFIX@/$exec_prefix/g;
	    s/\@INCLUDEDIR@/$generic_include_folder/g;
	    s/\@LIBDIR@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

my $command=join(' ',@ARGV);

if (-1 != index($command, "-X64")) {
	$sratom_api_version = "64-0";
} else {
	$sratom_api_version = "32-0";
}

process_file ("sratom.pc");
process_file ("build/sratom_config.h");

if ($command eq -buildall) {
	process_file ("build/msvc/sratom.rc");
	process_file ("build/msvc/sratom.vsprops");
}