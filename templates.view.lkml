view: templates {
  sql_table_name: stage_nova.templates ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: content {
    type: string
    sql: ${TABLE}.content ;;
  }

  measure: count {
    type: count
    drill_fields: [id, notification_types.count]
  }
}
