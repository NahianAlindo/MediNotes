class DosageSearch
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = params[:date_from]
    @date_to = params[:date_to]
  end

  def scope
    Dosage.where('timestamp BETWEEN ? AND ?', @date_from, @date_to)
  end

  private
  def parsed_date(datetime_string, default)
    DateTime.parse(datetime_string)
  rescue ArgumentError, TypeConflictError
    default
  end
end