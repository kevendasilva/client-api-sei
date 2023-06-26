class VacancyReservationsController < ApplicationController
  before_action :set_vacancy_reservation, only: %i[ show, destroy ]

  # GET /vacancy_reservations
  def show
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

  # DELETE /vacancy_reservations
  def destroy
    @vacancy_reservation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vacancy_reservation
    client_id = current_client.id
    @vacancy_reservation = VacancyReservation.find_by(client_id: client_id)
  end

  # Only allow a list of trusted parameters through.
  def vacancy_reservation_params
    params.require(:vacancy_reservation).permit(:client_id, :vacancy_id)
  end
end
