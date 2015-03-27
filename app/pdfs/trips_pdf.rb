class TripsPdf
  attr_reader :pdf, :trips

  def initialize(trips)
    @trips = trips
    @pdf = Prawn::Document.new
    trip_items
  end

  def trip_items
    pdf.text "Relatório de Viagens", size: 30, style: :bold, align: :center

    pdf.move_down(30)

    trips_table = headers.concat rows

    pdf.table trips_table do |table|
      table.row(0).font_style = :bold
      table.position = :center
    end
  end

  def headers
    [['Descrição', 'Valor', 'Usuários']]
  end

  def rows
    trips.map do |trip|
      [
        trip.description,
        trip.humanized_value,
        trip.users_names.map do |name|
          [
            name
          ]
        end
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
