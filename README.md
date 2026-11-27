# Kakeibo — আমাদের হিসাব
Mobile-first Bengali household ledger. Vanilla HTML/CSS/JS, Node.js 22+, PostgreSQL (Neon). One private shared household ledger, not a multi-tenant service.

## Windows PowerShell setup
1. Install Node.js 22 or newer. Create a PostgreSQL database in Neon (https://neon.tech/), copy its connection string from Connect.
2. Open a PowerShell terminal in this project folder:
```powershell
npm.cmd install
Copy-Item .env.example .env
notepad .env
```
3. Set DATABASE_URL to your actual Neon connection string, APP_USER to your chosen login and APP_PASSWORD to a strong unique password of at least 12 characters. Do not publish .env. The server creates the table automatically; no manual migration is required.
```powershell
npm.cmd start
```
4. Open http://localhost:3000 and enter the username/password. For deployment, run this Node service behind HTTPS; supply the same environment variables in your hosting provider. For a host that injects variables directly, use `node server.js`. Do not expose basic authentication over plain HTTP outside localhost. Mobile and desktop can use the same HTTPS address and credentials; refresh to see changes from another device.

## Use
- Settings: monthly planned income (default 20,000), savings target (default 6,000), and starting available funds, existing savings, outstanding debt/receivables. Starting amounts are the balance before the first recorded transaction, not a monthly entry.
- Tap expense/income/savings/debt, pick a category, enter amount and save. A date is selected automatically but editable. Record only money actually received or paid. Savings deposits move money out of spendable cash; withdrawals reverse this. Debt flows are not income or expenses.
- Daily view calculates opening and closing balance and shows each transaction. Monthly report aggregates categories and both savings funds, debt/receivables, and carryover. Edit/delete recalculates all dates. Negative balances can flag missing entries or incorrect amounts; the app does not reconcile bank accounts or enforce separate person-level debt ledgers.
- CSV exports daily totals. Settings offers JSON backup and restore (restore replaces all data). Keep backups secure.
- Offline demo: open the separate Kakeibo_Demo.html or open public/index.html locally. Data is saved in localStorage if supported by your browser; it is not synced to Neon. Use JSON backup and restore to move demo data into the connected app. If local-file storage is blocked, serve public/ over localhost and open `/?demo=1`.

## Tests
`npm.cmd test` checks the ledger calculations and validation. Actual Neon connection and production deployment require your own credentials and environment.
