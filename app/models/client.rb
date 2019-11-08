class Client < ApplicationRecord
    has_many :projects
    has_many :developers, through: :projects
    has_many :users, through: :projects

    accepts_nested_attributes_for :projects, reject_if: proc {|attributes| attributes['name'].blank? || attributes['description'].blank?}
end
