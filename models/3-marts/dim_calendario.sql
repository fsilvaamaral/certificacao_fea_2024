with 
    periodo_data as (
        select dateadd(day, seq4(), '2010-01-01'::date) as data
        from table(generator(rowcount => 1706))
    )

    , transformacoes as (
        select
            data
            , year(data) as ano
            , month(data) as mes
            , day(data) as dia
            , case
                when mes = 1 then 'Jan'
                when mes = 2 then 'Fev'
                when mes = 3 then 'Mar'
                when mes = 4 then 'Abr'
                when mes = 5 then 'Mai'
                when mes = 6 then 'Jun'
                when mes = 7 then 'Jul'
                when mes = 8 then 'Ago'
                when mes = 9 then 'Set'
                when mes = 10 then 'Out'
                when mes = 11 then 'Nov'
                else 'Dez'
            end as nome_mes
            , dayofweek(data)+1 as dia_semana
            , case
                when dia_semana = 1 then 'Domingo'
                when dia_semana = 2 then 'Segunda'
                when dia_semana = 3 then 'Terça'
                when dia_semana = 4 then 'Quarta'
                when dia_semana = 5 then 'Quinta'
                when dia_semana = 6 then 'Sexta'
                else 'Sábado'
            end as nome_dia_semana
            , quarter(data) as trimestre
            , case
                when dia_semana = 1 then true
                when dia_semana = 7 then true
                else false
            end as fl_final_semana
            , case
                when dia_semana between 2 and 6 then true
                else false
            end as fl_meio_semana
        from periodo_data
    )

    , dim_calendario as (
        select
            data
            , ano
            , trimestre
            , mes
            , nome_mes
            , dia as dia_mes
            , dia_semana
            , nome_dia_semana
            , fl_meio_semana
            , fl_final_semana
        from transformacoes
    )

    select *
    from dim_calendario
    
