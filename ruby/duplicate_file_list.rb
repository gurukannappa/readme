# running the program
# ruby duplicate_file_list.rb ~/Documents/Pictures
if ARGV.length > 0
  search_directory = ARGV[0]
  Dir.chdir(search_directory)
  file_list = Dir.glob("**/*")

  unique_files = {}

  file_list.each do |file_path|
    file_name = file_path.split("/").last
    unique_files[file_name] ||= []
    unique_files[file_name] << file_path
  end

  unique_files.each do |file_name, paths|
    if paths.count > 1
      puts "*" * 10 + " #{file_name} " + "*" * 10
      paths.each do |path|
        puts "PATH: #{path}"
      end
    end
  end
else
  puts "pass folder path as input"
end
