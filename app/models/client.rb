class Client < ApplicationRecord
    has_many :projects
    has_many :developers, through: :projects
    has_many :users, through: :projects
end
