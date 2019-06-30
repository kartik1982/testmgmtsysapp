class Testsuite < ApplicationRecord
  has_many :testcases
  belongs_to :user
  validates :title, presence: true, uniqueness:true, length: {minimum: 5, maximum:50}
  validates :description, length: {minimum: 5, maximum:100}
  validates :runmode, presence:true
  serialize :sequence, Array
end
