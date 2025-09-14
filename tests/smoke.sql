-- ============================================
-- PINTS Core Smoke Test
-- ============================================

-- 1) Check schema_info
SELECT 'Schema version' AS check, schema_version 
FROM schema_info
WHERE schema_name = 'pints_schema';

-- 2) Check vocabulary_info
SELECT 'Vocab version' AS check, vocab_version 
FROM vocabulary_info
WHERE vocab_name = 'pints_dictionary';

-- 3) Ontology terms sanity check
SELECT 'Ontology terms count' AS check, COUNT(*) 
FROM ontology_terms;

-- 4) Units sanity check
SELECT 'Units count' AS check, COUNT(*) 
FROM units;

-- 5) Field dictionary sanity check
SELECT 'Field dictionary entries' AS check, COUNT(*) 
FROM field_dictionary;

-- 6) Sample existence
SELECT 'Samples count' AS check, COUNT(*) 
FROM samples;

-- 7) Run existence
SELECT 'Runs count' AS check, COUNT(*) 
FROM runs;

-- 8) Features existence
SELECT 'Features count' AS check, COUNT(*) 
FROM features;

-- 9) Query one feature row (should exist after seeding)
SELECT 'First feature m/z' AS check, mz 
FROM features 
ORDER BY feature_id 
LIMIT 1;

-- ============================================
-- End of PINTS Core Smoke Test
-- ============================================
