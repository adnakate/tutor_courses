class Course < ApplicationRecord
  has_many :tutors
  accepts_nested_attributes_for :tutors
  validates_associated :tutors
  validates_presence_of :name, :subject,
                        message: Proc.new { |course, data| "You must provide #{data[:attribute]}" }
  paginates_per 10
end
