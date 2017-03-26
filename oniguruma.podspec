Pod::Spec.new do |s|

  s.name              = "oniguruma"
  s.version           = "6.1.1"
  s.summary           = "oniguruma is a regular expressions library forked from Oniguruma."
  s.description       = "oniguruma is a regular expressions library forked from Oniguruma."
  s.homepage          = "http://pcre.org"
  s.documentation_url = "http://pcre.org"
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

  s.source = { :git => "https://github.com/cute/oniguruma.git",
               :tag => "release-6.1.3" }

  s.source_files  = [
                  "podspec/*.{h,c}",
]

  s.header_mappings_dir = "podspec"
  s.public_header_files = "podspec/*.h"
  s.exclude_files = 'podspec/unicode_property_data*'
  s.requires_arc = false
  s.prefix_header_contents = '

  '
  s.prepare_command = <<-CMD
mkdir -p podspec
cp src/*.h podspec/
cp src/*.c podspec/

sed -i '' -e '
s/regcomp/onig_regcomp/
s/regexec/onig_regexec/
s/regerror/onig_regerror/
s/regfree/onig_regfree/
' podspec/onigposix.h podspec/regposix.c podspec/regposerr.c

CMD

end
