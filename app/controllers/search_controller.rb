class SearchController < ApplicationController
  def parkings
    parkings = ParkingRead.all

    render json: parkings, status: :ok
  end

  def vacancies
    vacancies = VacancyRead.where(parking_id: vacancies_params[:parking_id])
  
    render json: vacancies, status: :ok
  end

  private

  def vacancies_params
    params.permit(:parking_id)
  end
end
