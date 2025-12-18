# Installazione Completa - Server FiveM GTA

## Informazioni Mancanti per Server FiveM

### 1. Item QBCore Database
Aggiungi al tuo database SQL:

```sql
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES 
('annuario_scolastico_2005', 'Annuario Scolastico 2005', 1, 0, 1);
```

### 2. Item QBCore shared.lua
Aggiungi in `qb-core/shared/items.lua`:

```lua
['annuario_scolastico_2005'] = {
    ['name'] = 'annuario_scolastico_2005',
    ['label'] = 'Annuario Scolastico 2005',
    ['weight'] = 1,
    ['type'] = 'item',
    ['image'] = 'annuario_scolastico_2005.png',
    ['unique'] = false,
    ['useable'] = true,
    ['shouldClose'] = true,
    ['combinable'] = nil,
    ['description'] = 'Annuario scolastico dell\'anno 2005'
}
```

### 3. Icona Inventario
Usa direttamente l'immagine della copertina:
- Origine: `html/img/COPERTINA.png`
- Destinazione: `qb-inventory/html/images/annuario_scolastico_2005.png`
- Nota: L'inventario adatterà automaticamente le dimensioni

### 4. Installazione Resource
1. Copia la cartella `book_annuario_astral` in `resources/[standalone]/`
2. Aggiungi al `server.cfg`: `ensure book_annuario_astral`
3. Riavvia il server

### 5. Dipendenze Richieste
- QBCore Framework
- ox_lib

### 6. Comandi per Test
- `/giveitem annuario_scolastico_2005` (se hai admin)
- Oppure aggiungi l'item direttamente nel database

### 7. Verifica Funzionamento
- Usa l'item dall'inventario
- Dovrebbe apparire il libro 3D con animazione
- Si apre l'interfaccia con le immagini

## Note Importanti
- Assicurati che `ox_lib` sia installato e avviato prima
- Le immagini sono già incluse nel resource
- Il libro usa `prop_novel_01` come oggetto 3D
- Funziona con QBCore nuovo e vecchio formato
