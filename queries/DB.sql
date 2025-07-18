SELECT TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
ORDER BY TABLE_NAME,
    ORDINAL_POSITION;

    
SELECT t.name AS TableName,
    c.name AS ColumnName,
    ty.name AS DataType
FROM sys.tables t
    JOIN sys.columns c ON t.object_id = c.object_id
    JOIN sys.types ty ON c.user_type_id = ty.user_type_id
ORDER BY t.name,
    c.column_id;
