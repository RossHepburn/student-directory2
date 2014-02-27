def interactive_menu
 students = []
 loop do 
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
  selection = gets.chomp
  case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else 
    puts "I don't know what you mean't, try again"
  end
 end
end


def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp.capitalize
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {:name => name, :cohort => :February}    
    puts "Now we have #{students.length} students"
    # get another name from the user
    name = gets.chomp.capitalize
  end
  # return the array of students
  students
end

def print_footer(students)
  puts "Overall, we have #{students.length} great students"
end

students = interactive_menu
  if !students.empty?
    print_header
    print(students)
    print_footer(students)
  else
    puts "No students entered"
end