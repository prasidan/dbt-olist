with source as (

    select * from {{ ref('raw_product_category_name_translation') }}

),

renamed as (

    select 
        product_category_name 
        ,product_category_name_english as product_category

    from source

)

select * from renamed