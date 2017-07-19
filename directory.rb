# Let's put all students into an array
def input_students
    puts "Please enter the name of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # add the student hash to the array
        students << {name: name, cohort: :november}
        puts "Now we have #{students.count} students"
        # get another name from the user
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

# modified the students method to allow it to print a number before each of each student
# used each_with_index to call a block with two arguments for each item in the enum.
# The "+1" next to index in the string interpolation is to make the iteration start at 1 instead of 0.
def print(students)
    students.each_with_index do |student, index|
      puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
end

def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

students = input_students
# nothing happends until we call the methods
print_header
print(students)
print_footer(students)