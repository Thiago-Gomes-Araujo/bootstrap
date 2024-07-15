require 'faker'

# Exemplo para limpar os dados existentes (opcional)
Position.delete_all
Company.delete_all
Career.delete_all
Contract.delete_all
State.delete_all
TypeVacancy.delete_all

# Criar empresas fictícias
1.times do
  company = Company.create!(
    name: Faker::Company.name,
    url: Faker::Internet.url,
    user_id: User.first.id # Ajuste isso conforme necessário
  )

  # Criar carreiras fictícias
  careers = 5.times.map do
    Career.create!(
      name: Faker::Job.field,
      description: Faker::Lorem.sentence
    )
  end

  # Criar contratos específicos
  contracts = [
    { name: 'CLT', description: 'Contrato CLT' },
    { name: 'PJ', description: 'Contrato PJ' },
    { name: 'CONTRATO', description: 'Contrato Temporário' }
  ].map do |contract_attributes|
    Contract.create!(contract_attributes)
  end
  
  # Criar tipos de vagas fictícias
  type_vacancies = 15.times.map do
    TypeVacancy.create!(
      name: Faker::Job.position
    )
  end

  # Criar estados fictícios
  states = 27.times.map do
    State.create!(
      name: Faker::Address.state
    )
  end

  # Criar posições fictícias
  250.times do
    Position.create!(
      name: Faker::Job.title,
      city: Faker::Address.city,
      summary: Faker::Lorem.sentence,
      publish: Faker::Boolean.boolean,
      company_id: company.id,
      career_id: careers.sample.id,
      contract_id: contracts.sample.id,
      type_vacancy_id: type_vacancies.sample.id,
      state_id: states.sample.id
    )
  end
end
