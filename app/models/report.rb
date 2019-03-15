class Report < ApplicationRecord
belongs_to :testsuite
belongs_to :testcase
belongs_to :project
belongs_to :release
belongs_to :testcycle
end
