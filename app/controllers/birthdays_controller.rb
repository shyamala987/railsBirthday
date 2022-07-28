class BirthdaysController < ApplicationController
  def index
    @birthdays = Birthday.all
  end

  def show
    @birthday = Birthday.find(params[:id])
  end

  def new
    @birthday = Birthday.new
  end

  def create
    @birthday = Birthday.new(name: "...", birthday: "...")

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
