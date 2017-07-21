view: emailqueue {
  sql_table_name: stage_nova.emailqueue ;;

  dimension: auth_token {
    type: string
    sql: ${TABLE}.auth_token ;;
  }

  dimension: bcc {
    type: string
    sql: ${TABLE}.bcc ;;
  }

  dimension: cc {
    type: string
    sql: ${TABLE}.cc ;;
  }

  dimension: create_pdf {
    type: yesno
    sql: ${TABLE}.createPDF ;;
  }

  dimension_group: date_created {
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
    sql: ${TABLE}.dateCreated ;;
  }

  dimension_group: date_modified {
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
    sql: ${TABLE}.dateModified ;;
  }

  dimension: pdf {
    type: string
    sql: ${TABLE}.pdf ;;
  }

  dimension: process_id {
    type: string
    sql: ${TABLE}.process_ID ;;
  }

  dimension: proposal_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.proposal_ID ;;
  }

  dimension: proposal_title {
    type: string
    sql: ${TABLE}.proposal_title ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: to {
    type: string
    sql: ${TABLE}.`to` ;;
  }

  measure: count {
    type: count
    drill_fields: [proposals.id]
  }
}
