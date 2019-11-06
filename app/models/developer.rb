class Developer < ApplicationRecord
    has_many :projects
    has_many :clients, through: :projects
    validates :name, presence: true
    # validates :password, presence: :true

    accepts_nested_attributes_for :projects, reject_if: proc {|attributes| attributes['name'].blank? || attributes['description'].blank?}
    
end
