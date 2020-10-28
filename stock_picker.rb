require 'pry'

def stock_picker(prices)
  buy_sell = []

  # finds all possible buy-sell pairs regardless of profit or position
  prices.permutation(2) { |pair| buy_sell << pair }

  profit = buy_sell.reduce(Array.new(2, 0)) do |best_profit, current_pair|

    # checks if current buy-sell pair returns a better profit than current best profit
    if best_profit[1] - best_profit[0] < current_pair[1] - current_pair[0]

      # checks if in current buy-sell pair, the buy price comes before the sell price
      if prices.index(current_pair[0]) < prices.index(current_pair[1])
        current_pair
      else
        best_profit
      end
    else
      best_profit
    end
  end

  # returns the day on which the best profit is achieved
  [prices.index(profit[0]), prices.index(profit[1])]

end

p stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])