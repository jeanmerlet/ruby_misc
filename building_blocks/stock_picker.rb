def stock_picker(stock_prices)
  days = (0..(stock_prices.length-1)).to_a
  stock_by_day = Hash[days.zip(stock_prices)]

  profit = []

  days.length.times do |i|
    day_profit = []
    (days.length - i).times do |j|
      day_profit[j] = [i, j+i, stock_by_day[j+i] - stock_by_day[i]]
    end
    profit[i] = day_profit
  end
  
  profit.flatten!(1)
  best_days = profit.max_by { |x| x[2] }

  puts "[#{best_days[0]},#{best_days[1]}]"
end
