require 'scansnap_ocr'
require 'thor'

module ScansnapOcr
  CMD = 'pdftk'
  TEMPLATE_PDF = './lib/scansnap_ocr/templates/1st_page.pdf'
  FOR_OCR_DIR = './for_ocr'
  SUFFIX = 'for_OCR'

  class CLI < Thor
    desc "prepare input dir or files", "generante pre-convert OCR PDF"
    def prepare(path_name)
      mkdir_for_ocr
      if FileTest.file?(path_name)
        generate_with_1st_dummy_page(path_name)
      elsif FileTest.directory?(path_name)
        Dir::glob("#{path_name}/*.pdf").each do |path_name|
          generate_with_1st_dummy_page(path_name)
        end
      else
        raise 'No such file or directory'
      end
    end

    desc "extract from input dir or files", "extract pages 2-end from files in INPUTDIR and rename xxx_for_ocr.pdf files with xxx.pdf"
    def extract(path_name)
      if FileTest.file?(path_name)
        extract_after_2nd_page(path_name)
      elsif FileTest.directory?(path_name)
        Dir::glob("#{path_name}/*_#{SUFFIX}.pdf").each do |path_name|
          extract_after_2nd_page(path_name)
        end
      else
        raise 'No such file or directory'
      end
    end

    private

    def mkdir_for_ocr
      # puts %Q(executing "mkdir #{FOR_OCR_DIR}")
      system("mkdir #{FOR_OCR_DIR}")
    end

    def generate_with_1st_dummy_page(path_name)
      filename = File::basename(path_name).delete(File::extname(path_name))
      subcmd = 'cat output'
      output = "#{FOR_OCR_DIR}/#{filename}_#{SUFFIX}.pdf"
      # puts %Q(executing "#{[CMD, TEMPLATE_PDF, path_name, subcmd, output].join(' ')}")
      system([CMD, TEMPLATE_PDF, path_name, subcmd, output].join(' '))
    end

    def extract_after_2nd_page(path_name)
      new_path_name = path_name.sub("_#{SUFFIX}", '')
      subcmd = 'cat 2-end output'
      # puts %Q(#{[CMD, path_name, subcmd, new_path_name].join(' ')})
      system([CMD, path_name, subcmd, new_path_name].join(' '))
    end
  end
end
