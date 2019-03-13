class Device < ApplicationRecord
validates :serial, presence: true, uniqueness:true, length: {minimum: 5, maximum:50}
end
