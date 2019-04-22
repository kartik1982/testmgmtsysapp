class Project < ApplicationRecord
validates :title, presence: true, uniqueness:true
has_many :reports
belongs_to :user

has_many :release_projects
has_many :releases, through: :release_projects
end
