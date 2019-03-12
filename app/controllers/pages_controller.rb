class PagesController < ApplicationController
skip_before_action :require_user, only: [:about]
  def home

  end

  def about

  end

  def testmanagement

  end

  def testresources

  end

  def projectmanagement

  end
  def reportmanagement

  end

end
