class Api::V1::TutorsController < ApplicationController
  before_action :validate_course_id, only: [:create]

  def create
    tutor = Tutor.new(tutor_params)
    if tutor.save
      render json: tutor, status: :created
    else
      render json: { errors: tutor.errors }, status: :unprocessable_entity
    end
  end

  private

  # If you do not want to go with model leves validations you can do this
  def validate_course_id
    return render json: { errors: 'Enter course id' }, status: :unprocessable_entity if !params[:tutor].present?
    course_id = params[:tutor][:course_id]
    return render json: { errors: 'Enter course id' }, status: :unprocessable_entity if !course_id.present?
    course = Course.where(id: course_id).last
    render json: { errors: 'Invalid course id' }, status: :unprocessable_entity if course.nil?
  end

  def tutor_params
    params.require(:tutor).permit(:first_name, :last_name, :email, :course_id)
  end
end
