class Client < ApplicationRecord
    has_many :projects
    has_many :users, through: :projects
    validates_presence_of :name, :email

    accepts_nested_attributes_for :projects, reject_if: proc {|attributes| attributes['name'].blank? || attributes['description'].blank?}


end
