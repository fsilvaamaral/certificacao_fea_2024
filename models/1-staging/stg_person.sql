with
    fonte as (
        select *
        from {{ source('erp', 'person') }}
    )

    , renomeando as (
        select
            cast(BUSINESSENTITYID as int) as id_entidade_negocio
            , cast(PERSONTYPE as varchar) as tipo_pessoa
            , concat(ifnull(FIRSTNAME,' '), ' ', ifnull(MIDDLENAME, ' '), ' ', ifnull(LASTNAME, ' ')) as nome_completo              
            , cast(FIRSTNAME as varchar) as primeiro_nome
            , cast(MIDDLENAME as varchar) as nome_do_meio
            , cast(LASTNAME as varchar) as sobrenome
            -- NAMESTYLE
            -- TITLE
            -- SUFFIX
            -- EMAILPROMOTION
            -- ADDITIONALCONTACTINFO
            -- DEMOGRAPHICS
            -- ROWGUID
            -- MODIFIEDDATE     
        from fonte
    )

    select *
    from renomeando