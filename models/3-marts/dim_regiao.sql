with
    dados_int as (
        select *
        from {{ ref('int_regiao') }}
    )

    , dim_regiao as (
        select
            ID_ENDERECO
            , ENDERECO
            , COMPLEMENTO_ENDERECO
            , CIDADE
            , ID_ESTADO
            , CODIGO_ESTADO
            , ESTADO
            , CODIGO_REGIAO_PAIS as sigla_pais
            , PAIS
            , ID_TERRITORIO
        from dados_int
    )

    select *
    from dim_regiao

    