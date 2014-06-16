Shoes.app :title => "My Amazing Calculator" ,:width => 300, :height => 300 do
  background "#000"
  stack :margin => 80 do
    @output = edit_line
    background "#000"


    flow do
      @special = %W(7 8 9 4 5 6 1 2 3 + 0 / * - = C x\u00B2 √ log)
      @special.each do |item|
        button item do
          case item
            when "="
            eval_expression
            when "C" 
            del_expression
            when "x\u00B2" 
            pow_expression
            when "√" 
            square_root_expression
            when "log" 
            log_expression
            else
            append item
          end
        end
      end
    end   
  end
  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s + " "
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
  # Shoes.show_log
    @numbers = @input.split(" ")
    @first_number = @numbers.shift.to_f
    @numbers.unshift(@first_number)

    @last_number = @numbers.pop.to_f
    @numbers.push(@last_number.to_s)

    @input = @numbers.join
    @input = eval(@input).to_s
    @output.text = @input
  end

  def del_expression
    @input = eval(@input)
    @input = nil
    @output.text = @input
  end

  def pow_expression
    @pow = eval(@input)**2
    @input = @pow.to_s
    @output.text = @input
  end

  def square_root_expression
    @square = Math.sqrt(eval(@input))
    @input = @square.to_s
    @output.text = @input
  end

  def log_expression
    @square = Math.log2(eval(@input))
    @input = @square.to_s
    @output.text = @input
  end

  
end
