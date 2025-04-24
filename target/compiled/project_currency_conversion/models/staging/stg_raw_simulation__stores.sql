WITH columns_rename AS (
    SELECT
        "loja_id" AS store_id,
        "nome" AS store_name,
        "cidade" AS store_city,
        "estado" AS state

    FROM RAW.RAW_SIMULATION.LOJAS

)

SELECT * FROM columns_rename
