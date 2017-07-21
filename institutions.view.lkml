view: institutions {
  sql_table_name: stage_nova.institutions ;;

  dimension: name {
    label: "College Name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: program_college {
    view_label: "Proposals Supply/Demand"
    type: string
    sql: ${TABLE}.name ;;
    label: "Program College Name"
    suggest_persist_for: "24 hours"
  }

  dimension: address1 {
    type: string
    sql: ${TABLE}.address1 ;;
    hidden:  yes
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
    hidden:  yes
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    hidden:  yes
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

  dimension: district_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.district_id ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}.logo_url ;;
    hidden:  yes
  }

  dimension: lead_college {
    label: "Lead College"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: shortname {
    type: string
    sql: ${TABLE}.shortname ;;
    hidden:  yes
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    hidden:  yes
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
    hidden: yes
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

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
    hidden:  yes
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
    hidden:  yes
  }

  measure: institution_count {
    label: "Institution Count"
    type: count
  }

#   ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       id,
#       name,
#       shortname,
#       districts.id,
#       districts.name,
#       allocation_items.count,
#       fiscal_entities.count,
#       institutions_users.count,
#       signing_authorities.count
#     ]
#   }
}
