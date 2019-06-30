class ReportSerializer < ActiveModel::Serializer
  attributes :release_name, :project_name, :testcycle_name, :testsuite_name, :testcase_name, :start_at, :end_at, :pass, :fail, :pending, :comment, :log_path, :build, :os, :browser, :testuser, :testpassword, :testpath, :array_serial, :duration

end
