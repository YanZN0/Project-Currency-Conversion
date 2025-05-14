
  create or replace   view RAW.RAW_SIMULATION.stg_raw_simulation__customers
  
   as (
    WITH columns_rename AS (
    SELECT

        "cliente_id" AS customer_id,
        "nome" AS customer_name,
        "email" AS customer_email,
        "telefone" AS customer_phone,
        "data_nascimento" AS customer_date_of_birth,
        "vip" AS customer_vip

    FROM RAW.RAW_SIMULATION.CLIENTES

),

handling_invalid_values AS (
    SELECT
        customer_id,
        customer_name,
        customer_date_of_birth,
        customer_vip,
        CASE
            WHEN customer_email = 'emailinvalido.com' THEN 'INVALID_EMAIL'
            ELSE customer_email
        END AS customer_email,
        CASE
            WHEN trim(customer_phone) = '' THEN 'INVALID_PHONE'
            ELSE customer_phone
        END AS customer_phone

    FROM columns_rename
)

SELECT * FROM handling_invalid_values
  );

