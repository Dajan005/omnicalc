class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.delete(" ").length

    @word_count = @text.split.size

    @occurrences = @text.scan(@special_word).size

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("word_count.html.erb")
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

@i=(@apr/100)/12
@n=@years*12
@d=(((1+@i)**@n)-1)/(@i*((1+@i)**@n))

    @monthly_payment = @principal/@d

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment.html.erb")
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending - @starting
    @minutes = (@ending - @starting)/60
    @hours = (@ending - @starting)/3600
    @days = (@ending - @starting)/86400
    @weeks = (@ending - @starting)/604800
    @years = (@ending - @starting)/31557600


    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("time_between.html.erb")
  end

  def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.length

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum - @minimum

    @median = ((@sorted_numbers[(@sorted_numbers.count - 1) / 2] + @sorted_numbers[@sorted_numbers.count / 2]) / 2.0)

    @sum = @numbers.sum

    @mean = (@numbers.inject(0.0) {|s,x| s + x}) / @count

    @variance = @numbers.inject(0.0) {|s,x| s + (x - @mean)**2} / @count


    @standard_deviation = @variance**0.5

    @mode = @numbers.uniq.max_by{ |i| @numbers.count( i ) }

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("descriptive_statistics.html.erb")
  end
end
