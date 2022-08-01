class BirthdaysController < ApplicationController
  before_action :require_user_authentication

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
    @birthday = Birthday.new(birthday_params)

    if @birthday.save
      redirect_to @birthday
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @birthday = Birthday.find(params[:id])
  end

  def update
    @birthday = Birthday.find(params[:id])

    if @birthday.update(birthday_params)
      redirect_to @birthday
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @birthday = Birthday.find(params[:id])
    @birthday.destroy

    redirect_to birthdays_path, status: :see_other
  end

  private
    def birthday_params
      params.require(:birthday).permit(:name, :dob)
    end
end
