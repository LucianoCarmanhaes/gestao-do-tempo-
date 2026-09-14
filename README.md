# Gestão do Tempo

App de controle diário de tempo por quadrantes (método Q1–Q4), com dashboard de período e ações de melhoria. HTML/CSS/JS vanilla, sem build step.

## Setup do banco (Supabase)

1. Crie uma conta e um projeto em https://supabase.com.
2. No projeto, abra **SQL Editor** e rode o conteúdo de `supabase-schema.sql`.
3. Vá em **Project Settings > API** e copie a **Project URL** e a **anon public key**.
4. Abra `gestao-do-tempo.html` e preencha as constantes no início do `<script>`:
   ```js
   var SUPABASE_URL = "https://SEU-PROJETO.supabase.co";
   var SUPABASE_ANON_KEY = "sua-anon-key";
   ```
5. Commit e push — o deploy no Vercel atualiza sozinho.

**Atenção:** a anon key fica visível no código do site (é assim que o Supabase funciona no client). O acesso é liberado sem login, pensado para uso pessoal. Se o app for ficar acessível publicamente com dados sensíveis, adicione autenticação antes de divulgar a URL.

## Deploy (Vercel)

Site estático — o Vercel detecta automaticamente, sem comandos de build necessários.
