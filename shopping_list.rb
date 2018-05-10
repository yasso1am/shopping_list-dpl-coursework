# create a list
# create a menu
# create a contact
# view all contacts
# delete contacts
# edit contacts
# quit list

@shoppinglist = [
  {type: 'Meat', item: 'Chicken', qty: '2lbs'},
  {type: 'Meat', item: 'Pork', qty: '1lbs'},
  {type: 'Meat', item: 'Fish', qty: '3lbs'},
  {type: 'Fruit', item: 'Apple', qty: '10'},
  {type: 'Fruit', item: 'Orange', qty: '5'},
  {type: 'Dairy', item: 'Cheddar cheese', qty: '20 slices'}
]

def menu_options
  puts "\t-----------------------------------------------"
  puts "\tThanks for keeping track of your shopping needs"
  puts "\t1) Add to the list"
  puts "\t2) See the current list"
  puts "\t3) Remove an item"
  # puts "\t4) Edit an item"
  puts "\t5) Clear the list and start over"
  puts "\t6) Exit"
  puts "\t-----------------------------------------------"
  user_selection
end

def user_selection
  user_choice = gets.strip.to_i
  case user_choice
    when 1
      add_item
    when 2
      print_list
    when 3
      remove_item
    #when 4
    #  edit_item
    when 5
      delete_list
    when 6
      exit
    else
      puts "Invalid selection, try again "
      menu_options
    end
end

def add_item
  puts "What type of item are you adding?  (eg. Meat, Fruit, Dairy)"
    user_type = gets.strip
  puts "What is the name of the item?"
    user_item = gets.strip
  puts "How much of that item do you need?"
    user_qty = gets.strip
   @shoppinglist << {type: user_type, item: user_item, qty: user_qty}
  puts "You just added #{@shoppinglist.last} to your grocery list"
  menu_options
end

def get_clean_list
  cleanlist = @shoppinglist.each_with_index do |item, index|
    list_index = index + 1
      puts "#{list_index}] #{item[:type]}: #{item[:item]} - #{item[:qty]}"
  end
end

# def edit_item
#   puts "Which item would you like to edit?"
#     get_clean_list
#       choice = gets.to_i - 1
#   puts "What element would you like to edit?"
#   puts "Enter type, item or qty"
#     @element = gets.strip
#   puts "What would you like to change it to?"
#     change = gets.strip
#       newlist = @shoppinglist.each_with_index.map {|change, index| change[:@element]}
#       @shoppinglist = newlist
#   puts @shoppinglist[choice]
#   menu_options
# end

def print_list
  puts "Here is what is currently on your list:"
  puts ""
  get_clean_list
  puts ""
  menu_options
end

def remove_item
  puts "Which of these items would you like to remove?"
  get_clean_list
    choice = gets.to_i - 1
  if choice <= @shoppinglist.length - 1
    @shoppinglist.delete_at(choice)
    puts "Item removed!"
  else
    puts "Invalid selection, try again"
    remove_item
  end
    puts "Do you want to remove another item? Y/N?"
    selection = gets.strip
    if selection == "Y" || selection == "y"
      remove_item
    else
      menu_options
    end
end

def delete_list
  puts "Are you sure you would like to delete the list? Y/N?"
  choice = gets.strip
  if choice == "Y" || choice == "y"
    @shoppinglist = []
    puts "List deleted"
  else
    puts "Returning to main menu"
    puts ""
    menu_options
  end
  menu_options
end
menu_options
