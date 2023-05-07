class StudentDirectory
  def initialize
    @students = []
  end

  def run
    load_students("students.csv")
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to a file"
    puts "4. Load the list from a file"
    puts "9. Exit"
  end

  def process(selection)
    case selection
    when "1"
      input_students
      puts "Students successfully added."
    when "2"
      show_students
      puts "Student list displayed."
    when "3"
      save_students
    when "4"
      load_students_menu
    when "9"
      exit_program
    else
      puts "I don't know what you meant, try again"
    end
  end
  
  def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty?
      puts "Please enter the cohort of the student"
      cohort = STDIN.gets.chomp
      add_student(name, cohort)
      puts "Now we have #{student_count} student#{'s' if student_count > 1}"
      name = STDIN.gets.chomp
    end
  end

  def add_student(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
  end

  def show_students
    print_header
    print_student_list
    print_footer
  end

  def print_header
    puts "The students of Villains Academy"
    puts "-------------"
  end

  def print_student_list
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end

  def print_footer
    puts "Overall, we have #{student_count} great student#{'s' if student_count > 1}"
  end

  def student_count
    @students.count
  end

  def load_students(filename)
    if File.exist?(filename)
      File.foreach(filename) do |line|
        name, cohort = line.chomp.split(",")
        add_student(name, cohort)
      end
      puts "Loaded #{student_count} students from #{filename}"
    else
      puts "Sorry, #{filename} doesn't exist."
    end
  end

  def save_students
    puts "Enter filename to save:"
    filename = STDIN.gets.chomp
    file = File.open(filename, "w")
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
    puts "Saved #{student_count} student#{'s' if student_count > 1}"
  end
  
  def exit_program
    puts "Goodbye!"
    exit
  end
end

StudentDirectory.new.run

=begin 
# My code before in class
@students = [] # an empty array accessible to all methods

def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    add_students(name, :november)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items  
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "9"
    exit # this will cause the program to terminate
  when "3"
    save_students
  when "4"
    load_students
  else
    puts "I don't know what you meant, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
  add_students(name, cohort)
  end
  file.close
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

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def try_load_students
  filename = ARGV.first || "students.csv" # default incase no input
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

try_load_students
interactive_menu
=end

=begin 
#prior expected students put in hashes
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end