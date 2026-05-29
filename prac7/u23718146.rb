class GameCharacter
  attr_reader :health

  def initialize(health)
    @health = health
  end

  # Default attack (shared fallback)
  def attack
    1
  end

  # Must be overridden in subclasses
  def takeHit(damage)
    raise NotImplementedError, "takeHit must be implemented in subclass"
  end
end


class Wizard < GameCharacter
  def initialize(health, spellDamage)
    super(health)
    @spellDamage = spellDamage
  end

  def attack
    @spellDamage
  end

  def takeHit(damage)
    # instantly dies on any hit
    @health = 0
    false
  end
end


class Warrior < GameCharacter
  def initialize(health, shield)
    super(health)
    @shield = shield
  end

  def takeHit(damage)
    effective_damage = damage - @shield
    effective_damage = 0 if effective_damage < 0

    @health -= effective_damage

    if @health <= 0
      @health = 0
      false
    else
      true
    end
  end
end


# ----------------------------
# Battle Simulation
# ----------------------------

characters = []

# Input Character 1
print "Enter a wizard (1) or a warrior (2): "
type1 = gets.to_i

if type1 == 1
  print "Enter health: "
  h = gets.to_i
  print "Enter spell damage: "
  d = gets.to_i
  characters << Wizard.new(h, d)
else
  print "Enter health: "
  h = gets.to_i
  print "Enter shield strength: "
  s = gets.to_i
  characters << Warrior.new(h, s)
end

# Input Character 2
print "Enter a wizard (1) or a warrior (2): "
type2 = gets.to_i

if type2 == 1
  print "Enter health: "
  h = gets.to_i
  print "Enter spell damage: "
  d = gets.to_i
  characters << Wizard.new(h, d)
else
  print "Enter health: "
  h = gets.to_i
  print "Enter shield strength: "
  s = gets.to_i
  characters << Warrior.new(h, s)
end

puts "\nThe battle begins!"

attacker = 0
defender = 1

# Battle loop
loop do
  damage = characters[attacker].attack

  puts "Character #{attacker + 1} attacks for #{damage} damage"

  alive = characters[defender].takeHit(damage)

  puts "Character #{defender + 1} has #{characters[defender].health} health points left"

  unless alive
    puts "Character #{defender + 1} died"
    puts "Character #{attacker + 1} wins"
    break
  end

  # swap roles
  attacker, defender = defender, attacker
end