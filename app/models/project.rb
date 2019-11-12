class Project < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :user, optional: true

  validates_presence_of :name, :description

  def self.by_client(client_id)
    where(client: client_id)
  end
end
