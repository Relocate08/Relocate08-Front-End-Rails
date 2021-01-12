class TeamController < ApplicationController
  def index
    @members = [{'name': 'Hanna Davis', 'linkedin': 'https://www.linkedin.com/in/hanna-davis/', 'github':
    'https://img.icons8.com/nolan/64/linkedin.png'},
    {'name': 'Zach Sterns', 'linkedin': 'https://www.linkedin.com/in/zach-stearns/', 'github':
    'https://github.com/Stearnzy'},
    {'name': 'Jose Lopez', 'linkedin': 'https://www.linkedin.com/in/jose-lopez-0551a01a1/', 'github':
    'https://github.com/JoseLopez235'},
    {'name': 'Chris Allbritton', 'linkedin': 'https://www.linkedin.com/in/christopher-allbritton/',
    'github': 'https://github.com/JoseLopez235'},
    {'name': 'John Kim', 'linkedin': 'https://www.linkedin.com/in/abcdefghijohn/',
    'github': 'https://github.com/abcdefghijohn'},
    {'name': 'Brett Sherman', 'linkedin': 'https://www.linkedin.com/in/brettshermanll/',
    'github': 'https://github.com/BJSherman80'},
    {'name': 'Dani Coleman', 'linkedin': 'https://www.linkedin.com/in/dcoleman-21/',
    'github': 'https://github.com/dcoleman21'},
    {'name': 'Jake Heft', 'linkedin': 'https://www.linkedin.com/in/jakeheft/',
    'github': 'https://github.com/jakeheft'},
    {'name': 'Kevin Cuadros', 'linkedin': 'https://www.linkedin.com/in/kevin-cuadros-2bb4551a1/',
    'github': 'https://github.com/kevxo'}]
  end
end
