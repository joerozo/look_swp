view: notification_types {
  sql_table_name: stage_nova.notification_types ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: template_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.template_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, templates.id, notifications.count]
  }
}
