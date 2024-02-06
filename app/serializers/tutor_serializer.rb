class TutorSerializer < ActiveModel::Serializer
  attributes :id, :name, :email

  def name
    self.object.first_name + " " + self.object.last_name
  end
end