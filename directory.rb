# Let's put all students into an array
def input_students
    puts "Please enter the name of the student:"
    puts "(To finish, just hit return twice)"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    puts "What cohort is this student in:"
    cohort = gets.chomp.downcase.to_sym
    # while the name is not empty, repeat this code
    while !name.empty? do
        # this line says that if cohort is equal to a blank string that's been converted to a symbol
        # then the default value for cohort will be set to :november
        cohort = :november if cohort == :""
        # add the student hash to the array
        # added more information hobbies, country and height
        students << {name: name, cohort: cohort, hobbies: :reading, country: :UK, height: :tall}
        puts "Now we have #{students.count} students"
        # get another name from the user
        puts "Please enter the name of the next student:"
        puts "(To finish, just hit return twice)"
        name = gets.chomp
        # stops the program for asking for the cohort if the name field is blank
        puts "What cohort is this student in:" if name != ""
        cohort = gets.chomp.downcase.to_sym  
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy".center(100)
    puts "-------------".center(100)
end

# added a new argument letter with a default value of nil, so if no letter is entered the 
# entire array will be intact
def print(students, letter = nil) 
    # Only prints out the students whose names are shorter than 12 characters
    students.select { |student| student[:name].length < 12 }
    
    # gets the letter from the user
    puts "Do you want to print out the students beginning with a certain letter?".center(100)
    puts "If so input that letter now followed by return, if not just press return:".center(100)
    
    letter = gets.chomp
    
    # takes the student array and runs the select method on it then passes it a block that
    # targets the starting letter of the students name [:name] and only selects the elements that
    # are true and stores them in array form.
    students.select! { |student| student[:name].start_with?(letter) }
    # modified the students method to allow it to print a number before each of each student
    # used each_with_index to call a block with two arguments for each item in the enum.
    # The "+1" next to index in the string interpolation is to make the iteration start at 1 instead of 0.
    students.each_with_index do |student, index|
    puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
    
end

# added an if statement to pluralise "student" if the name count was greater than 1 
def print_footer(names)
    if names.count > 1
      puts "Overall, we have #{names.count} great students".center(100)
    elsif names.count == 1 
      puts "Overall, we have #{names.count} great student".center(100)
    end
end

students = input_students
# nothing happends until we call the methods
print_header
print(students)
print_footer(students)