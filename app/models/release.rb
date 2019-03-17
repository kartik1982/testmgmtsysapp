class Release <ApplicationRecord
has_many :reports
belongs_to :user
validates :title, presence: true, uniqueness:true
end
