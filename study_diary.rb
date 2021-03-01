def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione enter para continuar'
  gets
end

def clear_and_wait_keypress
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
  clear
  puts "[1] Cadastrar um item para estudar"
  puts "[2] Ver todos os itens cadastrados"
  puts "[3] Buscar um item de estudo"
  puts "[4] Sair"
  print 'Escolha uma opção: '#não quebra a linha diferente do puts
  gets.to_i #get imput
end

def register_study_item
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  print 'Digite a categoria do seu item de estudo: '
  category = gets.chomp
  puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  { title: title, category: category } #hash
end

def print_items(collection)
  collection.each_with_index do |item, index|
    puts "##{index + 1} - #{item[:title]} - #{item[:category]}"
  end
  puts 'Nenhum item cadastrado' if collection.empty?
end

def search_items(collection)
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = collection.filter do |item| #também pode usar colect e ..
    item[:title].include? term
  end
  puts found_items
  puts 'Nenhum item encontrado' if found_items.empty?
end

system('clear')
puts welcome
study_items = []
option = menu

while true
  clear
  case option
  when 1
    study_items << register_study_item
  when 2
    print_items(study_items)
  when 3
    search_items(study_items)
  when 4
    puts 'Encerrando programa...'
    break #break pode retornar valores break 10  
  else
    puts 'Opção inválida'
  end
  clear_and_wait_keypress
  option = menu
end

puts 'Obrigado por usar o Diário de Estudos'  