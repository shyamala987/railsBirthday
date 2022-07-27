class BirthdaysController < ApplicationController
  def index
    @birthdays = Dob.all
  end

  def show
    @birthday = Dob.find(params[:id])
  end

  def new
    @birthday = Dob.new
  end

  def create
    @birthday = Dob.new(name: "...", birthday: "...")

    if @birthday.save
      redirect_to @birthday
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def birthday_params
      params.require(:birthday).permit(:name, :birthday)
    end
end
