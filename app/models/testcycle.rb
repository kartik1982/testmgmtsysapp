class Testcycle < ApplicationRecord
validates :title, presence: true, uniqueness:true
has_many :reports
belongs_to :user
end
