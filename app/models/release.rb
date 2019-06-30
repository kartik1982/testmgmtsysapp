class Release <ApplicationRecord
belongs_to :user
validates :title, presence: true, uniqueness:true

has_many :release_projects
has_many :projects, through: :release_projects
end
