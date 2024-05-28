class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    if input.start_with?('//')
      delimiter = input[2]
      input = input[4..-1]
    else
      delimiter = /,|\n/
    end

    numbers = input.split(delimiter).map(&:to_i)
    negatives = numbers.select { |n| n < 0 }
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.sum
  end
end
