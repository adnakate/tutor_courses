class Api::V1::CoursesController < ApplicationController
  def create
    course = Course.new(course_params)
    if course.save
      render json: { course: ActiveModelSerializers::SerializableResource.new(course) }, status: :created
    else
      render json: { errors: course.errors }, status: :unprocessable_entity
    end
  end

  def index
    courses = Course.includes(:tutors).page params[:page]
    render json: { courses: ActiveModel::Serializer::CollectionSerializer.new(courses) }, status: :ok
  end

  private

  def course_params
    params.require(:course).permit(:name, :subject,
                                   tutors_attributes: [:first_name, :last_name, :email])
  end
end