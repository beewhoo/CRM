class Contact

  @@list =[]
  @@id = 1


  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id +=1
  end

  #getters
  def first
    @first_name
  end

  def last
    @last_name
  end

  def email
    @email
  end

  def note
    @note
  end

  def id
    @id
  end

  #setters

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  def first_name=(first_name)
    @first_name = first_name
  end


  def last_name=(last_name)
    @last_name = last_name
  end

  # store the newly created contact, and then return it
  def self.create(first_name,last_name,email,note)
    new_contact = self.new(first_name,last_name,email,note)
    new_contact.add
    new_contact

  end

  # This method should return all of the existing contacts
  def self.all
    @@list
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(num)
    @@list.each do |name|
      if name.id == num
      return name
      end
    end
  end
  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact

  def update(user_attribute, user_change)

  case user_attribute
    when "first name"
      then self.first_name= user_change.to_s
    when "last name"
      then self.last_name = user_change.to_s
    when "email"
      then self.email = user_change.to_s
    when "note"
      then self.note = user_change.to_s
    end
  end


  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(value)
    @@list.each do |contact|
      if contact.first == value
       return contact
     elsif contact.last == value
       return contact
     elsif contact.email == value
       return contact
     elsif contact.id == value
       return contact
      end
    end
  else 'No matches found'
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@list.clear
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(id_del)
    @@list.delete(id_del)
  end

  #add to list

  def add
    @@list << self
  end



end



p'----------------------------------------Add contact--------------------------------------'
  Contact.create('Bibek', 'Thapa', 'bst_bib@hotmail.com', 'loves Barca FC')
  Contact.create('Malik', 'Chabou', 'malik_chabou@hotmail.com', 'loves EDM')
  Contact.create('Shahzeen', 'Jiwani', 'Shahzeen.jiwani@gmai.com', 'loves Food')
