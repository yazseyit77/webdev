class Project < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :user, optional: true

  validates_presence_of :name, :description

  # def developer_attributes=(developer)
  #   self.developer = Developer.find_or_create_by(name: developer[:name])
  #   # self.developer.update(developer)
  # end
end
