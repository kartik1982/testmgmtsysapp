class Testcase < ApplicationRecord
  belongs_to :testsuite
  belongs_to :user
  has_many :reports
  validates :title, presence: true, uniqueness:true, length: {minimum: 5, maximum:250}
  validates :description, length: {minimum: 5, maximum:100}
  validates :runmode, presence:true
end
