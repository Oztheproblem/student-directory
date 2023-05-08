# student-directory
The student directory script allows you to manage the list of students enrolled at VIllains Academy

```
## How to use :star2:

The provided code is a student directory program that allows the user to input student names and their corresponding cohort, display the list of students, save the list to a file, load the list from a file, and exit the program.

The StudentDirectory class initializes an empty @students array, which is used to store the students' information. It has a run method that loads the student list from a file, displays the menu, and processes the user's input.

The print_menu method prints the options available to the user. The process method takes the user's input and performs the appropriate action based on the selected option. If the user selects option 1, it calls the input_students method, which prompts the user to enter the name and cohort of each student. The add_student method adds the student's information to the @students array.

If the user selects option 2, it displays the student list by calling the show_students method. The print_header, print_student_list, and print_footer methods are responsible for printing the list in a formatted manner.

If the user selects option 3, it calls the save_students method, which writes the student list to a file in comma-separated values (CSV) format. The user is prompted to enter a filename.

If the user selects option 4, it calls the load_students_menu method, which prompts the user to enter a filename to load the student list from.

Finally, if the user selects option 9, it calls the exit_program method, which exits the program.


**Student Directory**

Providing a .csv file is optional

```shell
git clone https://github.com/Oztheproblem/student-directory.git
cd student-directory

ruby directory.rb file.csv
```

**Print File**

(filename is optional)

```shell
ruby print_file.rb filename
```
