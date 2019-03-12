class ReportSerializer < ActiveModel::Serializer
  attributes :id, :release_id, :project_id, :testsuite_id, :testcase_id, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build

end
