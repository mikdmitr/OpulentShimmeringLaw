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
  
  #ticketCount = gets.chomp.to_f
  ticketCount=0
  notCorrectInput=true
  while notCorrectInput
    input = gets.chomp
    inputIsInteger = Integer(input) rescue false
    if inputIsInteger && (input.to_i>=0)
      notCorrectInput=false
      ticketCount=input.to_f
    else
      puts "Please enter a valid number value. It must be integer and equal or more than 0."
    end
  end

  if ticketCount>=4
    party[:onTicket] = ((ticketCount-(ticketCount%4))/4)*fourTicketPrice+(ticketCount%4)*ticketPrice
    party[:discount] =ticketCount*ticketPrice-party[:onTicket]
  else
    party[:onTicket] = ticketCount*ticketPrice
    party[:discount]=0
  end
  puts "How many servings of cotton candy did they order? =>"

  #cottonCandyCount = gets.chomp.to_f
  cottonCandyCount=0
  notCorrectInput=true
  while notCorrectInput
    input = gets.chomp
    inputIsInteger = Integer(input) rescue false
    if inputIsInteger && (input.to_i>=0)
      notCorrectInput=false
      cottonCandyCount=input.to_f
    else
      puts "Please enter a valid number value. It must be integer and equal or more than 0."
    end
  end

  puts "How many orders of curly fries? "
  puts "Small? =>"

  #curlyFriesSmallCount = gets.chomp.to_f
  curlyFriesSmallCount=0
  notCorrectInput=true
  while notCorrectInput
    input = gets.chomp
    inputIsInteger = Integer(input) rescue false
    if inputIsInteger && (input.to_i>=0)
      notCorrectInput=false
      curlyFriesSmallCount=input.to_f
    else
      puts "Please enter a valid number value. It must be integer and equal or more than 0."
    end
  end

  puts "Large? =>"

  #curlyFriesLargeCount = gets.chomp.to_f
  curlyFriesLargeCount=0
  notCorrectInput=true
  while notCorrectInput
    input = gets.chomp
    inputIsInteger = Integer(input) rescue false
    if inputIsInteger && (input.to_i>=0)
      notCorrectInput=false
      curlyFriesLargeCount=input.to_f
    else
      puts "Please enter a valid number value. It must be integer and equal or more than 0."
    end
  end

  party[:onFood] =cottonCandyCount*cottonCandyPrice+curlyFriesSmallCount*curlyFriesSmallPrice+curlyFriesLargeCount*curlyFriesLargePrice
  party[:total] = party[:onTicket]+party[:onFood] 
  parties.push(party)
end

puts " "
puts "---"
puts " "

earned=0
concession=0
mostMoney=0
mostMoneyPartyCounter=0
mostMoneyParty=Array.new #initialize array to store most cost parties

puts "Summary:"

3.times do |i| # iterator to output data
  onTickets=parties[i][:onTicket]
  onFood=parties[i][:onFood]
  total=parties[i][:total]
  puts "Party #{i+1} spent a total of $#{format("%.2f", onTickets)} on tickets and $#{format("%.2f", onFood)} on food for a total of $#{format("%.2f", total)}"
  earned+=total
  concession+=onFood #parties[i][:concession]
  if total>mostMoney
    mostMoney=total    
  end
end

3.times do |i| # iterator to output data
  if parties[i][:total]==mostMoney
    mostMoneyParty.push(i+1);  
  end
end


puts " "
puts "In this session the fair earned $#{format("%.2f", earned)}"
puts "The total spent on concessions is $#{format("%.2f", concession)}"
if mostMoneyParty.count==1
  puts "Party #{mostMoneyParty[0]} spent the most money for a total of $#{format("%.2f", mostMoney)}"
else
  print "Parties ## "
  mostMoneyParty.each do |party|
    #mostMoneyPartyCounter-=1
    print "(#{party}) "
  end
  puts "spent the most money for a total of $#{format("%.2f", mostMoney)}"
end
