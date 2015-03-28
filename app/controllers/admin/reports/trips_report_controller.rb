class Admin::Reports::TripsReportController < ApplicationController
  def index
    authorize! :read, Trip

    @trips = Trip.all.decorate
  end

  def show
    authorize! :read, Trip
    @trip = Trip.find(params[:id]).decorate

    respond_to do |format|
      format.html
      format.pdf do
        pdf = TripPdf.new(@trip)
        send_data pdf.render, filename: pdf.filename, type: 'application/pdf'
      end
    end
  end
end
