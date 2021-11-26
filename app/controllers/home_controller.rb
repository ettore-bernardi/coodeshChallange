class HomeController < ApplicationController
  def index
    render json: {status: '200', message:'Back-end Challenge 2021 🏅 - Space Flight News'},status: :ok
  end
end
