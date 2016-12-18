class InvoiceSearch
  attr_reader :date_from, :date_to

  def initialize(params)
    params ||= {}
    @date_from = parse_date(params[:from], 7.days.ago.to_date.to_s)
    @date_to = parse_date(params[:to], Date.today.to_s)
  end

  def scope
    Invoice.where('date BETWEEN ? AND ?', @date_from, @date_to)
  end

  def parse_date(date_string,default)
  	Date.parse(date_string)
  	rescue ArgumentError, TypeError
  	default
  end

end