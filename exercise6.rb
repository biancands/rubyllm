class Numeric
  @@currencies = {
    'dollar' => 1.0, 'dollars' => 1.0,
    'euro' => 1.292, 'euros' => 1.292,
    'rupee' => 0.019, 'rupees' => 0.019,
    'yen' => 0.013, 'yens' => 0.013
  }

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      super
    end
  end
end

# Example usage
puts 5.dollars.in(:euros) # => 3.870967741935484
puts 10.euros.in(:rupees) # => 680.0
puts 50.dollar.in(:yen)    # => 3846.153846153846
puts 100.yen.in(:dollars) # => 1.3