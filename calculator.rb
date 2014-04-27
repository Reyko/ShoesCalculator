Shoes.app :title => "My Amazing Calculator", :width => 300, :height => 300 do
   background "#000"
   stack :margin => 80 do
    @output = edit_line
    background "#000"


     flow do
      %w(7 8 9 4 5 6 1 2 3 + 0 / * -).each do |op|      
        button op do         
          append op
        end
      end

      @special = ["=","C","x\u00B2","√","log"]

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


    @decimal = @numbers.pop.to_f


    @numbers.push(@decimal.to_s)
    
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
    @input = @square
    @output.text = @input
  end

  def log_expression
    @square = Math.log2(eval(@input))
    @input = @square
    @output.text = @input
  end

  
end
