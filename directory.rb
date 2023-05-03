# let's put all students into an array
students = [
    "The students of Villain Academy",
    "----------",
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurser Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffery Baratheon",
    "Norman Bates"
]

# and then print them
puts "The students of Villain Academy"
puts "----------"
students.each do |student|
    puts student
end
# finally, we print the total
puts "Overall, we have #{students.count} great students"