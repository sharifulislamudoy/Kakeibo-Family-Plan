CREATE TABLE IF NOT EXISTS kakeibo_ledger (
  id integer PRIMARY KEY CHECK (id = 1),
  version integer NOT NULL DEFAULT 0,
  data jsonb NOT NULL,
  updated_at timestamptz NOT NULL DEFAULT now()
);
