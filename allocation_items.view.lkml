include: "funds.view"
view: allocation_items {
  sql_table_name: stage_nova.allocation_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
    hidden: yes
  }

  dimension: fund_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.fund_id ;;
    hidden: yes
  }

  dimension: institution_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.institution_id ;;
    hidden: yes
  }

  dimension: program_year_id {
    type: number
    hidden: yes
    sql: ${TABLE}.program_year_id ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
    hidden: yes
  }

  dimension: super_allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "CO" ;;
    hidden: yes
  }

  dimension: allocation_bool {
    type: yesno
    sql: ${TABLE}.source = "Region" ;;
    hidden: yes
  }

#   filter: fund_filter {
#     label: "FILTER Fund"
#     type: string
#     suggest_dimension: source
#     hidden: yes
#   }

#   dimension: test {
#     type: number
#     sql: coalesce(CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
#           THEN ${amount} ELSE NULL
#               END,0);;
#   }

  measure: allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END, 0);;
    filters: {
      field: super_allocation_bool
      value: "no"
    }
    value_format_name: "usd_0"
  }

  measure: super_allocation {
    type: sum
    sql: CASE WHEN {% condition funds.fund_filter %} ${funds.fund_name} {% endcondition %}
        THEN ${amount}
        ELSE NULL
        END;;
    filters: {
      field: super_allocation_bool
      value: "yes"
    }
    value_format_name: "usd_0"
  }

#   dimension_group: updated {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.updated_at ;;
#   }

#   dimension_group: created {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.created_at ;;
#   }

  # ----- Sets of fields for drilling ------
#   set: detail {
#     fields: [
#       id,
#       name,
#       institutions.id,
#       institutions.name,
#       institutions.shortname,
#       program_years.id,
#       program_years.name,
#       funds.id,
#       funds.name
#     ]
#   }
}
