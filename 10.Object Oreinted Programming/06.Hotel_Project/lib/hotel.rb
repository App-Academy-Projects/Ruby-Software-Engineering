require_relative "room"

class Hotel
  def initialize(name, names_hash)
    @name = name
    @rooms = {}
    names_hash.keys.each do |k| 
        room = Room.new(names_hash[k])
        @rooms[k] = room
    end
  end

  def name
    cap_name = @name.split.map { |n| n.capitalize}
    cap_name.join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    if rooms.keys.include?(room)
        return true
    end
    return false
  end

  def check_in(person, room)
    if !room_exists?(room)
        puts 'sorry, room does not exist'
    else
        room_ins = rooms[room]
        if room_ins.add_occupant(person)
            puts 'check in successful'
        else
            puts 'sorry, room is full'
        end
    end
  end
end
