class Computer
  def initialize(username, password)
    @username = username
    @password = password
    @files = {}
    @@users[username] = password
  end
  @@users = {}
  def create(filename)
    time = Time.now
    @files[filename] = time
    puts "Yeni #{filename}, #{time} tarihinde, #{@username} tarafından oluşturuldu."
  end

  def self.get_users
    @@users
  end
end

my_computer = Computer.new('Jam', 'ilu')
my_computer.create('files of Jam')

kubi_comp = Computer.new('Kubilay', 'asd')
kubi_comp.create('önemli dosyalar')
