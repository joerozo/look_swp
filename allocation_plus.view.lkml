view: allocation_plus {
  derived_table: {
    sql: SELECT
        allocations.*
        , funds.name as fund_name
      FROM allocation_items as allocations
      LEFT JOIN funds  AS funds ON allocations.fund_id = funds.id
 ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    hidden: yes
  }

  dimension: fund_id {
    type: number
    sql: ${TABLE}.fund_id ;;
    hidden: yes
  }

  dimension: super_allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "CO" ;;
    hidden: yes
  }

  measure: allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "no"
    }
    value_format_name: "usd_0"
  }

  measure: super_allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "yes"
    }
    value_format_name: "usd_0"
  }


  dimension: institution_id {
    type: number
    sql: ${TABLE}.institution_id ;;
    hidden: yes

  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id ;;
    hidden: yes
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: program_year_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.program_year_id ;;
    hidden: yes
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    hidden: yes
  }

  dimension: fund_name {
    hidden: yes
    type: string
    sql: ${TABLE}.fund_name ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    hidden: yes
  }


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      funds.name,
      funds.id,
      program_years.name,
      program_years.id
    ]
  }
}
