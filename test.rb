@code = []
@colors = {:r => "red", :o => "orange", :y => "yellow", :g => "green", :b => "blue", :p => "purple"}

4.times do
  @code.push(@colors.values[rand(@colors.length)])
end

p @code
