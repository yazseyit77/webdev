class Project < ApplicationRecord
  belongs_to :developer
  belongs_to :client
  belongs_to :user

  # validates_presence_of :name, :description

  # def developer_attributes=(developer)
  #   self.developer = Developer.find_or_create_by(name: developer[:name])
  #   # self.developer.update(developer)
  # end
end
