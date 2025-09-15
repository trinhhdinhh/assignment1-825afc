class PhoneBook
  def initialize
    # Store entries as a hash where key is name, value is [number, is_listed]
    @entries = {}
    # Keep track of which numbers are currently listed (only one listing allowed per number)
    @listed_numbers = []
  end
  
  def add(name, number, is_listed)
    # Check if person already exists
    return false if @entries.key?(name)
    
    # Validate phone number format (NNN-NNN-NNNN)
    if number.length != 12
      return false
    end
    
    parts = number.split('-')
    if parts.length != 3
      return false
    end
    
    if parts[0].length != 3 || parts[1].length != 3 || parts[2].length != 4
      return false
    end
    
    parts.each do |part|
      part.each_char do |char|
        if char < '0' || char > '9'
          return false
        end
      end
    end
    
    if number[0] == '0'
      return false
    end
    
    # Check if we're trying to list a number that's already listed
    if is_listed && @listed_numbers.include?(number)
      return false
    end
    
    # Add the entry
    @entries[name] = [number, is_listed]
    
    # If this entry is listed, track the number
    if is_listed
      @listed_numbers << number
    end
    
    true
  end
  
  def lookup(name)
    # Return phone number only if person exists and is listed
    if @entries.key?(name)
      number, is_listed = @entries[name]
      return number if is_listed
    end
    nil
  end
  
  def lookupByNum(num)
    # Find the name associated with this number, but only if it's listed
    @entries.each do |name, (number, is_listed)|
      if number == num && is_listed
        return name
      end
    end
    nil
  end
  
  def namesByAc(areacode)
    # Return all names (listed and unlisted) with numbers starting with the area code
    names = []
    @entries.each do |name, (number, is_listed)|
      if number.start_with?(areacode + "-")
        names << name
      end
    end
    names
  end
end