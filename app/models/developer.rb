class Developer < ApplicationRecord
    has_many :projects
    has_many :clients, through: :projects

    accepts_nested_attributes_for :projects
end
