/* ========================================================================
   DICCIONARIO DE DATOS – BASE DE DATOS AEROPORTUARIA
   Este script genera un diccionario de datos completo utilizando
   information_schema y pg_catalog.
   ======================================================================== */


/* ============================================================
   1. TABLAS DEL ESQUEMA PUBLIC
   ============================================================ */
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE'
ORDER BY table_name;


/* ============================================================
   2. COLUMNAS POR TABLA
   (nombre, tipo, nulabilidad, default)
   ============================================================ */
SELECT 
    table_name,
    column_name,
    data_type,
    character_maximum_length,
    is_nullable,
    column_default
FROM information_schema.columns
WHERE table_schema = 'public'
ORDER BY table_name, ordinal_position;


/* ============================================================
   3. COMENTARIOS DE TABLAS
   ============================================================ */
SELECT 
    c.relname AS table_name,
    obj_description(c.oid) AS table_comment
FROM pg_class c
JOIN pg_namespace n ON n.oid = c.relnamespace
WHERE n.nspname = 'public'
  AND c.relkind = 'r'
ORDER BY table_name;


/* ============================================================
   4. COMENTARIOS DE COLUMNAS
   ============================================================ */
SELECT 
    cols.table_name,
    cols.column_name,
    col_description(pg_class.oid, cols.ordinal_position) AS column_comment
FROM information_schema.columns cols
JOIN pg_class ON pg_class.relname = cols.table_name
JOIN pg_namespace n ON n.oid = pg_class.relnamespace
WHERE cols.table_schema = 'public'
  AND n.nspname = 'public'
ORDER BY cols.table_name, cols.ordinal_position;


/* ============================================================
   5. CONSTRAINTS POR TABLA (PK, FK, UNIQUE, CHECK)
   ============================================================ */
SELECT 
    c.conname AS constraint_name,
    CASE c.contype
        WHEN 'p' THEN 'PRIMARY KEY'
        WHEN 'f' THEN 'FOREIGN KEY'
        WHEN 'u' THEN 'UNIQUE'
        WHEN 'c' THEN 'CHECK'
        ELSE c.contype
    END AS constraint_type,
    c.conrelid::regclass AS table_name,
    pg_get_constraintdef(c.oid) AS definition
FROM pg_constraint c
JOIN pg_namespace n ON n.oid = c.connamespace
WHERE n.nspname = 'public'
ORDER BY table_name, constraint_type, constraint_name;


/* ============================================================
   6. LLAVES FORÁNEAS DETALLADAS
   ============================================================ */
SELECT
    con.conname AS fk_name,
    conrelid::regclass AS table_name,
    a1.attname AS column_name,
    confrelid::regclass AS referenced_table,
    a2.attname AS referenced_column,
    pg_get_constraintdef(con.oid) AS definition
FROM pg_constraint con
JOIN pg_attribute a1 ON a1.attrelid = con.conrelid AND a1.attnum = ANY (con.conkey)
JOIN pg_attribute a2 ON a2.attrelid = con.confrelid AND a2.attnum = ANY (con.confkey)
WHERE con.contype = 'f'
ORDER BY table_name, fk_name;


/* ============================================================
   7. CHECKS DETALLADOS
   ============================================================ */
SELECT
    conname AS check_name,
    conrelid::regclass AS table_name,
    pg_get_constraintdef(pg_constraint.oid) AS check_definition
FROM pg_constraint
WHERE contype = 'c'
ORDER BY table_name, check_name;


/* ============================================================
   8. ÍNDICES POR TABLA
   ============================================================ */
SELECT
    t.relname AS table_name,
    i.relname AS index_name,
    pg_get_indexdef(idx.indexrelid) AS index_definition
FROM pg_index idx
JOIN pg_class i ON i.oid = idx.indexrelid
JOIN pg_class t ON t.oid = idx.indrelid
JOIN pg_namespace n ON n.oid = t.relnamespace
WHERE n.nspname = 'public'
ORDER BY table_name, index_name;


/* ============================================================
   9. SECUENCIAS (si existieran)
   ============================================================ */
SELECT sequence_name
FROM information_schema.sequences
WHERE sequence_schema = 'public'
ORDER BY sequence_name;


/* ============================================================
   10. VISTAS DEL ESQUEMA (si existieran)
   ============================================================ */
SELECT table_name AS view_name
FROM information_schema.views
WHERE table_schema = 'public'
ORDER BY table_name;


/* ============================================================
   FIN DEL DICCIONARIO DE DATOS
   ============================================================ */
