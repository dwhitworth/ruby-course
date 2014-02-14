class TaxiMeter
  attr_accessor :amount_due, :miles_driven, :start_time, :stop_time
  attr_reader :airport, :elapsed_time

  def initialize(airport: false)
    @airport = airport
    @amount_due = 0
    @miles_driven = 0

  end

  def start
    @start_time = Time.now
  end

  def stop
    @stop_time = Time.now
  end

  def amount_due
    if @miles_driven == 0 && @airport == false
      amount = 0
    elsif @miles_driven == 1.0 / 6.0 && @airport == false
      amount = 2.5
    elsif @miles_driven == 1.0 / 6.0 && @airport == true
      amount = (2.5 + 13.1)
    elsif @airport == true
      amount = ((2.5 + 2.4 * (@miles_driven - (1.0 / 6.0))) + 13.1)
    else
      amount = ((2.5 + 2.4 * (@miles_driven - (1.0 / 6.0))))
    end
    # @elapsed_time = @stop_time - @start_time
    # amount += (@elapsed_time * (29 / 60))
    return amount.round(2)

  end
end
