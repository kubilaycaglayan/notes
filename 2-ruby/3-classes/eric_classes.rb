class Viking
  attr_accessor :name
  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
  end
  class << self
    def random_name
      [
        'Başkan', 'Erol', 'Yavuz Gökbay', 'Erdinç', 
        'Semih', 'Şimşek', 'Güvenlik', 'Ekşi Sözlük',
        'Milliyet Gazetesi', 'İslamcılar', 'Derya'
      ].sample
    end

    def create_warrior(name)
      age = rand * 20 + 15
      health = [age * 5, 120].min.round
      strength = [age / 2, 10].min
      Viking.new(name, health, age, strength)
    end

    def gold_to_silver(gold)
      gold * 10
    end

    def silver_to_gol(silver)
      silver / 10
    end
  end
  def attack(recipient)
    if recipient.dead
      puts "#{recipient.name} is already dead!"
    else
      damage = (rand * 10 + 10).round(0)
      recipient.take_damage(damage)
    end
  end

  protected

  def take_damage(damage)
    @health -= damage
    @health = 0 if @health <= 0
    puts "Ouch! #{@name} took #{damage} damage and has #{@health} health!"
    die if @health <= 0
  end

  def dead
    @death
  end

  private

  def die
    p "#{@name} died. RIP."
    @death = true
  end
end

p sten = Viking.create_warrior(Viking.random_name)
p sten2 = Viking.create_warrior(Viking.random_name)

10.times { sten.attack(sten2) }
