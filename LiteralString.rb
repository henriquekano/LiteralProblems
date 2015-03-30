#restricoes:  expoentes reais positivos
#             componentes no formato (N)(var)
#             inexistencia de parenteses
#             parcelas "atomicas"

class LiteralString < String

  def initialize(string)
    @hash = {}

    string.sub(/-/, "+-").split("+").each_with_index do |element, i|
      parts = divide_number_variables(element)
      @hash[parts[1]] = Float(parts[0])
    end

  end

  def to_s
    string = ""

    @hash.each_with_index do |(key, value), index|
      unless index == 0 or value < 0
        string += "+"
      end

      unless value == 0
        if value == 1
          string += key.to_s
        else
          string += value.to_s + key.to_s
        end
      end
    end

    if string == ""
      string = "0"
    end



    string
  end

  def hash
    @hash
  end

  def +(something)
    unless something.is_a?(String)
      something = something.to_s
    end

    parts = divide_number_variables(something)
    numeric_part = parts[0]
    alpha_part = parts[1]

    if @hash[alpha_part] != nil
      @hash[alpha_part] += Float(numeric_part)
    else
      @hash[alpha_part] = Float(numeric_part)
    end

    self
  end

  def *(something)
  end

  def /(something)
    
  end

  def -(something)
    unless something.is_a?(String)
      something = something.to_s
    end

    parts = divide_number_variables(something)
    numeric_part = parts[0]
    alpha_part = parts[1]

    if @hash[alpha_part] != nil
      @hash[alpha_part] -= Float(numeric_part)
    else
      @hash[alpha_part] = Float(numeric_part)
    end

    self
  end

  private
  def is_numeric(something)
    true if Float(something) rescue false  
  end

  def divide_number_variables(string)
    parts = []
    numeric_part = string.match(/((?!\^)(-)?\d+(\.\d+)?)/)#.reject! {|string| string.empty?}# [a-zA-Z]+(\^\d+)?|
    variable_part = string.match(/[a-zA-Z]+(\^)?\d*/)

    if numeric_part
      parts << numeric_part[0]
    else
      parts << nil
    end

    if variable_part
      parts << variable_part[0]
    else
      parts << nil
    end

    if parts[0] == nil
      parts[0] = "1"
    elsif parts[1] == nil
      parts[1] = ""
    end
    p parts
    parts
  end

end


test = LiteralString.new("a^2")+"a"
p test.to_s