## Write a short program that reads its own source code ##

# $0 name of the file 
# __FILE__ returns the path of the current source file

# Unlike __FILE__, $PROGRAM_NAME and $0 are real global variables, and you can change their values.
# $PROGRAM_NAME and $0 are aliases to each other, so you change the value of either one, the value 
# of the other will change accordingly.
# p $0 
# p __FILE__

# puts open(__FILE__).read

# does the same as

# puts open($0).read


# uses a code block to access the file so that we don't have to close the file explicitly.
File.open(__FILE__) do |file|
  file.each_line do |line|
    puts line
  end
end