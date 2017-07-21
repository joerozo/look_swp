view: knex_migrations_lock {
  sql_table_name: stage_nova.knex_migrations_lock ;;

  dimension: is_locked {
    type: number
    sql: ${TABLE}.is_locked ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
