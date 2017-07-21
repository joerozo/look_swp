view: users {
  sql_table_name: stage_nova.users ;;

  dimension: id {
    group_label: "Creator"
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: auth_token {
    type: string
    sql: ${TABLE}.auth_token ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension:  display_name {
    group_label: "Creator"
    type: string
    sql: CONCAT(${TABLE}.first_name, ' ', ${TABLE}.last_name) ;;
  }

  dimension: email_address {
    group_label: "Creator"
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: first_name {
    group_label: "Creator"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    group_label: "Creator"
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    group_label: "Creator"
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: password {
    type: string
    sql: ${TABLE}.password ;;
    hidden: yes
  }

  dimension: prefix {
    type: string
    sql: ${TABLE}.prefix ;;
  }

  dimension: salt {
    type: string
    sql: ${TABLE}.salt ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
  }

  dimension: title {
    group_label: "Creator"
    type: string
    sql: ${TABLE}.title ;;
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

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      colleges_users.count,
      fiscal_entities_contacts.count,
      funds_users.count,
      institutions_users.count,
      notifications.count,
      proposals_contacts.count,
      regions_users.count,
      roles_users.count,
      signing_authorities.count
    ]
  }
}
