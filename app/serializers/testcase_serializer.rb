class TestcaseSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :runmode, :testsuite_id
end
