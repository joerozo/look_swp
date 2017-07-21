# include: "proposals_plus.view"
view: sectors {
  sql_table_name: stage_nova.sectors ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: display_order {
    type: number
    sql: ${TABLE}.display_order ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    label: "Sector"
    full_suggestions: yes
  }

  dimension: sector {
    view_label: "Proposals"
    type: string
    sql: ${name};;
  }

  measure: sector_budget {
    view_label: "Proposals"
    type: sum
    sql: ${proposals.budget_per_sector} ;;
    label: "Sector Budget"
    sql_distinct_key: CONCAT(${sectors.id},' ',${proposals.id}) ;;
    value_format_name: "usd_0"
  }


  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, proposals_sectors.count]
  }
}
