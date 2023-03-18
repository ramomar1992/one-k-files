# LanguageFilesSeparator

LanguageFilesSeparator is a Ruby script that groups a set of text files into subfolders based on their name. Each subfolder is named after a language it contains, and the files are moved to their respective subfolders.

## Usage

To use LanguageFilesSeparator, simply run the script from the terminal and pass in the path to the directory containing the files that you want to separate, example:

```bash

ruby language_files_separator.rb files

```

Here files is a dynamic argument that represents the directory that contiains all language files. The files will be grouped and separated inside the same directory. Each language will have a new directory named with the same language name and contain all language files which names start with the same language name.

Type `ruby language_files_separator.rb help` to get a help output.

If you did not provide a directory name, an error message will be print out to the console. If the name you specified is not a directory, an error will be print out to the console.
