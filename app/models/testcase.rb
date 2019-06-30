class Testcase < ApplicationRecord
  belongs_to :testsuite
  belongs_to :user
  validates :testpath, presence: true, uniqueness:true
  validates :title, presence: true, length: {minimum: 5, maximum:250}
  validates :description, length: {minimum: 5, maximum:250}
  validates :runmode, presence:true
end
