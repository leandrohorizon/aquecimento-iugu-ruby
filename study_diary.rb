require_relative 'study_item'

def clear
  system('clear')
end

def wait_keypress
  puts
  puts 'Pressione qualquer tecla para continuar'
  gets #getch
end

def wait_keypress_and_clear
  wait_keypress
  clear
end

def welcome
  'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

REGISTER  = 1
VIEW      = 2
SEARCH    = 3
EXIT      = 4
DELETE    = 5

def menu
  clear
  puts "[#{REGISTER}] Cadastrar um item para estudar"
  puts "[#{VIEW}] Ver todos os itens cadastrados"
  puts "[#{SEARCH}] Buscar um item de estudo"
  puts "[#{DELETE}] Apagar um item de estudo"
  puts "[#{EXIT}] Sair"
  print 'Escolha uma opção: '#não quebra a linha diferente do puts
  gets.to_i #get imput
end

def register_study_item
  print 'Digite o título do seu item de estudo: '
  title = gets.chomp
  print 'Digite a categoria do seu item de estudo: '
  category = gets.chomp
  puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
  StudyItem.new(title, category);
end

def print_items
  puts StudyItem.all
  puts 'Nenhum item encontrado' if StudyItem.all.empty?
end

def search_items
  print 'Digite uma palavra para procurar: '
  term = gets.chomp
  found_items = StudyItem.all.filter do |item| #também pode usar colect e..
    item.include? term
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
  when REGISTER
    StudyItem.register
  when VIEW
    puts StudyItem.all
  when SEARCH
    search_items
  when EXIT
    puts 'Encerrando programa...'
    break #break pode retornar valores break 10
  when DELETE
  else
    puts 'Opção inválida'
  end
  wait_keypress_and_clear
  option = menu
end

puts 'Obrigado por usar o Diário de Estudos'  