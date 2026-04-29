create extension if not exists "pgcrypto";

create table if not exists public.app_state (
    id uuid primary key default gen_random_uuid(),
    user_id uuid not null unique references auth.users(id) on delete cascade,
    payload jsonb not null default '{}'::jsonb,
    updated_at timestamptz not null default now()
);

alter table public.app_state enable row level security;

drop policy if exists "Users can read own app state" on public.app_state;
create policy "Users can read own app state"
on public.app_state
for select
to authenticated
using (auth.uid() = user_id);

drop policy if exists "Users can insert own app state" on public.app_state;
create policy "Users can insert own app state"
on public.app_state
for insert
to authenticated
with check (auth.uid() = user_id);

drop policy if exists "Users can update own app state" on public.app_state;
create policy "Users can update own app state"
on public.app_state
for update
to authenticated
using (auth.uid() = user_id)
with check (auth.uid() = user_id);

-- ── SAKİN GİRİŞİ İÇİN PAYLAŞILAN VERİ TABLOSU ────────────────────────
-- Sakinlerin kendi cihazlarından giriş yapabilmesi için gereklidir.
-- Yöneticiye ait app_state verisi burada halka açık olarak yayınlanır.
-- Şifreler SHA-256 hash olarak saklanır, ham şifre tutulmaz.

create table if not exists public.shared_data (
    id integer primary key default 1,
    payload jsonb not null default '{}'::jsonb,
    updated_at timestamptz not null default now(),
    constraint shared_data_tek_satir check (id = 1)
);

alter table public.shared_data enable row level security;

drop policy if exists "Public read shared data" on public.shared_data;
create policy "Public read shared data"
on public.shared_data for select
to anon, authenticated
using (true);

drop policy if exists "Authenticated write shared data" on public.shared_data;
create policy "Authenticated write shared data"
on public.shared_data for all
to authenticated
using (true)
with check (true);
