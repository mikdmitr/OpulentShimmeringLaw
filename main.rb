ticketPrice=35.0
fourTicketPrice=112.0
cottonCandyPrice=1.25
curlyFriesSmallPrice=2.5
curlyFriesLargePrice=4.0
parties=Array.new #initialize array to store parties

puts "Welcome to the Coda State Fair Expense Tracker"
puts "Please provide some information:"

3.times do |i|  # iterator to input and store data for 3 parties and count other info
  puts " ";
  party= Hash.new  # initialize item for party
  puts "Please input the following for party ##{i+1}"
  puts "Number of tickets =>"
  ticketCount = gets.chomp.to_f
  if ticketCount>=4
    party[:onTicket] = ((ticketCount-(ticketCount%4))/4)*fourTicketPrice+(ticketCount%4)*ticketPrice
    party[:discount] =ticketCount*ticketPrice-party[:onTicket]
  else  
    party[:onTicket] = ticketCount*ticketPrice
    party[:discount]=0
  end
  puts "How many servings of cotton candy did they order? =>"
  cottonCandyCount = gets.chomp.to_f
  puts "How many orders of curly fries? "
  puts "Small? =>"
  curlyFriesSmallCount = gets.chomp.to_f
  puts "Large? =>"
  curlyFriesLargeCount = gets.chomp.to_f
  party[:onFood] =cottonCandyCount*cottonCandyPrice+curlyFriesSmallCount*curlyFriesSmallPrice+curlyFriesLargeCount*curlyFriesLargePrice
  parties.push(party)  
end

puts " "
puts "---"
puts " "

earned=0
concession=0
mostMoney=0
mostMoneyParty=0

puts "Summary:"

3.times do |i| # iterator to output data
  onTickets=parties[i][:onTicket]
  onFood=parties[i][:onFood]
  total=onTickets+onFood
  puts "Party #{i+1} spent a total of $#{format("%.2f", onTickets)} on tickets and $#{format("%.2f", onFood)} on food for a total of $#{format("%.2f", total)}"
  earned+=total
  concession+=onFood #parties[i][:concession]
  if total>mostMoney
    mostMoney=total
    mostMoneyParty=i+1
  end  
end 

puts " "
puts "In this session the fair earned $#{format("%.2f", earned)}"
puts "The total spent on concessions is $#{format("%.2f", concession)}"
puts "Party #{mostMoneyParty} spent the most money for a total of $#{format("%.2f", mostMoney)}"
