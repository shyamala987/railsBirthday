class BirthdaysController < ApplicationController
  def index
    @birthdays = Dob.all
  end

  def show
    @birthday = Dob.find(params[:id])
  end
end
