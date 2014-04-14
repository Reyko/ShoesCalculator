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
      
      button "=" do
        eval_expression
      end

      button "C" do
        del_expression
      end
    end
    
  end
  
  # Stick a string on the end of our input
  #
  def append(s)
    if @input.nil?
      @input = ""
    end
    @input += s
    @output.text = @input
  end
  
  # Evaluate the input we've got so far
  #
  def eval_expression
    @input = eval(@input).to_s
    @output.text = @input
  end

  def del_expression
   
    @input = eval(@input)
    @input = nil
    @output.text = @input
    

  end
  
end
