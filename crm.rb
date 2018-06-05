require_relative 'contact'

class Crm

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user = gets.chomp.to_i
      call_option(user)
    end
  end

  def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify and existing contact'
      puts '[3] Delete a new contact'
      puts '[4] Display all contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'

  end

  def call_option(user)
    case user
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then exit
  end

  end

  def add_new_contact
    p 'Enter First name:'
    first_name = gets.chomp

    p 'Enter Last name:'
    last_name = gets.chomp

    p 'Enter Email:'
    email = gets.chomp

    p 'Enter Note:'
    note = gets.chomp

    Contact.create(first_name,last_name, email, note)
  end

  def modify_existing_contact
    p 'Enter ID:'
    user_id = gets.chomp.to_i
    p 'What do you want to change(first name, last name, email, notes):'
    user_attribute = gets.chomp
    p "Enter new #{user_attribute}"
    user_change = gets.chomp.to_s

    edit = Contact.find(user_id)

    p edit.update(user_attribute, user_change)

    p  "Sucess! Your #{user_attribute} has been changed."


  end

  def delete_contact
    p 'Enter ID:'
    user_id = gets.chomp.to_i
    p contact = Contact.find(user_id)
    p contact.delete
  end

  def display_all_contacts
     p Contact.all

  end

  def search_by_attribute
    p 'Specify search method (firstname, lastname, email, id):'
    search1 = gets.chomp
    p "Enter #{search1}"
    search2 = gets.chomp.to_s
    p Contact.find_by(search2)
  end


end

at_exit do
  ActiveRecord::Base.connection.close
end
