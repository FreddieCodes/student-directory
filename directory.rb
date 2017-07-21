@students = []  # an emppty array accesible to all methods

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
    loop do
    print_menu
    process(STDIN.gets.chomp)
    end
end

def process(selection)
    case selection
      when "1"
        students = input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit # causes the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
end


def input_students
    puts "Please enter the name of the student:"
    puts "(To finish, just hit return twice)"
    @students = []
    months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    # get the first name
    name = STDIN.gets.gsub(/\n/, "")
    puts "What cohort is this student in:"
    cohort = STDIN.gets.gsub(/\n/, "").downcase.to_sym
    cohort = :november if cohort == :""
    # if the cohort inputted does not match any of the months in the months array then 
    # this until loop will keep asking for the cohort until a valid month is entered. (Typos)
    until months.include?(cohort)
        puts "The cohort month you entered was invalid please try again, do not use abbreviations:"
        cohort = STDIN.gets.gsub(/\n/, "").downcase.to_sym
    end
 
    while !name.empty? do
        cohort = :november if cohort == :""
      
        @students << {name: name, cohort: cohort}
        if @students.count > 1
          puts "Now we have #{@students.count} students"
        elsif @students.count == 1 
          puts "Now we have #{@students.count} student"
        end
        
        puts "Please enter the name of the next student:"
        puts "(To finish, just hit return twice)"
        name = gets.gsub(/\n/, "")

        puts "What cohort is this student in:" if name != ""
        cohort = gets.gsub(/\n/, "").downcase.to_sym  
    end
end


def show_students
    print_header
    print_student_list
    print_footer
end



def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
end


def print_student_list
    @students.each_with_index do |student, index|
      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
end

def print_footer
    puts "Overall, we have #{@students.count} great students".center(100)
end

def save_students
    # open the file for writing
    file = File.open("students.csv", "w")
    # iterate over the array of students
    @students.each do |student|
        student_data = [student[:name], student[:cohort]]
        csv_line = student_data.join(",")
        file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
        name, cohort = line.chomp.split(",")
        @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

def try_load_students
    filename = ARGV.first #first argument from the command line
    return if filename.nil? # get out of methof if it isn't given
    if File.exists?(filename) # if it exists
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else # if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit # quit the program
    end
end
        
    


# nothing happends until we call the method
try_load_students
interactive_menu







