Shoes.app :title => "My Amazing Calculator", :width => 240, :height => 240 do
   background "#F3F".."#F90"
  stack :margin => 20 do
    @output = edit_line
    background "#F3F".."#F90"

    flow do
      %w(0 1 2 3 4 5 6 7 8 9 + / * -).each do |op|      
        button op do         
          append op
        end
      end
      
      button "=" do
        eval_expression
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
  
end
