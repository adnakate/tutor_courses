class Tutor < ApplicationRecord
  belongs_to :course
  validates_uniqueness_of :email, message: TUTOR_MESSAGE
  validates_presence_of :first_name, :last_name, :email,
                        message: Proc.new { |tutor, data| "You must provide #{data[:attribute]}" }
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: INVALID_EMAIL
end
