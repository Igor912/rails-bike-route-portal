class FeedbacksController < ApplicationController
  before_action :check_if_its_not_admin?, only: [:index, :show, :delete]

  def index
    @feedbacks = Feedback.all
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(permit_comment)
    if @feedback.save
      flash[:notice] = "Ваше звернення успішно надіслано! Дякуємо!"
      redirect_to bike_routes_path
    else
      flash[:alert] = @feedback.errors.full_messages
      render new_feedback_path
    end
  end

  def delete
    @feedback = Feedback.find(params[:id])
    @feedback.destroy
    redirect_to feedbacks_path
  end

  private
    def permit_comment
      params.require(:feedback).permit(:name, :email, :description)
    end

    def check_if_its_not_admin?
      if user_signed_in? && current_user.admin
        true
      else
        flash[:alert] = "У вас не має прав для доступу до даної сторінки"
        redirect_to bike_routes_path
      end
    end
end
