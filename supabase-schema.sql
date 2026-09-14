-- Execute este script no SQL Editor do Supabase (Project > SQL Editor > New query)

create table if not exists entries (
  id text primary key,
  data date not null,
  inicio text not null,
  fim text not null,
  minutos integer not null,
  planejada text,
  realizada text,
  quadrante text not null check (quadrante in ('Q1','Q2','Q3','Q4')),
  ladrao text,
  obs text,
  created_at timestamptz default now()
);

create table if not exists acoes (
  id text primary key,
  identificada_em date,
  acao text not null,
  causa text,
  quadrante_atual text check (quadrante_atual in ('Q1','Q2','Q3','Q4')),
  quadrante_desejado text check (quadrante_desejado in ('Q1','Q2','Q3','Q4')),
  responsavel text,
  prazo date,
  status text not null default 'Aberta' check (status in ('Aberta','Em andamento','Concluída')),
  beneficio text,
  evidencia text,
  created_at timestamptz default now()
);

-- Row Level Security
alter table entries enable row level security;
alter table acoes enable row level security;

-- Uso pessoal sem login: qualquer requisição com a anon key pode ler/escrever.
-- A anon key fica exposta no código do site por natureza do Supabase — quem tiver
-- a URL do projeto e a key consegue ler e alterar os dados. Aceitável para um
-- app de uso individual sem dados sensíveis de terceiros; se isso mudar, troque
-- estas políticas por regras que exijam autenticação (supabase.auth) antes do deploy.
create policy "permitir tudo (uso pessoal)" on entries
  for all using (true) with check (true);

create policy "permitir tudo (uso pessoal)" on acoes
  for all using (true) with check (true);
