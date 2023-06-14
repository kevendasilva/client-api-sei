class VacancyReservationsController < ApplicationController
  before_action :set_vacancy_reservation, only: %i[ show destroy ]
  before_action :authenticate_client!

  # GET /vacancy_reservations/1
  def show 
    @vacancy_reservation = VacancyReservation.find_by(client_id: params[:client_id])

    if @vacancy_reservation
      render json: @vacancy_reservation
    else
      render json: { error: 'Vacancy Reservation not found' }, status: :not_found
    end
  end

  # POST /vacancy_reservations
  def create
    @vacancy_reservation = VacancyReservation.new(vacancy_reservation_params)

    if @vacancy_reservation.save
      render json: @vacancy_reservation, status: :created, location: @vacancy_reservation
    else
      render json: @vacancy_reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vacancy_reservations/1
  def destroy
    @vacancy_reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vacancy_reservation
    @vacancy_reservation = VacancyReservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def vacancy_reservation_params
    params.require(:vacancy_reservation).permit(:client_id, :vacancy_id)
  end
end
