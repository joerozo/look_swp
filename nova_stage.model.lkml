connection: "nova_stage"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

map_layer: district_map {
  url: "https://cdn.rawgit.com/productOps/swp-looker-public/4678a21c/CCD_LegalBoundaries.topojson?short_path=9541704"
  property_key: "DistrictNa"
}


explore: funds {
  hidden: yes
}

explore: allocations_exp {
  from: fiscal_entities
  label: "Allocations"

  join: budget_items {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${budget_items.fiscal_entity_id} = ${allocations_exp.id} ;;
    fields: []
  }

  join: institutions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${allocations_exp.institution_id} = ${institutions.id} ;;
    fields: []
  }

  join: allocations {
    from: allocation_plus
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.id} = ${allocations.institution_id} ;;
  }

  join: funds {
    type: left_outer
    relationship: many_to_one
    sql_on: ${allocations_exp.fund_id} = ${funds.id} ;;
  }

#   join: fiscal_entity_roles{
#     view_label: "Allocations"
#     type: left_outer
#     relationship: many_to_one
#     sql_on: ${allocations_exp.fiscal_entity_role_id} = ${fiscal_entity_roles.id} ;;
#     fields: []
#   }
#
  join: districts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.district_id} = ${districts.id} ;;
    fields: ["name"]
  }

  join: regions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${districts.region_id} = ${regions.id} ;;
#     fields: [regions.name, -regions.region_name]
    fields: ["region_name"]
  }
}

explore: budgeting_institutions {
  from: fiscal_entities
  label: "Budgeting Institutions"
#   hidden: yes

  join: budget_items {
    type:  left_outer
    relationship: one_to_many
    sql_on: ${budget_items.fiscal_entity_id} = ${budgeting_institutions.id} ;;
  }

  join: institutions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${budgeting_institutions.institution_id} = ${institutions.id} ;;
#     fields: [ALL_FIELDS*]
  }

  join: allocations {
    from: allocation_plus
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.id} = ${allocations.institution_id} ;;
  }

  join: funds {
    type: left_outer
    relationship: many_to_one
    sql_on: ${budgeting_institutions.fund_id} = ${funds.id} ;;
  }

  join: fiscal_entity_roles{
    view_label: "Allocations"
    type: left_outer
    relationship: many_to_one
    sql_on: ${budgeting_institutions.fiscal_entity_role_id} = ${fiscal_entity_roles.id} ;;
  }

  join: districts {
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.district_id} = ${districts.id} ;;
    fields: []
  }

  join: regions {
    type: left_outer
    relationship: many_to_one
    sql_on: ${districts.region_id} = ${regions.id} ;;
#     fields: [regions.name, -regions.region_name]
    fields: []
  }

  join: proposals {
    from: proposals_plus
    type: left_outer
    relationship: many_to_one
    sql_on: ${budget_items.proposal_id} = ${proposals.id} ;;
  }

  join: lead_college {
    view_label: "Proposals"
    from: institutions
    relationship: many_to_one
    sql_on: ${proposals.lead_institution_id} = ${institutions.id} ;;
    fields: [lead_college.lead_college]
  }

  join: creators {
    view_label: "Proposals"
    from: users
    type: left_outer
    sql_on:  ${proposals.creator_id} = ${creators.id} ;;
    relationship: many_to_one
    fields: ["display_name", "id","email_address","first_name","last_name", "phone","title"]
  }

  join: regions_users {
    type: left_outer
    relationship: one_to_many
    sql_on: ${regions_users.user_id} = ${creators.id} ;;
    fields: []
  }

  join: creators_regions {
    view_label: "Proposals"
    from:  regions
    type: left_outer
    relationship: one_to_many
    sql: ${creators_regions.id} = ${regions_users.region_id} ;;
#     fields: [creators_regions.region_name]
    fields: []
  }

  join: states {
    view_label: "Proposals"
    type: left_outer
    relationship: many_to_one
    sql_on: ${proposals.state_id} = ${states.id} ;;
  }

  join: lmi_programs {
    view_label: "Proposals Supply/Demand"
    type:  left_outer
    relationship: one_to_many
    sql_on: ${lmi_programs.fiscal_entity_id} = ${budgeting_institutions.id} ;;
    fields: ["narrative"]
  }

  join: lmis {
    view_label: "Proposals Supply/Demand"
    type: left_outer
    relationship: many_to_one
    sql_on: ${lmis.proposal_id} = ${proposals.id} ;;
    fields: ["name","region","subregion","county"]
  }

  join: lmi_soc_codes {
    sql_on: ${lmi_soc_codes.lmi_id} = ${lmis.id} ;;
    type:  left_outer
    relationship: many_to_one
    fields: []
  }

  join: soc_codes {
    from:  codes
    sql_on: ${soc_codes.id} = ${lmi_soc_codes.soc_code_id} ;;
    type:  left_outer
    relationship: many_to_one
    fields: ["soc_codes"]
    view_label: "Proposals Supply/Demand"
  }

  join: lmi_program_top_codes {
    from: codes
    sql_on: ${lmi_programs.top6_code_id} =  ${lmi_program_top_codes.id};;
    relationship: one_to_one
    fields: ["program_top_codes"]
    view_label: "Proposals Supply/Demand"
  }

  join: proposals_sectors {
    type: left_outer
    relationship: one_to_many
    type:  left_outer
    sql_on: ${proposals.id} = ${proposals_sectors.id} ;;
    fields: []
  }

  join: sectors {
    view_label: "Proposals"
    type:  left_outer
    relationship: many_to_one
    sql_on: ${proposals_sectors.sector_id} = ${sectors.id};;
    fields: ["sector"]
  }
}

explore: fiscal_entities {
  label: "Proposals"

  join: budget_items {
    type: left_outer
    relationship: many_to_one
    sql_on: ${budget_items.fiscal_entity_id} = ${fiscal_entities.id} ;;
    view_label: "Budget Items"
  }

  join: institutions {
    view_label: "Geographies"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fiscal_entities.institution_id} = ${institutions.id} ;;
    fields: [institutions.name, institutions.institution_count]
  }

  join: allocations {
    from: allocation_plus
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.id} = ${allocations.institution_id} ;;
  }

  join: funds {
    type: left_outer
    relationship: many_to_one
    sql_on: ${fiscal_entities.fund_id} = ${funds.id} ;;
    fields: [funds.fund_filter]
  }

  join: fiscal_entity_roles{
    view_label: "Allocations"
    type: left_outer
    relationship: many_to_one
    sql_on: ${fiscal_entities.fiscal_entity_role_id} = ${fiscal_entity_roles.id} ;;
  }

  join: districts {
    view_label: "Geographies"
    type: left_outer
    relationship: many_to_one
    sql_on: ${institutions.district_id} = ${districts.id} ;;
  }

  join: regions {
    view_label: "Geographies"
    type: left_outer
    relationship: many_to_one
    sql_on: ${districts.region_id} = ${regions.id} ;;
    fields: [regions.name, -regions.region_name]
  }

  join: proposals {
    from: proposals_plus
    type: left_outer
    relationship: many_to_one
    sql_on: ${budget_items.proposal_id} = ${proposals.id} ;;
  }

  join: lead_colleges {
    from: institutions
    type:  left_outer
    sql_on: ${proposals.lead_institution_id} = ${lead_colleges.id}  ;;
    relationship: one_to_one
    fields: ["lead_name"]
    view_label: "Proposals"
  }

  join: creators {
    view_label: "Proposals"
    from: users
    type: left_outer
    sql_on:  ${proposals.creator_id} = ${creators.id} ;;
    relationship: many_to_one
    fields: ["display_name", "id","email_address","first_name","last_name", "phone","title"]
  }

  join: regions_users {
    type: left_outer
    relationship: one_to_many
    sql_on: ${regions_users.user_id} = ${creators.id} ;;
    fields: []
  }

  join: creators_regions {
    view_label: "Proposals"
    from:  regions
    type: left_outer
    relationship: one_to_many
    sql_on: ${creators_regions.id} = ${regions_users.region_id} ;;
    fields: [creators_regions.region_name]
  }

  join: status {
    view_label: "Proposals"
    from: states
    type: left_outer
    sql_on:  ${status.id} = ${proposals.state_id} ;;
    relationship: many_to_one
    fields: ["name"]

  }

  join: lmi_programs {
    view_label: "Proposals Supply/Demand"
    type:  left_outer
    relationship: one_to_many
    sql_on: ${lmi_programs.fiscal_entity_id} = ${fiscal_entities.id} ;;
    fields: ["narrative", "lmi_program_budget"]
  }

  join: lmi_program_top_codes {
    from: codes
    sql_on: ${lmi_programs.top6_code_id} =  ${lmi_program_top_codes.id};;
    relationship: one_to_one
    fields: ["program_top_codes"]
    view_label: "Proposals Supply/Demand"
  }

  join: metrics {
    type: left_outer
    relationship: one_to_many
    sql_on: ${metrics.lmi_program_id} = ${lmi_programs.id} ;;
  }

  join: lmis {
    view_label: "Proposals Supply/Demand"
    type: left_outer
    relationship: many_to_one
    sql_on: ${lmis.proposal_id} = ${proposals.id} ;;
    fields: ["name","region","subregion","county"]
  }

  join:  object_codes {
    from: codes
    type: left_outer
    sql_on: ${object_codes.id} = ${budget_items.object_codes} ;;
    relationship: one_to_one
    fields: ["object_codes"]
    view_label: "Budget Items"
  }


  join: proposals_sectors {
    type: left_outer
    relationship: one_to_many
    sql_on: ${proposals.id} = ${proposals_sectors.proposal_id} ;;
    fields: []
  }

  join: sectors {
    type:  left_outer
    relationship: many_to_one
    sql_on: ${proposals_sectors.sector_id} = ${sectors.id};;
    fields: ["sector", "sector_budget"]
  }


#   join: lead_college {
#     view_label: "Lead College"
#     from: institutions
#     type: left_outer
#     sql_on: ${proposals.lead_college_id} = ${institutions.id} ;;
#     fields: [lead_college.name]
#   }
}


# explore: budgeting_institutions {
#   label: "Budgeting Institutions"
#   extends: [fiscal_entities]
#   from:  fiscal_entities
#   view_name: fiscal_entities
#   fields: [ALL_FIELDS*-]
# }
