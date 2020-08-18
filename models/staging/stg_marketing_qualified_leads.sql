with source as (

    select * from {{ ref('raw_marketing_qualified_leads') }}

),

renamed as (

    select 
        mql_id
        ,origin
        
    from source

)

select * from renamed