view: fiscal_entity_roles {
  sql_table_name: stage_nova.fiscal_entity_roles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: role {
    type: string
    sql: ${TABLE}.name ;;
  }
}
