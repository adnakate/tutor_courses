require 'rails_helper'

RSpec.describe "Api::V1::Tutors", type: :request do
  before(:each) do 
    @course = create_fake_course
  end

  describe 'successfully creates a tutor' do
    subject(:perform) do
      post '/api/v1/tutors', params: {
        tutor: {
          first_name: "first",
          last_name: "last",
          email: 'myemail2@gmail.com',
          course_id: @course.id
        }
      }
    end
    include_examples 'creates a new object', Tutor
  end

  describe 'check errors' do
    it "should return tutor model errors" do
      post '/api/v1/tutors', params: {
        tutor: {
          first_name: "",
          last_name: "",
          email: ""
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return invalid email error" do
      post '/api/v1/tutors', params: {
        tutor: {
          course_id: @course.id,
          first_name: "Abhijit",
          last_name: "Nakate",
          email: "123"
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should not allow tutor to take more than one course" do
      tutor = create_fake_tutor
      post '/api/v1/tutors', params: {
        tutor: {
          course_id: @course.id,
          first_name: "Abhijit",
          last_name: "Nakate",
          email: "myemail3@gmail.com"
        }
      }
      expect(response).to have_http_status :unprocessable_entity
    end
  end


end

def create_fake_course
  FactoryBot.create :course
end

def create_fake_tutor
  FactoryBot.create(:tutor, email: 'myemail3@gmail.com', course: @course)
end
