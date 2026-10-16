-- SCOPEPILOT HACKATHON DEMO ONLY
-- This deliberately permits anonymous access to one shared JSON state row.
-- Anyone with the website URL and publishable key can read/overwrite demo data.
-- Do NOT use for real client data or production. For production, use Supabase Auth
-- and user-/project-specific RLS policies instead.

-- RLS must remain enabled.
alter table public.scopepilot_app_state enable row level security;

-- Remove these demo policies if re-running this file.
drop policy if exists "Hackathon demo can read shared state" on public.scopepilot_app_state;
drop policy if exists "Hackathon demo can insert shared state" on public.scopepilot_app_state;
drop policy if exists "Hackathon demo can update shared state" on public.scopepilot_app_state;

create policy "Hackathon demo can read shared state"
on public.scopepilot_app_state
for select
to anon, authenticated
using (id = 1);

create policy "Hackathon demo can insert shared state"
on public.scopepilot_app_state
for insert
to anon, authenticated
with check (id = 1);

create policy "Hackathon demo can update shared state"
on public.scopepilot_app_state
for update
to anon, authenticated
using (id = 1)
with check (id = 1);
