def interactive_menu
    students = []
    loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit # this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
      end
    end
end






def input_students
    puts "Please enter the name of the student:"
    puts "(To finish, just hit return twice)"
    # create an empty array
    students = []
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    # get the first name
    name = gets.gsub(/\n/, "")
    puts "What cohort is this student in:"
    cohort = gets.gsub(/\n/, "").downcase.to_sym
    cohort = :november if cohort == :""
    # if the cohort inputted does not match any of the months in the months array then 
    # this until loop will keep asking for the cohort until a valid month is entered. (Typos)
    until months.include?(cohort)
        puts "The cohort month you entered was invalid please try again, do not use abbreviations:"
        cohort = gets.gsub(/\n/, "").downcase.to_sym
    end
    # while the name is not empty, repeat this code
    while !name.empty? do
     
        cohort = :november if cohort == :""
      
        students << {name: name, cohort: cohort, hobbies: :reading, country: :UK, height: :tall}
        @s_count = students.length
        if @s_count > 1
          puts "Now we have #{@s_count} students"
        elsif @s_count == 1 
          puts "Now we have #{@s_count} student"
        end
        
        puts "Please enter the name of the next student:"
        puts "(To finish, just hit return twice)"
        name = gets.gsub(/\n/, "")

        puts "What cohort is this student in:" if name != ""
        cohort = gets.gsub(/\n/, "").downcase.to_sym  
    end
    students
end

def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
end

# added a new argument letter with a default value of nil, so if no letter is entered the 
# entire array will be intact
def print(students)
    if @s_count == 0
        return
    end
      counter = 0
      while counter < students.count
        puts "#{counter+1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(100)
      counter += 1
     end
end

# Prints the students grouped by cohort using the group_by method.
def print_cohorts(students)
    students = students.group_by {|hash| hash[:cohort]}.values
    students.each do |student|
      student.each_with_index do |stu, index|
        puts "#{index +1}. #{stu[:name]} (#{stu[:cohort]} cohort)".center(100)
      end
    end
end


# added an if statement to pluralise "student" if the name count was greater than 1 
def print_footer(names)
    if @s_count == 0
        return
    end
    if names.count > 1
      puts "Overall, we have #{names.count} great students".center(100)
    elsif names.count == 1 
      puts "Overall, we have #{names.count} great student".center(100)
    end
end


# nothing happends until we call the methods
interactive_menu