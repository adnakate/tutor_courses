class AddIndexesToTutorsEmailCourseId < ActiveRecord::Migration[6.0]
  def change
    add_index :tutors, :email
    add_index :tutors, :course_id
  end
end
