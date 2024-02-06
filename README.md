# README

How to run the application?
- Install rails 6
- Install ruby 2.7.2
- Do bundle install inside the folder- Change database credentials in database.yml accordingly
- Run rake db:create
- Run rake db:migrate
Now you are ready to run the apis

You have 3 apis here


API 1
- POST http://localhost:3000/api/v1/courses - This will create course and it's tutors
- Parameters format -
  {"course"=>
  { "name"=>"Thermodynamics",
    "subject"=>"Chemistry",
    "tutors_attributes"=>[
      {"first_name"=>"Ganesh", "last_name"=>"Bansode", "email"=>"ganesh@gmail.com"},
      {"first_name"=>"Guddu", "last_name"=>"Bansode", "email"=>"guddu@gmail.com"}
    ]
  }
}

API 2
- GET http://localhost:3000/api/v1/courses - This will return the list of courses with associated tutors
- Parameters format -
  {"page"=>"1"}

API 3
- POST http://localhost:3000/api/v1/tutors - This will create tutors for existing course
- Parameters format -
 {"tutor"=>
  { "course_id"=>"9",
    "first_name"=>"Rupesh",
    "last_name"=>"Pund",
    "email"=>"rupesh@gmail.com"
  }
}

Topics covered in the assignment-
- Basic rails association
- All model level validations with custom messages
- Email regex validations with custom messages
- Controller level custom validations
- Serializers
- Pagination- Added indexes wherever required
- Rspec
- Shared examples with rspec
- Efficient APIs

All the necessary test cases are added. You can run them with rspec command. 

There was no major business logic so I did not use models or separate ruby classes to store business logic.
