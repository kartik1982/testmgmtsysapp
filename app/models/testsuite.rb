class Testsuite < ApplicationRecord
  has_many :testcases
  has_many :reports
  validates :title, presence: true, uniqueness:true, length: {minimum: 5, maximum:50}
  validates :description, length: {minimum: 5, maximum:100}
  validates :runmode, presence:true
end
