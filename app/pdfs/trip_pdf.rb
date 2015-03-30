class TripPdf
  attr_reader :pdf, :trip

  def initialize(trip)
    @trip = trip
    @pdf = Prawn::Document.new
    trip_table
  end

  def trip_table
    pdf.text "Relatório de Viagens", size: 30, style: :bold, align: :center

    pdf.move_down(30)

    pdf.text "#{trip.description} - #{trip.humanized_value}", size: 15, style: :bold, align: :center

    pdf.move_down(30)

    trip_table = headers.concat rows

    pdf.table trip_table do |table|
      table.row(0).font_style = :bold
      table.position = :center
    end
  end

  def headers
    [['Nome', 'Saldo na viagem']]
  end

  def rows
    trip.users_trip_balance.map do |user|
      [
        user[:name], user[:balance]
      ]
    end
  end

  def render
    pdf.render
  end

  def filename
    "RelatorioViagens-#{Time.current}.pdf"
  end
end
