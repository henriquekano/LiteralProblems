#restricoes:  expoentes reais
#             componentes no formato (N)(var)
#             inexistencia de parenteses

class LiteralString < String

  def initialize(string)
    @string = string
  end

  def +(something)
    unless something.is_a?(String)
      something = something.to_s
    end

    new_part_not_included = true
    result = ""
    result_array = []
    @string.split("+|-").each_with_index do |element, i|

      parts = divide_number_variables(element)
      numeric_part = parts[0]
      alpha_part = parts[1]

      if numeric_part == nil
        numeric_part = ""
      end

      if alpha_part == nil
        alpha_part = ""
      end

      if something == alpha_part
        if numeric_part == ""
          numeric_part = "1"
        end
        numeric_part = (Float(numeric_part) + 1.0).to_s
        new_part_not_included = false
      elsif is_numeric(something) and alpha_part == ""
        numeric_part = (Float(numeric_part) + Float(something)).to_s
        new_part_not_included = false
      end

      result_array[i] = numeric_part + alpha_part
    end

    result = result_array.join("+")

    if new_part_not_included
      result = result + "+" + something
    end

    result
  end

  def *(something)
    unless something.is_a?(String)
      something = something.to_s
    end

    result = ""
    result_array = []
    @string.split("+").each_with_index do |element, i|

      parts = divide_number_variables(element)
      numeric_part = parts[0]
      alpha_part = parts[1]

      if numeric_part == nil
        numeric_part = ""
      end

      if alpha_part == nil
        alpha_part = ""
      end

      if something == alpha_part
        if numeric_part == ""
          numeric_part = "1"
        end
        numeric_part = (Float(numeric_part) + 1.0).to_s
        new_part_not_included = false
      elsif is_numeric(something) and alpha_part == ""
        numeric_part = (Float(numeric_part) + Float(something)).to_s
        new_part_not_included = false
      end

      result_array[i] = numeric_part + alpha_part
    end

    result = result_array.join("+")

    if new_part_not_included
      result = result + "+" + something
    end

    result
  end

  def /(something)
    
  end

  def -(something)
    
  end

  private
  def is_numeric(something)
    true if Float(self) rescue false  
  end

  def divide_number_variables(string)
    result = []
    parts = string.split(/([a-zA-Z\^]+[\d]+)|/) - [""]#.reject! {|string| string.empty?}# [a-zA-Z]+(\^\d+)?|
    if parts.length == 1
      if is_numeric(parts[0])
        result = [parts[0], ""]
      else
        result = ["", parts[0]]
      end
    elsif parts.length == 2
      result = parts
    else
      p "Shit Happened"
    end

    result
  end

end