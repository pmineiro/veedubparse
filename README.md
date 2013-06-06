veedubparse
===========

c++ parser for [vowpal wabbit](https://github.com/JohnLangford/vowpal_wabbit) 
style input files.

I've used this in several projects since 2010 so I believe it is (mostly)
defect free and fairly zippy.

how to use
===========

1. Make a parser
        
        using namespace veedubparse;
        std::ios::sync_with_stdio (false); // otherwise performance can be poor (?)
        StandardParse<HashString> parser;

   You can choose `HashString` or `HashAll` which correspond to the vowpal wabbit 
   [hash command line option](https://github.com/JohnLangford/vowpal_wabbit/wiki/Feature-Hashing-and-Extraction#the---hash-command-line-option).

2. Pass the parser a `std::istream` and a callback.  Nowadays with the lambda syntax this is super easy.

        using namespace veedubparse;
        std::istream someIstream;
        parse (someIstream, [] (bool ok, const GeneralExample& ex) {
                 if (ok)
                   { 
                     process_example (ex);
                   }
                 else
                   {
                     // bad input line encountered
                   }
               });
