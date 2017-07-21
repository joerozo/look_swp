view: fiscal_entities_relationships {
  sql_table_name: stage_nova.fiscal_entities_relationships ;;

  dimension: agent_for_entity_id {
    type: number
    sql: ${TABLE}.agent_for_entity_id ;;
  }

  dimension: fiscal_entity_id {
    type: number
    sql: ${TABLE}.fiscal_entity_id ;;
  }

  dimension: fiscal_entity_parent_id {
    type: number
    sql: ${TABLE}.fiscal_entity_parent_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
