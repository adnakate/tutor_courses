require 'rails_helper'

RSpec.describe "Api::V1::Courses", type: :request do
  describe 'successfully creates a course' do
    subject(:perform) do
      post '/api/v1/courses', params: {
        course: {
          name: "calculus",
          subject: "science"
        }
      }
    end
    include_examples 'creates a new object', Course
  end

  describe 'successfully creates a course with tutor' do
    subject(:perform) do
      post '/api/v1/courses', params: {
        course: {
          name: "calculus",
          subject: "science",
          tutors_attributes: [ { first_name: "Ganesh", last_name: "Bansode", email: "ganesh@gmail.com"} ]
        }
      }
    end
    include_examples 'creates a new object', Course
    include_examples 'creates a new object', Tutor
  end

  describe 'check errors' do
    it "should return course model errors" do
      post '/api/v1/courses', params: {
        course: {
          name: "",
          subject: ""
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return tutor model errors" do
      post '/api/v1/courses', params: {
        course: {
          name: "calculus",
          subject: "science",
          tutors_attributes: [ { first_name: "", last_name: ""} ]
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return invalid email error" do
      post '/api/v1/courses', params: {
        course: {
          name: "calculus",
          subject: "science",
          tutors_attributes: [ { first_name: "Abhijit", last_name: "Nakate", email: '123'} ]
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should not allow tutor to take more than one course" do
      course = FactoryBot.create :course
      tutor = FactoryBot.create(:tutor, email: 'myemail1@gmail.com', course: course)
      post '/api/v1/courses', params: {
        course: {
          name: "calculus",
          subject: "science",
          tutors_attributes: [ { first_name: "Abhijit", last_name: "Nakate", email: 'myemail1@gmail.com'} ]
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe 'list courses' do
    before(:each) do 
      course = FactoryBot.create :course
      course_1 = FactoryBot.create :course
    end
    
    it "should return list of courses" do
      get '/api/v1/courses', params: {
        page: 1
      }
      expect(response).to have_http_status :ok
    end
  end
end