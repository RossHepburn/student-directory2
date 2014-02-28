@students = []

# Header
def print_header
  puts "The students of my cohort at Makers Academy".center(100)
  puts "-----------".center(100)
end

 def print_students_list
  @students.each do |student|
    puts "#{student[:first_name]} #{student[:last_name]} joined Makers Academy in the #{student[:cohort]} cohort".center(100)
  end
end

def print_footer
  puts "Overall, there are #{@students.length} great students".center(100)
end

def input_students
# get user first name
  puts "What is their first name?".center(100)
  first_name = STDIN.gets.capitalize.delete "\n"
# get user last name
  puts "What is their last name?".center(100)
  last_name = STDIN.gets.capitalize.delete "\n"
# get the cohort
  puts "What cohort are they in?".center(100)
  cohort = STDIN.gets.capitalize.delete "\n"

  first_name = "'n/a'" if first_name.empty?
  last_name = "'n/a'" if last_name.empty?
  cohort = "'n/a'" if cohort.empty?

while !first_name.empty? do 
  @students = @students || []
    add_student(first_name, last_name, cohort)
  if  @students.length > 1
    puts "Now we have #{@students.length} exceptionally talented students!!!".center(100)
  else
    puts "Now we have #{@students.length} exceptionally talented student!!!".center(100)
  end

# ask if there are students to add
    puts "Add another student yes/no".center(100)
    answer = STDIN.gets.downcase.delete "\n"
# "\n"if yes
    if answer == 'yes'
      # get user first name
  puts "What is their first name?".center(100)
  first_name = STDIN.gets.capitalize.delete "\n"
# get user last name
  puts "What is their last name?".center(100)
  last_name = STDIN.gets.capitalize.delete "\n"
# get the cohort
  puts "What cohort are they in?".center(100)
  cohort = STDIN.gets.capitalize.delete "\n"
    else
      break
    end
  end

  @students
end

def print_menu    
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save list to students.csv"
  puts "4. Load list from students.csv"
  puts "9. Exit" 
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:first_name], student[:last_name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def add_student(first_name, last_name, cohort)
  @students << {:first_name => first_name, :last_name => last_name, :cohort => cohort.to_sym}
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    first_name, last_name, cohort = line.chomp.split(',')
   add_student(first_name, last_name, cohort)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.length} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def process(selection)
  case selection
  when "1" ; input_students
  when "2" ; show_students
  when "3" ; save_students
  when "4" ; load_students
  when "9" ; exit
  else 
    puts "I don't know what you mean't, try again"
  end
 end


def interactive_menu
  loop do 
    print_menu
    process(STDIN.gets.chomp)
  end
end

# def filter
#   @students_grouped = @students.group_by {|student| student[:cohort] }

#   students_grouped.each do |cohort, students|
#     print
#   end
# end
try_load_students
interactive_menu