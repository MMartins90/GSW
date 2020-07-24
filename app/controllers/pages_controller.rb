class PagesController < ApplicationController
  def home
    @job = Job.all
  end

  def about
  end
end
