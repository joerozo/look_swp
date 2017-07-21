view: states {
  sql_table_name: stage_nova.states ;;
#   label: "Status"

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: fund_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.fund_id ;;
    hidden: yes
  }

  dimension: name {
    label: "Status"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
    hidden: yes
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
    hidden: yes
  }

#   measure: count {
#     type: count
#     drill_fields: [id, name, funds.id, funds.name, proposals.count]
#   }
}
