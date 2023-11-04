class CalculatorController < ApplicationController
  def square_new
    render({:template => "calculator_templates/square_new"})
  end
  def square_results
    @num_to_square = params.fetch("num_to_square")
    @square_num = @num_to_square.to_f ** 2
    render({:template => "calculator_templates/square_results"})
  end
  def square_root_new
    render({:template => "calculator_templates/square_root_new"})
  end
  def square_root_results
    @num_to_square_root = params.fetch("num_to_square_root")
    @square_root = @num_to_square_root.to_f ** (0.5)    
    render({:template => "calculator_templates/square_root_results"})
  end
  def random_new
    render({:template => "calculator_templates/random_new"})
  end
  def random_results
    @min_num = params.fetch("min_num")
    @max_num = params.fetch("max_num")
    @random_num = rand(@min_num.to_f..@max_num.to_f)  
    render({:template => "calculator_templates/random_results"})
  end
  def payment_new
    render({:template => "calculator_templates/payment_new"})
  end
  def payment_results
    @APR = params.fetch("APR").to_f
    @num_years = params.fetch("num_years")
    @principal = params.fetch("principal").to_f

    periods = @num_years.to_f * 12.0
    rate = (@APR / 100.0) / 12.0

    numerator = rate * @principal
    denominator = 1.0 - ((1.0 + rate) ** (-1.0 * periods))

    @payment = numerator/denominator 
    render({:template => "calculator_templates/payment_results"})
  end
end
