class Phone

  attr_reader :type, :number

  define_method(:initialize) do |phone_data|
    @type = phone_data[:type]
    @number = phone_data[:number]
  end

end
