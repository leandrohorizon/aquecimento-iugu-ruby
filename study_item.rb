class StudyItem
  attr_reader :id, :title, :category

  @@last_id = 1 #variavel de classe
  @@study_items = []

  def initialize(title, category)
  # def initialize(title: title, category: category) # os parametros estao nomeados
    @id = @@last_id
    @title = title
    @category = category

    @@last_id += 1
    @@study_items << self
  end

  def multiply_id(number)
    # error cria uma variavel id nova
    # id = id * number
    # id *= number
    # o correto seria
    # @id *= number ou self.id *= number
  end

  def to_s
    "##{id} - #{title} - #{category}"
  end

  def include?(query)
    title.include?(query) || category.include?(query)
  end

  def self.register
    print 'Digite o título do seu item de estudo: '
    title = gets.chomp
    print 'Digite a categoria do seu item de estudo: '
    category = gets.chomp
    puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
    new(title, category);
  end

  def self.all
    @@study_items
  end

  def self.search(query)

  end

  def self.delete
    puts 'Qual item de estudo você quer apagar?'
    id = gets.to_i
    study_item = StudyItem.all.detect do |study_item|
      study_items.id == id
    end

    StudyItem.all.delete(study_item)
  end
end