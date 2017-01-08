# README

Gradebook was an Iron Yard homework assignment in which we were tasked with building a rails application to track public school student grades that would allow parents, teachers, and students to see scores in each class. Teachers are able to create student and parent accounts (and other teachers), who may then sign up and create a password. Students can see their own grades, parents can see their students' grades, and teachers can see their students' grades.

I used polymorphic associations to handle users with different permissions. Students, teachers, and parents all have one user. User takes on a polymorphic association to each of the other three models.

I used cancancan to limit what different types of users can and can't do - these are defined in the abilities file in models.

Students have many grades, have many parents, and belongs to teacher. For simplicity's sake, we are limiting students to be able to be associated to only one teacher, and parents can only have one student.

## Running Tests
```
'$rails test' will run the test suite
```
