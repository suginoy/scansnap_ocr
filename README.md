# ScansnapOcr

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/scansnap_ocr`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

This gem is private and you can't get from rubygems.

## Usage

You need tools below.

- ScanSnap drivers '検索可能なPDFに変換' on Mac OS X
  [http://scansnap.fujitsu.com/jp/downloads/](http://scansnap.fujitsu.com/jp/downloads/)
- pdftk

    $ brew search pdftk                                                                                                                                                           No formula found for "pdftk".
    Searching pull requests...
    Closed pull requests:
    pdftk: 2.02 - a Handy Tool for Manipulating PDF Documents (https://github.com/Homebrew/homebrew/pull/25953)

    $ brew pull https://github.com/Homebrew/homebrew/pull/25953
You can generate OCR-able PDF files with the first dummy page in './output' dir.

    $ bundle exec scansnap_ocr prepare [dir or filename]

You can extract and rename OCR-ed files "xxx_for_OCR.pdf" with "xxx.pdf".

    $ bundle exec scansnap_ocr extract [dir or filename]

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec scansnap_ocr` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/scansnap_ocr. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
