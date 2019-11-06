class Developer < ApplicationRecord
    has_many :projects
    has_many :clients, through: :projects
    validates :name, presence: {message: "must be filled in!"}
    validates :password, presence: :true

    accepts_nested_attributes_for :projects, reject_if: proc {|attributes| attributes['name'].blank? || attributes['description'].blank?}

    # def projects_attributes=(projects_attributes)
    #     projects_attributes.values.each do |atts|
    #         if atts[:name] !="" && atts[:description] !=""
    #             self.projects.build(atts)
    #         end
    #     end
    # end
end
