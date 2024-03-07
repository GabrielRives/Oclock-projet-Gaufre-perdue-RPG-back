# Commande Sqitch effectué

```bash
sqitch init orpg --top-dir migrations --engine pg
```

```bash
sqitch config --user engine.pg.client psql
```

```bash
sqitch config --bool deploy.verify true
```

```bash
sqitch add 1.create_tables -n "création des tables"
```
