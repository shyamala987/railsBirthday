class BirthdaysController < ApplicationController
  before_action :require_user_authentication

  def index
    @birthdays = Birthday.all
    render json: @birthdays
  end

  def show
    @birthday = Birthday.find(params[:id])
    render json: @birthday
  end

  def new
    @birthday = Birthday.new
  end

  def create
    @birthday = Birthday.new(birthday_params)

    if @birthday.save
      render json: @birthday, status: 200
    else
      render json: { error: "Unable to create birthday" }, status: 400
    end
  end

  def edit
    @birthday = Birthday.find(params[:id])
  end

  def update
    @birthday = Birthday.find(params[:id])

    if @birthday.update(birthday_params)
      render json: @birthday, status: 200
    else
      render json: { error: "Unable to update birthday"}, status: 400
    end
  end

  def destroy
    @birthday = Birthday.find(params[:id])
    if @birthday
      @birthday.destroy
      render json: { message: "Birthday entry successfully removed!"}, status: 200
    else
      render json: { error: "Unable to delete entry :("}, status: 400
    end
  end

  private
    def birthday_params
      params.require(:birthday).permit(:name, :dob)
    end
end
