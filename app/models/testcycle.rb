class Testcycle < ApplicationRecord
validates :title, presence: true, uniqueness:true
belongs_to :user
has_many :project_testcycles
has_many :projects, through: :project_testcycles
end
