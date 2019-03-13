class Release <ApplicationRecord
has_many :reports
validates :title, presence: true, uniqueness:true
end
