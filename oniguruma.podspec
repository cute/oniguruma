Pod::Spec.new do |s|

  s.name              = "oniguruma"
  s.version           = "6.1.3"
  s.summary           = "oniguruma is a regular expressions library forked from Oniguruma."
  s.description       = "oniguruma is a regular expressions library forked from Oniguruma."
  s.homepage          = "https://github.com/kkos/oniguruma"
  s.documentation_url = "https://github.com/kkos/oniguruma"
  s.license           = "BSD"
  s.authors           = { "K.Takata"=>"kentkt@csc.jp",
                          "K.Kosako" => "sndgk393@ybb.ne.jp",
                        }
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"

  s.compiler_flags = '-Wno-shorten-64-to-32', '-Wno-unused-function', '-Wno-unreachable-code',
                     '-Wno-tautological-constant-out-of-range-compare',
                     '-DHAVE_CONFIG_H',
                     '-Wno-constant-conversion',
                     '-Wno-ambiguous-macro'

  s.source = { :git => "https://github.com/kkos/oniguruma.git",
               :tag => "release-6.1.3" }

  s.source_files  = [
    "podspec/*.{h,c}",
  ]

  s.header_mappings_dir = "podspec"
  s.private_header_files = ["podspec/reg*.h", "podspec/config.h", "podspec/st.h"]
  s.public_header_files = "podspec/onig*.h"
  s.requires_arc = false
  s.prefix_header_contents = '
  #define HAVE_CONFIG_H
  '
  s.prepare_command = <<-CMD
mkdir -p podspec
cp src/*.h podspec/
cp src/*.c podspec/
cat > podspec/config.h <<CONFIG_H
#define HAVE_ALLOCA 1
#define HAVE_ALLOCA_H 1
#define HAVE_DLFCN_H 1
#define HAVE_INTTYPES_H 1
#define HAVE_MEMORY_H 1
#define HAVE_PROTOTYPES 1
#define HAVE_STDARG_PROTOTYPES 1
#define HAVE_STDINT_H 1
#define HAVE_STDLIB_H 1
#define HAVE_STRINGS_H 1
#define HAVE_STRING_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TIMES_H 1
#define HAVE_SYS_TIME_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#define LT_OBJDIR ".libs/"
#define PACKAGE "onig"
#define PACKAGE_BUGREPORT ""
#define PACKAGE_NAME "onig"
#define PACKAGE_STRING "onig 6.1.3"
#define PACKAGE_TARNAME "onig"
#define PACKAGE_URL ""
#define PACKAGE_VERSION "6.1.3"
#define SIZEOF_INT 4
#define SIZEOF_LONG 8
#define SIZEOF_SHORT 2
#define STDC_HEADERS 1
#define TIME_WITH_SYS_TIME 1
#define VERSION "6.1.3"
CONFIG_H

sed -i '' -e '
s/regcomp/onig_regcomp/
s/regexec/onig_regexec/
s/regerror/onig_regerror/
s/regfree/onig_regfree/
' podspec/onigposix.h podspec/regposix.c podspec/regposerr.c

CMD

end
