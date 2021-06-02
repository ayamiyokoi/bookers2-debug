class FindersController < ApplicationController
  def finder
    @range = params[:range]
    if params[:word].present?
      @word = params[:word]
      if @range == "User"
        @users = User.looks(params[:search], params[:word])
      else
        @books = Book.looks(params[:search], params[:word])
      end
    end
  end
end