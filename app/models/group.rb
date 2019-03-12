class Group < ApplicationRecord
validates :title, presence: true, uniqueness:true
end
