class LanguageFilesSeparator
  # Initialize a new instance of LanguageFilesSeparator with the specified directory path
  #
  # @param dir [String] the path to the directory containing the text files
  # return [LanguageFilesSeparator]
  def initialize(dir_name)
    @dir_name = dir_name
  end

  # Group the text files in the directory by language and move them into subfolders
  #
  # @return [void]
  def main
    files = get_files
    groups = group_by_language(files)
    create_folders(groups)
    move_files(groups)
  end

  private

  # Get a list of all files in the directory
  #
  # @return [Array<String>] a list of file names
  def get_files
    Dir.entries(@dir_name).select { |f| f.end_with?(".txt") }
  end

  # Group the files by language
  #
  # @param files [Array<String>] a list of file names
  # @return [Hash<String, Array<String>>] a hash of language names to arrays of file names
  def group_by_language(files)
    groups = Hash.new { |h, k| h[k] = [] }
    files.each do |file|
      language = file.split("-").first
      groups[language] << file
    end
    groups
  end

  # Create a subfolder for each language if it doesn't already exist
  #
  # @param groups [Hash<String, Array<String>>] a hash of language names to arrays of file names
  # @return [void]
  def create_folders(groups)
    groups.keys.each do |language|
      Dir.mkdir("#{@dir_name}/#{language}") unless Dir.exist?("#{@dir_name}/#{language}")
    end
  end

  # Move each file into the appropriate subfolder
  #
  # @param groups [Hash<String, Array<String>>] a hash of language names to arrays of file names
  # @return [void]
  def move_files(groups)
    groups.each do |language, files|
      files.each do |file|
        File.rename("#{@dir_name}/#{file}", "#{@dir_name}/#{language}/#{file}")
      end
    end
  end
end

def help
  puts "Usage: ruby #{__FILE__} <dir>"
  puts "Groups language files in the specified directory by language and moves them into subfolders."
end

if ARGV[0] == "help"
  help
elsif ARGV.length != 1
  puts "Please specify a directory name"
else
  arg_name = ARGV[0]
  if Dir.exist?(arg_name)
    LanguageFilesSeparator.new(arg_name).main
  else
    puts "#{arg_name} is not a directory"
  end
end
